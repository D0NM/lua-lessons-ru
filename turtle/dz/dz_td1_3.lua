-- звезда
require "turtle"
zero (130, 200)

function kmove (x)
  
  turn (-90)
  move (7)
  turn (90)
  move (x)
  turn (90)
  move (7)
  turn (90)
  move (x) 
  move (-x)
  turn (180)
  
  end
for i = 1, 5 do
  kmove (210)
  turn (144)
end
wait()