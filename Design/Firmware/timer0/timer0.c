char i=0;



void interrupt(){//kesme alt program�
if (TMR0IF_bit){//Timer0 Kesme bayra�� kontrol ediliyor.
i++;
TMR0L=131;
TMR0IF_bit=0;// Kesme bayra�� s�f�rlan�yor.
}
}
//*****************************************************************************
void kurulum(){
TRISB=0;//PORTB ��k��
PORTB=0;//PORTB'nin t�m pinleri 0 seviyesinde.
TMR0ON_bit=1;
T08BIT_bit=0;
T0CS_bit=0;// Clock palsi kayna�� olarak dahili osilat�r se�ildi.
T0SE_bit=0;
PSA_bit=0;//Prescaler de�eri Timer0 i�in kullan�lacak.
T0PS2_bit=0;//Prescaler de�eri 1:32 olarak se�ildi.
T0PS1_bit=0;
T0PS0_bit=1;
GIE_bit=1;// t�m kesmelere izin verdik.
TMR0IF_bit=0;//Kesme bayra��n� her ihtimale kar�� s�f�rlad�k
TMR0L = 131;
TMR0IE_bit=1;//Timer0 kesmesini aktif ettik.
}
//*****************************************************************************
void main(){
kurulum();


/*trisb=0;//PORTB ��k��
portb=0;//PORTB'nin t�m pinleri 0 seviyesinde.
TMR0ON_bit=1;
T08BIT_bit=0;
T0CS_bit=0;// Clock palsi kayna�� olarak dahili osilat�r se�ildi.
T0SE_bit=0;
PSA_bit=0;//Prescaler de�eri Timer0 i�in kullan�lacak.
T0PS2_bit=0;//Prescaler de�eri 1:32 olarak se�ildi.
T0PS1_bit=0;
T0PS0_bit=1;
GIE_bit=1;// t�m kesmelere izin verdik.
TMR0IF_bit=0;//Kesme bayra��n� her ihtimale kar�� s�f�rlad�k
TMR0L = 131;
TMR0IE_bit=1;//Timer0 kesmesini aktif ettik.   */

while(1){

if(i==1)  // E�er i=5 ise yani 5 kesme olu�mu�sa(5 x 4ms = 20 ms)
{
latb=~latb;//portb tersleniyor
i=0;//i de�i�keni s�f�rlan�yor.

}
}
}