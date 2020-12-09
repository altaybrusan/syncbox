/** \file Kernel.c
 * \brief implement xPOST kernel.
 * \details Messages  produced by device's API and send to Kernel and the kernel delivers
 * them to the port and vice versa.
 * Messages are divided into two types: Real-time which are sent immadiately and
 * normal messages which are piled up into the device buffer and sent by kernel's dispacher
 * engine.
 * Each message is array of charachters. The maximum size of the array is tunable
 * inside the kernel via \b MAX_MSG_SIZE. If a device message length was equal zero
 * then the kernel assumes that the message was C-Style charachter string. In
 * other words, the message is terminated by a '\0'. So, during enlisting and sending
 * the operation is continued up until the first '\0' is hit. If the message length
 * where not equal to zero, then kernel automatically reads, enlist and transmit it
 * up to a specific message length (see also ConnectionMap.h).  
 * Each device type has a specified amount of buffer for sending the message to
 * the device. The device buffer is static array with fixed size. We have tested
 * dynamic memory allocation, but we noticed some problems during runtime. For this,
 * version we have used this static array, but we are planning for turning it into
 * dynamic memory allocation approach for the future implementations.
 * Device buffer is filled in circular linked list fasion. It would be better to seperate
 * the implementaion in a separate file instead of hard coding it inside this kernel file and
 * It is planned for future version.
 *
 * - Abrivations
 *   -# gen: Generator																																																											 Len: Length
 *	 -# act: Actuator
 *	 -# wks: Workstation
 *	 -# ptr: Pointer
 *	 -# buf: Buffer
 *	 -# msg: Message
 *	 -# Acc: Accumulator
 *	 -# Len: Length
 *	 -# trc: Trace
 *
 * \author Altay Brusan \author Aytac Durmaz \version   0.5a  \copyright &copy 2018 Bogazici University  
 * \n License: GNU Public License.
 */

#include "kernel.h"
#include "jsmn.h"
#if build==debug
#include "ConnectionMap.h"
#endif
#include "PIC24eDef.h"
#include <stdbool.h>

//!  \brief Amount of buffer for each device type.
static const int DEVICE_BUFFER_SIZE = 35;
//!  \brief  Maximum amount of JSON tokens in a message.
static const int JSON_TOKEN_CARDINALITY = 128;
//!  \brief  Maximum message size.
static const int MAX_MSG_SIZE = 30;

/** 
 * \brief Kernal internal data structure. 
 */
typedef struct
{
	char pData[MAX_MSG_SIZE]; //!< Storage for charachter string message.
	volatile int   iLen;      //!< Message length
} KL_PACKET;



/**
 * \brief allocate \a DEVICE_BUFFER_SIZE of \a KERNEL_FRAME for uart1.
 * \details The device connected to UART1 sends string message to kernel. Then the 
 * kernel reads the message charachter by charachter and depends on ConnectionMap.h configuration,
 * (may) construct a KENRENL_FRAME instance. This instance is buffered inside the UART1 received buffer.
 */
static KERNEL_FRAME  Uart1ReceiveBuf[DEVICE_BUFFER_SIZE];
/**
* \brief UART1 received buffer read pointer. 
* \details The \a Uart1RcivBufRdPtr locates the index of the slot of the Uart1ReceiveBuf 
* on which the KERNEL_FRAME is going to be read from.
*/
int Uart1RcivBufRdPtr = 0, Uart1RcivBufWrPtr = 0; //!< \brief UART1 received buffer write pointer.
                                                  //!< \details The \a Uart1RcivBufWrPtr locates 
                                                  //! the index of the slot of the Uart1ReceiveBuf 
                                                  //! that the next frame is going to be
                                                  //! written to.

/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KERNEL_FRAME for uart2.
* \details The device connected to UART2 sends string message to kernel. Then the
* kernel reads the message charachter by charachter and depends on ConnectionMap.h configuration,
* (may) construct a KENRENL_FRAME instance. This instance is buffered inside the UART2 received buffer.
*/
static KERNEL_FRAME  Uart2ReceiveBuf[DEVICE_BUFFER_SIZE];
/**
* \brief UART2 received buffer read pointer.
* \details The \a Uart2RcivBufRdPtr locates the index of the slot of the Uart2ReceiveBuf
* on which the KERNEL_FRAME is going to be read from.
*/
int Uart2RcivBufRdPtr = 0, Uart2RcivBufWrPtr = 0; //!< \brief UART2 received buffer write pointer.
												  //!< \details The \a Uart2RcivBufWrPtr locates the 
                                                  //! index of the slot of the Uart2ReceiveBuf 
                                                  //! that the next frame is going to be 
                                                  //! written to.

/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KERNEL_FRAME for uart3.
* \details The device connected to UART3 sends string message to kernel. Then the
* kernel reads the message charachter by charachter and depends on ConnectionMap.h configuration,
* (may) construct a KENRENL_FRAME instance. This instance is buffered inside the UART3 received buffer.
*/
static KERNEL_FRAME  Uart3ReceiveBuf[DEVICE_BUFFER_SIZE];
/**
* \brief UART3 received buffer read pointer.
* \details The \a Uart3RcivBufRdPtr locates the index of the slot of the Uart3ReceiveBuf
* on which the KERNEL_FRAME is going to be read from.
*/
int Uart3RcivBufRdPtr = 0, Uart3RcivBufWrPtr = 0; //!< \brief UART3 received buffer write pointer.
												  //!< \details The \a Uart3RcivBufWrPtr locates the 
                                                  //!< index of the slot of the Uart3ReceiveBuf 
                                                  //!< that the next frame is going to be 
                                                  //!< written to.


