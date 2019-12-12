main:	

readtemp C.1, b7		; read temperature into variable b7
bintoascii b7,b8,b9,b10		; separate into 3 ASCII characters
high B.1			; switch radio module on (TXEN)
rfout B.0,(?Temp=?,b8,b9,b10)	; send data (TX)
low B.1				; switch radio module off (TXEN)
pause 2000			; wait 2 seconds
goto main			; loop forever