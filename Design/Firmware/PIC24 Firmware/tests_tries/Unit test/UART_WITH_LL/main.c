/*
 * Project name:
     UARTA (Usage of UART libraries)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Description:
     This simple example demonstrates usage of mikroC's UART libraries, through
     a 'loopback' interface. The data being sent to PIC24 through UART and sent back.
 * Test configuration:
     MCU:             P24EP512GU810
                      http://ww1.microchip.com/downloads/en/DeviceDoc/70616F.pdf
     Dev.Board:       EasyPIC Fusion v7 - ac:UARTA
                      http://www.mikroe.com/easypic-fusion/
     Oscillator:      XT-PLL, 140.0000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for dsPIC
                      http://www.mikroe.com/mikroc/dspic/
 * NOTES:
     - Turn ON UARTA switches at SW12. (board specific)
 */

#include "ll.h"

const int UART1_BUFFER_SIZE = 20;
char UART1_READ_BUFFER[UART1_BUFFER_SIZE];
int UART1_MESSAGE_LENGTH=0; // UART1 message length
char   UART1_DELIMITER =0x0D;

 static const int DEVICE_BUFFER_SIZE = 50;

 static linkListDef GENERATOR_FRAME_BUFFER[DEVICE_BUFFER_SIZE];
 static linkListDef* GENERATOR_LATEST_FRAME;


char uart_rd;
void ClearBuffer()
{
   memset(UART1_READ_BUFFER,0x00,UART1_BUFFER_SIZE); //clear buffer
}

int i=0;
void UART1MessageReceiveHandler() iv IVT_ADDR_U1RXINTERRUPT {
 static int qidx=1;
   if (UART1_Data_Ready())
   {
      // If data is received
      char _recivedChar = UART1_Read();
      if(_recivedChar == UART1_DELIMITER || UART1_MESSAGE_LENGTH == UART1_BUFFER_SIZE)
        {
            // start from node1. leave the first node empty. it makes reading easy!
            GENERATOR_LATEST_FRAME = GENERATOR_LATEST_FRAME->pNext; //shift pointer
            if(GENERATOR_LATEST_FRAME->pNext)     //Fill up all  frame buffers
            {
               memcpy((char*)GENERATOR_LATEST_FRAME->pData,' ',20);
               strcpy((char*)GENERATOR_LATEST_FRAME->pData,UART1_READ_BUFFER);
               UART1_Write_Text("\rEnqueued ");

            }
            else
            {                                      // read out all frames inside buffer
            GENERATOR_LATEST_FRAME = GENERATOR_LATEST_FRAME->pPrev; //shift back
             while(GENERATOR_LATEST_FRAME->pPrev )
              {
                UART1_Write_Text("\rFrame:");
                UART1_Write_Text((char*)GENERATOR_LATEST_FRAME->pData);
                GENERATOR_LATEST_FRAME = GENERATOR_LATEST_FRAME->pPrev; //shift back
              }
            }
            
            

//********************************** ACCESS VIA [] operator
          //if(qidx<=5)
//          {
//           memcpy((char*)GENERATOR_FRAME_BUFFER[qidx]->pData,' ',20); // clear buffer, o.w. bunch of trash destroy it.
//           strcpy((char*)GENERATOR_FRAME_BUFFER[qidx]->pData,UART1_READ_BUFFER);
//           UART1_Write_Text("\rEnqueued ");
//           ++qidx;
//          }
//          else
//          {
//
//           for(i=1;i<qidx;i++)
//           {
//            UART1_Write_Text("\rFrame:");
//            UART1_Write_Text((char*)GENERATOR_FRAME_BUFFER[i]->pData);
//           }
//
//            qidx=0;
//          }

          UART1_MESSAGE_LENGTH = 0;
          ClearBuffer();
        }
      else
       {
         UART1_READ_BUFFER[UART1_MESSAGE_LENGTH] = _recivedChar;
         UART1_MESSAGE_LENGTH++;
       }

   }
  if (U1STA.OERR = 1)
   {
     U1STA.OERR = 0;
     U1STA.FERR = 0;
   }
   
    U1RXIF_bit = 0;
 }



char *pi;      // pointer to integer
char ai[10];  // array of integers

int result=0;
char  buffer[15];
// this const is MUST
const HEAP_SIZE = 4500;


void EnableRXInterrupt()
{
  U1RXIE_bit = 1;
  U1RXIE_bit = 1;
  U1RXIF_bit = 0;
}
void AllocateIOBuffers()
{ 
   int index=0;
   // initialize IO buffers
   for (index=0;index<DEVICE_BUFFER_SIZE;index++)
   {
     addNode( &GENERATOR_FRAME_BUFFER[0], &GENERATOR_FRAME_BUFFER[index], malloc(20) );
   }
   
   GENERATOR_LATEST_FRAME =  &GENERATOR_FRAME_BUFFER[0];
   
      if(GENERATOR_LATEST_FRAME->pNext)
   {
    UART1_Write_Text("STAGE ONE PASSED!");
    GENERATOR_LATEST_FRAME= GENERATOR_LATEST_FRAME->pNext ;
   }

   if(GENERATOR_LATEST_FRAME->pNext)
   {
    UART1_Write_Text("STAGE TWO PASSED!");
   }
   
}

void AllocateHeap()
{
MM_Init();
}


void TestWithMInit(){

  MM_Init();
  pi = (char *)Malloc(400);
  //strcpy(ai,"ABC");UART1_write_text( ai)
  strcpy(pi,"ABC");
  UART1_write_text( pi); //success
}
void TestmallocWithoutMinit()
{
     pi = (char *)Malloc(sizeof ai);
     for(result=0;result<10;result++)
     {
       pi[result] = result+60;
       ai[result] = result+60;
     }
     for(result=0;result<10;result++)
     {
       UART1_write( pi[result]);  // does not print anything
     }
}


void main() {
  int index;
  // Setting output frequency to 140MHz
  PLLFBD = 70;             // PLL multiplier M=70
  CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;

  result = PPS_Mapping(124, _INPUT,  _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
  result = PPS_Mapping(125, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it
   Delay_ms(500);
  ClearBuffer();
  UART1_Init(9600);              // Initialize UART module at 56000 bps

  Delay_ms(500);                  // Wait for UART module to stabilize

 //  UART1_Write_Text("Start");
 //  UART1_Write(13);
 //  UART1_Write(10);

  //TestmallocWithoutMinit();
  //TestWithMInit();
  
  EnableRXInterrupt();
  AllocateHeap();
  AllocateIOBuffers();


   
  while (1) {                     // Endless loop
      asm nop;
  }
}