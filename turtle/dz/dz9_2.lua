require "turtle" 
show () 
posn (-180, 0) 
for i = 1, 8 do 
	trtl(1).angle = 270 
	move (55) 
	turn (-140) 
	move (35) 
	trtl(1).angle = 0
	move (45) 
	turn (-130) 
	move (35) 
	trtl(1).angle = 90
	jump (55) 
	trtl(1).angle = 0
	rand (10) 
	if rand(20)>5 then 
		turn (7) 
	else 
		turn (-7)
	end
	move (50) 
end
wait () 