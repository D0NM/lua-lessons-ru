class = require "lib.middleclass"

Unit = class("Unit")

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
	x2 < x1+w1 and
	y1 < y2+h2 and
	y2 < y1+h1
end

function CheckLinearCollision(y1,h1, y2,h2)
	return y1 < y2+h2 and
	y2 < y1+h1
end

function Unit:initialize(name, x, y)
	self.name = name
	self.x = x
	self.y = y
	self.r = love.math.random(10, 20)
	self.color = {love.math.random(1, 255),
		love.math.random(1, 255),
		love.math.random(1, 255), 50
	}
end

-- возвращ true если Unit на экране и не касается границ экрана
function Unit:isOnScreen()
	if self.x - self.r < 0
		or self.x + self.r > love.graphics.getWidth()
		or self.y - self.r < 0
		or self.y + self.r > love.graphics.getHeight()
	then
		return false
	else
		return true
	end
end
-- ИИ
function Unit:update(dt) 
	self.x = self.x + love.math.random(-100, 100) * dt
	self.y = self.y + love.math.random(-100, 100) * dt
end

function Unit:draw()
	love.graphics.setColor(unpack(self.color))
	love.graphics.circle("fill", self.x, self.y, self.r)
	love.graphics.setColor(255,255,255)
	love.graphics.print(self.name, self.x, self.y)
	love.graphics.print("x:"..math.floor(self.x)..",y:"..math.floor(self.y),
		self.x - self.r, self.y + 10)
end

UnitDrop = class("UnitDrop", Unit)
function UnitDrop:initialize(name, x, y)
	Unit.initialize(self, name, x, y)
	self.color = {love.math.random(155, 255),
		0,
		0,
		255
	}	
end
-- ИИ
function UnitDrop:update(dt) 
	if self.y < love.graphics.getHeight() - self.r * 2 then
		self.y = self.y + 100 * dt
	end
end

UnitPong = class("UnitPong", Unit)
function UnitPong:initialize(name, x, y)
	Unit.initialize(self, name, x, y)
	self.color = {0,
		0,
		love.math.random(155, 255),
		255
	}
	if love.math.random() < 0.5 then
		self.speedx = 0
		self.speedy = 80
	else
		self.speedx = 80
		if love.math.random() < 0.5 then
			self.speedy = 0
		else
			self.speedy = 80
		end
	end
end
-- ИИ
function UnitPong:update(dt) 
	local oldx, oldy = self.x, self.y
	self.x = self.x + self.speedx * dt
	if not self:isOnScreen() then
		self.x = oldx
		self.speedx = -self.speedx
	end
	self.y = self.y + self.speedy * dt
	if not self:isOnScreen() then
		self.y = oldy
		self.speedy = -self.speedy
	end
end

Player = class("Player", Unit)
function Player:initialize(name, x, y, keys)
	Unit.initialize(self, name, x, y)
	self.color = {0,
		love.math.random(155, 255),
		0,
		255
	}	
	self.speed = 100
	self.keys = keys or {left = "a", right = "d", up = "w", down = "s"}
end

function Player:control(dt) 
	local oldx, oldy = self.x, self.y
	local sx, sy = 0, 0
	if love.keyboard.isDown(self.keys.left) and
	self.x > 0 + self.r then
		sx = -self.speed * dt
	elseif love.keyboard.isDown(self.keys.right) and
	self.x < love.graphics.getWidth() - self.r then
		sx = self.speed * dt
	end
	if love.keyboard.isDown(self.keys.up) and
	self.y > 0 + self.r then
		sy = -self.speed * dt
	elseif love.keyboard.isDown(self.keys.down) and
	self.y < love.graphics.getHeight() - self.r then
		sy = self.speed * dt
	end
	self.x = self.x + sx
	self.y = self.y + sy
	if self:collideWithAny() then
		self.x = oldx
		self.y = oldy
	end
end

--проверка столкновения текущего объекта с другим other
function Player:collideWith(other) 
	if self == other then
		return false
	end
	if math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2)
	< self.r + other.r
	then
		return true
	else
		return false
	end
end

function Player:collideWithAny() 
	for i = 1, #units do
		if self:collideWith(units[i]) then
			return true
		end
	end
	return false
end

function Player:update(dt) 
	self:control(dt) 
end

function love.load()
	units = {}
	for i = 1, 5 do
		units[#units + 1] = Unit:new("ball"..i, 
			love.math.random(1,love.graphics.getWidth()),
			love.math.random(1,love.graphics.getHeight()))
	end
	for i = 1, 30 do
		units[#units + 1] = UnitDrop:new("Drop"..i, 
			love.math.random(1,love.graphics.getWidth()),
			love.math.random(1,love.graphics.getHeight()))
	end
	units[#units + 1] = Player:new("IGROK", 
		love.graphics.getWidth() / 2,
		love.graphics.getHeight() / 2)
	units[#units + 1] = Player:new("IGROK2", 
		love.graphics.getWidth() / 2 + 100,
		love.graphics.getHeight() / 2,
		{left = "left", right = "right", up = "up", down = "down"})
	for i = 1, 10 do
		units[#units + 1] = UnitPong:new("Drop"..i, 
			love.math.random(1,love.graphics.getWidth()),
			love.math.random(1,love.graphics.getHeight()))
	end	
end

function love.draw()
	for i = 1, #units do
		units[i]:draw()
	end
end

function love.update(dt)
	for i = 1, #units do
		units[i]:update(dt)
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end
