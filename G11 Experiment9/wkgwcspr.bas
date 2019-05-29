;B.0, B.1, B.2 are three lights
;B.4 and B.6 are contestant inputs
;B.5 and B.7 are contestant lights
;C.7 is host button and C.6 is host endgame button

init:
	symbol pinnum = b0
	let pinnum = 0
	symbol waiter = b1
	symbol pinnum2 = b6
	let pinnum2 = 0
	symbol pinnum3 = b7
	let pinnum3 = 0
	
startgameshow:	
	button C.7,1,200,255,b2,1,startgameshow
	Goto forth

endgamshow:
	button C.6,1,200,255,b2,1,endgameshow

	Goto forth
	
Contestant1:
	button b.4,1,200,255,b2,1
	toggle pinnum2
	play.sound
	
Contestant2:
	button b.7,1,200,255,b2,1
	toggle pinnum3
	play.sound
	
forth:
	toggle pinnum
	pause waiter
	toggle pinnum
	inc pinnum
	if pinnum = 3 then back
	button C.7,1,200,255,b2,1,startgameshow
	button C.6,1,200,255,b2,1,endgameshow
	goto forth
	
back:
	toggle pinnum
	pause waiter
	toggle pinnum
	dec pinnum
	if pinnum = 0 then forth
	button C.7,1,200,255,b2,1,startgameshow
	button C.6,1,200,255,b2,1,endgameshow
	goto back

