require "turtle"

function kvad(x)
	for i = 1, 4 do
		move(x)
		turn(90)
	end
end

function punkt(n)
	for i = 1, n do
		jump(5)
		move(5)
	end
end

show()
--1
posn(100, 100)
turn(180)
move(100)

trtl() --2
--rant()
pncl( colr(255,0,0) )
turn(-90)
move(100)

trtl() --3
pncl( colr(0,255,0) )
move(100)

rant()
rant()
rant()
rant()
rant()

pick()
posn(0, 0)
kvad(30)
punkt(15)
kvad(40)
wait()