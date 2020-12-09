
_USB_Init_Desc:

;USBdsc.c,161 :: 		void USB_Init_Desc(){
;USBdsc.c,162 :: 		USB_config_dsc_ptr[0] = &configDescriptor1;
	MOV	#lo_addr(_configDescriptor1), W0
	MOV	W0, _USB_config_dsc_ptr
;USBdsc.c,163 :: 		USB_string_dsc_ptr[0] = (const char*)&strd1;
	MOV	#lo_addr(_strd1), W0
	MOV	W0, _USB_string_dsc_ptr
;USBdsc.c,164 :: 		USB_string_dsc_ptr[1] = (const char*)&strd2;
	MOV	#lo_addr(_strd2), W0
	MOV	W0, _USB_string_dsc_ptr+2
;USBdsc.c,165 :: 		USB_string_dsc_ptr[2] = (const char*)&strd3;
	MOV	#lo_addr(_strd3), W0
	MOV	W0, _USB_string_dsc_ptr+4
;USBdsc.c,166 :: 		}
L_end_USB_Init_Desc:
	RETURN
; end of _USB_Init_Desc
