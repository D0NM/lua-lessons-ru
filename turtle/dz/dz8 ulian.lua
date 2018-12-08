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
	turn(-180)
	jump(x)
end
size(700,700)
function zvezda(x, y)
	for i = 1, 5 do
		kmove(x)
		turn(144)
	end
end
for i =1, 360 do
	zvezda(200)
end
wait(100)