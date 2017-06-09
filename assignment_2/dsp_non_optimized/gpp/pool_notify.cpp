#include <stdlib.h>
#include <stdio.h>

#include <semaphore.h>
/*  ----------------------------------- DSP/BIOS Link                   */
#include <dsplink.h>

/*  ----------------------------------- DSP/BIOS LINK API               */
#include <proc.h>
#include <pool.h>
#include <mpcs.h>
#include <notify.h>
#if defined (DA8XXGEM)
#include <loaderdefs.h>
#endif


/*  ----------------------------------- Application Header              */
#include "pool_notify.h"
//#include <pool_notify_os.h>

#if defined (__cplusplus)
//extern "C" {
#endif /* defined (__cplusplus) */

/* ------------------------------------ OpenCV Headers                  */
#include "meanshift.h"
#include "arm_neon.h"

/*------------------------------------- Fixed/Floating point conversion */
const int scale = 8; // 1/2^16
#define FloatToFixed(x) (x* (float)(1<<scale))
#define FixedToFloat(x) ((float)x/(float)(1<<scale))

#ifndef ARMCC
#include "markers.h"
#endif

/* ------------------------------------ Timer                           */
#include "Timer.h"

/*  ============================================================================
 *  @const   NUM_ARGS
 *
 *  @desc   Number of arguments specified to the DSP application.
 *  ============================================================================
 */
#define NUM_ARGS                       1

/** ============================================================================
 *  @name   SAMPLE_POOL_ID
 *
 *  @desc   ID of the POOL used for the sample.
 *  ============================================================================
 */
#define SAMPLE_POOL_ID                 0

/** ============================================================================
 *  @name   NUM_BUF_SIZES
 *
 *  @desc   Number of buffer pools to be configured for the allocator.
 *  ============================================================================
 */
#define NUM_BUF_SIZES                  1

/** ============================================================================
 *  @const  NUM_BUF_POOL0
 *
 *  @desc   Number of buffers in first buffer pool.
 *  ============================================================================
 */
#define NUM_BUF_POOL0                  1

/*  ============================================================================
 *  @const   pool_notify_INVALID_ID
 *
 *  @desc   Indicates invalid processor ID within the pool_notify_Ctrl structure.
 *  ============================================================================
 */
#define pool_notify_INVALID_ID            (Uint32) -1

/** ============================================================================
 *  @const  pool_notify_IPS_ID
 *
 *  @desc   The IPS ID to be used for sending notification events to the DSP.
 *  ============================================================================
 */
#define pool_notify_IPS_ID                0

/** ============================================================================
 *  @const  pool_notify_IPS_EVENTNO
 *
 *  @desc   The IPS event number to be used for sending notification events to
 *          the DSP.
 *  ============================================================================
 */
#define pool_notify_IPS_EVENTNO           5


/*  ============================================================================
 *  @name   pool_notify_BufferSize
 *
 *  @desc   Size of buffer to be used for data transfer.
 *  ============================================================================
 */
STATIC Uint32  pool_notify_BufferSize ;

/*  ============================================================================
 *  @name   pool_notify_NumIterations
 *
 *  @desc   Number of iterations of data transfer.
 *  ============================================================================
 */
STATIC Uint32  pool_notify_NumIterations ;

/** ============================================================================
 *  @name   pool_notify_DataBuf
 *
 *  @desc   Pointer to the shared data buffer used by the pool_notify sample
 *          application.
 *  ============================================================================
 */
unsigned char * pool_notify_DataBuf = NULL ;


/** ============================================================================
 *  @func   pool_notify_Notify
 *
 *  @desc   This function implements the event callback registered with the
 *          NOTIFY component to receive notification indicating that the DSP-
 *          side application has completed its setup phase.
 *
 *  @arg    eventNo
 *              Event number associated with the callback being invoked.
 *  @arg    arg
 *              Fixed argument registered with the IPS component along with
 *              the callback function.
 *  @arg    info
 *              Run-time information provided to the upper layer by the NOTIFY
 *              component. This information is specific to the IPS being
 *              implemented.
 *
 *  @ret    None.
 *
 *  @enter  None.
 *
 *  @leave  None.
 *
 *  @see    None.
 *  ============================================================================
 */
STATIC Void pool_notify_Notify (Uint32 eventNo, Pvoid arg, Pvoid info) ;

sem_t sem;

/** ============================================================================
 *  @func   pool_notify_Create
 *
 *  @desc   This function allocates and initializes resources used by
 *          this application.
 *
 *  @modif  None
 *  ============================================================================
 */
