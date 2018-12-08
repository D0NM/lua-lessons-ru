

require "turtle"
function kmove (длина)
	for i = 1, 6 do
		turn (144)
		move (длина) 
		turn (-90) 
		move (5) 
		turn (-90) 
		move (длина) 
		turn (-90) 
		move (5) 
		turn (-90) 
		jump (100)
	end
end
kmove (100)
wait()
