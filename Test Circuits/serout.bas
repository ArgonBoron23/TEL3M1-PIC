symbol out = b4

main:
	out = 9
	  serout A.0,N2400_8,(out)	; transmit value to serial LCD

	debug out
goto main