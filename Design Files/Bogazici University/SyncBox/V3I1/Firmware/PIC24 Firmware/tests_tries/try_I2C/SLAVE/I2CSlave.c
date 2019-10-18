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
Dev.Board:       EasyPIC Fusion v7 -  ac:Serial_EEPROM
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

// This header file is for TFT screen
#include "resources.h"


char _str[4] = { ' ',' ',' ',' ' }; // buffer to convert address byte to string
int _idx = 0;
unsigned char   temp;   //used to put received byte into


void Init_Slave() {
        // ATTENSION: the shif is MUST!!!! I dont know why! otherwise it will not work
        I2C2ADD = 0xA0 >> 1;
        I2C2CON = 0x9040;// USE_I2C_Clock_Stretch
        IFS3.SI2C2IF = 0; //clear I2C2 Slave interrupt flag
        IEC3.SI2C2IE = 1; // enable all slave interrupts
}
// Display the received byte on the PIC fusion TFT screen
void Init_TFT() {
        TFT_BLED_Direction = 0;      // Set TFT backlight pin as output
        TFT_Set_Default_Mode();
        TFT_Init_ILI9341_8bit(320, 240);          // Initialize TFT display
        TFT_BLED = 1;                // Turn on TFT backlight
}
void DrawFrame() {
        TFT_Fill_Screen(CL_WHITE);
        TFT_Set_Pen(CL_BLACK, 1);
        TFT_Line(20, 220, 300, 220);
        TFT_LIne(20, 46, 300, 46);
        TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_RED, FO_HORIZONTAL);
        TFT_Write_Text("I2C  Advanced  Example", 50, 14);
        TFT_Set_Font(&Verdana12x13_Regular, CL_BLACK, FO_HORIZONTAL);
        TFT_Write_Text("Bogazici University", 19, 223);
        TFT_Set_Font(&Verdana12x13_Regular, CL_RED, FO_HORIZONTAL);
        TFT_Write_Text("www.boun.edu.tr", 200, 223);
        TFT_Set_Font(&TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
}


// This is a simple slave logic to process the I2C operations
// for more information, refer to dsPIC and PIC24 I2C on Microchip website
// this slave just receive.
void SI2C2Int() iv IVT_ADDR_SI2C2INTERRUPT ics ICS_AUTO {

        // Check for (READ_FROM_SLAVE) or (WRITE_TO_SLAVE)
        if (R_W_I2C2STAT_bit == 0)
        {
                // (WRITE_TO_SLAVE) section

                // Check the byte is (DATA) or (ADDRESS)
                if (D_A_I2C2STAT_bit == 0)
                {
                        // (ADDRESS) section

                        //  check (RECEIVE_BUFFER_IS_FULL)
                        if (RBF_I2C2STAT_bit == 0)
                        {
                                TFT_Write_Text("Address Empty!", 20, 90);
                        }
                        else
                        {
                                TFT_Write_Text("Address:", 20, 100);
                                temp = I2C2RCV;
                                ByteToStr(temp, _str);
                                TFT_Write_Text(_str, 80, 100);
                                //ACKDT_I2C2CON_bit = 0;
                        }
                }
                else
                {
                        // (DATA) section

                        //  check (RECEIVE_BUFFER_IS_FULL)
                        if (RBF_I2C2STAT_bit == 0)
                        {
                                TFT_Write_Text("Data Empty!", 20, 120);
                        }
                        else
                        {
                                TFT_Write_Text("Data:", 20, 130);
                                temp = I2C2RCV;
                                TFT_Write_Char(temp, 70 + 10 * _idx, 130);
                                _idx++;
                        }

                }
        }
        else
        {
                // (READ_FROM_SLAVE) section

                TFT_Write_Text("Read Slave", 20, 140);
                TFT_Write_Char('.', 80 + _idx * 10, 140);
                _idx++;
                I2C2TRN = 'P';      //send data to I2C master device
                I2C2CONbits.SCLREL = 1; //Release SCL2 line
                while (I2C2STATbits.TBF);

        }

        SCLREL_I2C2CON_bit = 1;       //Release SCL2 line
        IFS3.SI2C2IF = 0; //clear I2C2 Slave interrupt flag
        SI2C2IF_bit = 0;
}


void main() {


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

        Init_Slave();            // performs I2C initialization
        Init_TFT();              // Initialize TFT
        DrawFrame();             // Draw graphical frame
        Delay_ms(100);
        TFT_Write_Text("READY", 150, 223);


        while (1);

}