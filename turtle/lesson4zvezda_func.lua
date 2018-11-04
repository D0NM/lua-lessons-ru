require "turtle"
show()
pnsz(3)

function zvezda ( rebro )
	for i = 1, 5 do
		move(rebro)
		turn(144)
	end
end

for i = 1, 121 do
	zvezda ( 100 )
	turn(15)
	move (i)
end
save( " zvezda ")
wait()