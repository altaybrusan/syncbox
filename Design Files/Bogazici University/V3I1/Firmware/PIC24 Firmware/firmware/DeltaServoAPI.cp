#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/DeltaServoAPI.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/deltaservoapi.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/types.h"
#line 7 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/types.h"
 typedef unsigned char byte;
 typedef unsigned int uint;
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
#line 57 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/deltaservoapi.h"
 extern const int MIN_MOTOR_JOG ;

 extern const int MAX_MOTOR_JOG ;



 void TurnOnSliderMotor();

 void TurnOffSliderMotor();

 void SetSliderMotorSpeed(int);

 void RotateSliderMotorCounterClockwise();

 void RotateSliderMotorClockwise();

 void StopMotor();


 void ActuatorProcessKernelFrame(KERNEL_FRAME);
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/built_in.h"
#line 8 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/DeltaServoAPI.c"
const int MIN_MOTOR_JOG = 100;
const int MAX_MOTOR_JOG = 800;

const char SET_CONNECTION_MECHANISM_CMD[] = {0x00, 0x00, 0x00, 0x00};

const byte TURN_ON_CMD[] = {0x00, 0x01, 0x00, 0x00};
const byte TURN_OFF_CMD[] = {0x00, 0x00, 0x00, 0x00};

const byte ROTATE_CW_CMD[] = {0x13, 0x87, 0x00, 0x00};
const byte ROTATE_CCW_CMD[] = {0x13, 0x86, 0x00, 0x00};
const byte STOP_ROTATION_CMD[] = {0x00, 0x00, 0x00, 0x00};

byte _startingAddress[2];
byte _numberOfRegisters[2] = {0x00 , 0x02};
byte _dataRegisters[4];
int _crc;





uint ModRTU_CRC(byte buf[], int len)
{
 uint crc = 0xFFFF;
 int pos=0, index=0;

 for ( pos = 0; pos < len; pos++) {
 crc ^= (uint)buf[pos];

 for ( index = 8; index != 0; index--) {
 if ((crc & 0x0001) != 0) {
 crc >>= 1;
 crc ^= 0xA001;
 }
 else
 crc >>= 1;
 }
 }


 return crc;
}

void PrepareCommandStructure(byte* command)
{

 memset(command,0x00,13);
 memset(_dataRegisters,0x00,4);


 command[0]= 0x7F;


 command[1]= 0x10;


 memcpy(&command[4], _numberOfRegisters,2);


 command[6]= 0x04;
}



void CallActuatorKernelSendService(char* message,FRAME_TYPE type)
{

 KERNEL_FRAME _frame ;
 _frame.F_SENDER = ACTUATOR;
 _frame.F_RECEIVER = ACTUATOR;
 _frame.F_TYPE = type;
 _frame.MESSAGE_LENGTH=13;
 _frame.FRAME_MESSAGE = message;
 _frame.F_PRIORITY = NORMAL_FRAME;
 Delay_ms(10);
 KL_SendFrame(&_frame);
}


void SetConnectionToRS232Modbus()
{
#line 127 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/DeltaServoAPI.c"
}

void TurnOnSliderMotor()
{
 byte _command[13];
 PrepareCommandStructure(_command);

 _startingAddress[0]=0x02;
 _startingAddress[1]=0x3c;

 memcpy(&_command[2], _startingAddress,2);
 memcpy(&_command[7], TURN_ON_CMD,4);
 _crc = ModRTU_CRC(_command,11);
 memcpy(&_command[11],&_crc,2);

 CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void TurnOffSliderMotor()
{
 byte _command[13];
 PrepareCommandStructure(_command);

 _startingAddress[0]=0x02;
 _startingAddress[1]=0x3c;

 memcpy(&_command[2], _startingAddress,2);
 memcpy(&_command[7], TURN_OFF_CMD,4);
 _crc = ModRTU_CRC(_command,11);
 memcpy(&_command[11],&_crc,2);

 CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void SetSliderMotorSpeed(int speed)
{
 if( MIN_MOTOR_JOG <= speed && speed <= MAX_MOTOR_JOG )
 {
 byte _command[13];
 char _cmd[] ={0x00,0x00,0x00,0x00};


 _cmd[0]=  ((char *)&speed)[1] ;
 _cmd[1]=  ((char *)&speed)[0] ;

 PrepareCommandStructure(_command);

 _startingAddress[0]=0x04;
 _startingAddress[1]=0x0a;

 memcpy(&_command[2], _startingAddress,2);
 memcpy(&_command[7], _cmd,4);
 _crc = ModRTU_CRC(_command,11);
 memcpy(&_command[11],&_crc,2);

 CallActuatorKernelSendService(_command,UNSTRUCTURED);
 }
}


void RotateSliderMotorCounterClockwise()
{
 byte _command[13];
 PrepareCommandStructure(_command);

 _startingAddress[0]=0x04;
 _startingAddress[1]=0x0a;

 memcpy(&_command[2], _startingAddress,2);
 memcpy(&_command[7], ROTATE_CCW_CMD,4);
 _crc = ModRTU_CRC(_command,11);
 memcpy(&_command[11],&_crc,2);

 CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void RotateSliderMotorClockwise()
{
 byte _command[13];
 PrepareCommandStructure(_command);

 _startingAddress[0]=0x04;
 _startingAddress[1]=0x0a;

 memcpy(&_command[2], _startingAddress,2);
 memcpy(&_command[7], ROTATE_CW_CMD,4);
 _crc = ModRTU_CRC(_command,11);
 memcpy(&_command[11],&_crc,2);

 CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void StopMotor()
{
 byte _command[13];
 PrepareCommandStructure(_command);

 _startingAddress[0]=0x04;
 _startingAddress[1]=0x0a;

 memcpy(&_command[2], _startingAddress , 2);
 memcpy(&_command[7], STOP_ROTATION_CMD, 4);
 _crc = ModRTU_CRC(_command,11);
 memcpy(&_command[11],&_crc,2);

 CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void ActuatorProcessKernelFrame(KERNEL_FRAME frame)
{







}