/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KERNEL_FRAME for uart4.
* \details The device connected to UART4 sends string message to kernel. Then the
* kernel reads the message charachter by charachter and depends on ConnectionMap.h configuration,
* (may) construct a KENRENL_FRAME instance. This instance is buffered inside the UART4 received buffer.
*/
static KERNEL_FRAME  Uart4ReceiveBuf[DEVICE_BUFFER_SIZE];
/**
* \brief UART4 received buffer read pointer.
* \details The \a Uart4RcivBufRdPtr locates the index of the slot of the Uart4ReceiveBuf
* on which the KERNEL_FRAME is going to be read from.
*/
int Uart4RcivBufRdPtr = 0, Uart4RcivBufWrPtr = 0; //!< \brief UART4 received buffer write pointer.
												  //!< \details The \a Uart4RcivBufWrPtr locates the 
                                                  //!< index of the slot of the Uart4ReceiveBuf 
                                                  //!< that the next frame is going to be 
                                                  //!< written to.


/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KL_PACKET for generator.
* \details The generator API sends KL_PACKET to the kernel. The
* kernel reads the packet content and if it was not real-time, it is buffered inside
* the genSendBuf. Later on, the packet is dispached to the device
*/
static KL_PACKET  genSendBuf[DEVICE_BUFFER_SIZE];
/**
* \brief generator-send read pointer.
* \details The \a genSndRdPtr locates the index of the genSendBuf
* from which the KL_PACKET is going to be read.
*/
int genSndRdPtr = 0, genSndWrPtr = 0; //!< \brief generator-send write pointer.
									  //!< \details The \a genSndWrPtr locates the 
                                      //!< index of genSendBuf that the next frame 
                                      //!< is going to be written on.


/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KL_PACKET for actuator.
* \details The actuator API sends KL_PACKET to the kernel. The
* kernel reads the packet content and if it was not real-time, it is buffered inside
* the actSendBuf. Later on, the packet is dispached to the device
*/
volatile KL_PACKET  actSendBuf[DEVICE_BUFFER_SIZE];
/**
* \brief actuator-send read pointer.
* \details The \a actSndRdPtr locates the index of the actSendBuf
* from which the KL_PACKET is going to be read.
*/
volatile int actSndRdPtr = 0, actSndWrPtr = 0; //!< \brief actuator-send write pointer.
											   //!< \details The \a genSndWrPtr locates the 
											   //!< index of actSendBuf that the next frame 
											   //!< is going to be written on.


											   
/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KL_PACKET for workstation.
* \details The workstation API sends KL_PACKET to the kernel. The
* kernel reads the packet content and if it was not real-time, it is buffered inside
* the wrkSendBuf. Later on, the packet is dispached to the device
*/
static KL_PACKET  wrkSendBuf[DEVICE_BUFFER_SIZE];
/**
* \brief workstation-send read pointer.
* \details The \a wrkSndRdPtr locates the index of the wrkSendBuf
* from which the KL_PACKET is going to be read.
*/
int wrkSndRdPtr = 0, wrkSndWrPtr = 0;//!< \brief workstation-send write pointer.
									 //!< \details The \a wrkSndWrPtr locates the 
									 //!< index of wrkSendBuf that the next frame 
									 //!< is going to be written on.



/**
* \brief allocate \a DEVICE_BUFFER_SIZE of \a KL_PACKET for display.
* \details The display API sends KL_PACKET to the kernel. The
* kernel reads the packet content and if it was not real-time, it is buffered inside
* the disSendBuf. Later on, the packet is dispached to the device
*/
static KL_PACKET  disSndBuf[DEVICE_BUFFER_SIZE];

/**
* \brief display-send read pointer.
* \details The \a disSndRdPtr locates the index of the disSendBuf
* from which the KL_PACKET is going to be read.
*/
int disSndRdPtr = 0, disSndWrPtr = 0;//!< \brief display-send write pointer.
									 //!< \details The \a disSndWrPtr locates the 
									 //!< index of disSendBuf that the next frame 
									 //!< is going to be written on.

/**
 * \brief JSON parser instance from jsmn.c
 * \details the formated messages are parsed by \a _parser. 
 */
static jsmn_parser _parser;
/**
 * \brief JSON tokes paresed by \a _parser are stored inside tokens.
 */
jsmntok_t tokens[JSON_TOKEN_CARDINALITY];

/**
 * \brief for each device type there is one slot on the kernel 
 * \details Each device API register a callback function with kernel. By means of this
 *  function kernel can communicate with the API device.
 */ 
DEVICE_SLOT _SLOTS[__DEVICE_TYPES_COUNT];

/**
 * \brief a temporary accumulator array for holding the received messages from uart1
 */
char _uart1AccBuf[MAX_MSG_SIZE];
/**
 * \brief a temporary accumulator array for holding the received messages from uart2
 */
char _uart2AccBuf[MAX_MSG_SIZE];
/**
 * \brief a temporary accumulator array for holding the received messages from uart3
 */
char _uart3AccBuf[MAX_MSG_SIZE];
/**
 * \brief a temporary accumulator array for holding the received messages from uart4
 */
char _uart4AccBuf[MAX_MSG_SIZE];

/**
 * \brief after successful bootup, kernel calls _startupFunction
 * \details the main.c should register the insrument.c startup function into the kernel.c
 */
InstrumentStart _startupFunction = 0;

//******************************System Resources********************************

/** 
 *  \brief generator send buffer mutex. 
 *	\details false means the mutex is not acquired and true means the mutex is acquired
 */
volatile bool genSendMutex = false;

/**
 * \brief actuator send buffer mutex.
 * \details false means the mutex is not acquired and true means the mutex is acquired
 */
