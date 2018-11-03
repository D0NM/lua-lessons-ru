require "turtle"
show() -- Показать черепашку
size(900,900) -- Увеличили поле

function РисуйКвадрат()
  for i = 1,4 do
    move(100)
    turn(90)
  end
end

for i=1, 4 do
  move(200)
  turn(90)
  for m = 1,4 do
    turn(90)
    РисуйКвадрат()
  end
end
wait()