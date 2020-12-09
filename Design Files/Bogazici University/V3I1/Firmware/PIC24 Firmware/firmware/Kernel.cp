#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stddef.h"



typedef int ptrdiff_t;
typedef unsigned int size_t;
typedef unsigned int wchar_t;
#line 17 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef enum {
 JSMN_UNDEFINED = 0,
 JSMN_OBJECT = 1,
 JSMN_ARRAY = 2,
 JSMN_STRING = 3,
 JSMN_PRIMITIVE = 4
} jsmntype_t;

enum jsmnerr {

 JSMN_ERROR_NOMEM = -1,

 JSMN_ERROR_INVAL = -2,

 JSMN_ERROR_PART = -3
};
#line 40 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef struct {
 jsmntype_t type;
 int start;
 int end;
 int size;
#line 48 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
} jsmntok_t;
#line 54 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef struct {
 unsigned int pos;
 unsigned int toknext;
 int toksuper;
} jsmn_parser;
#line 63 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
void jsmn_init(jsmn_parser *parser);
#line 69 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
int jsmn_parse(jsmn_parser *parser, const char *js, size_t len,
 jsmntok_t *tokens, unsigned int num_tokens);
#line 22 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
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
#line 41 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef enum {
 NORMAL_FRAME,
 REALTIME_FRAME
 } FRAME_PRIORITY;
#line 50 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef enum{
 UNSTRUCTURED,
 STRUCTURED
 } FRAME_TYPE;
#line 62 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef struct {
 DEVICE_TYPE F_SENDER;
 DEVICE_TYPE F_RECEIVER;
 FRAME_TYPE F_TYPE;
 FRAME_PRIORITY F_PRIORITY;
 char* FRAME_MESSAGE;
 int MESSAGE_LENGTH;
 } KERNEL_FRAME;

 typedef void (*FrameHandler)(KERNEL_FRAME);
 typedef void (*InstrumentStart)();
#line 80 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef struct {
 DEVICE_TYPE device;
 FrameHandler handler;
 } DEVICE_SLOT;





 void KL_RegisterDevice(DEVICE_SLOT);

 void KL_SendFrame(KERNEL_FRAME*);

 void KL_SendSignal(void*);

 void KL_Read();

 void KL_Bootup();

 void KL_RegisterInstrument(InstrumentStart);
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stdbool.h"



 typedef char _Bool;
#line 13 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
 extern  _Bool  ENABLE_SYNCBOX_SPEEKER =  1 ;
#line 20 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
const HEAP_SIZE = 400;
#line 25 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void InitializeHeap()
 {
 MM_Init();
 Delay_ms(200);
 }
#line 34 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void InitializePICSpeed()
{

 PLLFBD = 70;
 CLKDIV = 0x0000;
}
#line 44 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void InitializePICPins()
{

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;









 PORTA=0x00;
 PORTB=0x00;
 PORTC=0x00;
 PORTE=0x00;
 PORTF=0x00;
 PORTG=0x00;

}
#line 77 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void InitializeUARTS()
{




 PPS_Mapping( 100 , _INPUT, _U1RX);
 PPS_Mapping( 101 , _OUTPUT, _U1TX);
 Delay_ms(200);


 PPS_Mapping( 108 , _INPUT, _U2RX);
 PPS_Mapping( 109 , _OUTPUT, _U2TX);
 Delay_ms(200);

 PPS_Mapping( 124 , _INPUT, _U3RX);
 PPS_Mapping( 125 , _OUTPUT, _U3TX);
 Delay_ms(200);

 PPS_Mapping( 112 , _INPUT, _U4RX);
 PPS_Mapping( 113 , _OUTPUT, _U4TX);
 Delay_ms(200);

 UART1_Init_Advanced( 9600 ,  _UART_8BIT_NOPARITY , _UART_ONE_STOPBIT , _UART_LOW_SPEED );
 Delay_ms(200);


 UART2_Init_Advanced( 9600 ,  _UART_8BIT_NOPARITY ,  _UART_TWO_STOPBITS , _UART_LOW_SPEED );
 Delay_ms(200);

 UART3_Init_Advanced( 9600 ,  _UART_8BIT_NOPARITY ,  _UART_TWO_STOPBITS , _UART_LOW_SPEED );
 Delay_ms(200);

 UART4_Init_Advanced( 9600 ,  _UART_8BIT_NOPARITY ,  _UART_TWO_STOPBITS , _UART_Hi_SPEED );

 Delay_ms(200);


 U1RXIE_bit = 1; U2RXIE_bit = 1; U3RXIE_bit = 1; U4RXIE_bit = 1;
 U1RXIF_bit = 0; U2RXIF_bit = 0; U3RXIF_bit = 0; U4RXIF_bit = 0;


}
#line 124 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void PrioritizeInterrupts()
{
 IPC6.B14 = 0; IPC6.B13 = 0; IPC6.B12 = 1;
 IPC7.B2 = 0; IPC7.B1 = 0; IPC7.B0 = 1;

 IPC1.B14 = 0; IPC1.B13 = 0; IPC1.B12 = 1;
 IPC2.B2 = 0; IPC2.B1 = 0; IPC2.B0 = 1;
}
#line 136 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void InitializeBuzzer()
{
 Sound_Init( &PORTD ,  3 );
}
#line 144 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/pic24edef.h"
void InitializeTimers()
{
 IPC0.B12=1;
 IPC0.B13=1;
 IPC0.B14=1;
}
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stdbool.h"
#line 48 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static const int DEVICE_BUFFER_SIZE = 35;

