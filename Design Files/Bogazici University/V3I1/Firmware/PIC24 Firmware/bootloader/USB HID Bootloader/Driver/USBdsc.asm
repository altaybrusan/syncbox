
_USB_Init_Desc:

	MOV	#lo_addr(_configDescriptor1), W0
	MOV	W0, _USB_config_dsc_ptr
	MOV	#lo_addr(_strd1), W0
	MOV	W0, _USB_string_dsc_ptr
	MOV	#lo_addr(_strd2), W0
	MOV	W0, _USB_string_dsc_ptr+2
	MOV	#lo_addr(_strd3), W0
	MOV	W0, _USB_string_dsc_ptr+4
L_end_USB_Init_Desc:
	RETURN
; end of _USB_Init_Desc
