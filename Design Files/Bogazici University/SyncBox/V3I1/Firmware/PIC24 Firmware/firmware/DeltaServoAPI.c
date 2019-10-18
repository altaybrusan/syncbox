#include "DeltaServoAPI.h"
#if build==debug
#include "ConnectionMap.h"
#endif
#include "Kernel.h"
#include <built_in.h>   // loads MikroC internal functions

const int MIN_MOTOR_JOG = 100;
const int MAX_MOTOR_JOG = 800;

const char SET_CONNECTION_MECHANISM_CMD[] = {0x00, 0x00, 0x00, 0x00};

const byte TURN_ON_CMD[] =  {0x00, 0x01, 0x00, 0x00};
const byte TURN_OFF_CMD[] = {0x00, 0x00, 0x00, 0x00};

const byte ROTATE_CW_CMD[] =  {0x13, 0x87, 0x00, 0x00};
const byte ROTATE_CCW_CMD[] = {0x13, 0x86, 0x00, 0x00};
const byte STOP_ROTATION_CMD[] = {0x00, 0x00, 0x00, 0x00};

byte _startingAddress[2];                                    // Starting register address
byte _numberOfRegisters[2] = {0x00 , 0x02};                  // endian problem is hard to solve, so I use this trick
byte _dataRegisters[4];                                      // Data registers content
int _crc;                                                    // Save the CRC inside

                                  // Buffer to keep latest command in.


// Compute the MODBUS RTU CRC
uint ModRTU_CRC(byte buf[], int len)
{
  uint crc = 0xFFFF;
  int pos=0, index=0;

  for ( pos = 0; pos < len; pos++) {
    crc ^= (uint)buf[pos];          // XOR byte into least sig. byte of crc

    for ( index = 8; index != 0; index--) {    // Loop over each bit
      if ((crc & 0x0001) != 0) {      // If the LSB is set
        crc >>= 1;                    // Shift right and XOR 0xA001
        crc ^= 0xA001;
      }
      else                            // Else LSB is not set
        crc >>= 1;                    // Just shift right
    }
  }
  // Note, this number has low and high bytes swapped, 
  // so use it accordingly (or swap bytes)
  return crc;
}

void PrepareCommandStructure(byte* command)
{
  // clear buffer
  memset(command,0x00,13);
  memset(_dataRegisters,0x00,4);
  
  // set slave address
  command[0]= 0x7F;
  
  // set modbus function call code
  command[1]= 0x10;
  
  // number of registers
  memcpy(&command[4], _numberOfRegisters,2);
  
  // bytes count
  command[6]= 0x04;
}


// This is not best practice: WHYE THE COMMANDS LENGTH IS FIX?!
void CallActuatorKernelSendService(char* message,FRAME_TYPE type)
{
     //int temp = 0;
     KERNEL_FRAME _frame ;//= { 0,0,0,0,0,0 };
     _frame.F_SENDER = ACTUATOR;
     _frame.F_RECEIVER = ACTUATOR;
     _frame.F_TYPE = type;
     _frame.MESSAGE_LENGTH=13;
     _frame.FRAME_MESSAGE = message;
         _frame.F_PRIORITY = NORMAL_FRAME; // ALL frames are normal.
      Delay_ms(10); //based on delta guidline. We can count on dispacher delay over normal frames
     KL_SendFrame(&_frame);
}