NORMAL_API DSP_STATUS pool_notify_Create (	IN Char8 * dspExecutable,
											IN Char8 * strBufferSize,
											IN Uint8   processorId)
{
    DSP_STATUS      status     = DSP_SOK  ;
    Uint32          numArgs    = NUM_ARGS ;
    Void *          dspDataBuf = NULL ;
    Uint32          numBufs [NUM_BUF_SIZES] = {NUM_BUF_POOL0, } ;
    Uint32          size    [NUM_BUF_SIZES] ;
    SMAPOOL_Attrs   poolAttrs ;
    Char8 *         args [NUM_ARGS] ;

	#ifdef DEBUG
    printf ("Entered pool_notify_Create ()\n") ;
	#endif
 
    sem_init(&sem,0,0);

    /*
     *  Create and initialize the proc object.
     */
    status = PROC_setup (NULL) ;

    /*
     *  Attach the Dsp with which the transfers have to be done.
     */
    if (DSP_SUCCEEDED (status)) 
	{
        status = PROC_attach (processorId, NULL) ;
        if (DSP_FAILED (status)) 
		{
            printf ("PROC_attach () failed. Status = [0x%x]\n", (int)status );
        }
    }
    else 
	{
        printf ("PROC_setup () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Open the pool.
     */
    if (DSP_SUCCEEDED (status)) 
	{
        size [0] = pool_notify_BufferSize ;
        poolAttrs.bufSizes      = (Uint32 *) &size ;
        poolAttrs.numBuffers    = (Uint32 *) &numBufs ;
        poolAttrs.numBufPools   = NUM_BUF_SIZES ;
        poolAttrs.exactMatchReq = TRUE ;
        status = POOL_open (POOL_makePoolId(processorId, SAMPLE_POOL_ID), &poolAttrs) ;
        if (DSP_FAILED (status)) 
		{
            printf ("POOL_open () failed. Status = [0x%x]\n", (int)status );
        }
    }

    /*
     *  Allocate the data buffer to be used for the application.
     */
    if (DSP_SUCCEEDED (status)) 
	{
        status = POOL_alloc (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                             (Void **) &pool_notify_DataBuf,
                             pool_notify_BufferSize) ;

        /* Get the translated DSP address to be sent to the DSP. */
        if (DSP_SUCCEEDED (status)) 
		{
            status = POOL_translateAddr (
                                   POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                                         &dspDataBuf,
                                         AddrType_Dsp,
                                         (Void *) pool_notify_DataBuf,
                                         AddrType_Usr) ;

            if (DSP_FAILED (status)) 
			{
                printf ("POOL_translateAddr () DataBuf failed."
                                 " Status = [0x%x]\n",
                                 (int)status) ;
            }
        }
        else 
		{
            printf ("POOL_alloc() DataBuf failed. Status = [0x%x]\n",(int)status);
        }
    }

    /*
     *  Register for notification that the DSP-side application setup is
     *  complete.
     */
    if (DSP_SUCCEEDED (status)) 
	{
        status = NOTIFY_register (processorId,
                                  pool_notify_IPS_ID,
                                  pool_notify_IPS_EVENTNO,
                                  (FnNotifyCbck) pool_notify_Notify,
                                  0/* vladms XFER_SemPtr*/) ;
        if (DSP_FAILED (status)) 
		{
            printf ("NOTIFY_register () failed Status = [0x%x]\n",
                             (int)status) ;
        }
    }

    /*
     *  Load the executable on the DSP.
     */
    if (DSP_SUCCEEDED (status)) {
        args [0] = strBufferSize ;
        {
            status = PROC_load (processorId, dspExecutable, numArgs, args) ;
        }

        if (DSP_FAILED (status)) {
            printf ("PROC_load () failed. Status = [0x%x]\n", (int)status) ;
        }
    }

    /*
     *  Start execution on DSP.
     */
    if (DSP_SUCCEEDED (status)) {
        status = PROC_start (processorId) ;
        if (DSP_FAILED (status)) {
            printf ("PROC_start () failed. Status = [0x%x]\n",
                             (int)status) ;
        }
    }

    /*
     *  Wait for the DSP-side application to indicate that it has completed its
     *  setup. The DSP-side application sends notification of the IPS event
     *  when it is ready to proceed with further execution of the application.
     */
    if (DSP_SUCCEEDED (status)) {
        // wait for initialization 
        sem_wait(&sem);
    }

    /*
     *  Send notifications to the DSP with information about the address of the
     *  control structure and data buffer to be used by the application.
     *
     */
    status = NOTIFY_notify (processorId,
                            pool_notify_IPS_ID,
                            pool_notify_IPS_EVENTNO,
                            (Uint32) dspDataBuf);
    if (DSP_FAILED (status)) 
	{
        printf ("NOTIFY_notify () DataBuf failed."
                " Status = [0x%x]\n",
                 (int)status) ;
    }

    status = NOTIFY_notify (processorId,
                            pool_notify_IPS_ID,
                            pool_notify_IPS_EVENTNO,
                            (Uint32) pool_notify_BufferSize);
    if (DSP_FAILED (status)) 
	{
        printf ("NOTIFY_notify () DataBuf failed."
                " Status = [0x%x]\n",
                 (int)status) ;
    }

	#ifdef DEBUG
    printf ("Leaving pool_notify_Create ()\n") ;
	#endif

    return status ;
}

#include <sys/time.h>

long long get_usec(void);

long long get_usec(void) 
{
  long long r;
  struct timeval t;
  gettimeofday(&t,NULL);
  r=t.tv_sec*1000000+t.tv_usec;
  return r;
}

void copy_float_matrix_to_buffer(cv::Mat matrix, unsigned char* buffer) 
{
  float* float_buf = (float*)buffer;
  if(matrix.isContinuous()) {
      std::copy((float*)matrix.datastart, (float*)matrix.dataend, float_buf);
  } else {
      // Iterate and manually insert. There is probably some faster way to do this.
      for (int row = 0; row < matrix.rows; row++) {
          for (int col = 0; col < matrix.cols; col++) {
              float_buf[row*matrix.rows + col] = matrix.at<float>(row, col);
          }
      }
  }
}

void copy_uchar_matrix_to_buffer(cv::Mat matrix, unsigned char* buffer) 
{
  if(matrix.isContinuous()) {
      std::copy((unsigned char*)matrix.datastart, (unsigned char*)matrix.dataend, buffer);
  } else {
      // Iterate and manually insert. There is probably some faster way to do this.
      for (int row = 0; row < matrix.rows; row++) {
          for (int col = 0; col < matrix.cols; col++) {
              buffer[row*matrix.rows + col] = matrix.at<unsigned char>(row, col);
          }
      }
  }
}

/*void copy_uchar_vector_to_buffer(std::Vec vector, unsigned char* buffer) 
{
  std::copy((unsigned char*)vector.begin(), (unsigned char*)vector.end(), buffer);
}*/

/** ============================================================================
 *  @func   pool_notify_Execute
 *
 *  @desc   This function implements the execute phase for this application.
 *
 *  @modif  None
 *  ============================================================================
 */

NORMAL_API DSP_STATUS pool_notify_Execute (IN Uint32 numIterations, Uint8 processorId)
{
  DSP_STATUS  status    = DSP_SOK ;

	#if defined(DSP)
    unsigned char *buf_dsp;
	#endif

	#ifdef DEBUG
    printf ("Entered pool_notify_Execute ()\n") ;
	#endif

  //start = get_usec();
  Timer totalTimer("Total Time");
  Timer kernelTimer("Kernel");

  // Initialize before tracking
  cv::VideoCapture frame_capture = cv::VideoCapture( "car.avi" );

  // this is used for testing the car video
  // instead of selection of object of interest using mouse
  // Constructor is x, y, width, height
  cv::Rect rect(228, 367, 86, 58);
  cv::Mat frame;
  frame_capture.read(frame);
  
  MeanShift ms; // creat meanshift obj
  ms.Init_target_frame(frame,rect); // init the meanshift

  int codec = CV_FOURCC('F', 'L', 'V', '1');
  cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols, frame.rows));

  // Wait for DSP to be ready for command
  sem_wait(&sem);

  totalTimer.Start();

  // Newest attempt (this one works).
  // Send target_Region size to DSP
  memcpy(&pool_notify_DataBuf[0], &rect.width, sizeof(int));
  memcpy(&pool_notify_DataBuf[0 + sizeof(int)], &rect.height, sizeof(int));


  POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                    pool_notify_DataBuf,
                    pool_notify_BufferSize);

  POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                       (void**)&buf_dsp,
                       AddrType_Dsp,
                       (Void *) pool_notify_DataBuf,
                       AddrType_Usr) ;

  status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)1);

  if (DSP_FAILED (status)) 
  {
      printf ("NOTIFY_notify () DataBuf failed."
              " Status = [0x%x]\n",
               (int)status) ;
  }

  // Wait for DSP to save target_Region size
  sem_wait(&sem);

  // Allocate only once

  // Start tracking
  int TotalFrames = 32;
  int fcount;

  for(fcount=0; fcount<TotalFrames; ++fcount)
  {
      // Read a frame
      int status = frame_capture.read(frame);
      if( 0 == status ) break;

      kernelTimer.Start();

      // track object
      #ifndef ARMCC
      // MCPROF_START();
      #endif

      cv::Rect next_rect;
      // Track function from MS class
      for(int iter=0;iter<ms.cfg.MaxIter;iter++)
      {
        cv::Mat target_candidate = ms.pdf_representation(frame, ms.target_Region);

        // Calculate weight on DSP
        // Send ROI of BGR matrices and target_candidate to DSP
        
        // New without split
        // Get ROI of frame (all colours)
        cv::Mat roi = frame(ms.target_Region).clone();

        // Put ROI in shared buffer
        // Check for continuous!!
        int roi_size = roi.rows * roi.cols * sizeof(unsigned char) * 3;
        memcpy(pool_notify_DataBuf, roi.data, roi_size);

        // New: float to fix on GPP:
        // This can be done more efficient with pointers instead of .at and single loop :)
        // Also, we only need first three rows, as only those are used!
       
        // This works:
        
        uint16_t fixed[48];
        for(int r = 0; r < 3; r++) {
          for(int c = 0; c < target_candidate.cols; c++) {
            float temp = static_cast<float>((sqrt(ms.target_model.at<float>(r, c)/target_candidate.at<float>(r, c))));
            fixed[r*target_candidate.cols + c] = FloatToFixed(temp);
          }
        }

        memcpy(&pool_notify_DataBuf[roi_size], fixed, 48 * sizeof(uint16_t));

        POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                  pool_notify_DataBuf,
                  pool_notify_BufferSize);

        POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                             (void**)&buf_dsp,
                             AddrType_Dsp,
                             (Void *) pool_notify_DataBuf,
                             AddrType_Usr) ;

        // Tell DSP to save it
        status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)(4));
        if (DSP_FAILED (status)) 
        {
            printf ("NOTIFY_notify () DataBuf failed."
                    " Status = [0x%x]\n",
                     (int)status) ;
        }

        // Wait for DSP
        sem_wait(&sem);

        // Tell DSP to execute
        status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)(7));
        if (DSP_FAILED (status)) 
        {
            printf ("NOTIFY_notify () DataBuf failed."
                    " Status = [0x%x]\n",
                     (int)status) ;
        }

        // Wait for execution
        sem_wait(&sem);


        POOL_invalidate (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                                        pool_notify_DataBuf,
                                        pool_notify_BufferSize);

        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = static_cast<float>((ms.target_Region.height-1)/2.0);
        double mult = 0.0;

        next_rect.x = ms.target_Region.x;
        next_rect.y = ms.target_Region.y;
        next_rect.width = ms.target_Region.width;
        next_rect.height = ms.target_Region.height;
        uint16_t* int_buf = (uint16_t*)pool_notify_DataBuf;

        for(int i = 0; i < ms.target_Region.height; i++)
        {
            for(int j = 0; j < ms.target_Region.width; j++) {
              
                float norm_i = static_cast<float>(i-centre)/centre;
                float norm_j = static_cast<float>(j-centre)/centre;
                mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;

                float weight = FixedToFloat(int_buf[i*ms.target_Region.width + j]);

                delta_x += static_cast<float>(norm_j*weight*mult);
                delta_y += static_cast<float>(norm_i*weight*mult);
                sum_wij += static_cast<float>(weight*mult);
            }
        }

        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
        next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

        if(abs(next_rect.x-ms.target_Region.x)<1 && abs(next_rect.y-ms.target_Region.y)<1)
        {
            break;
        }
        else
        {
            ms.target_Region.x = next_rect.x;
            ms.target_Region.y = next_rect.y;
        }
      }      

      kernelTimer.Pause();

      #ifndef ARMCC
      // MCPROF_STOP();
      #endif
      
      // mark the tracked object in frame
      cv::rectangle(frame,next_rect,cv::Scalar(0,0,255),3);

      // write the frame
      writer << frame;
  }

  totalTimer.Pause();

  totalTimer.Print();
  kernelTimer.Print();

  return status ;
}


