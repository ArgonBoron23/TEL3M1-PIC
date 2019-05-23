init:	b2 = 0

myloop:	
	button C.0,1,200,100,b2,1,main	; jump to cont when C.0 = 1				; output off
	pause 10				; loop delay time
	goto myloop:;

main:
    toggle B.0
    pause 50
    toggle B.1
    pause 50 
    toggle B.2
    pause 50
    toggle B.3
    pause 50
    toggle B.4
    pause 50
    toggle B.5
    pause 50
    toggle B.6
    pause 50
    toggle B.7
    pause 500
    goto main
    

    