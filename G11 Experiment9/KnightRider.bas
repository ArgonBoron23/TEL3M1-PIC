init:
	symbol pinnum = b0
	let pinnum = 0

forth:
	toggle pinnum
	pause 50
	toggle pinnum
	inc pinnum
	if pinnum = 7 then back
	goto forth
	
back:
	toggle pinnum
	pause 50
	toggle pinnum
	dec pinnum
	if pinnum = 0 then forth
	goto back
	
	