volatile bool actMutex = false;

/**
 * \brief display send buffer mutex.
 * \details false means the mutex is not acquired and true means the mutex is acquired
 */
volatile bool disMutex = false;

/**
 * \brief mutex for uart1 receive buffer.
 * \details false means the mutex is not acquired and true means the mutex is acquired.
 */
volatile bool uart1ReceiveMutex = false;

/**
* \brief mutex for uart2 receive buffer.
* \details false means the mutex is not acquired and true means the mutex is acquired.
*/
volatile bool uart2ReceiveMutex = false;

/**
* \brief mutex for uart3 receive buffer.
* \details false means the mutex is not acquired and true means the mutex is acquired.
*/
volatile bool uart3ReceiveMutex = false;

/**
* \brief mutex for uart4 receive buffer.
* \details false means the mutex is not acquired and true means the mutex is acquired.
*/
volatile bool uart4ReceiveMutex = false;
//******************************Private Functions*******************************

/**
* \brief kernel private function.
* \details reset all internal buffers and variables. This function is just called during bootup.
*/
void KL_ClearKernelMemory()
{
	int idx = 0;
	memset(_uart1AccBuf, 0x00, MAX_MSG_SIZE);
	memset(_uart2AccBuf, 0x00, MAX_MSG_SIZE);
	memset(_uart3AccBuf, 0x00, MAX_MSG_SIZE);
	memset(_uart4AccBuf, 0x00, MAX_MSG_SIZE);

	// initialize IO buffers
	for (idx = 0; idx < DEVICE_BUFFER_SIZE; idx++)
	{
		memset(genSendBuf[idx].pData, '\0', MAX_MSG_SIZE);
		genSendBuf[idx].iLen = 0;

		memset(actSendBuf[idx].pData, '\0', MAX_MSG_SIZE);
		actSendBuf[idx].iLen = 0;

		memset(wrkSendBuf[idx].pData, '\0', MAX_MSG_SIZE);
		wrkSendBuf[idx].iLen = 0;

		memset(disSndBuf[idx].pData, '\0', MAX_MSG_SIZE);
		disSndBuf[idx].iLen = 0;

		Uart1ReceiveBuf[idx].MESSAGE_LENGTH = 0;
		Uart4ReceiveBuf[idx].MESSAGE_LENGTH = 0;
	}
}

/**
 * \brief kernal private function.
 * \details The CallSlotHandler searchs among the registered devices and call its handler. 
 * In this way, a frame is transfered from Kernel to API. 
 * \param[in] _frame The frame that is going to be delivered to the API
 */
void KL_CallSlotHandler(KERNEL_FRAME _frame)
{

#if build==debug
	//SendDebugMsg("\r    SEARCHING SLOT...");
#endif

	int i = 0;
	for (i = 0; i <= __DEVICE_TYPES_COUNT; i++)
	{
		// the callback slot is not empty
		if (_SLOTS[i].device == _frame.F_RECEIVER)
		{
			//KERNEL_FRAME _frame;

#if build==debug
			//  SendDebugMsg("\r SLOT FOUND!");
#endif
			//_frame.F_SENDER = device;
			//_frame.F_TYPE = UNSTRUCTURED; // kernel do not pars the received msg
			//_frame.FRAME_MESSAGE = message;
			_SLOTS[i].handler(_frame);
			break;
		}
	}
}


/*!
 * \brief starts the dispacher engine to start dispatch the buffers contents.
 * \details The dispacher engin is Timer1. With the device configurations 
 * timer1 period is Time = 200  ms. It is adjustable via Time Calculator tool 
 * provided by MikroE. Just copy and past the content into this file.
 */
void KL_StartDispacherEngine() {

	T2CON = 0x00;
	T3CON = 0x0;
	TMR2 = 0;
	TMR3 = 0;
	T3IE_bit = 1;
	T3IF_bit = 0;
	T3IP_0_bit = 1;
	T3IP_1_bit = 1;
	T3IP_2_bit = 1;
	PR3 = 106;
	PR2 = 53290;
	T2CONbits.TON = 1;
	T2CONbits.T32 = 1;


}

/*!
 * \brief  the dispacher engin executes KL_DistributeFrames periodically.
 * \details distribute frames inside send and receive buffers for all device types.
 * the KL_DistributeFrames dequeue frames for all devices of both send and receive types.
 * and calls private function KL_CallSlotHandler to hand over the frame to API.
 * \note the order that the buffers are dequeued reflect the device type importance
 */
