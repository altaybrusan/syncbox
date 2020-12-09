char i=0;

void InitTimer1(){
  T1CON         = 0x21;
  TMR1IF_bit         = 0;
  TMR1H         = 0x3C;
  TMR1L         = 0xB0;
  TMR1IE_bit         = 1;
  INTCON         = 0xC0;
}

void Interrupt(){
  if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H         = 0x3C;
    TMR1L         = 0xB0;
    i++;

  }
}


void main(){
TRISB=0;//PORTB çýkýþ
PORTB=0;//PORTB'nin tüm pinleri 0 seviyesinde.
InitTimer1();

while(1){

if(i==1)  // Eðer i=5 ise yani 5 kesme oluþmuþsa(5 x 4ms = 20 ms)
{
latb=~latb;//portb tersleniyor
i=0;//i deðiþkeni sýfýrlanýyor.

}
}
}