require"turtle"
pnsz(2)
function zig(x)
	move(x)
	turn(-170)
	move(x)
	turn(170)
end

zig(100)
zig(100)
zig(100)
wait()