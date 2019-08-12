local bump = require 'bump'
bump_debug = require 'bump_debug'
require "debug_console"

cols_len = 0 -- сколько столкновений произошло
coins = 0
isGameOver = false

-- Создаём мир
world = bump.newWorld()
qp_items = {}

-- рисование прямоугольника выбранным цветом R G B
local function drawBox(box, r,g,b)
	love.graphics.setColor(r,g,b,70/255)
	love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
	love.graphics.setColor(r,g,b)
	love.graphics.rectangle("line", box.x, box.y, box.w, box.h)
end

-- рисование круга выбранным цветом R G B
local function drawCircle(box, r,g,b)
	love.graphics.setColor(r,g,b,70/255)
	love.graphics.circle("fill", box.x+box.w/2, box.y+box.w/2, box.w/2)
	love.graphics.setColor(r,g,b)
	love.graphics.circle("line", box.x+box.w/2, box.y+box.w/2, box.w/2)
end

local function myFilter(item, other)
	--print(item.name, " collides ", other.name)
	if other.isCoin then
		return "cross"
	end
	if other.isWall then
		return "slide"
	end
	return "cross"
end

-- Функции для игрока
local player = { x=50,y=50,w=20,h=20, speed = 180, name = "Player1", isPlayer = true }

local function updatePlayer(dt)
	local speed = player.speed

	local dx, dy = 0, 0
	if love.keyboard.isDown('right') then
		dx = speed * dt
	elseif love.keyboard.isDown('left') then
		dx = -speed * dt
	end
	if love.keyboard.isDown('down') then
		dy = speed * dt
	elseif love.keyboard.isDown('up') then
		dy = -speed * dt
	end

	if dx ~= 0 or dy ~= 0 then
		local cols
		player.x, player.y, cols, cols_len
		= world:move(player, player.x + dx, player.y + dy, myFilter)
		for i=1, #cols do
			local col = cols[i]
			consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other,
					col.type, col.normal.x, col.normal.y))
			if col.other.isCoin then
				coins = coins + 1
				col.other.isCoin = false
			end
			if col.other.isLava then
				isGameOver = true
			end
		end
	end
end

-- Рисование игрока. Можете спрайт сюда подставить потом
local function drawPlayer()
--	drawBox(player, 0, 1, 0)
	drawCircle(player, 0, 1, 0)
end

-- Функции создания объектов на уровне
local blocks = {}

local function addBlock(x,y,w,h)
	local block = {x=x,y=y,w=w,h=h, color = math.random(), 
		name = "Wall" .. #blocks+1, isWall = true }
	blocks[#blocks+1] = block
	world:add(block, x,y,w,h)
end

local function addLava(x,y,w,h)
	local block = {x=x,y=y,w=w,h=h, 
		name = "Lava" .. #blocks+1, isLava = true }
	blocks[#blocks+1] = block
	world:add(block, x,y,w,h)
end

local coinSize = 20
local function addCoin(x,y)
	local block = {x=x,y=y,w=coinSize,h=coinSize, 
		name = "Coin" .. #blocks+1, isCoin = true }
	blocks[#blocks+1] = block
	world:add(block, x,y,coinSize,coinSize)
end

local function drawBlocks()
	for _,block in ipairs(blocks) do
		if block.isCoin then
			drawCircle(block, 1, 1, 0 )
		elseif block.isWall then
			drawBox(block, 0,1, block.color)
		elseif block.isLava then
			drawBox(block, 1,0,0)
		end
	end
end

-- Главные функции LÖVE
function love.load()
	world:add(player, player.x, player.y, player.w, player.h)
	local result = world:hasItem(coinSize)
	print(result, world:countItems() )

	addBlock(0,       0,     800, 32)
	addBlock(0,      32,      32, 600-32*2)
	addBlock(800-32, 32,      32, 600-32*2)
	addBlock(0,      600-32, 800, 32)
	
	print( world:countItems() )

	for i=1,30 do
		addCoin( math.random(100, 600),
			math.random(100, 400),
			math.random(10, 100),
			math.random(10, 100)
		)
	end

	for i=1,10 do
		addBlock( math.random(100, 600),
			math.random(100, 400),
			math.random(10, 100),
			math.random(10, 100)
		)
	end

	for i=1, 5 do
		addLava( math.random(100, 600),
			math.random(100, 400),
			math.random(10, 100),
			math.random(10, 100)
		)
	end
end

local function filter_only_player( item )
	return item.isPlayer
end

local function filter_not_player( item )
	return not item.isPlayer
end

function love.update(dt)
	cols_len = 0
	updatePlayer(dt)

	--qp_items, _ = world:queryPoint( love.mouse.getX(), love.mouse.getY(), filter_not_player )
	--qp_items, _ = world:queryRect( love.mouse.getX(), love.mouse.getY(), 20, 20, filter_not_player )
	--qp_items, _ = world:querySegment( 0,0, love.mouse.getX(), love.mouse.getY() )
	qp_items, _ = world:querySegmentWithCoords( 60,60, love.mouse.getX(), love.mouse.getY() )

end

function love.draw()
	drawBlocks()
	drawPlayer()
	if shouldDrawDebug then
		drawDebug()
		drawConsole()
	end
	drawMessage()
	love.graphics.print("COINS: "..coins, 10, 580)
	--love.graphics.rectangle("line", love.mouse.getX(), love.mouse.getY(), 20, 20 )
	love.graphics.line(60,60, love.mouse.getX(), love.mouse.getY() )
	if isGameOver then
		love.graphics.setColor(1,0,0, 0.7)
		love.graphics.rectangle("fill", 0, 0, 800, 600)
	end
	
	local x,y,w,h = world:getRect(player)
	love.graphics.setColor(1,0,0, 0.9)
	love.graphics.rectangle("fill", x, y, w, h)
	
	x,y = world:toCell(love.mouse.getX(), love.mouse.getY() )
	love.graphics.setColor(0,0,1, 0.2)
	--love.graphics.rectangle("fill", (x - 1) * 64, (y - 1)* 64, 64, 64)
	x,y = world:toWorld(x, y)
	love.graphics.rectangle("fill", x, y, 64, 64)
end

-- кнопки управления, которые не имеют отношения к игроку
function love.keypressed(k)
	if k=="escape" then love.event.quit() end
	if k=="tab"    then shouldDrawDebug = not shouldDrawDebug end
	if k=="delete" then collectgarbage("collect") end
end
