init: 
	symbol rawRead = b1
	symbol NeedForSpeed = b2
	NeedForSpeed = 0
	rawRead = 118
	
main:

	readadc B.0, rawRead
	debug rawRead
	if rawRead < 25  then backwards
	low C.5
	if rawRead > 220 then forwards
	low C.4
	HPWM 0, 0, %1111, 333,  0
	goto main

backwards:

	low C.4
	NeedForSpeed = 255 - rawRead * 8
		debug NeedForSpeed
	
	HPWM 0, 0, %0010, 488,  0
	
	HPWM 0, 0, %0001, 488,  1023
	readadc B.0, rawRead
	goto main

forwards:

	low C.5
	NeedForSpeed = rawRead * 8
		debug NeedForSpeed
	
	HPWM 0, 0, %0001, 488,  0
	
	HPWM 0, 0, %0010, 488,  1023
	
	readadc B.0, rawRead
	goto main