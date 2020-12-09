/*
 * Project name:
     I2C_Simple (Simple test of I2C library routines)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Description:
     This program demonstrates usage of the I2C library routines. It
     establishes I2C bus communication with 24C02 EEPROM chip, writes one byte
     of data on some location, then reads it and displays it on PORTB.
 * Test configuration:
     MCU:             P24EP512GU810
                      http://ww1.microchip.com/downloads/en/DeviceDoc/70616F.pdf
     dev.board:       easypic fusion v7 rom
                      http://www.mikroe.com/easypic-fusion/
     Oscillator:      XT, 8.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for dsPIC
                      http://www.mikroe.com/mikroc/dspic/
 * NOTES:
     - Turn on I2C lines at SW14.3 (RA2) and SW14.4 (RA3). (board specific)
     - Turn off PORTA LEDs at SW15.1. (board specific)
     - Turn on PORTB and PORTD LEDs SW15.3 and SW15.5. (board specific)
 */
 
 #include "resources.h"
unsigned short i;
unsigned error;
char j;

void SI2C2Int() iv IVT_ADDR_MI2C2INTERRUPT ics ICS_AUTO {

    TFT_Write_Text("Interrupt Handler", 20, 150);
    SCLREL_I2C2CON_bit = 1;       //Release SCL2 line
    IFS3.MI2C2IF = 0;             //clear I2C2 Master interrupt flag
    MI2C2IF_bit=0;
}
 // display the outputs on Fusion v7 TFT screen
void Init_TFT() {
  TFT_BLED_Direction = 0;      // Set TFT backlight pin as output
  TFT_Set_Default_Mode();
  TFT_Init_ILI9341_8bit(320, 240);          // Initialize TFT display
  TFT_BLED = 1;                // Turn on TFT backlight
}

 void DrawFrame(){
  TFT_Fill_Screen(CL_WHITE);
  TFT_Set_Pen(CL_BLACK, 1);
  TFT_Line(20, 220, 300, 220);
  TFT_LIne(20,  46, 300,  46);
  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("I2C  Advanced  Example", 50, 14);
  TFT_Set_Font(&Verdana12x13_Regular, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text("Bogazici University", 19, 223);
  TFT_Set_Font(&Verdana12x13_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("www.boun.edu.tr", 200, 223);
  TFT_Set_Font(&TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
}

void Init_I2C() {

  I2C2_Init(100000);
  I2C2CONbits.A10M = 0;
  I2C2CONbits.SCLREL = 1;
  I2C2ADD = 0xB0; // Master address
  I2C2MSK = 0;
  //I2C2CONbits.I2CEN = 1;
  //IEC3bits.MI2C2IE = 1; // enable all master interrupts
  //IFS3bits.MI2C2IF = 0;//clear I2C2 Master interrupt flag
}

//--------------- Writes data to slave - signle location
// No error handled, so system may crash if an error happens!!!!
// The master just sends and slaves just receive
void WriteToSlaveSingleByte(unsigned short wData) {

  TFT_Write_Text("Sending", 20, 80);
  TFT_Write_Char(j, 80+i*10, 80);
  I2C2_Start(); // issue I2C start signal
  error = I2C2_Write(0xA0);     // send address
  // POINT: A is the slave address and 0 means write command in I2C
  // 0xA1 means slave address is A and the command is read
/*if(error == 1)
  {
     TFT_Write_Text("Address error", 30, 90);
  }*/
  error = I2C2_Write(wData);         // send data (data to be written)
/*if(error == 1)
  {
     TFT_Write_Text("Data error", 30, 100);
  }*/
  I2C2_Stop();       // issue I2C start signal
  
}

unsigned short reslt,result2;

unsigned short ReadFromSlaveSingleByte(unsigned short rAddr) {
    I2C2_Start();              // issue I2C start signal
    I2C2_Write(0xA0);          // send byte via I2C  (device address + W)
    I2C2_Write(rAddr);         // send byte (data address)
    I2C2_Restart();            // issue I2C signal repeated start
    I2C2_Write(0xA1);          // send byte (device address + R)
    reslt = I2C2_Read(1);      // Read the data (NO acknowledge)
    while (!I2C2_Is_Idle())
      asm nop;                 // Wait for the read cycle to finish
    I2C2_Stop();
    return reslt;
}


void main(){
  // Setting output frequency to 140MHz
  PLLFBD = 70;             // PLL multiplier M=70
  CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;

  TRISB = 0;               // Configure PORTB as output
  TRISD = 0;               // Configure PORTB as output
  LATB = 0;                // Set PORTB value to zero
  LATD = 0;                // Set PORTD value to zero

  Init_TFT();
  DrawFrame();
  delay_ms(200);
  Init_I2C();     // performs I2C initialization

// write to slave test
j = 'a';
  for(i = 0x00; i < 0x16; i++) {
   WriteToSlaveSingleByte(j);
   LATD=~PORTD;
   j++;
   Delay_ms(1000);
  }
  
 }