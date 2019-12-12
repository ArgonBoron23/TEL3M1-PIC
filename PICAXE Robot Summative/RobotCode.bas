init: ;Declares all I/O and memory slots as named variables
;drive motors
symbol rightfor = C.1
symbol leftfor = A.3
symbol rightrev = C.0
symbol leftrev = A.2

;bumper buttons
symbol leftbump = B.0
symbol rightbump = C.6

;misc outputs
symbol speaker = B.5
symbol stopled = A.1

;bumper memory slots
symbol leftbumpvar = b0
symbol rightbumpvar = b1

;timing variable constants
symbol turntime = 1600
symbol backouttime = 1500
symbol stoptime = 500

;inputs from the remote
symbol leftJoyVal = b6
symbol rightJoyVal = b7
symbol slideVal = b8

goto automain


refresh: ;pulls all motors low and turns the red LED off
low stopled
low leftfor
low rightfor
low leftrev 
low rightrev
return


fullstop:  ;stops the motors and turns the red LED on
low leftfor
low rightfor
low leftrev 
low rightrev
high stopled
tune speaker, 6,($40,$42,$40,$28, $28) ;plays a tune
return


cwturn: ;clockwise turn procedure
high leftfor
high rightrev
return


ccwturn: ;clockwise turn procedure
high rightfor
high leftrev
return


backout: ;reverses both motors
high rightrev
high leftrev
return


automain: ;main method for autonomous
high leftfor
high rightfor

button leftbump,1,200,255,leftbumpvar,1,autoleftbumped
button rightbump,1,200,255,rightbumpvar,1,autorightbumped

goto automain


autoleftbumped: ;if the left bumper is pressed
gosub fullstop
pause stoptime
gosub refresh

gosub backout
pause backouttime
gosub refresh

gosub cwturn
pause turntime
gosub refresh

goto automain


autorightbumped: ;if the right bumper is pressed
gosub fullstop
pause stoptime
gosub refresh

gosub backout
pause backouttime
gosub refresh

gosub ccwturn
pause turntime
gosub refresh

goto automain