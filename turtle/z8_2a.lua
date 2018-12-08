require"turtle"

function zig(x)
	move(x)
	turn(-170)
	move(x)
	turn(170)
end

for i = 10, 50 do
	zig(i)
end
wait()