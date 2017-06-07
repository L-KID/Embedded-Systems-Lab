/*  ----------------------------------- DSP/BIOS Headers            */
#include <std.h>
#include <gbl.h>
#include <log.h>
#include <swi.h>
#include <sys.h>
#include <tsk.h>
#include <pool.h>

/*  ----------------------------------- DSP/BIOS LINK Headers       */
#include <failure.h>
#include <dsplink.h>
#include <platform.h>
#include <notify.h>
#include <bcache.h>
/*  ----------------------------------- Sample Headers              */
#include <pool_notify_config.h>
#include <task.h>

/*  ----------------------------------- OpenCV Headers              */
#include "meanshift.h"
#include <string.h>
#include <stdlib.h>

extern Uint16 MPCSXFER_BufferSize ;

static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info) ;

//////////////////////////////
// For MeanShift
////////////////////////////
unsigned char bin_width;
struct config {
    unsigned char num_bins;
    int pixel_range;
    unsigned char MaxIter;
} cfg;

void MeanShift_Init();
int* CalWeight(unsigned char* frame, int* target_candidate, struct Rect rec, int* data);

/* Conversion between floating point and fixed point */
const int scale = 16; // 1/2^16
#define FloatToFixed(x) (x* (float)(1<<scale))
#define FixedToFloat(x) ((float)x/(float)(1<<scale))
#define MUL(x, y)  ((((x) >> 8)*((y) >> 8)) >> 0)
#define DIV(x, y) (((x)<<7)/(y)<<9)

int SquareRootRounded(int x)
{
    // input a fixed number
    Uint32 op  = x;
    Uint32 res = 0;
    Uint32 one = 1uL << 30; // The second-to-top bit is set: use 1u << 14 for uint16_t type; use 1uL<<30 for uint32_t type
    
    
    // "one" starts at the highest power of four <= than the argument.
    while (one > op)
    {
        one >>= 2;
    }
    
    while (one != 0)
    {
        if (op >= res + one)
        {
            op = op - (res + one);
            res = res +  2 * one;
        }
        res >>= 1;
        one >>= 2;
    }
    
    /* Do arithmetic rounding to nearest integer */
    if (op > res)
    {
        res++;
    }
    
    res = res*(float)(1<<4);
    
    return res; // fixed number
}

Int Task_create (Task_TransferInfo ** infoPtr)
{
    Int status    = SYS_OK ;
    Task_TransferInfo * info = NULL ;

    /* Allocate Task_TransferInfo structure that will be initialized
     * and passed to other phases of the application */
    if (status == SYS_OK) 
	{
        *infoPtr = MEM_calloc (DSPLINK_SEGID,
                               sizeof (Task_TransferInfo),
                               0) ; /* No alignment restriction */
        if (*infoPtr == NULL) 
		{
            status = SYS_EALLOC ;
        }
        else 
		{
            info = *infoPtr ;
        }
    }

    /* Fill up the transfer info structure */
    if (status == SYS_OK) 
	{
        info->dataBuf       = NULL ; /* Set through notification callback. */
        info->bufferSize    = MPCSXFER_BufferSize ;
        SEM_new (&(info->notifySemObj), 0) ;
    }

    /*
     *  Register notification for the event callback to get control and data
     *  buffer pointers from the GPP-side.
     */
    if (status == SYS_OK) 
	{
        status = NOTIFY_register (ID_GPP,
                                  MPCSXFER_IPS_ID,
                                  MPCSXFER_IPS_EVENTNO,
                                  (FnNotifyCbck) Task_notify,
                                  info) ;
        if (status != SYS_OK) 
		{
            return status;
        }
    }

    /*
     *  Send notification to the GPP-side that the application has completed its
     *  setup and is ready for further execution.
     */
    if (status == SYS_OK) 
	{
        status = NOTIFY_notify (ID_GPP,
                                MPCSXFER_IPS_ID,
                                MPCSXFER_IPS_EVENTNO,
                                (Uint32) 0) ; /* No payload to be sent. */
        if (status != SYS_OK) 
		{
            return status;
        }
    }

    /*
     *  Wait for the event callback from the GPP-side to post the semaphore
     *  indicating receipt of the data buffer pointer and image width and height.
     */
    SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;
    SEM_pend (&(info->notifySemObj), SYS_FOREVER) ;

    return status ;
}

