require "turtle"
-- Выводим текст при клике мыши
while true do
	if clck("ld") then
		print("ЛЕВАЯ")
	elseif clck("rd") then
		print("ПРАВАЯ")
	elseif clck("ru") then
		print("ПРАВАЯ отпущена")
	elseif clck("l2") then -- L2
		print("ЛЕВАЯ 2 РАЗА")
	end	
	wait(0.1)
end
--wait()