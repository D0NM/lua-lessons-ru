require"turtle"
--zero(0,0) -- начало координат левый верхний угол
rant(1)
trtl(1).angle = 45
function p()
	print("Х,У", posn())
	print("угол", trtl(1).angle)
end

for i = 1, 4 do
	p()
	move(100)
	turn(90)
end
wait()
