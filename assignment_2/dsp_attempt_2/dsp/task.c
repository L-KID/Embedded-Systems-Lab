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
#include <math.h>
//#include "opencv2/core/core.hpp"

extern Uint16 MPCSXFER_BufferSize ;


static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info) ;

#define MSG_TARGET_REGION     10
#define MSG_TARGET_MODEL      11
#define MSG_BLUE_FRAME        12
#define MSG_GREEN_FRAME       13
#define MSG_RED_FRAME         14
#define MSG_TARGET_CANDIDATE  15
#define MSG_TRACK             16

//////////////////////////////
// For MeanShift
////////////////////////////
int bin_width;
struct config {
    int num_bins;
    int pixel_range;
    int MaxIter;
} cfg;

void MeanShift_Init();
int* CalWeight(unsigned char* bgr_planes[3], int* target_model, int* target_candidate, struct Rect rec, int* data);

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
  int i;

  int* target_model;
  int* target_candidate;
  int* result;

  // This one holds the blue, green and red frames, respectively
  unsigned char* bgr_planes[3];

  MeanShift_Init();

  target_model      = (int*) malloc(128*sizeof(int));         // These are fixed size by PDF representation
  target_candidate  = (int*) malloc(128 * sizeof(int));       

  // Cannot run if memory is not successfully allocated
  if (target_model == NULL || target_candidate == NULL) { 
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
      memcpy(target_model, &buf[0 + 2*sizeof(int)], 128*sizeof(int));

      // Debug
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(int)1234);


      // Allocate memory for bgr planes
      bgr_planes[0] = (unsigned char*)malloc(target_region.width * target_region.height * sizeof(unsigned char));
      if(bgr_planes[0] == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
      }

      bgr_planes[1] = (unsigned char*)malloc(target_region.width * target_region.height * sizeof(unsigned char));
      if(bgr_planes[1] == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
      }

      bgr_planes[2] = (unsigned char*)malloc(target_region.width * target_region.height * sizeof(unsigned char));
      if(bgr_planes[2] == NULL) {
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

      memcpy(bgr_planes[0], buf, target_region.width * target_region.height * sizeof(unsigned char));
      memcpy(bgr_planes[1], &buf[target_region.width * target_region.height * sizeof(unsigned char)], target_region.width * target_region.height * sizeof(unsigned char));
      memcpy(bgr_planes[2], &buf[2 * target_region.width * target_region.height * sizeof(unsigned char)], target_region.width * target_region.height * sizeof(unsigned char));
      memcpy(target_candidate, &buf[3 * target_region.width * target_region.height * sizeof(unsigned char)], 128 * sizeof(int));

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 7:
      // Calculate weight
      CalWeight(bgr_planes, target_model, target_candidate, target_region, result);

      // Copy weight to shared buffer
      memcpy(buf, result, target_region.width * target_region.height * sizeof(int));
      
      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;
    }

  }	

  free(target_model);
  free(target_candidate);
  free(result);

  for(i = 0; i < 3; i++) {
    free(bgr_planes[i]);
  }

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

int* CalWeight(unsigned char* bgr_planes[3], int* target_model,
                            int* target_candidate, struct Rect rec, int* data)
{
    int k, i, j;
    int rows = rec.height;
    int cols = rec.width;

    // Debug
    int curr_pixel;
    int bin_value;
    int tm_fixed, tc_fixed, weight;

    // Memory problem, should be checked outside?
    if (data == NULL) {
      return NULL;
    }

    // Double loop fixed point
    for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
        // First
        curr_pixel  = bgr_planes[0][i*cols + j];
        bin_value   = curr_pixel/bin_width;
        tm_fixed    = target_model[bin_value];
        tc_fixed    = target_candidate[bin_value];

        if(tc_fixed == 0)
          tc_fixed = 1;

        weight            = DIV(tm_fixed, tc_fixed);
        data[i*cols + j]  = SquareRootRounded(weight);

        // Second
        curr_pixel  = bgr_planes[1][i*cols + j];
        bin_value   = curr_pixel/bin_width;
        tm_fixed    = target_model[16 + bin_value];
        tc_fixed    = target_candidate[16 + bin_value];

        if(tc_fixed == 0)
          tc_fixed = 1;

        weight            = DIV(tm_fixed, tc_fixed);
        data[i*cols + j]  = MUL( data[i*cols + j], SquareRootRounded(weight) );

        // Third
        curr_pixel  = bgr_planes[2][i*cols + j];
        bin_value   = curr_pixel/bin_width;
        tm_fixed    = target_model[2*16 + bin_value];
        tc_fixed    = target_candidate[2*16 + bin_value];

        if(tc_fixed == 0)
          tc_fixed = 1;

        weight            = DIV(tm_fixed, tc_fixed);
        data[i*cols + j]  = MUL( data[i*cols + j], SquareRootRounded(weight) );
      } 
    }

    return data;
}
