;B.0, B.1, B.2 are three lights
;B.4 and B.6 are contestant inputs
;B.5 and B.7 are contestant lights
;C.7 is host button and C.6 is host endgame button

init:
	symbol pinnum = b0
	let pinnum = 0
	symbol waiter = b1
	waiter = 1000
	goto startgameshow
	
revert:
	low B.5
	low B.7
	goto main

startgameshow:	
	button C.7,1,200,255,b8,1,forth
	goto startgameshow

endgameshow:
	button C.6,1,200,255,b9,1,endgameshow
	goto forth

main:
	button B.4,1,200,255,b4,1, Contestant1
	button B.6,1,200,255,b7,1, Contestant2
	goto main

Contestant1:
	high b.5
	goto answerquestion
	
Contestant2:
	high b.7
	goto answerquestion
	
forth:
	toggle pinnum
	pause waiter
	toggle pinnum
	inc pinnum
	if pinnum = 2 then back
	goto forth
	
back:
	toggle pinnum
	pause waiter
	toggle pinnum
	if pinnum = 0 then main
	dec pinnum
	goto back
	
answerquestion: 
	button C.7,1,200,255,b9,1, revert
	goto answerquestion