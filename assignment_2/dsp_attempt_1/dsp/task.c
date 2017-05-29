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
float bin_width;
struct config {
    int num_bins;
    int pixel_range;
    int MaxIter;
} cfg;

struct Rect MeanShift_Track(Task_TransferInfo * info, unsigned char* bgr_planes[3], unsigned char* target_model, struct Rect target_region);
void MeanShift_Init();

////////////////////
// Original
////////////////////

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

int sum_dsp() 
{
    int sum=0,i;
    for(i=0;i<length;i++) 
	{
       sum=sum+buf[i];
       buf[i]++;
    }
    return sum;
}

// Command from GPP to DSP
Uint32 command;

// This is the rectangle that is around the target
struct Rect target_region;

Int Task_execute (Task_TransferInfo * info)
{
  int i;

  // In order to retreive float values over the buffer
  float* float_buf;

  // This is the candidate that we think is the model
  //float* target_candidate = (float*) malloc(128*sizeof(float)); // Currently assuming fixed size (since it is)
  
  // This is the original selection that we're looking to track
  float* target_model = (float*) malloc(128*sizeof(float));     // Currently assuming fixed size (since it is)

  // This one holds the blue, green and red frames, respectively
  unsigned char* bgr_planes[3];
  unsigned char rows, cols;

  //if(target_candidate == NULL) {
    // Not enough memory available, what to do?
  //}

  MeanShift_Init();

  while (command != 0) {

    // Wait for new command
    SEM_pend (&(info->notifySemObj), SYS_FOREVER);

    switch (command) {
    case (Uint32)MSG_TARGET_REGION:
      
      // Invalidate cache
      BCACHE_inv ((Ptr)buf, length, TRUE);

      // Store target region from GPP
      target_region.height  = buf[0];
      target_region.width   = buf[1];
      target_region.x       = buf[2];
      target_region.y       = buf[3];
      rows                  = buf[4];
      cols                  = buf[5];

      // Allocate memory for bgr, check for error?
      for (i = 0; i < 3; i++) {
        bgr_planes[i] = (unsigned char*) malloc(rows*cols*sizeof(unsigned char));
      }

      // For testing
      //buf[0] = 5;

      //BCACHE_wbInv ((Ptr)buf, length, TRUE);

      //notify that we are done
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_TARGET_MODEL:

      // Invalidate cache
      BCACHE_inv ((Ptr)buf, length, TRUE);
      
      // Store PDF representation from GPP
      float_buf = (float*)buf;
      memcpy(target_model, float_buf, 128 * sizeof(float));

      // For testing
      //float_buf[0] = 1.5f;

      //BCACHE_wbInv ((Ptr)buf, length, TRUE);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_BLUE_FRAME:
      // Store blue frame
      BCACHE_inv ((Ptr)buf, length, TRUE);
      memcpy(bgr_planes[0], buf, rows * cols * sizeof(unsigned char) );

      // Tell GPP that DSP is ready
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_GREEN_FRAME:
      // Store green frame
      BCACHE_inv ((Ptr)buf, length, TRUE);
      memcpy(bgr_planes[1], buf, rows * cols * sizeof(unsigned char) );
      
      // Tell GPP that DSP is ready  
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_RED_FRAME:
      // Store red frame
      BCACHE_inv ((Ptr)buf, length, TRUE);
      memcpy(bgr_planes[2], buf, rows * cols * sizeof(unsigned char) );

      // Tell GPP that DSP is ready
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_TARGET_CANDIDATE:
      // Invalidate cache
      //BCACHE_inv ((Ptr)buf, length, TRUE);
      
      // Store target candidate from GPP
      //float_buf = (float*)buf;
      //memcpy(target_candidate, float_buf, 128 * sizeof(float));

      // Tell GPP that DSP is ready
      //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_TRACK:
      break;

    default:
      command = 0;
      break;
    }

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
      buf = (unsigned char*)info ;
    } 
    else if (count == 2) {
      length = (int)info;
    }
    else {
      command = (Uint32)info;
    }

    SEM_post(&(mpcsInfo->notifySemObj));
}