/** ============================================================================
 *  @func   pool_notify_Delete
 *
 *  @desc   This function releases resources allocated earlier by call to
 *          pool_notify_Create ().
 *          During cleanup, the allocated resources are being freed
 *          unconditionally. Actual applications may require stricter check
 *          against return values for robustness.
 *
 *  @modif  None
 *  ============================================================================
 */
NORMAL_API Void pool_notify_Delete (Uint8 processorId)
{
    DSP_STATUS status    = DSP_SOK ;
    DSP_STATUS tmpStatus = DSP_SOK ;

	#ifdef DEBUG
    printf ("Entered pool_notify_Delete ()\n") ;
	#endif

    /*
     *  Stop execution on DSP.
     */
    status = PROC_stop (processorId) ;
    if (DSP_FAILED (status)) {
        printf ("PROC_stop () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Unregister for notification of event registered earlier.
     */
    tmpStatus = NOTIFY_unregister (processorId,
                                   pool_notify_IPS_ID,
                                   pool_notify_IPS_EVENTNO,
                                   (FnNotifyCbck) pool_notify_Notify,
                                   0/* vladms pool_notify_SemPtr*/) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
        status = tmpStatus ;
        printf ("NOTIFY_unregister () failed Status = [0x%x]\n",
                         (int)status) ;
    }

    /*
     *  Free the memory allocated for the data buffer.
     */
    tmpStatus = POOL_free (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                           (Void *) pool_notify_DataBuf,
                           pool_notify_BufferSize) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
        status = tmpStatus ;
        printf ("POOL_free () DataBuf failed. Status = [0x%x]\n",
                         (int)status) ;
    }

    /*
     *  Close the pool
     */
    tmpStatus = POOL_close (POOL_makePoolId(processorId, SAMPLE_POOL_ID)) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
        status = tmpStatus ;
        printf ("POOL_close () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Detach from the processor
     */
    tmpStatus = PROC_detach  (processorId) ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
        status = tmpStatus ;
        printf ("PROC_detach () failed. Status = [0x%x]\n", (int)status) ;
    }

    /*
     *  Destroy the PROC object.
     */
    tmpStatus = PROC_destroy () ;
    if (DSP_SUCCEEDED (status) && DSP_FAILED (tmpStatus)) {
        status = tmpStatus ;
        printf ("PROC_destroy () failed. Status = [0x%x]\n", (int)status) ;
    }

	#ifdef DEBUG
    printf ("Leaving pool_notify_Delete ()\n") ;
	#endif
}


