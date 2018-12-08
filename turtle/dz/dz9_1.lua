require "turtle"
size (1100,500)
zero (0,250)

function El ()
	trtl (1).angle = -90
	pnsz(5)
	pncl(colr(150,75,0))
	move (70)
	pncl(colr( 0,225,0))
	turn (-150)
	move (50)
	turn (-120)
	move (50)
	turn (-120)
	move (50)
	turn (-150)
	jump (70)
	turn (-90)
end
function Z ()
	pnsz(5)
	pncl(colr(0,0,0))
end

-- 1
jump (55)
El ()
-- 2
Z ()
turn (-45)
move (75)
El ()
-- 3
Z ()
turn (-15)
move (60)
El ()
-- 4
Z ()
turn (60)
move (100)
El ()
-- 5
Z ()
turn (0)
move (150)
El ()
-- 6
Z ()
turn (-45)
move (60)
El ()
-- 7
Z ()
turn (60)
move (80)
El ()
-- 8
Z ()
turn (0)
move (100)
El ()
-- 9
Z ()
turn (15)
move (50)
El ()
-- 10
Z ()
turn (-15)
move (100)
El ()
-- 11
Z ()
turn (-25)
move (60)
El ()
-- 12
Z ()
turn (-35)
move (70)
El ()
-- 13
Z ()
turn (50)
move (100)
El ()
-- 14
Z ()
turn (-20)
move (55)
El ()
-- 15
Z ()
turn (0)
move (100)
El ()

wait()