//////////////////////////////////////
// MeanShift Functions
//////////////////////////////////////

void MeanShift_Init() {
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.pixel_range = 256;
    bin_width = (float)cfg.pixel_range / (float)cfg.num_bins;
}

struct Matrix CalWeight(unsigned char** bgr_planes, unsigned char *target_model,
                            float* target_candidate, struct Rect rec)
{
    int k, i, j;
    struct Matrix weight;
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    //cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    float *data = (float*)malloc(rows*cols*sizeof(float));
    // Remember to FREE this one once it is no longer needed in main 
    
    for(k = 0; k < 3;  k++)
    {
        row_index = rec.y;
        for(i = 0; i < rows; i++)
        {
            col_index = rec.x;
            for(j = 0; j < cols; j++)
            {
                int curr_pixel = (bgr_planes[k][row_index*rows + col_index]);
                int bin_value = curr_pixel/bin_width;
                data[i*rows + j] *= (float)((sqrt(target_model[k*rows + bin_value]/target_candidate[k*rows + bin_value])));
                col_index++;
            }
            row_index++;
        }
    }

    weight.rows = rows;
    weight.cols = cols;
    weight.data = data;

    return weight;
}

//cv::Rect MeanShift::track(const cv::Mat &next_frame)
struct Rect MeanShift_Track(Task_TransferInfo * info, unsigned char* bgr_planes[3], unsigned char* target_model)
{
    struct Rect next_rect;
    int iter, i, j;
    float* float_buf;
    float* target_candidate = (float*) malloc(128 * sizeof(float)); // Error handling?
    struct Matrix weight;
    float delta_x, sum_wij, delta_y, centre, norm_i, norm_j;
    double mult;

    for ( iter = 0; iter < cfg.MaxIter; iter++ )
    {
        // Ask GPP for target_candidate, give correct info in buffer and wait for GPP
        buf[0] = (uchar)target_region.height;
        buf[1] = (uchar)target_region.width;
        buf[2] = (uchar)target_region.x;
        buf[3] = (uchar)target_region.y;

        BCACHE_wbInv ((Ptr)buf, length, TRUE);
        
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)20);
        SEM_pend (&(info->notifySemObj), SYS_FOREVER);

        // Invalidate cache
        BCACHE_inv ((Ptr)buf, length, TRUE);
        
        // Store target candidate from GPP
        float_buf = (float*)buf;
        memcpy(target_candidate, float_buf, 128 * sizeof(float)); // Fixed size (for now)

        // Calculate weight
        weight = CalWeight(bgr_planes, target_model, target_candidate, target_region);

        delta_x = 0.0;
        sum_wij = 0.0;
        delta_y = 0.0;
        centre = (float)((weight.rows - 1)/2.0);
        mult = 0.0;

        next_rect.x = target_region.x;
        next_rect.y = target_region.y;
        next_rect.width = target_region.width;
        next_rect.height = target_region.height;

        for(i = 0; i < weight.rows; i++)
        {
            for(j = 0; j < weight.cols; j++)
            {
                norm_i = (float)(i - centre)/centre;
                norm_j = (float)(j - centre)/centre;
                mult = pow(norm_i,2) + pow(norm_j,2) > 1.0 ? 0.0 : 1.0;
                delta_x += (float)(norm_j * weight.data[i*weight.rows + j] * mult);
                delta_y += (float)(norm_i * weight.data[i*weight.rows + j] * mult);
                sum_wij += (float)(weight.data[i*weight.rows + j] * mult);
            }
        }

        free(weight.data);

        next_rect.x += (int)((delta_x/sum_wij)*centre);
        next_rect.y += (int)((delta_y/sum_wij)*centre);

        if(abs(next_rect.x-target_region.x)<1 && abs(next_rect.y-target_region.y)<1)
        {
            break;
        }
        else
        {
            target_region.x = next_rect.x;
            target_region.y = next_rect.y;
        }
    }

    free(target_candidate);

    return next_rect;
}
