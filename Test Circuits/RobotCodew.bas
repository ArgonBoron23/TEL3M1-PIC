;---Outputs---
;A.2 right forwards
;C.0 left forwards

;A.3 right backwards
;C.1 left backwards

;B.5 speaker
;A.1 red LED


;---Button Inputs--- 
;C.6 right bumper
;B.0 left bumper


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

;timing variables
symbol turntime = 3000
symbol backouttime = 4000
symbol stoptime = 500

goto automain


refresh:
low stopled
low leftfor
low rightfor
low leftrev 
low rightrev
return


fullstop:
low leftfor
low rightfor
low leftrev 
low rightrev
high stopled
return


cwturn: ;clockwise turn procedure
high leftfor
high rightrev
return


ccwturn: ;clockwise turn procedure
high rightfor
high leftrev
return


backout: 
high rightrev
high leftrev
return


automain:
high leftfor
high rightfor

button leftbump,1,200,255,leftbumpvar,1,autoleftbumped
button rightbump,1,200,255,rightbumpvar,1,autorightbumped

goto automain


autoleftbumped:
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


autorightbumped:
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




