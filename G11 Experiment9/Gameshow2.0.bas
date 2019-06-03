;B.0, B.1, B.2 are three lights
;B.4 and B.6 are contestant inputs
;B.5 and B.7 are contestant lights
;C.7 is host button and C.6 is host endgame button
;9-13 are count lights

init:
	symbol pinnum = b0
	let pinnum = 0
	
	symbol waiter = b1
	waiter = 1000
	
	symbol countlight = b11
	countlight = 9
	
	symbol countlight100 = b12
	countlight100 = 0
	
		
	goto startgameshow
	
revert:
	low B.5
	low B.7
	countlight = 9
	low 9
	low 10
	low 11
	low 12
	low 13
	goto main

startgameshow:	
	button C.7,1,200,255,b8,1,forth
	goto startgameshow

endgameshow:
	tune C.0, 4,($25,$29,$00,$05,$42,$44,$45,$42,$00,$2A,$02,$29,$00,$27,$04,$C5,$25,$29,$00,$05,$42,$44,$45,$42,$C0,$42,$05,$00,$05,$44,$45,$07,$C5)
	goto init

main:
	button B.4,1,200,255,b4,1, Contestant1
	button B.6,1,200,255,b7,1, Contestant2
	button C.6,1,200,255,b7,1, endgameshow
	goto main

Contestant1:
	high b.5
	tune C.0, 2,($10,$12,$14,$16)
	goto answerquestion
	
Contestant2:
	high b.7
	tune C.0, 2,($24,$26,$28,$30)
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
	button C.6,1,200,255,b7,1, endgameshow
	pause 100
	high countlight
	inc countlight100

	if countlight > 13 then fail
	if countlight100 > 100 then increment
	
	goto answerquestion
	
increment:
	inc countlight
	countlight100 = 0
	goto answerquestion
	

fail:
	tune C.0, 4,($40,$42,$40,$28)
	goto revert