/** ============================================================================
 *  @func   pool_notify_Main
 *
 *  @desc   Entry point for the application
 *
 *  @modif  None
 *  ============================================================================
 */
NORMAL_API Void pool_notify_Main (IN Char8 * dspExecutable, IN Char8 * strBufferSize)
{
    DSP_STATUS status       = DSP_SOK ;
    Uint8      processorId  = 0 ;

	#ifdef DEBUG
    printf ("========== Sample Application : pool_notify ==========\n") ;
	#endif

    if (   (dspExecutable != NULL) && (strBufferSize != NULL)   ) 
	{
        /*
         *  Validate the buffer size and number of iterations specified.
         */
        pool_notify_BufferSize = DSPLINK_ALIGN ( atoi (strBufferSize),
                                             DSPLINK_BUF_ALIGN) ;
		#ifdef DEBUG
        printf(" Allocated a buffer of %d bytes\n",(int)pool_notify_BufferSize );
		#endif
		
        processorId = 0 ;
        if (pool_notify_BufferSize == 0) 
		{
            status = DSP_EINVALIDARG ;
            printf ("ERROR! Invalid arguments specified for  ");
            printf ("     Buffer size    = %d\n", (int)pool_notify_BufferSize) ;
        }

        /*
         *  Specify the dsp executable file name and the buffer size for
         *  pool_notify creation phase.
         */
        status = pool_notify_Create (dspExecutable,
                                     strBufferSize,
                                     0) ;

        if (DSP_SUCCEEDED (status)) 
		{
            status = pool_notify_Execute (pool_notify_NumIterations, 0) ;
        }

         pool_notify_Delete (processorId) ;
        
    }
    else 
	{
        status = DSP_EINVALIDARG ;
        printf ("ERROR! Invalid arguments specified for  "
                         "pool_notify application\n") ;
    }

    printf ("====================================================\n") ;
}

/** ----------------------------------------------------------------------------
 *  @func   pool_notify_Notify
 *
 *  @desc   This function implements the event callback registered with the
 *          NOTIFY component to receive notification indicating that the DSP-
 *          side application has completed its setup phase.
 *
 *  @modif  None
 *  ----------------------------------------------------------------------------
 */
STATIC Void pool_notify_Notify (Uint32 eventNo, Pvoid arg, Pvoid info)
{
	#ifdef DEBUG
    //printf("Notification %8d \n", (int)info);
	#endif
    /* Post the semaphore. */

  if ((int)info == 0) {
    sem_post(&sem); // Let execute
  }
}


#if defined (__cplusplus)
//}
#endif /* defined (__cplusplus) */
