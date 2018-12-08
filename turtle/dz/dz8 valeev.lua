require"turtle"
function kmove(x)
	turn(-90)
	move(5)
	turn(90)
	move(x)
	turn(90)
	move(5)
	turn(90)
	move(x)
	jump(-x)
	turn(180)
end
for i = 1, 5 do
	kmove(200)
	turn(144)
end
wait()