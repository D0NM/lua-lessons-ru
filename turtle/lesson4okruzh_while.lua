require "turtle"
show()
pnsz(3)

local s = 1
while s <= 360  do
	move(1)
	turn(1)
	print( s )
	s = s + 1
end

wait()