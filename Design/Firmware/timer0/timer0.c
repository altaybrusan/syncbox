char i=0;



void interrupt(){//kesme alt programý
if (TMR0IF_bit){//Timer0 Kesme bayraðý kontrol ediliyor.
i++;
TMR0L=131;
TMR0IF_bit=0;// Kesme bayraðý sýfýrlanýyor.
}
}
//*****************************************************************************
void kurulum(){
TRISB=0;//PORTB çýkýþ
PORTB=0;//PORTB'nin tüm pinleri 0 seviyesinde.
TMR0ON_bit=1;
T08BIT_bit=0;
T0CS_bit=0;// Clock palsi kaynaðý olarak dahili osilatör seçildi.
T0SE_bit=0;
PSA_bit=0;//Prescaler deðeri Timer0 için kullanýlacak.
T0PS2_bit=0;//Prescaler deðeri 1:32 olarak seçildi.
T0PS1_bit=0;
T0PS0_bit=1;
GIE_bit=1;// tüm kesmelere izin verdik.
TMR0IF_bit=0;//Kesme bayraðýný her ihtimale karþý sýfýrladýk
TMR0L = 131;
TMR0IE_bit=1;//Timer0 kesmesini aktif ettik.
}
//*****************************************************************************
void main(){
kurulum();


/*trisb=0;//PORTB çýkýþ
portb=0;//PORTB'nin tüm pinleri 0 seviyesinde.
TMR0ON_bit=1;
T08BIT_bit=0;
T0CS_bit=0;// Clock palsi kaynaðý olarak dahili osilatör seçildi.
T0SE_bit=0;
PSA_bit=0;//Prescaler deðeri Timer0 için kullanýlacak.
T0PS2_bit=0;//Prescaler deðeri 1:32 olarak seçildi.
T0PS1_bit=0;
T0PS0_bit=1;
GIE_bit=1;// tüm kesmelere izin verdik.
TMR0IF_bit=0;//Kesme bayraðýný her ihtimale karþý sýfýrladýk
TMR0L = 131;
TMR0IE_bit=1;//Timer0 kesmesini aktif ettik.   */

while(1){

if(i==1)  // Eðer i=5 ise yani 5 kesme oluþmuþsa(5 x 4ms = 20 ms)
{
latb=~latb;//portb tersleniyor
i=0;//i deðiþkeni sýfýrlanýyor.

}
}
}