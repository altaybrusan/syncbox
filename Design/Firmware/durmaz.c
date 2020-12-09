
uint8_t tmr1ms,tmr100ms,tmr1s;
uint8_t tmrLCDClear=0;
void timer100us(void){//100us lik timer
	//#############################################################
	if(tmr1ms==0){//1ms dolmuş
		tmr1ms=10;
		if(tmrSerial)tmrSerial--;
		//______________________________________________________
		if(tmr100ms==0){//100ms dolmuş
			tmr100ms=100;
			//100ms işlemleri

			if(tmrLCDClear)tmrLCDClear--;

			//////////////////////////////////////////////////
			if(tmr1s==0){//1s dolmuş
				tmr1s=10;
				//1s işlemleri



			}else{
				tmr1s--;
			}
			//////////////////////////////////////////////////


		}else{
			tmr100ms--;
		}
		//______________________________________________________
	}else{//
		tmr1ms--;
	}
	//#############################################################
}



void function(void){
	uint8_t dataCnt;
	//main loop
	while(1){

		dataCnt=HID_Read();//varsa okudum beklemedim
		if(dataCnt){//usb den data gelmiş ise
			for(cnt=0;cnt<dataCnt;cnt++)writebuf[cnt]=readbuf[cnt];//alınan veriyi aynen geri koy
			HID_Write(&writeBuf,dataCnt);//alınanı geri verdik
			//alınan datayı display edelim
			lcd_Cmd(clear);//ekran sil
			writeBuf[dataCnt]=0;//giden data durması için buffer son datası 0 yaptık    "123456"
			PC0=1;//pinc0
			uart1_write(&writeBuf);//seriporta basıldı
			PC0=0;//pinc0
			lcd_out(row,col,writebuf);//lcdye yazdık
			tmrLCDClear=10;
		}

		if(tmrLCDClear==0)lcd_Cmd(clear);//ekran sil

		if(uartReady()){//seri data gelmiş
			rxData=uartRead();//geleni aldık
			lcdWrite(row,col,rxData);//ekrana yaz

		}

		//seriport için mux kısmı
		if(tmrSerial==0){//seriport değiş
			tmrSerial=2;//2ms kurduk
			ADScnt++;

		}


	}
}
