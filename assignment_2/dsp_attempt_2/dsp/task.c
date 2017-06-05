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

struct Rect MeanShift_Track(Task_TransferInfo * info, unsigned char* bgr_planes[3], float* target_model);
void MeanShift_Init();
float* CalWeight(unsigned char* bgr_planes[3], float* target_model, float* target_candidate, struct Rect rec, float* data);
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
int rows, cols;

Int Task_execute (Task_TransferInfo * info)
{
  int i;

  // In order to retreive float values over the buffer
  float* float_buf;

  //int* int_buf;

  // This is the candidate that we think is the model
  //float* target_candidate = (float*) malloc(128*sizeof(float)); // Currently assuming fixed size (since it is)

  // This is the original selection that we're looking to track
  float* target_model;
  float* target_candidate;
  float* result;

  // This one holds the blue, green and red frames, respectively
  unsigned char* bgr_planes[3];

  MeanShift_Init();

  //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1000);
  
  command = 1000; // So it's not accidentally 0

  target_model = (float*) malloc(128*sizeof(float));        // Currently assuming fixed size (since it is)
  target_candidate = (float*) malloc(128 * sizeof(float));  // Currently assuming fixed size (since it is)

  //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1001);

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
      memcpy(&target_region.x, &buf[0], sizeof(int));
      memcpy(&target_region.y, &buf[4], sizeof(int));
      memcpy(&target_region.width, &buf[8], sizeof(int));
      memcpy(&target_region.height, &buf[12], sizeof(int));

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
      if(bgr_planes[1] == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
      }

      result = (float*) malloc(target_region.width * target_region.height * sizeof(float));
      if(result == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)666);
      }

      // Notify GPP that DSP is ready
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 2:
      // Store target_model
      BCACHE_inv ((Ptr)buf, length, TRUE);

      memcpy(target_model, buf, 128 * sizeof(float));
      //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1003);

      // Debugging
      float_buf = (float*)buf;
      float_buf[0] = target_model[1];
      //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1004);

      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 3:
      // Store target_region and target_candidate
      BCACHE_inv ((Ptr)buf, length, TRUE);

      // Values are int, so copy as int
      memcpy(&target_region.x, &buf[0], sizeof(int));
      memcpy(&target_region.y, &buf[4], sizeof(int));

      // Values are float, so copy as float, 128 fixed for now
      memcpy(target_candidate, &buf[8], 128 * sizeof(float));

      //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)1005);
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);

      break;

    case 4: 
      /*bgr_planes[0] = (unsigned char*)malloc(target_region.width * target_region.height * sizeof(unsigned char));
      if (bgr_planes[0] == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)667);
      }*/

      // Store blue ROI
      BCACHE_inv ((Ptr)buf, length, TRUE);

      memcpy(bgr_planes[0], buf, target_region.width * target_region.height * sizeof(unsigned char));

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;
  
    case 5: 
      /*bgr_planes[1] = (unsigned char*)malloc(target_region.width * target_region.height * sizeof(unsigned char));
      if (bgr_planes[1] == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)667);
      }*/

      // Store blue ROI
      BCACHE_inv ((Ptr)buf, length, TRUE);

      memcpy(bgr_planes[1], buf, target_region.width * target_region.height * sizeof(unsigned char));

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 6: 
      /*bgr_planes[2] = (unsigned char*)malloc(target_region.width * target_region.height * sizeof(unsigned char));
      if (bgr_planes[2] == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)667);
      }*/

      // Store blue ROI
      BCACHE_inv ((Ptr)buf, length, TRUE);

      memcpy(bgr_planes[2], buf, target_region.width * target_region.height * sizeof(unsigned char));

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case 7:
      // Calculate weight
      CalWeight(bgr_planes, target_model, target_candidate, target_region, result);

      // Check for NULL?
      if (result == NULL) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)668);
      }

      /*if(result[0] < 1 && result[0] > 0) {
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)777);
      }*/

      //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)777);

      memcpy(buf, result, target_region.width * target_region.height * sizeof(float));
      //float_buf = (float*)buf;

      //float_buf[0] = bgr_planes[1][1*target_region.width + 10];

      //result[0] = 1.6f;

      // Checked

      //float_buf[0] = result[0];
      //float_buf[0] = target_model[0]; OK
      //float_buf[0] = target_candidate[0]; OK
      
      //float_buf[0] = bgr_planes[1][target_region.width + 5];

      //float_buf[0] = (float)target_region.width;
      //float_buf[0] = (float)target_region.height;
      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      //free(result);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;
    /*case (Uint32)MSG_TARGET_MODEL:

      // Invalidate cache
      BCACHE_inv ((Ptr)buf, length, TRUE);
      
      // Store PDF representation from GPP
      float_buf = (float*)buf;
      memcpy(target_model, float_buf, 128 * sizeof(float));

      float_buf[1] = 1.5f;

      // For testing
      //float_buf[0] = 1.5f;

      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_BLUE_FRAME:
      // Store blue frame
      BCACHE_inv ((Ptr)buf, length, TRUE);
      bgr_planes[0] = (unsigned char*) malloc(rows * cols * sizeof(unsigned char));
      memcpy(bgr_planes[0], buf, rows * cols * sizeof(unsigned char) );

      // For debugging
      memcpy(buf, bgr_planes[0], rows * cols * sizeof(unsigned char) );
      BCACHE_wbInv( (Ptr)buf, length, TRUE);

      // Tell GPP that DSP is ready
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_GREEN_FRAME:
      // Store green frame
      BCACHE_inv ((Ptr)buf, length, TRUE);
      bgr_planes[1] = (unsigned char*) malloc(rows * cols * sizeof(unsigned char));
      memcpy(bgr_planes[1], buf, rows * cols * sizeof(unsigned char) );
      
      // For debugging
      memcpy(buf, bgr_planes[1], rows * cols * sizeof(unsigned char) );
      BCACHE_wbInv( (Ptr)buf, length, TRUE);

      // Tell GPP that DSP is ready  
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);
      break;

    case (Uint32)MSG_RED_FRAME:
      // Store red frame
      BCACHE_inv ((Ptr)buf, length, TRUE);
      bgr_planes[2] = (unsigned char*) malloc(rows * cols * sizeof(unsigned char));
      memcpy(bgr_planes[2], buf, rows * cols * sizeof(unsigned char) );

      // For debugging
      memcpy(buf, bgr_planes[2], rows * cols * sizeof(unsigned char) );
      BCACHE_wbInv( (Ptr)buf, length, TRUE);

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
      result = MeanShift_Track(info, bgr_planes, target_model);

      // Tell GPP that tracking is done
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);

      // Send result to GPP
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(int)result.x);
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(int)result.y);

      //buf[0] = (unsigned char)result.x;
      //buf[1] = (unsigned char)result.y;

      break;*/
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

    /*if (count == 1) {
      buf = (unsigned char*)info ;
      SEM_post(&(mpcsInfo->notifySemObj));
    } 
    else if (count == 2) {
      length = (int)info;
      SEM_post(&(mpcsInfo->notifySemObj));
    }
    else if (count <= 8) { // Receive 6 data...
      switch(count) {
      case 3:
        target_region.height = (int)info;
        break;
      case 4:
        target_region.width = (int)info;
        break;
      case 5:
        target_region.x = (int)info;
        break;
      case 6:
        target_region.y = (int)info;
        break;
      case 7:
        rows = (int)info;
        break;
      case 8:
        cols = (int)info;
        SEM_post(&(mpcsInfo->notifySemObj));
        break;
      }

      // Confirm reception to GPP
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(int)0);
    }
    else {
      command = (Uint32)info;
      SEM_post(&(mpcsInfo->notifySemObj));
    }*/
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

