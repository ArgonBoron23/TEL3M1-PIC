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

	goto main



backwards:

	low C.4
	
	high C.5
	

	readadc B.0, rawRead
	goto main

forwards:

	low C.5

	
	high C.4
	
	readadc B.0, rawRead
	goto main