require"turtle"
size(700,700)
hide()

function branch(x)
	if x < 1 then
		return
	end
	pnsz(x)
	move( x * 10 )
	
	local u1 = math.random(30, 60)
	turn(-u1)
	branch(x - 1)
	turn(u1)
	
	local u1 = math.random(30, 60)
	turn(u1)
	branch(x - 1)
	turn(-u1)
	
	jump( -x * 10)
end

turn(-90)
jump(-100)

for i = 1, 40 do
	--posn(math.random(-600, 600), math.random(-700, 400))
	rant()
end
pick()
	branch(5+ rand(3))
	
wait()