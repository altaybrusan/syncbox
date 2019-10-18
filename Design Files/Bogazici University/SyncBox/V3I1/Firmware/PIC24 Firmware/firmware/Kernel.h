/**
 * \file Kernel.h
 * \brief public interface of the xPOST kernel. 
 * \details The kernel header files include kernel's public methods,structures and enums.
 * This file can be seen as the \a public \a interface of the kernel. The device APIs and
 * instrument can include this header file and then call the kernels services.
 */
#ifndef KERNEL_H
  #define KERNEL_H
  
  #include "jsmn.h"
  

  //*********************************  structures ****************************
  /**
   * \enum DEVICE_TYPE
   * \brief includes all kernel supported \b device \b types and its cardinality.
   * 
   * \note these types are written to make the code more clear, however, a more general code
   * can use more abstract nameing convention such as DEVEICE1, DEVICE2, etc.
   */
  typedef enum {
   WORKSTATION,
   GENERATOR,
   ACTUATOR,
   COLLIMATOR,
   DETECTOR,
   VENTILATOR,
   ALARM,
   COOLING,
   DISPLAY,
   __DEVICE_TYPES_COUNT = 9
  } DEVICE_TYPE;
  
  /**
   * \enum define frames priority
   * \details The way that the kernel handel the message depends on their priority.
   * normal frames are enqueued in a buffer and later on dispached to the the receiver.
   * However, realtime frames are delivered to the destination immadiately.
   */
  typedef enum {
    NORMAL_FRAME,
    REALTIME_FRAME
  } FRAME_PRIORITY;
  
  /**
   * \enum FRAME_TYPE 
   * \details define frame types.   
   */
   typedef enum{
      UNSTRUCTURED, //!< Does not require JSON parse.
      STRUCTURED    //!< Requires JSON parse.
   } FRAME_TYPE;
   
   /**
    * \struct KERNEL_FRAME
	* \brief define the structure of messages.
	* \details Kernel accept and deliver message between APIs and devices in a 
	* KERNEL_FRAME format. This format includes the  message and some meta-data.
	* based on this meta-data kernel treat the message in special way. 
	*/
   typedef struct {
      DEVICE_TYPE F_SENDER;      //!< Which device produced the FRAME. Useful for device level priority
      DEVICE_TYPE F_RECEIVER;    //!< in which buffer the FRAME is stored in.
      FRAME_TYPE F_TYPE;         //!< JSON parser is required or not
      FRAME_PRIORITY F_PRIORITY; //!< Frame priority used by Kernel dispatcher
      char* FRAME_MESSAGE;       //!< Frame Content
      int MESSAGE_LENGTH;
   } KERNEL_FRAME;
  
   typedef void (*FrameHandler)(KERNEL_FRAME);
   typedef void (*InstrumentStart)();
   /**
    * \struct DEVICE_SLOT
	* \brief Define the structure of a device slot on the kernel.
	* \details Device slot define a mechanism for kernel to inform API with new message.
	* The device type determines which device API is connected to the slot and the handler
	* is the API's callback function.
	*/
  typedef struct {
   DEVICE_TYPE device;   //!< device type. 
   FrameHandler handler; //!< device handler.
  } DEVICE_SLOT;



 //********************** Kernel System Calls *****************************

  void KL_RegisterDevice(DEVICE_SLOT);

  void KL_SendFrame(KERNEL_FRAME*);

  void KL_SendSignal(void*); // TODO: implement this

  void KL_Read();             // TODO: implement this
  
  void KL_Bootup();

  void KL_RegisterInstrument(InstrumentStart);
  
  //void KL_StartInstrument();

#endif