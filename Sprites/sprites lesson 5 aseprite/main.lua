-- Библиотека 'peachy' by Josh Perry
-- (парсинг и анимация из редактора спрайтов aseprite)
-- УРОК 5
local peachy = require("peachy")
function love.load()
	spriteSheetDude = love.graphics.newImage("res/spr/dude.png")
	man = peachy.new("res/spr/dude.json", spriteSheetDude, "stand")
	x = 150
	man:onLoop (function()
				x = x + 1
			end)
end
function love.draw()
	man:draw( x, 50, 0, 2, 2)
end
function love.update(dt)
	man:update(dt)
end
function love.keypressed(key)
	if key == "space" then
		man:setTag("run")
	end
	if key == "1" then
		man:togglePlay ()
	end
end
