init: 
	symbol rawRead = b1
	symbol pwmSpeed = b2
	
main:
	readadc10 B.0, rawRead
	
	rawRead = rawRead - 127
	
	if rawRead < 0 then backwards
	if rawRead >= 0 then forwards

backwards:

	pwmSpeed = -8 * rawRead 
	HPWM 0, 0, %1100, 333,  pwmSpeed
	goto main

forwards:
	pwmSpeed = rawRead * 8 
	HPWM 0, 0, %0011, 333,  pwmSpeed
	goto main