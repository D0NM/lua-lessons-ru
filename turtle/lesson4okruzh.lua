require "turtle"
show()
pnsz(3)

for i = 1, 360 do
	move(1)
	turn(1)
end
for i = 1, 360 do
	move(1)
	turn(-1)
end

wait()