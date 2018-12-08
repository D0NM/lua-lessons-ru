require"turtle"
function kmove(x)
	turn(-90)
	move(5) -- узкая сторона 5 шагов
	turn(90)
	move(x)
	turn(90)
	move(5) -- узкая сторона 5 шагов
	turn(90)
	move(x)
	jump(-x) -- прыгнем в начало
	turn(180) -- повернемся, как было
end
for i = 1, 5 do --пятиконечная звезда
	kmove(200)
	turn(144)
end
wait()