unsigned char* buf;
int length;

// Command from GPP to DSP
Uint32 command = 1000;

// This is the rectangle that is around the target
struct Rect target_region;
int rows, cols;

Int Task_execute (Task_TransferInfo * info)
{
  int* target_candidate;
  int* result;

  // This one holds the blue, green and red frames, respectively
  unsigned char* frame;

  MeanShift_Init();

  target_candidate  = (int*) malloc(48 * sizeof(int));       

  // Cannot run if memory is not successfully allocated
  if (target_candidate == NULL) { 
    NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
    return 0;
  }

  // Notify GPP that DSP is ready
  NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);

  while (command != 0) {

    // Wait for new command
    SEM_pend (&(info->notifySemObj), SYS_FOREVER);

    switch (command) {
    case 1:
      // Store target_region
      BCACHE_inv ((Ptr)buf, length, TRUE);

      // Values are int, so copy as int
      memcpy(&target_region.width, &buf[0], sizeof(int));
      memcpy(&target_region.height, &buf[0 + sizeof(int)], sizeof(int));

      // Allocate memory for frame (3 for BGR)
      frame = (unsigned char*) malloc(target_region.width * target_region.height * sizeof(unsigned char) * 3);
      if(frame == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
      }

      result = (int*) malloc(target_region.width * target_region.height * sizeof(int));
      if(result == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
      }

      // Notify GPP that DSP is ready
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 4: 
      // Store all ROI and target_candidate
      BCACHE_inv ((Ptr)buf, length, TRUE);

      // New: store frame and target_candidate ! change name
      memcpy(frame, buf, target_region.width * target_region.height * sizeof(unsigned char) * 3);
      memcpy(target_candidate, &buf[3 * target_region.width * target_region.height * sizeof(unsigned char)], 48 * sizeof(int));

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 7:
      // Calculate weight
      CalWeight(frame, target_candidate, target_region, result);

      // Copy weight to shared buffer
      memcpy(buf, result, target_region.width * target_region.height * sizeof(int));
      
      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;
    }
  }	

  free(target_candidate);
  free(result);
  free(frame);

  return SYS_OK;
}

Int Task_delete (Task_TransferInfo * info)
{
    Int    status     = SYS_OK ;
    /*
     *  Unregister notification for the event callback used to get control and
     *  data buffer pointers from the GPP-side.
     */
    status = NOTIFY_unregister (ID_GPP,
                                MPCSXFER_IPS_ID,
                                MPCSXFER_IPS_EVENTNO,
                                (FnNotifyCbck) Task_notify,
                                info) ;

    /* Free the info structure */
    MEM_free (DSPLINK_SEGID,
              info,
              sizeof (Task_TransferInfo)) ;
    info = NULL ;

    return status ;
}

static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info)
{
    static int count = 0;
    Task_TransferInfo * mpcsInfo = (Task_TransferInfo *) arg ;

    (Void) eventNo ; /* To avoid compiler warning. */

    count++;

    if (count == 1) {
      buf = (unsigned char*)info;
      SEM_post(&(mpcsInfo->notifySemObj));
    }
    else if (count == 2) {
      length = (int)info;
      SEM_post(&(mpcsInfo->notifySemObj));
    }
    else {
      command = (Uint32)info;
      SEM_post(&(mpcsInfo->notifySemObj));
    }
  }

/////////////////////////
// MeanShift Functions //
/////////////////////////

void MeanShift_Init() {
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.pixel_range = 256;
    bin_width = cfg.pixel_range / cfg.num_bins;
}

int* CalWeight(unsigned char* frame, int* target_candidate, struct Rect rec, int* data)
{
    int i;
    int index = 0;

    unsigned char curr_pixel;
    unsigned char bin_value;

    for(i = 0; i < rec.height * rec.width; i++) {
        // First
        curr_pixel  = frame[index++];
        bin_value   = curr_pixel/bin_width;
        data[i]     = target_candidate[bin_value];

        // Second
        curr_pixel  = frame[index++];
        bin_value   = curr_pixel/bin_width;
        data[i]     = MUL( data[i], target_candidate[16 + bin_value] );

        // Third
        curr_pixel  = frame[index++];
        bin_value   = curr_pixel/bin_width;
        data[i]     = MUL( data[i], target_candidate[2*16 + bin_value]);
    }

    return data;
}
