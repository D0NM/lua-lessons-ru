-- Камера Gamera

function love.load()
	camera = require "lib.gamera" -- загрузим библиотеку Gamera
	cam = camera.new(0,0,1000,1000) -- создадим камеру (и сразу укажем размер большой картинки)
	cam:setWorld(0,0,2000,2000)	-- в любой момент меняем размеры нашей огромной картинки
	cam:setWindow(0,0, 640,480) -- задаем размер окошка через которое будем смотреть на нашу картинку

	x, y = 0, 0
	scale = 1
	newAngle = 0
end

function love.draw()
	cam:draw(function(l,t,w,h)
		-- тут рисуем то, что покажет камера
			love.graphics.setColor(255,156,256)
			love.graphics.print("l,t,w,h:"..l..","..t..","..w..","..h, 200,170)
			love.graphics.circle("fill",x,y,32)
			love.graphics.setColor(0,156,256)
			love.graphics.rectangle("line", 10,10, 120, 20)
			love.graphics.rectangle("fill", 90,40, 820, 30)
			love.graphics.rectangle("line", 100,90, 20, 520)
		end)
	-- тут рисуем то, что всегда должно быть видно на экране.
	love.graphics.setColor(255,56,56)
	love.graphics.rectangle("line", 10,10, 40, 10)
	love.graphics.print("x,y:"..x..","..y, 10,30)
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		x = x + 100 * dt
	end
	if love.keyboard.isDown("left") then
		x = x - 100 * dt
	end
	if love.keyboard.isDown("down") then
		y = y + 100 * dt
	end
	if love.keyboard.isDown("up") then
		y = y - 100 * dt
	end
	cam:setPosition(x, y)	
	
	if love.keyboard.isDown("w") then
		scale = scale - 0.1
	end
	if love.keyboard.isDown("s") then
		scale = scale + 0.1
	end
	cam:setScale(scale) -- увеличить камеру в 2 раза (приблизить картинку)
		
	if love.keyboard.isDown("a") then
		newAngle = newAngle - 0.01
	end
	if love.keyboard.isDown("d") then
		newAngle = newAngle + 0.01
	end
	cam:setAngle(newAngle) -- поворот камеры на угол в радианах
end