require "turtle"
local количество = 7	-- сколько всего деревьев рисовать
local высота = 110		-- высота ствола
local высота2 = 30		-- высота ребра квадрата для листвы
local промежуток = 50   -- между стволами деревьев
size(количество * промежуток +100, (высота + высота2 + высота2) )
zero(30, (высота + высота2 + высота2))
show()
pnsz(3)
for i = 1, количество do
-- начало дерева
	turn(-90)
	pncl( colr( 255, 0, 0) )
	move(высота)
	pncl( colr( 0, 255, 0) )
	turn(-45)
	move(высота2)
	turn(90)
	move(высота2)
	turn(90)
	move(высота2)
	turn(90)
	move(высота2)
	turn(-45)
	jump(высота)
	turn(-90)
	jump(промежуток)
-- конец дерева
end
back( (количество + 1) * промежуток)
wait()