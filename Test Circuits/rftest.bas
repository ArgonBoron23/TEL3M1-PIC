init:
	b7 =50


main:	

	bintoascii b7,b8,b9,b10		; separate into 3 ASCII characters
	high b.1			; switch radio module on (TXEN)
	rfout b.0,(b8,b9,b10,b11,b12,b13,b14,b15)
	low b.1				; switch radio module off (TXEN)
	pause 2000			; wait 2 seconds
	goto main			; loop forever