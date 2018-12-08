require"turtle"

function zigmove(z)
	if z < 10 then
		move(z)
		return
	end
	zigmove(z / 3)
	turn(90)
	zigmove(z / 6)
	turn(-90)
	zigmove(z / 3)
	turn(-90)
	zigmove(z / 6)
	turn(90)
	zigmove(z / 3)
end

function treug(x)
	zigmove(x)
	turn(-120)
	zigmove(x)
	turn(-120)
	zigmove(x)
	turn(-120)
end

treug(200)

wait()