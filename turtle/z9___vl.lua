require"turtle"
zero(0,0) -- начало координат левый верхний угол
turn(55)
for i = 1, 10000 do
	move(5)
	if rand(6) < 3 then
		turn(3)
	else
		turn(-3)
	end
	local x, y = posn()	
	print(x, y)
	if x > 450 then
		posn( 0, y )
	end
	if x < 0 then
		posn( 450, y )
	end
	if y > 450 then
		posn( x, 0 )
	end
	if y < 0 then
		posn( x, 450 )
	end
	wait(0.01)
end
wait()
