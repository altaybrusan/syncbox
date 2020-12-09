#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/timer0/timer0.c"
char i=0;



void interrupt(){
if (TMR0IF_bit){
i++;
TMR0L=131;
TMR0IF_bit=0;
}
}

void kurulum(){
TRISB=0;
PORTB=0;
TMR0ON_bit=1;
T08BIT_bit=0;
T0CS_bit=0;
T0SE_bit=0;
PSA_bit=0;
T0PS2_bit=0;
T0PS1_bit=0;
T0PS0_bit=1;
GIE_bit=1;
TMR0IF_bit=0;
TMR0L = 131;
TMR0IE_bit=1;
}

void main(){
kurulum();
#line 49 "C:/Users/Burak/Desktop/SyncBox Kodlarý/timer0/timer0.c"
while(1){

if(i==1)
{
latb=~latb;
i=0;

}
}
}