float* CalWeight(unsigned char* bgr_planes[3], float* target_model,
                            float* target_candidate, struct Rect rec, float* data)
{
    int k, i, j;
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    // Debug
    int curr_pixel;
    int bin_value;

    //cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    //float *data = (float*)malloc(rows*cols*sizeof(float));
    if (data == NULL) {
      return NULL;
    }
    // Remember to FREE this one once it is no longer needed in main 
    

    // Debug
    for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {

        curr_pixel = bgr_planes[0][i*cols + j];
        bin_value = curr_pixel/bin_width;
        data[i*cols + j] = (float)sqrt(target_model[bin_value]/target_candidate[bin_value]);

        curr_pixel = bgr_planes[1][i*cols + j];
        bin_value = curr_pixel/bin_width;
        data[i*cols + j] *= (float)sqrt(target_model[16 + bin_value]/target_candidate[16 + bin_value]);

        curr_pixel = bgr_planes[2][i*cols + j];
        bin_value = curr_pixel/bin_width;
        data[i*cols + j] *= (float)sqrt(target_model[2*16 + bin_value]/target_candidate[2*16 + bin_value]);

      }
    }



    /*for(k = 0; k < 3;  k++)
    {
        row_index = rec.y;
        for(i = 0; i < rows; i++)
        {
            col_index = rec.x;
            for(j = 0; j < cols; j++)
            {
                //int curr_pixel = (bgr_planes[k][row_index*rows + col_index]);
                

              curr_pixel = (bgr_planes[k][i*cols + j]);
              bin_value = curr_pixel/bin_width;
              data[i*cols + j] *= (float)sqrt(target_model[k*16 + bin_value]/target_candidate[k*16 + bin_value]);

              // NEW
              /*curr_pixel = (bgr_planes[0][i*cols + j]);
              bin_value = curr_pixel/bin_width;
              data[i*cols + j] = (float)sqrt(target_model[bin_value]/target_candidate[bin_value]);

              curr_pixel = (bgr_planes[1][i*cols + j]);
              bin_value = curr_pixel/bin_width;
              data[i*cols + j] *= (float)sqrt(target_model[16 + bin_value]/target_candidate[bin_value]);

              curr_pixel = (bgr_planes[2][i*cols + j]);
              bin_value = curr_pixel/bin_width;
              data[i*cols + j] *= (float)sqrt(target_model[2*16 + bin_value]/target_candidate[bin_value]);

                //data[i*cols + j] = (float)sqrt(target_model[k*16 + bin_value]/target_candidate[k*16 + bin_value]);
                //col_index++;
            }
            //row_index++;
        }
    }*/

    //data[0] = target_model[0];
    // Checked
    // BGR planes
    // 

    return data;
}

//cv::Rect MeanShift::track(const cv::Mat &next_frame)
struct Rect MeanShift_Track(Task_TransferInfo * info, unsigned char* bgr_planes[3], float* target_model)
{
    struct Rect next_rect;
    /*int iter, i, j;
    float* float_buf;
    float* target_candidate = (float*) malloc(128 * sizeof(float)); // Error handling?
    struct Matrix weight;
    float delta_x, sum_wij, delta_y, centre, norm_i, norm_j;
    double mult;

    for ( iter = 0; iter < cfg.MaxIter; iter++ )
    {
        // Ask GPP for target_candidate, give correct info in buffer and wait for GPP
        //buf[0] = (unsigned char)target_region.x;
        //buf[1] = (unsigned char)target_region.y;

        //BCACHE_wbInv ((Ptr)buf, length, TRUE);
        
        //NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)20);
        
        // Send target_region to GPP, wait for target_candidate in return
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(int)5);
        NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(int)10);
        
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

    free(target_candidate);*/

    return next_rect;
}
