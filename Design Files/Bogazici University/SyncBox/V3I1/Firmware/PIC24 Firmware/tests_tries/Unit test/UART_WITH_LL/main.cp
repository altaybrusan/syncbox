#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/main.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/tests_tries/unit test/uart_with_ll/ll.h"
#line 29 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/tests_tries/unit test/uart_with_ll/ll.h"
 typedef struct _llnode {
 void* pData;

 struct _llnode* pHead;
 struct _llnode* pNext;
 struct _llnode* pPrev;
 struct _llnode* pTail;
 } linkListDef;

 void addNode(linkListDef* pLL, linkListDef* pNode, void* pData);
 void removeNode(linkListDef* pNode);
#line 24 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/main.c"
const int UART1_BUFFER_SIZE = 20;
char UART1_READ_BUFFER[UART1_BUFFER_SIZE];
int UART1_MESSAGE_LENGTH=0;
char UART1_DELIMITER =0x0D;

 static const int DEVICE_BUFFER_SIZE = 50;

 static linkListDef GENERATOR_FRAME_BUFFER[DEVICE_BUFFER_SIZE];
 static linkListDef* GENERATOR_LATEST_FRAME;


char uart_rd;
void ClearBuffer()
{
 memset(UART1_READ_BUFFER,0x00,UART1_BUFFER_SIZE);
}

int i=0;
void UART1MessageReceiveHandler() iv IVT_ADDR_U1RXINTERRUPT {
 static int qidx=1;
 if (UART1_Data_Ready())
 {

 char _recivedChar = UART1_Read();
 if(_recivedChar == UART1_DELIMITER || UART1_MESSAGE_LENGTH == UART1_BUFFER_SIZE)
 {

 GENERATOR_LATEST_FRAME = GENERATOR_LATEST_FRAME->pNext;
 if(GENERATOR_LATEST_FRAME->pNext)
 {
 memcpy((char*)GENERATOR_LATEST_FRAME->pData,' ',20);
 strcpy((char*)GENERATOR_LATEST_FRAME->pData,UART1_READ_BUFFER);
 UART1_Write_Text("\rEnqueued ");

 }
 else
 {
 GENERATOR_LATEST_FRAME = GENERATOR_LATEST_FRAME->pPrev;
 while(GENERATOR_LATEST_FRAME->pPrev )
 {
 UART1_Write_Text("\rFrame:");
 UART1_Write_Text((char*)GENERATOR_LATEST_FRAME->pData);
 GENERATOR_LATEST_FRAME = GENERATOR_LATEST_FRAME->pPrev;
 }
 }
#line 92 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/UART_WITH_LL/main.c"
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



char *pi;
char ai[10];

int result=0;
char buffer[15];

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

 for (index=0;index<DEVICE_BUFFER_SIZE;index++)
 {
 addNode( &GENERATOR_FRAME_BUFFER[0], &GENERATOR_FRAME_BUFFER[index], malloc(20) );
 }

 GENERATOR_LATEST_FRAME = &GENERATOR_FRAME_BUFFER[0];

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

 strcpy(pi,"ABC");
 UART1_write_text( pi);
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
 UART1_write( pi[result]);
 }
}


void main() {
 int index;

 PLLFBD = 70;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;

 result = PPS_Mapping(124, _INPUT, _U1RX);
 result = PPS_Mapping(125, _OUTPUT, _U1TX);
 Delay_ms(500);
 ClearBuffer();
 UART1_Init(9600);

 Delay_ms(500);








 EnableRXInterrupt();
 AllocateHeap();
 AllocateIOBuffers();



 while (1) {
 asm nop;
 }
}