static const int JSON_TOKEN_CARDINALITY = 128;

static const int MAX_MSG_SIZE = 30;
#line 57 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
typedef struct
{
 char pData[MAX_MSG_SIZE];
 volatile int iLen;
} KL_PACKET;
#line 71 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KERNEL_FRAME Uart1ReceiveBuf[DEVICE_BUFFER_SIZE];
#line 77 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int Uart1RcivBufRdPtr = 0, Uart1RcivBufWrPtr = 0;
#line 89 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KERNEL_FRAME Uart2ReceiveBuf[DEVICE_BUFFER_SIZE];
#line 95 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int Uart2RcivBufRdPtr = 0, Uart2RcivBufWrPtr = 0;
#line 107 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KERNEL_FRAME Uart3ReceiveBuf[DEVICE_BUFFER_SIZE];
#line 113 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int Uart3RcivBufRdPtr = 0, Uart3RcivBufWrPtr = 0;
#line 126 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KERNEL_FRAME Uart4ReceiveBuf[DEVICE_BUFFER_SIZE];
#line 132 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int Uart4RcivBufRdPtr = 0, Uart4RcivBufWrPtr = 0;
#line 145 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KL_PACKET genSendBuf[DEVICE_BUFFER_SIZE];
#line 151 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int genSndRdPtr = 0, genSndWrPtr = 0;
#line 163 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile KL_PACKET actSendBuf[DEVICE_BUFFER_SIZE];
#line 169 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile int actSndRdPtr = 0, actSndWrPtr = 0;
#line 182 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KL_PACKET wrkSendBuf[DEVICE_BUFFER_SIZE];
#line 188 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int wrkSndRdPtr = 0, wrkSndWrPtr = 0;
#line 201 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static KL_PACKET disSndBuf[DEVICE_BUFFER_SIZE];
#line 208 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
int disSndRdPtr = 0, disSndWrPtr = 0;
#line 217 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
static jsmn_parser _parser;
#line 221 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
jsmntok_t tokens[JSON_TOKEN_CARDINALITY];
#line 228 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
DEVICE_SLOT _SLOTS[__DEVICE_TYPES_COUNT];
#line 233 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
char _uart1AccBuf[MAX_MSG_SIZE];
#line 237 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
char _uart2AccBuf[MAX_MSG_SIZE];
#line 241 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
char _uart3AccBuf[MAX_MSG_SIZE];
#line 245 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
char _uart4AccBuf[MAX_MSG_SIZE];
#line 251 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
InstrumentStart _startupFunction = 0;
#line 259 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  genSendMutex =  0 ;
#line 265 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  actMutex =  0 ;
#line 271 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  disMutex =  0 ;
#line 277 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  uart1ReceiveMutex =  0 ;
#line 283 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  uart2ReceiveMutex =  0 ;
#line 289 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  uart3ReceiveMutex =  0 ;
#line 295 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
volatile  _Bool  uart4ReceiveMutex =  0 ;
#line 302 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
void KL_ClearKernelMemory()
{
 int idx = 0;
 memset(_uart1AccBuf, 0x00, MAX_MSG_SIZE);
 memset(_uart2AccBuf, 0x00, MAX_MSG_SIZE);
 memset(_uart3AccBuf, 0x00, MAX_MSG_SIZE);
 memset(_uart4AccBuf, 0x00, MAX_MSG_SIZE);


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
#line 336 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
void KL_CallSlotHandler(KERNEL_FRAME _frame)
{





 int i = 0;
 for (i = 0; i <= __DEVICE_TYPES_COUNT; i++)
 {

 if (_SLOTS[i].device == _frame.F_RECEIVER)
 {








 _SLOTS[i].handler(_frame);
 break;
 }
 }
}
#line 370 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
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
#line 396 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
void KL_DistributeFrames()
{

 int _index = 0;



 if (genSendMutex ==  0 )
 {


 int* xLen = &genSendBuf[genSndRdPtr].iLen;
 char* xPtr = genSendBuf[genSndRdPtr].pData;


 if (*xLen == 0)
 {

 if (strlen(xPtr) != 0)
 {



  UART3_Write_Text("\r    >>SEND TO GENERATOR:  ") ;




 _index = 0;
 while (xPtr[_index] != '\0')
 {


  UART3_Write(xPtr[_index]) ;

  UART1_Write(xPtr[_index]) ;
 _index++;
 }


 memset(xPtr, '\0', MAX_MSG_SIZE - 1);

 *xLen = 0;


 if (genSndRdPtr == DEVICE_BUFFER_SIZE - 1 || genSndRdPtr >= DEVICE_BUFFER_SIZE)
 {
 genSndRdPtr = 0;
 }
 else
 {
 genSndRdPtr = genSndRdPtr + 1;
 }
 }
 }
 else
 {


  UART3_Write_Text("\r    >>SEND TO GENERATOR:  ") ;

 _index = 0;
 while (_index <= *xLen)
 {


  UART3_Write(xPtr[_index]) ;

  UART1_Write(xPtr[_index]) ;
 _index++;
 }


 memset(xPtr, '\0', MAX_MSG_SIZE - 1);
 *xLen = 0;


 if (genSndRdPtr == DEVICE_BUFFER_SIZE - 1 || genSndRdPtr >= DEVICE_BUFFER_SIZE)
 {
 genSndRdPtr = 0;
 }
 else
 {
 genSndRdPtr = genSndRdPtr + 1;
 }
 }
 }



 if (actMutex ==  0 )
 {



 int* xLen = &actSendBuf[actSndRdPtr].iLen;
 char* xPtr = actSendBuf[actSndRdPtr].pData;


 if (*xLen == 0)
 {



 if (strlen(xPtr) != 0)
 {



  UART3_Write_Text("\r    >> SEND TO ACTUATOR :  ") ;

 while (xPtr[_index] != '\0')
 {

  UART3_Write(xPtr[_index]) ;

  UART2_Write(xPtr[_index]) ;
 _index++;
 }


 memset(xPtr, '\0', MAX_MSG_SIZE - 1);

 *xLen = 0;

 if (actSndRdPtr == DEVICE_BUFFER_SIZE - 1 || actSndRdPtr >= DEVICE_BUFFER_SIZE)
 {
 actSndRdPtr = 0;
 }
 else
 {
 actSndRdPtr = actSndRdPtr + 1;
 }
 }
 }
 else
 {


  UART3_Write_Text("    >> SEND TO ACTUATOR : ") ;

 _index = 0;
 while (_index < *xLen)
 {

  UART3_Write(xPtr[_index]) ;

  UART2_Write(xPtr[_index]) ;
 _index++;
 }


 memset(xPtr, '\0', MAX_MSG_SIZE - 1);
 *xLen = 0;

 if (actSndRdPtr == DEVICE_BUFFER_SIZE - 1 || actSndRdPtr >= DEVICE_BUFFER_SIZE)
 {
 actSndRdPtr = 0;
 }
 else
 {
 actSndRdPtr = actSndRdPtr + 1;
 }
 }
 }




 if (disMutex ==  0 )
 {

 if (disSndBuf[disSndRdPtr].iLen == 0)
 {



 if (strlen((disSndBuf[disSndRdPtr].pData)) != 0)
 {




  UART3_Write_Text("\r    >>DISPLAY MESSAGE:  ") ;

 while (((char*)((disSndBuf[disSndRdPtr]).pData))[_index] != '\0')
 {

  UART3_Write(((char*)((disSndBuf[disSndRdPtr]).pData))[_index]) ;

  UART4_Write(((char*)((disSndBuf[disSndRdPtr]).pData))[_index]) ;
 _index++;
 }


 memset(disSndBuf[disSndRdPtr].pData, '\0', MAX_MSG_SIZE);

 actSendBuf[disSndRdPtr].iLen = 0;

 if (disSndRdPtr == DEVICE_BUFFER_SIZE - 1 || disSndRdPtr >= DEVICE_BUFFER_SIZE)
 {
 disSndRdPtr = 0;
 }
 else
 {
 disSndRdPtr = disSndRdPtr + 1;
 }
 }
 }
 else
 {


  UART3_Write_Text("\r    >>SEND TO DISPLAY : ") ;
 _index = 0;
 while (_index < disSndBuf[disSndRdPtr].iLen)
 {

  UART3_Write(((char*)disSndBuf[disSndRdPtr].pData)[_index]) ;

  UART4_Write(((char*)disSndBuf[disSndRdPtr].pData)[_index]) ;
 _index++;
 }


 memset((char*)disSndBuf[disSndRdPtr].pData, '\0', MAX_MSG_SIZE);
 disSndBuf[disSndRdPtr].iLen = 0;


 if (disSndRdPtr == DEVICE_BUFFER_SIZE - 1 || disSndRdPtr >= DEVICE_BUFFER_SIZE)
 {
 disSndRdPtr = 0;
 }
 else
 {
 disSndRdPtr = disSndRdPtr + 1;
 }
 }
 }


 if (uart1ReceiveMutex ==  0 )
 {
 if (Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH != 0)
 {
 KL_CallSlotHandler(Uart1ReceiveBuf[Uart1RcivBufRdPtr]);





 free(Uart1ReceiveBuf[Uart1RcivBufRdPtr].FRAME_MESSAGE, Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH);
 Uart1ReceiveBuf[Uart1RcivBufRdPtr].MESSAGE_LENGTH = 0;


 if (Uart1RcivBufRdPtr == DEVICE_BUFFER_SIZE - 1 || Uart1RcivBufRdPtr >= DEVICE_BUFFER_SIZE)
 {
 Uart1RcivBufRdPtr = 0;
 }
 else
 {
 Uart1RcivBufRdPtr = Uart1RcivBufRdPtr + 1;
 }
 }
 }


 if (uart4ReceiveMutex ==  0 )
 {
 if (Uart4ReceiveBuf[Uart4RcivBufRdPtr].MESSAGE_LENGTH != 0)
 {
 KL_CallSlotHandler(Uart4ReceiveBuf[Uart4RcivBufRdPtr]);
 free(Uart4ReceiveBuf[Uart4RcivBufRdPtr].FRAME_MESSAGE, Uart4ReceiveBuf[Uart4RcivBufRdPtr].MESSAGE_LENGTH);
 Uart4ReceiveBuf[Uart4RcivBufRdPtr].MESSAGE_LENGTH = 0;


 if (Uart4RcivBufRdPtr == DEVICE_BUFFER_SIZE - 1 || Uart4RcivBufRdPtr >= DEVICE_BUFFER_SIZE)
 {
 Uart4RcivBufRdPtr = 0;
 }
 else
 {
 Uart4RcivBufRdPtr = Uart4RcivBufRdPtr + 1;
 }
 }
 }

}
#line 692 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
void EnqueueFrameIntoSendBuffer(KL_PACKET buffer[], KERNEL_FRAME* frame, int* index,  _Bool * mutex)
{

 if (frame->MESSAGE_LENGTH == 0)
 {
 *mutex =  1 ;
 strcpy((char*)buffer[*index].pData, frame->FRAME_MESSAGE);
 *mutex =  0 ;
 }
 else
 {
 *mutex =  1 ;
 memcpy((char*)(buffer[*index].pData), frame->FRAME_MESSAGE, (*frame)->MESSAGE_LENGTH);
 (buffer[*index]).iLen = (*frame)->MESSAGE_LENGTH;
 *mutex =  0 ;






 }


 if (*index == DEVICE_BUFFER_SIZE - 1 || *index >= DEVICE_BUFFER_SIZE)
 {
 *index = 0;
 }
 else
 {
 *index = (*index) + 1;
 }


 Delay_ms(1);
}
#line 736 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
void EnqueueFrameIntoReceiveBuffer(KERNEL_FRAME buffer[], KERNEL_FRAME* frame, int* index,  _Bool * mutex)
{


 *mutex =  1 ;
 buffer[*index]->FRAME_MESSAGE = (char*)malloc((*frame)->MESSAGE_LENGTH + 1);
 memcpy(buffer[*index].FRAME_MESSAGE, frame->FRAME_MESSAGE, (*frame)->MESSAGE_LENGTH);
 (buffer[*index]).MESSAGE_LENGTH = (*frame)->MESSAGE_LENGTH;
 buffer[*index].F_RECEIVER = frame->F_RECEIVER;
 buffer[*index].F_TYPE = frame->F_TYPE;
 buffer[*index]->FRAME_MESSAGE[(*frame)->MESSAGE_LENGTH] = '\0';
 *mutex =  0 ;








 if (*index == DEVICE_BUFFER_SIZE - 1 || *index >= DEVICE_BUFFER_SIZE)
 {
 *index = 0;
 }
 else
 {
 *index = (*index) + 1;
 }


 Delay_ms(1);
}


void KL_Dispacher(KERNEL_FRAME* frame)
{
 int _index = 0;
 if (frame->F_PRIORITY == REALTIME_FRAME)
 {


 switch (frame->F_RECEIVER)
 {
 case WORKSTATION:



 break;
 case GENERATOR:



 if (frame->MESSAGE_LENGTH != 0)
 {

 for (_index = 0; _index < frame->MESSAGE_LENGTH; _index++)
 {



  UART1_Write(frame->FRAME_MESSAGE[_index]) ;
 }
 }
 else
 {

 _index = 0;
 while (frame->FRAME_MESSAGE[_index] != 0)
 {



  UART1_Write(frame->FRAME_MESSAGE[_index]) ;
 _index++;
 }

 }

 break;
 case ACTUATOR:

  UART3_Write_Text("\r    >>ACT HIGH PRIO:  ") ;

 if (frame->MESSAGE_LENGTH != 0)
 {

 for (_index = 0; _index < frame->MESSAGE_LENGTH; _index++)
 {

  UART3_Write(frame->FRAME_MESSAGE[_index]) ;

  UART2_Write(frame->FRAME_MESSAGE[_index]) ;
 }
 }
 else
 {

 _index = 0;
 while (frame->FRAME_MESSAGE[_index] != 0)
 {

  UART3_Write(frame->FRAME_MESSAGE[_index]) ;

  UART2_Write(frame->FRAME_MESSAGE[_index]) ;
 _index++;
 }
 }

 break;
 case COLLIMATOR:

 break;
 case DETECTOR:

 break;
 case VENTILATOR:

 break;
 case ALARM:

 break;
 case COOLING:

 break;
 case DISPLAY:

  UART3_Write_Text("\r    >>DISP HIGH PRIO:  ") ;

 _index = 0;
 while (frame->FRAME_MESSAGE[_index] != 0)
 {

  UART3_Write(frame->FRAME_MESSAGE[_index]) ;

  UART4_Write(frame->FRAME_MESSAGE[_index]) ;
 _index++;
 }
 break;
 }
 }
 else
 {


 switch (frame->F_RECEIVER)
 {
 case GENERATOR:
 EnqueueFrameIntoSendBuffer(genSendBuf, frame, &genSndWrPtr, &genSendMutex);
 break;
 case ACTUATOR:
 EnqueueFrameIntoSendBuffer(actSendBuf, frame, &actSndWrPtr, &actMutex);
 break;
 case WORKSTATION:
 break;
 case COLLIMATOR:
 break;
 case DETECTOR:
 break;
 case DISPLAY:
 EnqueueFrameIntoSendBuffer(disSndBuf, frame, &disSndWrPtr, &disMutex);
 break;
 }
 }
}




static int u1MsgSize = 0;

void KL_UART1MessageReceiveHandler() iv IVT_ADDR_U1RXINTERRUPT {

 U1RXIF_bit = 0;
 if (UART1_Data_Ready())
 {
 char _recivedChar = UART1_Read();



 if ( 0  != 0)
 {
 if (u1MsgSize !=  0 )
 {
 _uart1AccBuf[u1MsgSize] = _recivedChar;
 u1MsgSize++;
 }
 else
 {

 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  GENERATOR ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart1AccBuf;
 _frame.MESSAGE_LENGTH = u1MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart1ReceiveBuf,
 &_frame,
 &Uart1RcivBufWrPtr,
 &uart1ReceiveMutex);
 u1MsgSize = 0;
 memset(_uart1AccBuf, '\0', MAX_MSG_SIZE);
 }
 }
 else
 {

 if ( 0x0d  != 0)
 {
 if (_recivedChar !=  0x0d  && u1MsgSize < MAX_MSG_SIZE)
 {
 _uart1AccBuf[u1MsgSize] = _recivedChar;
 u1MsgSize++;
 }
 else
 {

 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  GENERATOR ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart1AccBuf;
 _frame.MESSAGE_LENGTH = u1MsgSize;
 KL_CallSlotHandler(_frame);
 u1MsgSize = 0;
 memset(_uart1AccBuf, '\0', MAX_MSG_SIZE);
 }
 }
 else
 {



 KERNEL_FRAME _frame;
 _uart1AccBuf[0] = _recivedChar;
 _frame.F_RECEIVER =  GENERATOR ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart1AccBuf;
 _frame.MESSAGE_LENGTH = 1;
 EnqueueFrameIntoReceiveBuffer(Uart1ReceiveBuf,
 &_frame,
 &Uart1RcivBufWrPtr,
 &uart1ReceiveMutex);
 u1MsgSize = 0;
 memset(_uart1AccBuf, '\0', 1);
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

void KL_UART2MessageReceiveHandler() iv IVT_ADDR_U2RXINTERRUPT {


 U2RXIF_bit = 0;
 if (UART2_Data_Ready())
 {
 char _recivedChar = UART2_Read();


 if ( 0  != 0)
 {
 if (u2MsgSize !=  0 )
 {
 _uart2AccBuf[u2MsgSize] = _recivedChar;
 u2MsgSize++;
 }
 else
 {
 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  ACTUATOR ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart2AccBuf;
 _frame.MESSAGE_LENGTH = u2MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart2ReceiveBuf,
 &_frame,
 &Uart2RcivBufWrPtr,
 &uart2ReceiveMutex);
 u2MsgSize = 0;
 memset(_uart2AccBuf, '\0', MAX_MSG_SIZE);
 }
 }
 else
 {

 if ( 0  != 0)
 {
 if (_recivedChar !=  0  && u2MsgSize < MAX_MSG_SIZE)
 {
 _uart2AccBuf[u2MsgSize] = _recivedChar;
 u2MsgSize++;
 }
 else
 {
 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  ACTUATOR ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart2AccBuf;
 _frame.MESSAGE_LENGTH = u2MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart2ReceiveBuf,
 &_frame,
 &Uart2RcivBufWrPtr,
 &uart2ReceiveMutex);
 u2MsgSize = 0;
 memset(_uart2AccBuf, '\0', MAX_MSG_SIZE);
 }

 }
 else
 {



 KERNEL_FRAME _frame;
 _uart2AccBuf[0] = _recivedChar;
 _frame.F_RECEIVER =  ACTUATOR ;
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

void KL_UART3MessageReceiveHandler() iv IVT_ADDR_U3RXINTERRUPT {


 U3RXIF_bit = 0;
 if (UART3_Data_Ready())
 {
 char _recivedChar = UART3_Read();

 if ( 0  != 0)
 {
 if (u3MsgSize !=  0 )
 {
 _uart3AccBuf[u3MsgSize] = _recivedChar;
 u3MsgSize++;
 }
 else
 {
 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  WORKSTATION ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart3AccBuf;
 _frame.MESSAGE_LENGTH = u3MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart3ReceiveBuf,
 &_frame,
 &Uart3RcivBufWrPtr,
 &uart3ReceiveMutex);
 u3MsgSize = 0;
 memset(_uart3AccBuf, '\0', MAX_MSG_SIZE);
 }
 }
 else
 {

 if ( 0  != 0)
 {
 if (_recivedChar !=  0  && u3MsgSize < MAX_MSG_SIZE)
 {
 _uart3AccBuf[u3MsgSize] = _recivedChar;
 u3MsgSize++;
 }
 else
 {
 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  WORKSTATION ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart3AccBuf;
 _frame.MESSAGE_LENGTH = u3MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart3ReceiveBuf,
 &_frame,
 &Uart3RcivBufWrPtr,
 &uart3ReceiveMutex);
 u3MsgSize = 0;
 memset(_uart3AccBuf, '\0', MAX_MSG_SIZE);
 }

 }
 else
 {



 KERNEL_FRAME _frame;
 _uart3AccBuf[0] = _recivedChar;
 _frame.F_RECEIVER =  WORKSTATION ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart3AccBuf;
 _frame.MESSAGE_LENGTH = 1;
 KL_CallSlotHandler(_frame);
 u3MsgSize = 0;
 memset(_uart3AccBuf, '\0', 1);
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

void KL_UART4MessageReceiveHandler() iv IVT_ADDR_U4RXINTERRUPT {


 U4RXIF_bit = 0;
 if (UART4_Data_Ready())
 {
 char _recivedChar = UART4_Read();
  UART3_Write(_recivedChar) ;

 if ( 0  != 0)
 {
 if (u4MsgSize !=  0 )
 {
 _uart4AccBuf[u4MsgSize] = _recivedChar;
 u4MsgSize++;
 }
 else
 {
 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  DISPLAY ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart4AccBuf;
 _frame.MESSAGE_LENGTH = u4MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart4ReceiveBuf,
 &_frame,
 &Uart4RcivBufWrPtr,
 &uart4ReceiveMutex);
 u4MsgSize = 0;
 memset(_uart4AccBuf, '\0', MAX_MSG_SIZE);
 }
 }
 else
 {

 if ( 0  != 0)
 {
 if (_recivedChar !=  0  && u4MsgSize < MAX_MSG_SIZE)
 {
 _uart4AccBuf[u4MsgSize] = _recivedChar;
 u4MsgSize++;
 }
 else
 {
 KERNEL_FRAME _frame;
 _frame.F_RECEIVER =  DISPLAY ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart4AccBuf;
 _frame.MESSAGE_LENGTH = u4MsgSize;
 EnqueueFrameIntoReceiveBuffer(Uart4ReceiveBuf,
 &_frame,
 &Uart4RcivBufWrPtr,
 &uart4ReceiveMutex);
 u4MsgSize = 0;
 memset(_uart4AccBuf, '\0', MAX_MSG_SIZE);
 }

 }
 else
 {





 KERNEL_FRAME _frame;
 _uart4AccBuf[0] = _recivedChar;
 _frame.F_RECEIVER =  DISPLAY ;
 _frame.F_TYPE = UNSTRUCTURED;
 _frame.FRAME_MESSAGE = _uart4AccBuf;
 _frame.MESSAGE_LENGTH = 1;
 KL_CallSlotHandler(_frame);
 u4MsgSize = 0;
 memset(_uart4AccBuf, '\0', 1);
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
#line 1257 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Kernel.c"
void KL_SendFrame(KERNEL_FRAME* frame)
{

 KL_Dispacher(frame);
}


void KL_RegisterDevice(DEVICE_SLOT slot)
{
 static int _register = 0;
 _SLOTS[_register] = slot;
 _register++;

  UART3_Write_Text("\r    DEVICE REGISTERED.") ;

}


void KL_Bootup()
{

 InitializePICSpeed();
 InitializePICPins();
 InitializeUARTS();
 InitializeTimers();
 InitializeHeap();
 PrioritizeInterrupts();
 InitializeBuzzer();

 KL_ClearKernelMemory();


 Sound_Play(1600, 100);
  UART3_Write_Text("\r-----------------------") ;
  UART3_Write_Text("\r X-Ray Package Ordering & Signal Transmitting (xPOST) kernel.") ;
  UART3_Write_Text("\r Version: 0.5") ;
  UART3_Write_Text("\r Date: May, 2018") ;

  UART3_Write_Text("\r BOOTUP IN DEBUG MODE.") ;

  UART3_Write_Text("\r-----------------------\r") ;
 Delay_ms(100);
 KL_StartDispacherEngine();
 _startupFunction();

 while (1)
 {
 asm nop;
 }

}




void KL_RegisterInstrument(InstrumentStart function)
{
 _startupFunction = function;
}
