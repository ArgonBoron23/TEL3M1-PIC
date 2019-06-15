init:
symbol leftJoyIn = B.1
symbol rightJoyIn = B.5
symbol slideIn = C.0

symbol leftJoyVal = b0
symbol rightJoyVal = b1
symbol slideVal = b2

leftJoyVal = 0 

main:
readadc leftJoyIn, leftJoyVal
debug leftJoyVal

readadc rightJoyIn, rightJoyVal
debug rightJoyVal

readadc slideIn, slideVal

rfout b.0,(leftJoyVal,rightJoyVal,slideVal,b3,b4,b5,b6,b7)

goto main
