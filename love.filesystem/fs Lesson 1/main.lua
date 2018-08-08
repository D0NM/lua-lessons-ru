-- файловая система в Love2D
-- УРОК 1  пишем в файл, читаем из файла, как хранить данные на диске
r = {}
function love.load()
	if arg[#arg] == "-debug" then require("mobdebug").start() end 
end

function addRect(x, y, w, h)
	r[#r + 1] = {x, y, w, h}
	print("added", x, y, w, h)
end
function drawRects()
	local p
	for i = 1, #r do
		p = r[i]
		love.graphics.rectangle("line", p[1], p[2], p[3], p[4] )
	end
end
function saveRects()
	local t = "r = {"
	for i = 1, #r do
		p = r[i]
		t = t .. "{" .. p[1] .. "," .. p[2] .. "," .. p[3] .. "," .. p[4] .. "}," 
	end
	t = t .. "}"
	local success = love.filesystem.write("rects.txt", t, #t )
end
function clearRects()
	r = {}
end
function loadRects()
	--local contents, size = love.filesystem.read( "rects.txt" )
	local chunk = love.filesystem.load ("rects.txt" )
	--print(contents, size, #contents)
	chunk()
end
function love.draw()
	drawRects()
end
function love.update(dt)
end
function love.keypressed(key)
	if key == "s" then
		saveRects()
	end
	if key == "c" then
		clearRects()
	end 
	if key == "l" then
		loadRects()
	end 
	if key == "escape" then
		love.event.quit()
	end 
end

local px, py
function love.mousepressed( x, y, button, isTouch )
	--	print("love.mousepressed", x, y, button, isTouch)
	px, py = x, y
end
function love.mousereleased( x, y, button, isTouch )
	--	print(" love.mousereleased", x, y, button, isTouch)
	addRect(px, py, x - px, y - py)
end
