require "turtle"
-- Покажи координаты курсора
-- там, где было нажатие клавиш мыши
local x, y
while true do
	x, y = clck("ld")
	if x then
		print("ЛЕВАЯ", x, y)
	end
	x, y = clck("rd")
	if x then
		print("ПРАВАЯ", x, y)
	end
	x, y = clck("l2") -- Left Double Click
	if x then
		print("ЛЕВАЯ 2х", x, y)
	end
	wait(0.1)
end
wait()