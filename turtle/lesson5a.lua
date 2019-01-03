require "turtle"

function kvad(x)
	for i = 1, 4 do
		move(x)
		turn(90)
	end
end

function punkt(n)
	for i = 1, n do
		pncl( ranc() )
		jump(5)
		move(5)
	end
end

show()
--1
trtl() --2
trtl() --3
trtl()
trtl()
trtl()
trtl()
trtl() --8
pick()
pnsz(3)
for i = 1, 8 do
	pick( i )
	pncl( ranc() )
	posn(-200, i * 40 - 200)
end
--pick()
for i = 1, 4 do
	pick( i, i + 4 )
	punkt(40)	
end
--kvad(30)

--kvad(40)
wait()