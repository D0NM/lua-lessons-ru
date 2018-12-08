require"turtle"
for i = 1, 2500 do
	move(5)
	local x,y = posn()
	if x > 250 then
		trtl(1).angle = 180
--		posn(0,0)
	end
	wait(0.01)
end
wait()