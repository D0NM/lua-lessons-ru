require "turtle"
size (600,300)
posn (-300,150)
for i=1,10 do
	turn (45)
	turn (rand (-90))
	move (50)
	local ug=trtl(1).angle
	turn (-ug)
	turn (-90)
	move (100)
	turn (130)
	move (30)
	turn (140)
	move (45)
	turn (140)
	move (30)
	turn (130)
	move (100)
	turn (-90)
end
wait ()