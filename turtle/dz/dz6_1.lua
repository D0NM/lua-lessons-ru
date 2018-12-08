require "turtle"
pnsz(3) -- толщина 3
-- Забор
for i = 1, 5 do -- 5 раз повторяем
	turn (-90)
	move (70)
	turn (90)
	move (10)
	turn (90)
	move (70)
	turn (90)
	move (10)
	turn (-180)
	jump (20)
end
-- Трава
pncl( colr( 0, 255, 0) ) -- Зелёный цвет
zero(140, 230) -- сместим начало координат
for i = 1, 3 do  -- три раза повторяем
	turn (-60)
	move (20)
	back (20)
	turn (-30)
	move (20)
	back (20)
	turn (-30)
	move (20)
	back (20)
	turn (-240)
	jump (30)
end
zero(30, 227)
move(100)
wait()