char  uart_rd;


void main() {
     TRISD.F0 = 0;//PORTB çýkýþ
     PORTD.F0 = 0;//PORTB'nin tüm pinleri 0 seviyesinde.
     ADCON1 = 0x0F ;
     CMCON = 7; // Disable Comparators


     PORTD.F0 = 1;

     UART1_Init(9600);
     Delay_ms(100);

     UART1_Write(63);
     UART1_Write(80);
     UART1_Write(13);


     while (1)
     {

        if (UART1_Data_Ready())
        {

           uart_rd = UART1_Read();

           UART1_Write(uart_rd);
}
}
  }