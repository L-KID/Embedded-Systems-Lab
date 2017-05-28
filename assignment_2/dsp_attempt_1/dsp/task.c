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
//#include "opencv2/core/core.hpp"

extern Uint16 MPCSXFER_BufferSize ;


static Void Task_notify (Uint32 eventNo, Ptr arg, Ptr info) ;

#define CMD_RECV_TARGET_CAND 10
#define CMD_RECV_PDF_REPR    11

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

struct Rect target_region;
Uint32 command;

Int Task_execute (Task_TransferInfo * info)
{
  int sum;
  float* float_buf;
  float* target_candidate = (float*) malloc(128*sizeof(float)); // Currently assuming fixed size (since it is)

  if(target_candidate == NULL) {
    // Not enough memory available, what to do?
  }

  while (command != 0) {

    // Wait for new command
    SEM_pend (&(info->notifySemObj), SYS_FOREVER);

    switch (command) {
    case (Uint32)CMD_RECV_TARGET_CAND:
      
      // Invalidate cache
      BCACHE_inv ((Ptr)buf, length, TRUE);

      // Store target region from GPP
      target_region.height  = buf[0];
      target_region.width   = buf[1];
      target_region.x       = buf[2];
      target_region.y       = buf[3];

      // For testing
      buf[0] = 5;

      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      //notify that we are done
      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);

      // For testing
      break;

    case CMD_RECV_PDF_REPR:

      // Invalidate cache
      BCACHE_inv ((Ptr)buf, length, TRUE);
      
      // Store PDF representation from GPP
      float_buf = (float*)buf;
      memcpy(target_candidate, float_buf, 128 * sizeof(float));

      float_buf[0] = 1.5f;

      BCACHE_wbInv ((Ptr)buf, length, TRUE);

      NOTIFY_notify(ID_GPP,MPCSXFER_IPS_ID,MPCSXFER_IPS_EVENTNO,(Uint32)0);

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
