init:
	symbol pinnum = b0
	let pinnum = 0
	symbol waiter = b1
	
	
slower:	
	let waiter = 150
	goto forth

faster:
	let waiter = 25
	goto forth
	
	
	
forth:
	toggle pinnum
	pause waiter
	toggle pinnum
	inc pinnum
	if pinnum = 7 then back
	button C.7,1,200,100,b2,1,slower
	button C.6,1,200,100,b2,1,faster
	goto forth
	
back:
	toggle pinnum
	pause waiter
	toggle pinnum
	dec pinnum
	if pinnum = 0 then forth
	button C.7,1,200,100,b2,1,slower
	button C.6,1,200,100,b2,1,faster
	goto back


	
