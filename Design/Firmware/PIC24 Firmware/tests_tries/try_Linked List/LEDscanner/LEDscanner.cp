#line 1 "F:/MikroC/LEDscanner/LEDscanner.c"
#line 1 "f:/mikroc/ledscanner/ll.h"
#line 29 "f:/mikroc/ledscanner/ll.h"
 typedef struct _llnode {
 void* pData;

 struct _llnode* pHead;
 struct _llnode* pNext;
 struct _llnode* pPrev;
 struct _llnode* pTail;
 } linkListDef;

 void addNode(linkListDef* pLL, linkListDef* pNode, void* pData);
 void removeNode(linkListDef* pNode);
#line 1 "f:/mikroc/ledscanner/led.h"
#line 22 "f:/mikroc/ledscanner/led.h"
 typedef unsigned short ushort;


 typedef unsigned char byte;


 typedef struct {
 ushort* pPort;
 byte bytIOmask;
 } LEDctrlDef;

 void setupLEDcontrol(LEDctrlDef* pLED, ushort* pPort, byte bytIOmask);
#line 16 "F:/MikroC/LEDscanner/LEDscanner.c"
static linkListDef nodes[ 8 ];
static LEDctrlDef LEDs[ 8 ];
static linkListDef* pCurrent;
volatile LEDctrlDef* pLED;
volatile int intDir;
#line 24 "F:/MikroC/LEDscanner/LEDscanner.c"
void initTimer1() {

 T1CON = 0x21;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xAD;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}
#line 36 "F:/MikroC/LEDscanner/LEDscanner.c"
void Interrupt() {
 if (TMR1IF_bit) {
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xAD;

 pLED = (LEDctrlDef*)(pCurrent->pData);
 *(pLED->pPort) ^= pLED->bytIOmask;

 if ( intDir == 0 ) {
 if ( pCurrent->pNext ) {
 pCurrent = pCurrent->pNext;
 } else {
 intDir = 1;
 }
 } else if ( intDir == 1 ) {
 if ( pCurrent->pPrev ) {
 pCurrent = pCurrent->pPrev;
 } else {
 intDir = 0;
 }
 }
 }
}
#line 63 "F:/MikroC/LEDscanner/LEDscanner.c"
void main() {

 int i;
 for( i=0; i< 8 ; i++ ) {
 setupLEDcontrol(&LEDs[i], &PORTD, (1 << i));
 addNode(&nodes[0], &nodes[i], &LEDs[i]);
 }

 pCurrent = &nodes[0];
 intDir = 0;

 TRISD = 0;
 PORTD = 0x0;
 OSCCON = 0b01110000;

 initTimer1();
}
