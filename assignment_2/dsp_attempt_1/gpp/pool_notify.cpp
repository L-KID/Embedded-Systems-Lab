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

/* ------------------------------------ Custom defines                  */
#define MSG_TARGET_REGION     10
#define MSG_TARGET_MODEL      11
#define MSG_BLUE_FRAME        12
#define MSG_GREEN_FRAME       13
#define MSG_RED_FRAME         14
#define MSG_TARGET_CANDIDATE  15
#define MSG_TRACK             16

#ifndef ARMCC
#include "markers.h"
#endif


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

cv::Mat kernel;

void unit_init(void) 
{
    unsigned int i;

    // Initialize the array with something
    for(i=0;i<pool_notify_BufferSize;i++) {
       pool_notify_DataBuf[i] = i % 20 + i % 5;
    }

    for(i=0;i<10;i++) {
       printf("Value before: %d\n", pool_notify_DataBuf[i]);
    }
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

int sum_dsp(unsigned char* buf, int length) 
{
    int a=0,i;
    for(i=0;i<length;i++) 
	{
       a=a+buf[i];
    }
    return a;
}

std::vector<uchar> matrix_to_vector(cv::Mat matrix) 
{
    std::vector<uchar> vec(matrix.rows * matrix.cols);
    if (matrix.isContinuous()) {
        vec.assign(matrix.datastart, matrix.dataend);
    } else {
        for (int i = 0; i < matrix.rows; ++i) {
            vec.insert(vec.end(), matrix.ptr<uchar>(i), matrix.ptr<uchar>(i) + matrix.cols);
        }
    }

    return vec;
}

std::vector<float> float_matrix_to_vector(cv::Mat matrix) 
{

    printf("Matrix rows: %d cols: %d\n", matrix.rows, matrix.cols);

    std::vector<float> vec(matrix.rows * matrix.cols);

    printf("Vector size: %d\n", vec.size());
    printf("Data type: %d\n", matrix.type());
    printf("Size of float: %d\n", sizeof(float));
    printf("Data length: %d\n", matrix.datastart - matrix.dataend);
    if (matrix.isContinuous()) {
        vec.assign(matrix.datastart, matrix.dataend);
    } else {
        for (int i = 0; i < matrix.rows; ++i) {
            vec.insert(vec.end(), matrix.ptr<float>(i), matrix.ptr<float>(i) + matrix.cols);
        }
    }

    printf("Vector size: %d\n", vec.size());

    return vec;
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

// Variables that must be global for notification
cv::Mat frame;
cv::Rect rect;
MeanShift ms;
Uint8 processorIdGlobal;
unsigned char* buf_dsp_global;
bool dsp_executing = false, dsp_done = false;

NORMAL_API DSP_STATUS pool_notify_Execute (IN Uint32 numIterations, Uint8 processorId)
{
  DSP_STATUS  status    = DSP_SOK ;

  long long start;
  int row, col;

  // Current solution... should be replaced #fix
  processorIdGlobal = processorId;

  // New variables for tracking
  cv::VideoCapture frame_capture;

	#if defined(DSP)
    unsigned char *buf_dsp;
    buf_dsp_global = buf_dsp; // #fix
	#endif

	#ifdef DEBUG
    printf ("Entered pool_notify_Execute ()\n") ;
	#endif

    start = get_usec();

    /* --------------------- TO DO:
        - Add filename as argument to main
        - Adjust buffer size according to video size?
    */

    // Initialize video reading and tracking
    ////////////////////////////////////////
    frame_capture = cv::VideoCapture("car.avi");

    //cv::Rect rect(228,367,86,58);
    rect.x = 228;
    rect.y = 367;
    rect.width = 86;
    rect.height = 58;

    frame_capture.read(frame);
    
    ms.Init_target_frame(frame, rect); // init the meanshift
    
    // More initialization for writing result
    /////////////////////////////////////////    
    int codec = CV_FOURCC('F', 'L', 'V', '1');
    cv::VideoWriter writer("tracking_result.avi", codec, 20, cv::Size(frame.cols,frame.rows));

    ///////////////////////////////////////////////
    // Send target_region and rows + cols to DSP //
    ///////////////////////////////////////////////
    // Attempt 2: send by notify...
    ///////////////////////////////////////////////
    // Tell DSP to receive target_region and target_model

    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (int)rect.height);
    sem_wait(&sem);

    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (int)rect.width);
    sem_wait(&sem);
    
    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (int)rect.x);
    sem_wait(&sem);
    
    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (int)rect.y);
    sem_wait(&sem);
    
    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (int)frame.rows);
    sem_wait(&sem);
    
    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (int)frame.cols);
    sem_wait(&sem);

    /*
    pool_notify_DataBuf[0] = static_cast<uchar>(rect.height);
    pool_notify_DataBuf[1] = static_cast<uchar>(rect.width);
    pool_notify_DataBuf[2] = static_cast<uchar>(rect.x);
    pool_notify_DataBuf[3] = static_cast<uchar>(rect.y);
    pool_notify_DataBuf[4] = static_cast<uchar>(frame.rows);
    pool_notify_DataBuf[5] = static_cast<uchar>(frame.cols);

    POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                    pool_notify_DataBuf,
                    pool_notify_BufferSize);

    POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                         (void**)&buf_dsp,
                         AddrType_Dsp,
                         (Void *) pool_notify_DataBuf,
                         AddrType_Usr) ;

    // Tell DSP to receive target_region and target_model
    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)MSG_TARGET_REGION);

    if (DSP_FAILED (status)) 
    {
        printf ("NOTIFY_notify () DataBuf failed."
                " Status = [0x%x]\n",
                 (int)status) ;
    }

    // Wait for DSP to store target_region
    //sem_wait(&sem);

    // Invalidate buffer #fix?
    POOL_invalidate (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                                    pool_notify_DataBuf,
                                    pool_notify_BufferSize);
*/

    //////////////////////////////
    // Send target_model to DSP //
    //////////////////////////////

    // TO DO: simplify, maybe separate function? #fix
    // Currently not sending size, as PDF Model is fixed to 8x16

    // Must cast to float buffer since PDF Model uses float
    // Store matrix in shared buffer as array

    float* float_buf = (float*)pool_notify_DataBuf;
    if(ms.target_model.isContinuous()) {
        std::copy((float*)ms.target_model.datastart, (float*)ms.target_model.dataend, float_buf);
    } else {
        // Iterate and manually insert. There is probably some faster way to do this.
        for (row = 0; row < ms.target_model.rows; row++) {
            for (col = 0; col < ms.target_model.cols; col++) {
                float_buf[row*ms.target_model.rows + col] = ms.target_model.at<float>(row, col);
            }
        }
    }

    POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                    pool_notify_DataBuf,
                    pool_notify_BufferSize);

    POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                         (void**)&buf_dsp,
                         AddrType_Dsp,
                         (Void *) pool_notify_DataBuf,
                         AddrType_Usr) ;

    for(int i = 0; i < 10; i++) {
      printf(" %f ", float_buf[i]);
    }
    printf("\n");

    // Tell DSP to receive target_model
    ///////////////////////////////////
    status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)11);
    if (DSP_FAILED (status)) 
    {
        printf ("NOTIFY_notify () DataBuf failed."
                " Status = [0x%x]\n",
                 (int)status) ;
    }

    // Wait for DSP to store data
    /////////////////////////////
    sem_wait(&sem);

    for(int i = 0; i < 10; i++) {
      printf(" %f ", float_buf[i]);
    }
    printf("\n");

    int TotalFrames = 32;
    int fcount;

    cv::Mat previousFrame;
    cv::Rect ms_rect = rect;

    printf("We are here\n");

    // MAIN LOOP
    ////////////
    for (fcount = 0; fcount <= TotalFrames; ++fcount) {

      // If this is not the first frame, store the previous one.
      /*if(fcount > 0) {
        previousFrame = frame;
      }*/

      if (fcount < TotalFrames) {
        // read a frame
        int status = frame_capture.read(frame);
        if( 0 == status ) break;

        // TRACKING STARTS HERE

        // Split frame into BGR
        std::vector<cv::Mat> bgr_planes;
        cv::split(frame, bgr_planes);

        // Send each BGR frame separately to DSP
        for (int i = 0; i < 3; i++) {
          copy_uchar_matrix_to_buffer(bgr_planes[i], pool_notify_DataBuf);

          POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                    pool_notify_DataBuf,
                    pool_notify_BufferSize);

          POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                               (void**)&buf_dsp,
                               AddrType_Dsp,
                               (Void *) pool_notify_DataBuf,
                               AddrType_Usr) ;

          // Tell DSP to receive BGR_planes
          ///////////////////////////////////

          // Debug
          for(int j = 100; j < 110; j++) {
            printf(" %d ", bgr_planes[i].at<unsigned char>(0,j));
          }
          printf("\n");

          status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)(12 + i));
          if (DSP_FAILED (status)) 
          {
              printf ("NOTIFY_notify () DataBuf failed."
                      " Status = [0x%x]\n",
                       (int)status) ;
          }

          // Wait for DSP to store data
          /////////////////////////////
          printf("Waiting\n");
          sem_wait(&sem);

          // Debug
          for(int j = 100; j < 110; j++) {
            printf(" %d ", bgr_planes[i].at<unsigned char>(0,j));
          }
          printf("\n");

        }

        // Tell DSP to execute and wait
        dsp_executing = true;
        NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)16);
        printf("Let's execute\n");

        while(dsp_executing) {
          sem_wait(&sem);
          printf("Sending target_candidate\n");

          // Calculate and send target_candidate
          POOL_invalidate (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                                          pool_notify_DataBuf,
                                          pool_notify_BufferSize);   

          // Calculate the target_candidate
          cv::Mat target_candidate = ms.pdf_representation(frame, rect);

          // Send the target_candidate to the DSP
          copy_float_matrix_to_buffer(target_candidate, pool_notify_DataBuf);

          POOL_writeback (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                          pool_notify_DataBuf,
                          pool_notify_BufferSize);

          POOL_translateAddr ( POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                               (void**)&buf_dsp,
                               AddrType_Dsp,
                               (Void *) pool_notify_DataBuf,
                               AddrType_Usr) ;

          printf("Here\n");

          // Tell DSP to receive target_candidate
          status = NOTIFY_notify (processorId, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)30); // Random value currently, it is not checked
          if (DSP_FAILED (status)) 
          {
              printf ("NOTIFY_notify () DataBuf failed."
                      " Status = [0x%x]\n",
                       (int)status) ;
          }
        }
      }

      // We already have a frame, so let's write it while DSP calculates
      // Only if we already have calculated one frame though
      /*if (fcount > 0) {

        cv::rectangle(previousFrame, ms_rect, cv::Scalar(0, 0, 255), 3);
        writer << previousFrame;
      }

      if (fcount < TotalFrames) {
        // Wait for rectangle from DSP
        printf("Waiting for result\n");
        sem_wait(&sem);

        // Store rectangle from DSP
        POOL_invalidate (POOL_makePoolId(processorId, SAMPLE_POOL_ID),
                                    pool_notify_DataBuf,
                                    pool_notify_BufferSize);
      }*/
    }

    printf("Sum execution time %lld us.unsigned char\n", get_usec()-start);

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
    printf("Notification %8d \n", (int)info);
	#endif
    /* Post the semaphore. */

  static int count = 0;

  if (dsp_executing) {
    count++;

    // It is done, result will come
    if ((int)info == 0) {
      count = 0;
      dsp_executing = false;
      dsp_done = true;
    }
    else if (count == 1) {
      rect.x = (int)info;
    } else if (count == 2) { // receive y
      rect.y = (int)info;
      count = 0;
      sem_post(&sem); // Let execute
    }

      // Calculate and send target_candidate
      /*POOL_invalidate (POOL_makePoolId(processorIdGlobal, SAMPLE_POOL_ID),
                                      pool_notify_DataBuf,
                                      pool_notify_BufferSize);   

      // Calculate the target_candidate
      cv::Mat target_candidate = ms.pdf_representation(frame, rect);

      // Send the target_candidate to the DSP
      copy_float_matrix_to_buffer(target_candidate, pool_notify_DataBuf);

      POOL_writeback (POOL_makePoolId(processorIdGlobal, SAMPLE_POOL_ID),
                      pool_notify_DataBuf,
                      pool_notify_BufferSize);

      POOL_translateAddr ( POOL_makePoolId(processorIdGlobal, SAMPLE_POOL_ID),
                           (void**)&buf_dsp_global,
                           AddrType_Dsp,
                           (Void *) pool_notify_DataBuf,
                           AddrType_Usr) ;

      // Tell DSP to receive target_candidate
      NOTIFY_notify (processorIdGlobal, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)30); // Random value currently, it is not checked
    
      count = 0;
    } else if (dsp_done) {
      count++;

      if(count == 1) {
        printf("Result x: %d\n", (int)info);
      } else if (count == 2) {
        printf("Result y: %d\n", (int)info);
        count = 0;
        dsp_done = false;
        sem_post(&sem);
      }
    }*/
    
    /*
    if ((int)info == 20) 
    {
      // Calculate and send target_candidate
      POOL_invalidate (POOL_makePoolId(processorIdGlobal, SAMPLE_POOL_ID),
                                      pool_notify_DataBuf,
                                      pool_notify_BufferSize);   

      // Retrieve current rectangle position from DSP
      rect.x = pool_notify_DataBuf[0];
      rect.y = pool_notify_DataBuf[1];

      // Calculate the target_candidate
      cv::Mat target_candidate = ms.pdf_representation(frame, rect);

      // Send the target_candidate to the DSP
      copy_float_matrix_to_buffer(target_candidate, pool_notify_DataBuf);

      POOL_writeback (POOL_makePoolId(processorIdGlobal, SAMPLE_POOL_ID),
                      pool_notify_DataBuf,
                      pool_notify_BufferSize);

      POOL_translateAddr ( POOL_makePoolId(processorIdGlobal, SAMPLE_POOL_ID),
                           (void**)&buf_dsp_global,
                           AddrType_Dsp,
                           (Void *) pool_notify_DataBuf,
                           AddrType_Usr) ;

      // Tell DSP to receive target_candidate
      ///////////////////////////////////////
      NOTIFY_notify (processorIdGlobal, pool_notify_IPS_ID, pool_notify_IPS_EVENTNO, (Uint32)30); // Random value currently, it is not checked
    
      sem_post(&sem);
    }*/
  } else {
    if((int)info==0) 
    {
      sem_post(&sem);
    }
    else {
      //sem_post(&sem);
    }
  }
}


#if defined (__cplusplus)
//}
#endif /* defined (__cplusplus) */
