-- Библиотека tween by kikito
local tween = require 'tween'

function love.load()
	krug = {x = 20, y = 20, r1 = 10, r2 = 10, c = {255, 0, 255}}
	go = { x = 100, y = 100,
		sprite = love.graphics.newText(love.graphics.newFont(100), "GaMe OvEr!") }
	z = {}
	for i = 1, 20 do
		z[#z + 1] = { x = i * 40, y = 600 - 20, r = love.math.random(3, 7),
			c = {love.math.random(40, 100),
				love.math.random(140, 200),
				love.math.random(0, 255)},

		}
		z[#z].tw = tween.new(love.math.random(1, 5), z[#z],
			{ x = love.math.random(0, 800),
				y = love.math.random(0, 600),
				c = {255, 0, 0},
				r = love.math.random(20, 40)
			},
			"inOutBounce")
	end
	--local t = tween.new(duration, subject, target, [easing])
	krugTweenY = tween.new(3, krug, { y = 600 - 20 }, "outBounce")
	krugTweenX = tween.new(5, krug, { x = 800 - 20, r1 = 3,
			c = {80, 255, 30} }, "outQuad")
	goTweenY = tween.new(1, go, { y = 240 }, "outElastic")
end

function love.draw()
	love.graphics.setColor(krug.c[1],krug.c[2],krug.c[3])
	love.graphics.circle("fill", krug.x, krug.y, krug.r1, krug.r2)
	love.graphics.setColor(55,255,55)
	love.graphics.draw(go.sprite, go.x, go.y, 0.1)
	--love.graphics.setColor(255,255,255)	
	for i = 1, #z do
		love.graphics.setColor(z[i].c[1],z[i].c[2],z[i].c[3])
		love.graphics.circle("fill", z[i].x, z[i].y, z[i].r, 7)
	end
end

function love.update(dt)
	krugTweenX:update(dt)
	krugTweenY:update(dt)
	goTweenY:update(dt)
	for i = 1, #z do
		z[i].tw:update(dt)
	end
end
