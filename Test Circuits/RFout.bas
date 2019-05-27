init:b7 = 50

main:	
	bintoascii b7, b8, b9, b10
	high b.1			; switch radio module on (TXEN)
	rfout b.0,("item=",b8, b9,b10)	; send data (TX)
	low b.1				; switch radio module off (TXEN)
	pause 2000			; wait 2 seconds
	goto main			; loop forever

    