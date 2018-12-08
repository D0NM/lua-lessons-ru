require "turtle"
trtl() -- поставим на поле вторую черепаху
pncl( colr(255,0,0) ) -- покрасим её в красный
pnsz(2) -- толщина её пера 2
for i = 1, 10000 do
	pick(2) -- выберем 2ю черепаху
	move(1) -- она рисует пунктир
	jump(3) 
	pick(1) -- выберем 1ю черепаху
	move(2) -- она просто идет вперед

	k = char()
	if k == 314 then -- <--
		turn(-5)
	elseif k == 316 then -- >
		turn(5)
	elseif k == 32 then
		local x, y = posn()
		pick(2)
		posn(x, y)
		trtl(2).angle = trtl(1).angle
	elseif k then
		print( k )
	end
	wait(0.1)  
end

wait()