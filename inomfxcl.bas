init: 
	symbol rawRead = b1

	rawRead = 118
	
main:
	
	readadc B.0, rawRead
	debug rawRead
	if rawRead < 25  then backwards
	low C.5
	HPWM 0, 0, %1111, 333,  0
	if rawRead > 220 then forwards
	low C.4
	goto main

backwards:

	low C.4
	HPWM 0, 0, %1111, 333,  50
	readadc B.0, rawRead
	goto main

forwards:

	low C.5
	HPWM 0, 0, %1111, 333,  0
	high C.4
	
	readadc B.0, rawRead
	goto main
