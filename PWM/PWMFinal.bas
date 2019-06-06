init: 
	symbol rawRead = b1
	symbol NeedForSpeed = b2
	NeedForSpeed = 0
	rawRead = 118
	
main:

	readadc B.0, rawRead
	debug rawRead
	if rawRead < 100  then backwards
	low C.5
	if rawRead > 150 then forwards
	low C.4
	HPWM 0, 0, %1111, 333,  0
	goto main

backwards:

	low C.4
	NeedForSpeed = 255 - rawRead
		debug NeedForSpeed
	
	HPWM pwmdiv16, 0, 0, %0010, 66,  0
	
	HPWM pwmdiv16, 0, 0, %0001, 66, NeedForSpeed
	readadc B.0, rawRead
	goto main

forwards:

	low C.5
	NeedForSpeed = rawRead
		debug NeedForSpeed
	
	HPWM pwmdiv16, 0, 0, %0001, 66,  0
	
	HPWM pwmdiv16, 0, 0, %0010, 66, NeedForSpeed
	
	readadc B.0, rawRead
	goto main