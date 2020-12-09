#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/timer1/timer1.c"
char i=0;

void InitTimer1(){
 T1CON = 0x21;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}

void Interrupt(){
 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 i++;

 }
}


void main(){
TRISB=0;
PORTB=0;
InitTimer1();

while(1){

if(i==1)
{
latb=~latb;
i=0;

}
}
}
