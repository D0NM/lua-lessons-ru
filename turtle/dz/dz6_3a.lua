require "turtle"
local голубой = colr (0,191,255)
local черный = colr (0,0,0)
local желтый = colr (255,255,0)
pncl(желтый)
fill(черный)
for i= 0, 100 do -- Звёзды
	pixl (rand (300),rand (300))
	pixl (rand (-300),rand (300))
	pixl (rand (300),rand (-300))
	pixl (rand (-300),rand (-300))
end
oval(0, 0, 180, 160, голубой, start, finish)
wait()