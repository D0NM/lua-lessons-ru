require"turtle"
shag = 5
rant(1)
for i = 1, 2500 do
	move(shag)
	local x,y = posn()
	if x > 250 then
		trtl(1).angle = 180
	end
	if x < -250 then
		trtl(1).angle = 0
	end
	if y > 250 then
		trtl(1).angle = 270
	end
	if y < -250 then
		trtl(1).angle = 90
	end
	turn(1)
	wait(0.01)
end
wait()