void SetConnectionToRS232Modbus()
{
   // TODO: reimplement this
   
  // This function did not work.
  // char _cmd1[] ={0Xff, 0x03, 0x03, 0x00, 0x00, 0x01, 0x91, 0x90};
  //   char _cmd2[] ={0X7f, 0x06, 0x03, 0x08, 0x00, 0x00, 0x02, 0x52};
  //   char _cmd3[] ={0X7f, 0x03, 0x03, 0x0a, 0x00, 0x02, 0xee, 0x53};
  //   char _cmd4[] ={0X7f, 0x10, 0x03, 0x0a, 0x00, 0x02, 0x04, 0x00, 0x01, 0x00, 0x00, 0xa8, 0xc9};
  //   char _cmd5[] ={0Xff, 0x06, 0x03, 0x0a, 0x00, 0x00, 0xBC, 0x52};
  //   char _cmd6[] ={0Xff, 0x03, 0x03, 0x00, 0x00, 0x02, 0xd1, 0x91};
  //   char _cmd7[] ={0X7f, 0x06, 0x03, 0x08, 0x00, 0x00, 0x02, 0x52};
  //   char _cmd8[] = {0X7f, 0x03, 0x03, 0x10, 0x00, 0x02, 0xcf, 0x94};
  //   char _cmd9[] = {0X7f, 0x67, 0x00, 0x12, 0x00, 0x03, 0xde, 0x18};
  //   char _cmd10[] ={0X7f, 0x03, 0x00, 0x00, 0x00, 0x01, 0x8e, 0x14};
  //   char _cmd11[] ={0X7f, 0x67, 0x00, 0x12, 0x00, 0x03, 0xde, 0x18};
  //   char _cmd12[] ={0X7f, 0x03, 0x00, 0x00, 0x00, 0x01, 0x8e, 0x14};
  //   char _cmd13[] ={0X7f, 0x67, 0x00, 0x12, 0x00, 0x03, 0xde, 0x18};
  //   char _cmd14[] ={0X7f, 0x03, 0x00, 0x00, 0x00, 0x01, 0x8e, 0x14};
  //   char _cmd15[] ={0X7f, 0x06, 0x02, 0x10, 0x00, 0x0c, 0x83, 0xac};
  //   char _cmd16[] ={0X7f, 0x03, 0x02, 0x10, 0x00, 0x01, 0x8e, 0x69};
  //   char _cmd17[] ={0x7f, 0x10, 0x03, 0x0a, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xf9, 0x09};
  //    SendInitCommand(_cmd1, 8);
  //    SendInitCommand(_cmd2, 8);
  //    SendInitCommand(_cmd3, 8);
  //    SendInitCommand(_cmd4, 13);
  //    SendInitCommand(_cmd5, 8);
  //    SendInitCommand(_cmd6, 8);
  //    SendInitCommand(_cmd7, 8);
  //    SendInitCommand(_cmd8, 8);
  //    SendInitCommand(_cmd9, 8);
  //    SendInitCommand(_cmd10, 8);
  //    SendInitCommand(_cmd11, 8);
  //    SendInitCommand(_cmd12, 8);
  //    SendInitCommand(_cmd13, 8);
  //    SendInitCommand(_cmd14, 8);
  //    SendInitCommand(_cmd15, 8);
  //    SendInitCommand(_cmd16, 8);
  //    SendInitCommand(_cmd17, 13);
   
}

void TurnOnSliderMotor()
{
     byte _command[13];
     PrepareCommandStructure(_command);
     
     _startingAddress[0]=0x02;
     _startingAddress[1]=0x3c;
     
     memcpy(&_command[2], _startingAddress,2);
     memcpy(&_command[7], TURN_ON_CMD,4);
     _crc =   ModRTU_CRC(_command,11);   // calculate crc
     memcpy(&_command[11],&_crc,2);       // append  crc to the buffer
   
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
     _crc =   ModRTU_CRC(_command,11);   // calculate crc
     memcpy(&_command[11],&_crc,2);       // append  crc to the buffer

     CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void SetSliderMotorSpeed(int speed)
{
    if(  MIN_MOTOR_JOG <= speed && speed <= MAX_MOTOR_JOG )
    {
     byte _command[13];
     char _cmd[] ={0x00,0x00,0x00,0x00};
     //byte lbyte = Lo(speed);
     //byte hbyte = hi(speed);
     _cmd[0]= hi(speed);//hbyte;     //swap the byte order of int data type
     _cmd[1]= Lo(speed);//lbyte;

     PrepareCommandStructure(_command);
     
     _startingAddress[0]=0x04;
     _startingAddress[1]=0x0a;

     memcpy(&_command[2], _startingAddress,2);
     memcpy(&_command[7], _cmd,4);
     _crc =   ModRTU_CRC(_command,11);   // calculate crc
     memcpy(&_command[11],&_crc,2);       // append  crc to the buffer

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
     _crc =   ModRTU_CRC(_command,11);   // calculate crc
     memcpy(&_command[11],&_crc,2);       // append  crc to the buffer

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
     _crc =   ModRTU_CRC(_command,11);   // calculate crc
     memcpy(&_command[11],&_crc,2);       // append  crc to the buffer

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
     _crc =   ModRTU_CRC(_command,11);   // calculate crc
     memcpy(&_command[11],&_crc,2);       // append  crc to the buffer

     CallActuatorKernelSendService(_command,UNSTRUCTURED);
}

void ActuatorProcessKernelFrame(KERNEL_FRAME frame)
{
//        int _temp = 0;
#if build == debug
   // TODO: WE DID NOT RECEIVED FEEDBACK IN OUR API.
   //       BUT WE CAN CHECK THE MESSAGES FEEDBACKS
   //SendDebugMsg("\r    >>ACTUATOR RECIEVED: ");
   //SendDebugMsg(frame.FRAME_MESSAGE);
#endif
}