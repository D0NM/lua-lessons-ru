require "turtle"
pnsz (3)
pncl( colr( 255, 0, 0) )
turn (-90)
-- КРЕСТ
for drop = 1, 4 do
	move (50)
	turn (-90)
	move (5)
	back (5)
	turn (180)
	move (5)
	back (5)
	turn (-90)
	back (50)
	turn (90)
end
wait ()