void KL_DistributeFrames()
{

	int _index = 0;

	// First Device: GENERATOR
	// if mutex is free ?
	if (genSendMutex == false)
	{
		// take a pointer to the generator send buffer
		// DO NOT DIRECTLY USE THE actSendBuf. IT WILL NOT WORK!!!
		int* xLen = &genSendBuf[genSndRdPtr].iLen;
		char* xPtr = genSendBuf[genSndRdPtr].pData;

		// what is the generator message length?
		if (*xLen == 0)
		{
			// contol message length
			if (strlen(xPtr) != 0)
			{
				// message exists
				// send until hit c-style string termination charachter
#if build == debug
				SendDebugMsg("\r    >>SEND TO GENERATOR:  ");
#endif

				// send until  hit the C-style string termination charachter
			// TODO: what if the terminating string was something else?
				_index = 0;
				while (xPtr[_index] != '\0')
				{

#if build == debug
					SendDebugChr(xPtr[_index]);
#endif
					SendToGenerator(xPtr[_index]);
					_index++;
				}

				// clear buffer
				memset(xPtr, '\0', MAX_MSG_SIZE - 1);
				// not necessary for here. protect against any possible trash values
				*xLen = 0;

				// circular buffer pointer re-allocation
				if (genSndRdPtr == DEVICE_BUFFER_SIZE - 1 || genSndRdPtr >= DEVICE_BUFFER_SIZE)
				{
					genSndRdPtr = 0;  // return to the head
				}
				else
				{
					genSndRdPtr = genSndRdPtr + 1; // proceed one step
				}
			}
		}
		else
		{
			// send message by the amount of its length
#if build == debug
			SendDebugMsg("\r    >>SEND TO GENERATOR:  ");
#endif
			_index = 0;
			while (_index <= *xLen)
			{

#if build == debug
				SendDebugChr(xPtr[_index]);
#endif
				SendToGenerator(xPtr[_index]);
				_index++;
			}

			// clear buffer
			memset(xPtr, '\0', MAX_MSG_SIZE - 1);
			*xLen = 0;    // this is must!

			// relocate circular buffer pointer 
			if (genSndRdPtr == DEVICE_BUFFER_SIZE - 1 || genSndRdPtr >= DEVICE_BUFFER_SIZE)
			{
				genSndRdPtr = 0;  // return to the head
			}
			else
			{
				genSndRdPtr = genSndRdPtr + 1;
			}
		}
	}

	// Second Device: Actuator
	// if mutex is free?
	if (actMutex == false)
	{

		// take a pointer to the actuator send buffer
		// DO NOT DIRECTLY USE THE actSendBuf. IT WILL NOT WORK!!!
		int* xLen = &actSendBuf[actSndRdPtr].iLen;
		char* xPtr = actSendBuf[actSndRdPtr].pData;

		//what is the actuator message length?
		if (*xLen == 0)
		{
			// zero length messages: 
			// a) send til hit C-Style null termination charachter
			// b) nothing to send.
			if (strlen(xPtr) != 0)
			{
				// message exists
				// send until hit C-Style string termination string
#if build == debug
				SendDebugMsg("\r    >> SEND TO ACTUATOR :  ");
#endif
				while (xPtr[_index] != '\0')
				{
#if build == debug
					SendDebugChr(xPtr[_index]);
#endif
					SendToActuator(xPtr[_index]);
					_index++;
				}

				// clear buffer
				memset(xPtr, '\0', MAX_MSG_SIZE - 1);
				// not necessary, to make sure not trash value exists
				*xLen = 0;
				//circular buffer
				if (actSndRdPtr == DEVICE_BUFFER_SIZE - 1 || actSndRdPtr >= DEVICE_BUFFER_SIZE)
				{
					actSndRdPtr = 0;  // return to the head
				}
				else
				{
					actSndRdPtr = actSndRdPtr + 1;
				}
			}
		}
		else
		{
			// sends message by the amount of its length
#if build == debug
			SendDebugMsg("    >> SEND TO ACTUATOR : ");
#endif
			_index = 0;
			while (_index < *xLen)
			{
#if build == debug
				SendDebugChr(xPtr[_index]);
#endif
				SendToActuator(xPtr[_index]);
				_index++;
			}

			// clear buffer & message length
			memset(xPtr, '\0', MAX_MSG_SIZE - 1);
			*xLen = 0;    // this is a must!

			if (actSndRdPtr == DEVICE_BUFFER_SIZE - 1 || actSndRdPtr >= DEVICE_BUFFER_SIZE)
			{
				actSndRdPtr = 0;  // return to the head
			}
			else
			{
				actSndRdPtr = actSndRdPtr + 1;
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                // relocate circular buffer pointer
		}
	}


	// Third Device: Display
	// if mutex is free
	if (disMutex == false)
	{
		// control message length
		if (disSndBuf[disSndRdPtr].iLen == 0)
		{
			// Two cases:
			// a) Send until hit C-Style null terminating char
			// b) Nothing to send
			if (strlen((disSndBuf[disSndRdPtr].pData)) != 0)
			{
				// message exists
				// send until hit C-Style string termination string

#if build == debug
				SendDebugMsg("\r    >>DISPLAY MESSAGE:  ");
#endif
				while (((char*)((disSndBuf[disSndRdPtr]).pData))[_index] != '\0')
				{
#if build == debug
					SendDebugChr(((char*)((disSndBuf[disSndRdPtr]).pData))[_index]);
#endif
					SendToDisplay(((char*)((disSndBuf[disSndRdPtr]).pData))[_index]);
					_index++;
				}

				// clear buffer
				memset(disSndBuf[disSndRdPtr].pData, '\0', MAX_MSG_SIZE);
				// not necessary, to make sure no trash value exists
				actSendBuf[disSndRdPtr].iLen = 0;
				// circular buffer
				if (disSndRdPtr == DEVICE_BUFFER_SIZE - 1 || disSndRdPtr >= DEVICE_BUFFER_SIZE)
				{
					disSndRdPtr = 0;  // return to the head
				}
				else
				{
					disSndRdPtr = disSndRdPtr + 1;
				}
			}
		}
		else
		{
			// send all available chars in message

			SendDebugMsg("\r    >>SEND TO DISPLAY : ");
			_index = 0;
			while (_index < disSndBuf[disSndRdPtr].iLen)
			{
#if build == display
				SendDebugChr(((char*)disSndBuf[disSndRdPtr].pData)[_index]);
#endif
				SendToDisplay(((char*)disSndBuf[disSndRdPtr].pData)[_index]);
				_index++;
			}

			// clear buffer & message length
			memset((char*)disSndBuf[disSndRdPtr].pData, '\0', MAX_MSG_SIZE);
			disSndBuf[disSndRdPtr].iLen = 0;      // this is a must!

			// relocate circular buffer pointer
			if (disSndRdPtr == DEVICE_BUFFER_SIZE - 1 || disSndRdPtr >= DEVICE_BUFFER_SIZE)
			{
				disSndRdPtr = 0;  // return to the head
			}
			else
			{
				disSndRdPtr = disSndRdPtr + 1;
			}
		}
	}


	if (uart1ReceiveMutex == false)
	{
		if (Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH != 0)
		{
			KL_CallSlotHandler(Uart1ReceiveBuf[Uart1RcivBufRdPtr]);

			//SendDebugChr(Uart1ReceiveBuf[Uart1RcivBufRdPtr].FRAME_MESSAGE[0]);
			//SendDebugChr(Uart1ReceiveBuf[Uart1RcivBufRdPtr].FRAME_MESSAGE[1]);
			// clear buffer
			//memset( Uart1ReceiveBuf[Uart1RcivBufRdPtr].FRAME_MESSAGE, '\0', Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH );
			free(Uart1ReceiveBuf[Uart1RcivBufRdPtr].FRAME_MESSAGE, Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH);
			Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH = 0;

			// circular buffer pointer re-allocation
			if (Uart1RcivBufRdPtr == DEVICE_BUFFER_SIZE - 1 || Uart1RcivBufRdPtr >= DEVICE_BUFFER_SIZE)
			{
				Uart1RcivBufRdPtr = 0;  // return to the head
			}
			else
			{
				Uart1RcivBufRdPtr = Uart1RcivBufRdPtr + 1; // proceed one step
			}
		}
	}
	// TODO: implement uart2Receive
	// TODO: implement uart3Receive
	if (uart4ReceiveMutex == false)
	{
		if (Uart4ReceiveBuf[Uart4RcivBufRdPtr].MESSAGE_LENGTH != 0)
		{
			KL_CallSlotHandler(Uart4ReceiveBuf[Uart4RcivBufRdPtr]);
			free(Uart4ReceiveBuf[Uart4RcivBufRdPtr].FRAME_MESSAGE, Uart4ReceiveBuf[Uart4RcivBufRdPtr].MESSAGE_LENGTH);
			Uart4ReceiveBuf[Uart4RcivBufRdPtr].MESSAGE_LENGTH = 0;

			// circular buffer pointer re-allocation
			if (Uart4RcivBufRdPtr == DEVICE_BUFFER_SIZE - 1 || Uart4RcivBufRdPtr >= DEVICE_BUFFER_SIZE)
			{
				Uart4RcivBufRdPtr = 0;  // return to the head
			}
			else
			{
				Uart4RcivBufRdPtr = Uart4RcivBufRdPtr + 1; // proceed one step
			}
		}
	}

}

/*! 
 * \brief private function that enqueue frame into send buffer.
 * \param[in] buffer the buffer which is going to be enqueued in.
 * \param[in] frame the frame which is going to be enqueued.
 * \param[in] index the index of buffer which is going to be written n.
 * \param[in] mutex the send buffer mutex.
 */
void EnqueueFrameIntoSendBuffer(KL_PACKET buffer[], KERNEL_FRAME* frame, int* index, bool* mutex)
{
	//int i = 0;
	if (frame->MESSAGE_LENGTH == 0)
	{
		*mutex = true;
		strcpy((char*)buffer[*index].pData, frame->FRAME_MESSAGE); // copy message
		*mutex = false;
	}
	else
	{
		*mutex = true;
		memcpy((char*)(buffer[*index].pData), frame->FRAME_MESSAGE, (*frame)->MESSAGE_LENGTH);// MAX_MSG_SIZE);
		(buffer[*index]).iLen = (*frame)->MESSAGE_LENGTH;
		*mutex = false;
		//SendDebugMsg("\r\r");
		//for (i = 0; i < frame->MESSAGE_LENGTH; i++)
		//{
		//        SendDebugChr(((char*)buffer[*index].pData)[i]);
		//        //SendDebugChr(frame->FRAME_MESSAGE[i]);
		//}
	}

	// relocate circular buffer pointer
	if (*index == DEVICE_BUFFER_SIZE - 1 || *index >= DEVICE_BUFFER_SIZE)
	{
		*index = 0;  // return to the head 
	}
	else
	{
		*index = (*index) + 1;
	}

	// whithout this delay, the timer can not catch new messages!!!
	Delay_ms(1);
}

/*!
* \brief private function that enqueue frame into receive buffer.
* \param[in] buffer the buffer which is going to be enqueued in.
* \param[in] frame the frame which is going to be enqueued.
* \param[in] index the index of buffer which is going to be written n.
* \param[in] mutex the send buffer mutex.
*/
void EnqueueFrameIntoReceiveBuffer(KERNEL_FRAME buffer[], KERNEL_FRAME* frame, int* index, bool* mutex)
{
	//int i = 0;

	*mutex = true;
	buffer[*index]->FRAME_MESSAGE = (char*)malloc((*frame)->MESSAGE_LENGTH + 1); // extra space for null terminating string
	memcpy(buffer[*index].FRAME_MESSAGE, frame->FRAME_MESSAGE, (*frame)->MESSAGE_LENGTH);
	(buffer[*index]).MESSAGE_LENGTH = (*frame)->MESSAGE_LENGTH;
	buffer[*index].F_RECEIVER = frame->F_RECEIVER;
	buffer[*index].F_TYPE = frame->F_TYPE;
	buffer[*index]->FRAME_MESSAGE[(*frame)->MESSAGE_LENGTH] = '\0';
	*mutex = false;

	//SendDebugMsg("FRAME ENQUEUED:   ");
	//for (i = 0; i < frame->MESSAGE_LENGTH; i++)
	//{
	//        SendDebugChr(buffer[*index].FRAME_MESSAGE[i]);
	//}

	// relocate circular buffer pointer
	if (*index == DEVICE_BUFFER_SIZE - 1 || *index >= DEVICE_BUFFER_SIZE)
	{
		*index = 0;  // return to the head 
	}
	else
	{
		*index = (*index) + 1;
	}

	// whithout this delay, the timer can not catch new messages!!!
	Delay_ms(1);
}


void KL_Dispacher(KERNEL_FRAME* frame)
{
	int _index = 0;
	if (frame->F_PRIORITY == REALTIME_FRAME)
	{

		// start execution thread immidiately
		switch (frame->F_RECEIVER)
		{
		case WORKSTATION:
#if build == debug

#endif
			break;
		case GENERATOR:
#if build == debug
			//SendDebugMsg("\r    >>GEN HIGH PRIO:  ");
#endif
			if (frame->MESSAGE_LENGTH != 0)
			{
				// Send by the message length
				for (_index = 0; _index < frame->MESSAGE_LENGTH; _index++)
				{
#if build == debug
					//SendDebugChr(frame->FRAME_MESSAGE[_index]);
#endif 
					SendToGenerator(frame->FRAME_MESSAGE[_index]);
				}
			}
			else
			{
				// Send til hit null terminating string
				_index = 0;
				while (frame->FRAME_MESSAGE[_index] != 0)
				{
#if build == debug
					//SendDebugChr(frame->FRAME_MESSAGE[_index]);
#endif
					SendToGenerator(frame->FRAME_MESSAGE[_index]);
					_index++;
				}

			}

			break;
		case ACTUATOR:
#if build == debug
			SendDebugMsg("\r    >>ACT HIGH PRIO:  ");
#endif
			if (frame->MESSAGE_LENGTH != 0)
			{
				// send by amount of message length
				for (_index = 0; _index < frame->MESSAGE_LENGTH; _index++)
				{
#if build == debug
					SendDebugChr(frame->FRAME_MESSAGE[_index]);
#endif 
					SendToActuator(frame->FRAME_MESSAGE[_index]);
				}
			}
			else
			{
				// Send till hit null terminating string
				_index = 0;
				while (frame->FRAME_MESSAGE[_index] != 0)
				{
#if build == debug
					SendDebugChr(frame->FRAME_MESSAGE[_index]);
#endif 
					SendToActuator(frame->FRAME_MESSAGE[_index]);
					_index++;
				}
			}

			break;
		case COLLIMATOR:
			// TODO: implement later
			break;
		case  DETECTOR:
			// TODO: implement later
			break;
		case VENTILATOR:
			// TODO: implement later
			break;
		case ALARM:
			// TODO: implement later
			break;
		case COOLING:
			// TODO: implement later
			break;
		case DISPLAY:
#if build == debug
			SendDebugMsg("\r    >>DISP HIGH PRIO:  ");
#endif
			_index = 0;
			while (frame->FRAME_MESSAGE[_index] != 0)
			{
#if build == debug
				SendDebugChr(frame->FRAME_MESSAGE[_index]);
#endif
				SendToDisplay(frame->FRAME_MESSAGE[_index]);
				_index++;
			}
			break;
		}
	}
	else
	{

		// enqueue the message into the device buffer
		switch (frame->F_RECEIVER)
		{
		case  GENERATOR:
			EnqueueFrameIntoSendBuffer(genSendBuf, frame, &genSndWrPtr, &genSendMutex);
			break;
		case     ACTUATOR:
			EnqueueFrameIntoSendBuffer(actSendBuf, frame, &actSndWrPtr, &actMutex);
			break;
		case      WORKSTATION:
			break;
		case   COLLIMATOR:
			break;
		case     DETECTOR:
			break;
		case DISPLAY:
			EnqueueFrameIntoSendBuffer(disSndBuf, frame, &disSndWrPtr, &disMutex);
			break;
		}
	}
}


//******************* Interrupt Handlers**************************************

static int u1MsgSize = 0;
//! \brief kernel internal event handler for uart1.
void KL_UART1MessageReceiveHandler() iv IVT_ADDR_U1RXINTERRUPT {

	U1RXIF_bit = 0;
	if (UART1_Data_Ready()) // this is MUST; do not remove it
	{
		char _recivedChar = UART1_Read();
		//SendDebugChr(_recivedChar);

		// Is UART1 Fixed length message device?
		if (UART1_MSG_LENGTH != 0)
		{
			if (u1MsgSize != UART1_MSG_LENGTH)
			{
				_uart1AccBuf[u1MsgSize] = _recivedChar;
				u1MsgSize++;
			}
			else
			{

				KERNEL_FRAME _frame;
				_frame.F_RECEIVER = UART1MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart1AccBuf;
				_frame.MESSAGE_LENGTH = u1MsgSize;
				EnqueueFrameIntoReceiveBuffer(Uart1ReceiveBuf,
					&_frame,
					&Uart1RcivBufWrPtr,
					&uart1ReceiveMutex);
				u1MsgSize = 0;
				memset(_uart1AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
			}
		}
		else
		{
			// is there any delimiter for uart1?
			if (UART1_DELIMITER != 0)
			{
				if (_recivedChar != UART1_DELIMITER && u1MsgSize < MAX_MSG_SIZE)
				{
					_uart1AccBuf[u1MsgSize] = _recivedChar;
					u1MsgSize++;
				}
				else
				{

					KERNEL_FRAME _frame;
					_frame.F_RECEIVER = UART1MappedDevice;
					_frame.F_TYPE = UNSTRUCTURED;
					_frame.FRAME_MESSAGE = _uart1AccBuf;
					_frame.MESSAGE_LENGTH = u1MsgSize;
					KL_CallSlotHandler(_frame);
					u1MsgSize = 0;
					memset(_uart1AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
				}
			}
			else
			{
				// there is no delimitor nor the messages length is fixed
				// so,send the received byte to the device which is mapped on UART1
				// the device will decide what to do with that.                                
				KERNEL_FRAME _frame;
				_uart1AccBuf[0] = _recivedChar;
				_frame.F_RECEIVER = UART1MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart1AccBuf;
				_frame.MESSAGE_LENGTH = 1;
				EnqueueFrameIntoReceiveBuffer(Uart1ReceiveBuf,
					&_frame,
					&Uart1RcivBufWrPtr,
					&uart1ReceiveMutex);
				u1MsgSize = 0;
				memset(_uart1AccBuf, '\0', 1); //clear buffer
			}
		}

		if (U1STA.OERR = 1)
		{
			U1STA.OERR = 0;
			U1STA.FERR = 0;
		}
	}
}

static int u2MsgSize = 0;
//! \brief kernel internal event handler for uart2.
void KL_UART2MessageReceiveHandler() iv IVT_ADDR_U2RXINTERRUPT {


	U2RXIF_bit = 0;
	if (UART2_Data_Ready()) // this is MUST; do not remove it
	{
		char _recivedChar = UART2_Read();
		//SendDebugChr(_recivedChar);
		// messages are FIXED length or not?
		if (UART2_MSG_LENGTH != 0)
		{
			if (u2MsgSize != UART2_MSG_LENGTH)
			{
				_uart2AccBuf[u2MsgSize] = _recivedChar;
				u2MsgSize++;
			}
			else
			{
				KERNEL_FRAME _frame;
				_frame.F_RECEIVER = UART2MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart2AccBuf;
				_frame.MESSAGE_LENGTH = u2MsgSize;
				EnqueueFrameIntoReceiveBuffer(Uart2ReceiveBuf,
					&_frame,
					&Uart2RcivBufWrPtr,
					&uart2ReceiveMutex);
				u2MsgSize = 0;
				memset(_uart2AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
			}
		}
		else
		{
			// is there any delimiter for uart2?
			if (UART2_DELIMITER != 0)
			{
				if (_recivedChar != UART2_DELIMITER && u2MsgSize < MAX_MSG_SIZE)
				{
					_uart2AccBuf[u2MsgSize] = _recivedChar;
					u2MsgSize++;
				}
				else
				{
					KERNEL_FRAME _frame;
					_frame.F_RECEIVER = UART2MappedDevice;
					_frame.F_TYPE = UNSTRUCTURED;
					_frame.FRAME_MESSAGE = _uart2AccBuf;
					_frame.MESSAGE_LENGTH = u2MsgSize;
					EnqueueFrameIntoReceiveBuffer(Uart2ReceiveBuf,
						&_frame,
						&Uart2RcivBufWrPtr,
						&uart2ReceiveMutex);
					u2MsgSize = 0;
					memset(_uart2AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
				}

			}
			else
			{
				// there is no delimitor nor the messages length is fixed
				// so,send the received byte to the device which is mapped on UART2
				// the device will decide what to do with that.
				KERNEL_FRAME _frame;
				_uart2AccBuf[0] = _recivedChar;
				_frame.F_RECEIVER = UART2MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart2AccBuf;
				_frame.MESSAGE_LENGTH = 1;
				KL_CallSlotHandler(_frame);
				memset(_uart2AccBuf, '\0', MAX_MSG_SIZE);
			}
		}

		if (U2STA.OERR = 1)
		{
			U2STA.OERR = 0;
			U2STA.FERR = 0;
		}
	}

}

static int u3MsgSize = 0;
//! \brief kernel internal event handler for uart3.
void KL_UART3MessageReceiveHandler() iv IVT_ADDR_U3RXINTERRUPT {


	U3RXIF_bit = 0;
	if (UART3_Data_Ready()) // this is MUST; do not remove it
	{
		char _recivedChar = UART3_Read();
		// messages are FIXED size length or not
		if (UART3_MSG_LENGTH != 0)
		{
			if (u3MsgSize != UART3_MSG_LENGTH)
			{
				_uart3AccBuf[u3MsgSize] = _recivedChar;
				u3MsgSize++;
			}
			else
			{
				KERNEL_FRAME _frame;
				_frame.F_RECEIVER = UART3MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart3AccBuf;
				_frame.MESSAGE_LENGTH = u3MsgSize;
				EnqueueFrameIntoReceiveBuffer(Uart3ReceiveBuf,
					&_frame,
					&Uart3RcivBufWrPtr,
					&uart3ReceiveMutex);
				u3MsgSize = 0;
				memset(_uart3AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
			}
		}
		else
		{
			// is there any delimitor for uart1?
			if (UART3_DELIMITER != 0)
			{
				if (_recivedChar != UART3_DELIMITER && u3MsgSize < MAX_MSG_SIZE)
				{
					_uart3AccBuf[u3MsgSize] = _recivedChar;
					u3MsgSize++;
				}
				else
				{
					KERNEL_FRAME _frame;
					_frame.F_RECEIVER = UART3MappedDevice;
					_frame.F_TYPE = UNSTRUCTURED;
					_frame.FRAME_MESSAGE = _uart3AccBuf;
					_frame.MESSAGE_LENGTH = u3MsgSize;
					EnqueueFrameIntoReceiveBuffer(Uart3ReceiveBuf,
						&_frame,
						&Uart3RcivBufWrPtr,
						&uart3ReceiveMutex);
					u3MsgSize = 0;
					memset(_uart3AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
				}

			}
			else
			{
				// there is no delimitor nor the messages length is fixed
				// so,send the received byte to the device which is mapped on UART1
				// the device will decide what to do with that.
				KERNEL_FRAME _frame;
				_uart3AccBuf[0] = _recivedChar;
				_frame.F_RECEIVER = UART3MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart3AccBuf;
				_frame.MESSAGE_LENGTH = 1;
				KL_CallSlotHandler(_frame);
				u3MsgSize = 0;
				memset(_uart3AccBuf, '\0', 1); //clear buffer
			}
		}


		if (U3STA.OERR = 1)
		{
			U3STA.OERR = 0;
			U3STA.FERR = 0;
		}
	}
}

static int u4MsgSize = 0;
//! \brief kernel internal event handler for uart4.
void KL_UART4MessageReceiveHandler() iv IVT_ADDR_U4RXINTERRUPT {


	U4RXIF_bit = 0;
	if (UART4_Data_Ready()) // this is MUST; do not remove it
	{
		char _recivedChar = UART4_Read();
		SendDebugChr(_recivedChar);
		// messages are FIXED size length or not
		if (UART4_MSG_LENGTH != 0)
		{
			if (u4MsgSize != UART4_MSG_LENGTH)
			{
				_uart4AccBuf[u4MsgSize] = _recivedChar;
				u4MsgSize++;
			}
			else
			{
				KERNEL_FRAME _frame;
				_frame.F_RECEIVER = UART4MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart4AccBuf;
				_frame.MESSAGE_LENGTH = u4MsgSize;
				EnqueueFrameIntoReceiveBuffer(Uart4ReceiveBuf,
					&_frame,
					&Uart4RcivBufWrPtr,
					&uart4ReceiveMutex);
				u4MsgSize = 0;
				memset(_uart4AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
			}
		}
		else
		{
			// is there any delimitor for uart4?
			if (UART4_DELIMITER != 0)
			{
				if (_recivedChar != UART4_DELIMITER && u4MsgSize < MAX_MSG_SIZE)
				{
					_uart4AccBuf[u4MsgSize] = _recivedChar;
					u4MsgSize++;
				}
				else
				{
					KERNEL_FRAME _frame;
					_frame.F_RECEIVER = UART4MappedDevice;
					_frame.F_TYPE = UNSTRUCTURED;
					_frame.FRAME_MESSAGE = _uart4AccBuf;
					_frame.MESSAGE_LENGTH = u4MsgSize;
					EnqueueFrameIntoReceiveBuffer(Uart4ReceiveBuf,
						&_frame,
						&Uart4RcivBufWrPtr,
						&uart4ReceiveMutex);
					u4MsgSize = 0;
					memset(_uart4AccBuf, '\0', MAX_MSG_SIZE); //clear buffer
				}

			}
			else
			{
				// there is no delimitor nor the messages length is fixed
				// send the received byte to the device which is mapped on UART4
				// the device will decide what to do with that.
				// instead of queue-ing the byte, the byte is sent directly
				// to the handler.
				KERNEL_FRAME _frame;
				_uart4AccBuf[0] = _recivedChar;
				_frame.F_RECEIVER = UART4MappedDevice;
				_frame.F_TYPE = UNSTRUCTURED;
				_frame.FRAME_MESSAGE = _uart4AccBuf;
				_frame.MESSAGE_LENGTH = 1;
				KL_CallSlotHandler(_frame);
				u4MsgSize = 0;
				memset(_uart4AccBuf, '\0', 1); //clear buffer
			}
		}


		if (U4STA.OERR = 1)
		{
			U4STA.OERR = 0;
			U4STA.FERR = 0;
		}
	}

}

void KL_Timer1Interrupt() iv IVT_ADDR_T3INTERRUPT {
	T3IF_bit = 0;
	KL_DistributeFrames();
}

//*********************** Public functions ************************************

/*!
 * \brief proxy function for dispatching frames made by APIs.
 * \details public function that is used by APIs to send message to a device or communicate in between themselves. 
 * \param[in] frame the frame made by API.
 */
void KL_SendFrame(KERNEL_FRAME* frame)
{
	// call Dispacher to decide is it high priority to execute the cmd
	KL_Dispacher(frame);
}

//! \brief register a device into kernel.
void KL_RegisterDevice(DEVICE_SLOT slot)
{
	static int _register = 0;
	_SLOTS[_register] = slot;
	_register++;
#if build==debug
	SendDebugMsg("\r    DEVICE REGISTERED.");
#endif
}

//! \brief bootup kernel.
void KL_Bootup()
{
	//int idx = 0;
	InitializePICSpeed();
	InitializePICPins();  // ALWAYS THIS COMES FIRST
	InitializeUARTS();    // ALWAYS THIS COMES AFTER
	InitializeTimers();
	InitializeHeap();
	PrioritizeInterrupts();
	InitializeBuzzer();

	KL_ClearKernelMemory();

	//Play boot successful beep
	Sound_Play(1600, 100);
	SendDebugMsg("\r-----------------------");
	SendDebugMsg("\r X-Ray Package Ordering & Signal Transmitting (xPOST) kernel.");
	SendDebugMsg("\r Version: 0.5");
	SendDebugMsg("\r Date: May, 2018");
#if build==debug
	SendDebugMsg("\r BOOTUP IN DEBUG MODE.");
#endif
	SendDebugMsg("\r-----------------------\r");
	Delay_ms(100);
	KL_StartDispacherEngine();
	_startupFunction();

	while (1)
	{
		asm nop;
	}

}

//! \brief register instrument's start function.
//! \details at the last step of boot process, the kernel calls instrument start function.
//! this function must already be registered.
void KL_RegisterInstrument(InstrumentStart function)
{
	_startupFunction = function;
}