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
	if x > 250 or x < -250 
		or y > 250 or y < -250
	then
		rant(1)
		posn(0, 0)
	end
--	wait(0.01)
end
wait()