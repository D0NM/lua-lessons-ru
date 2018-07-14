-- Библиотека анимации anim8 by kikito
-- УРОК 4

local anim8 = require 'anim8.anim8'
local image, g32, animation
local x, y = 100, 100
local flashScreen = false
local ugol = 0

function triggerFlashScreen()
	flashScreen = not flashScreen
end

function stoppppAniiiiim(anim, n)
	--if n > 5 then
		anim:pause()
		--flashScreen = not flashScreen
	--end
end

function krest(x, y)
	love.graphics.setColor(255,0,0)
	love.graphics.line(x - 10,y, x + 10, y) 
	love.graphics.line(x,y - 10, x, y + 10) 
end

function love.load()
	image = love.graphics.newImage("res/1945.png")
	g65 = anim8.newGrid(65, 65, image:getWidth(), image:getHeight(), 267,399, 1)
	g32 = anim8.newGrid(32, 32, image:getWidth(), image:getHeight(), 3,3, 1)
	SAMOLET_5 = anim8.newAnimation(g32("1-8", 2), 0.1 )
	animation = anim8.newAnimation(g65("1-3", 1), 0.2 )
	animation2 = anim8.newAnimation(g32("8-1", 3, "1-8", 3), 0.1, 'pauseAtEnd')
	animation3 = anim8.newAnimation(g32("1-8", 1), 0.2 )
	animation2:gotoFrame(3)
	animation3:gotoFrame(6)
	--animation3:pauseAtEnd()
end

function love.draw()
	if flashScreen then
		love.graphics.clear(55,0,0)
	else
		love.graphics.clear(0,0,0)
	end
	krest(x, y)
	love.graphics.setColor(255,255,255)
	animation:draw(image, x, y, ugol, 1, 1, 32, 32)
	animation2:draw(image, 32, 100, 0, 2, 2)
	animation3:draw(image, 64, 200, 0, 4, 4)
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		if ugol < math.pi / 2 then
			ugol = ugol + 10 * dt
		elseif ugol > math.pi / 2 then
			ugol = ugol - 10 * dt
		end
		x = x + 100 * dt
	end
	if love.keyboard.isDown("left") then
		if ugol > -math.pi / 2 then
			ugol = ugol - 10 * dt
		end
		x = x - 100 * dt
	end	
	
	if love.keyboard.isDown("up") then
		if ugol < 0 then
			ugol = ugol + 10 * dt
		end
		if ugol > 0 then
			ugol = ugol - 10 * dt
		end
		y = y - 100 * dt
	end
	if love.keyboard.isDown("down") then
		if ugol > math.pi then
			ugol = ugol - 10 * dt
		end
		if ugol < math.pi then
			ugol = ugol + 10 * dt
		end
		y = y + 100 * dt
	end		
	
	animation:update(dt)
	animation2:update(dt)
	animation3:update(dt)
end
