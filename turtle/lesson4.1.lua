require "turtle"

local красный = colr(255, 0, 0)
pncl(красный)
load("pic1.png", -200, -200)
for i = 0, 225, 1 do
	pncl( ranc() )
	line(0,0, rand(450) - 450/2, rand(-100))
--	rect( 0, -100, 100, 50 )
--	fill( ranc(), 50, -80 )
--	rect( 0, 0, 100, 50, 25 )
--	font(13)
--	text("ПРИВЕТ!", rand(360), rand(450) - 450/2, rand(100))
--	crcl(0, 0, i, ranc(), 0, rand(360) )
--	oval(0, 0, i * 3, i * 2, ranc() )
	
	wait(0.1)
end


--save("pic_out")
wait()