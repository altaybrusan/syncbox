char cnt;
unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;



// LCD module connections
sbit LCD_RS at RA5_bit;
sbit LCD_EN at RA4_bit;
sbit LCD_D4 at RA3_bit;
sbit LCD_D5 at RA2_bit;
sbit LCD_D6 at RA1_bit;
sbit LCD_D7 at RA0_bit;

sbit LCD_RS_Direction at TRISA5_bit;
sbit LCD_EN_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISA3_bit;
sbit LCD_D5_Direction at TRISA2_bit;
sbit LCD_D6_Direction at TRISA1_bit;
sbit LCD_D7_Direction at TRISA0_bit;
// End LCD module connections


void interrupt(){
   USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
}


void main() {
  
  ADCON1 |= 0x0F;                         // Configure all ports with analog function as digital
  CMCON  |= 7;
  
  /*ADCON1 = 0x0F ;
  CMCON  = 0x07 ; */
  TRISA = 0x00; // PORTA is output

   Lcd_Init();                        // Initialize LCD
   Lcd_Out(1,1,"USB DENEME");
   Delay_Ms(1000);
   Lcd_Cmd(_LCD_CLEAR);


HID_Enable(&readbuff,&writebuff);       // Enable HID communication

  while(1){
    while(!HID_Read());

    for(cnt=0;cnt<64;cnt++)
      writebuff[cnt]=readbuff[cnt];

    while(!HID_Write(&writebuff,64));
    
    Lcd_Out(1,1,writebuff);
    Delay_Ms(500);
    Lcd_Cmd(_LCD_CLEAR);
    
  }
}