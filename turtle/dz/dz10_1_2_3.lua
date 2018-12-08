require "turtle"
size (500,250);turn(-90);jump(-120) --Черепаху вниз поля
function vetka (dlin)
	if dlin < 3 then 
		return
	end
	if dlin < 10 then -- Если длина < 10 
		pncl(colr(0,225,0)) -- Зеленые листочки
	elseif dlin < 70 then -- Если длина < 70 
		pncl(colr(220,110,0)) -- Светло коричневый
	else
		pncl(colr(160,80,0))
	end 
	pnsz ( dlin / 15 ) -- ТОЛЩИНА. Разделим длину на 15
	
	move (dlin) -- рисуем ствол
	
	local ugol = 10 + rand(50) -- случайный угол от 10 до 50
	turn (ugol) -- поворот направо
	vetka(dlin * 0.6) -- правая ветвь
	turn (-ugol) -- повернем назад, как было

	ugol = 10 + rand(50) -- случайный угол от 10 до 50
	turn (-ugol) -- налево повернем
	vetka(dlin * 0.6)
	turn (ugol) -- повернемся назад, как было

	ugol = (rand(30)-15) -- случайный угол от -15 до 15
	turn (ugol) -- поворот для третьей ветки
	vetka(dlin * 0.6) -- третья ветка
	turn (-ugol) -- повернем назад, как было

	jump(-dlin) -- прыгнем назад, к корню
end
vetka(100)
wait()
