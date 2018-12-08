require"turtle"
shag = 5
for i = 1, 2500 do
	move(shag)

	if rand(10) < 5 then
		turn(15)
	else
		turn(-15)
	end

	local x,y = posn()
	if x > 250 then
		posn(-250, y)
	end
	if x < -250 then
		posn(250, y)
	end
	if y > 250 then
		posn(x, -250)
	end
	if y < -250 then
		posn(x, 250)
	end

	wait(0.01)
end
wait()