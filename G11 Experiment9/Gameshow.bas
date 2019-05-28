;B.0, B.1, B.2 are three lights
;B.4 and B.6 are contestant inputs
;B.5 and B.7 are contestant lights
;C.7 is host button and C.6 is host endgame button

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
	if pinnum = 3 then back
	button C.7,1,200,255,b2,1,slower
	button C.6,1,200,255,b2,1,faster
	goto forth
	
back:
	toggle pinnum
	pause waiter
	toggle pinnum
	dec pinnum
	if pinnum = 0 then forth
	button C.7,1,200,255,b2,1,slower
	button C.6,1,200,255,b2,1,faster
	goto back


	
