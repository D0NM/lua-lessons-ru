require "turtle"
function kmove(x, y)
	move(x)
	turn(90)
	move(y)
	turn(90)
	move(x)
	turn(90)
	move(y)
	
	turn(90)
	move(x)
end
for i = 1, 5 do
	kmove(75, 5)
	turn(144)
end

wait()