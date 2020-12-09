#line 1 "F:/MikroC/LEDscanner/led.c"
#line 1 "f:/mikroc/ledscanner/led.h"
#line 22 "f:/mikroc/ledscanner/led.h"
 typedef unsigned short ushort;


 typedef unsigned char byte;


 typedef struct {
 ushort* pPort;
 byte bytIOmask;
 } LEDctrlDef;

 void setupLEDcontrol(LEDctrlDef* pLED, ushort* pPort, byte bytIOmask);
#line 19 "F:/MikroC/LEDscanner/led.c"
void setupLEDcontrol(LEDctrlDef* pLED, ushort* pPort, byte bytIOmask) {

 if ( !(pLED && pPort && bytIOmask) ) {

 return;
 }
 pLED->pPort = pPort;
 pLED->bytIOmask = bytIOmask;
}
