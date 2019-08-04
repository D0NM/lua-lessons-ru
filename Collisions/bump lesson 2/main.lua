local bump       = require 'bump'
local bump_debug = require 'bump_debug'

local instructions = [[
  bump.lua simple demo

    arrows: move
    tab: toggle debug info
    delete: run garbage collector
]]

local cols_len = 0 -- how many collisions are happening

-- World creation
local world = bump.newWorld()
qp_items = {}

-- Message/debug functions
local function drawMessage()
  local msg = instructions:format(tostring(shouldDrawDebug))
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(msg, 550, 10)
	--love.graphics.print( ""..#qp_items.." "..love.mouse.getX().." "..love.mouse.getY(), 10, 10)  
	love.graphics.print( ""..#qp_items.." "..love.mouse.getX().." "..love.mouse.getY(), 10, 10) 
	for y = 1, #qp_items do
		local it = qp_items[y]
		love.graphics.print( ""..it.item.name.." "..it.x1.." "..it.y1.." "..it.x2.." "..it.y2.." "..it.ti1.." "..it.ti2, 10, 10 + y * 10) 
	end
end

local function drawDebug()
  bump_debug.draw(world)

  local statistics = ("fps: %d, mem: %dKB, collisions: %d, items: %d"):format(love.timer.getFPS(), collectgarbage("count"), cols_len, world:countItems())
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf(statistics, 0, 580, 790, 'right')
end

local consoleBuffer = {}
local consoleBufferSize = 5
for i=1,consoleBufferSize do consoleBuffer[i] = "" end
local function consolePrint(msg)
  table.remove(consoleBuffer,1)
  consoleBuffer[consoleBufferSize] = msg
end

local function drawConsole()
  local str = table.concat(consoleBuffer, "\n")
  for i=1,consoleBufferSize do
    love.graphics.setColor(1,1,1, i/consoleBufferSize)
    love.graphics.printf(consoleBuffer[i], 10, 580-(consoleBufferSize - i)*12, 790, "left")
  end
end

-- helper function
local function drawBox(box, r,g,b)
  love.graphics.setColor(r,g,b,70/255)
  love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x, box.y, box.w, box.h)
end


local function myFilter(item, other)
	--print(item.name, " collides ", other.name)
	if other.kind and other.kind == "coin" then
		--coins = coins + 1
		-- other OFF
		return "cross"
	--return "bounce"
	end
	if other.kind and other.kind == "wall" then
		return "slide"
	--return "bounce"
	end
	return "slide"
end

-- Player functions
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
      consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other, col.type, col.normal.x, col.normal.y))
    end
  end
end

local function drawPlayer()
  drawBox(player, 0, 1, 0)
end

-- Block functions

local blocks = {}

local function addBlock(x,y,w,h)
  local block = {x=x,y=y,w=w,h=h, color = math.random(), name = "Wall" .. #blocks+1, isWall = true }
  blocks[#blocks+1] = block
  world:add(block, x,y,w,h)
end

local function drawBlocks()
  for _,block in ipairs(blocks) do
    drawBox(block, 1,0, block.color)
  end
end

-- Main LÖVE functions

function love.load()
  world:add(player, player.x, player.y, player.w, player.h)

  addBlock(0,       0,     800, 32)
  addBlock(0,      32,      32, 600-32*2)
  addBlock(800-32, 32,      32, 600-32*2)
  addBlock(0,      600-32, 800, 32)

  for i=1,30 do
    addBlock( math.random(100, 600),
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
  
	--love.graphics.rectangle("line", love.mouse.getX(), love.mouse.getY(), 20, 20 )
	love.graphics.line(60,60, love.mouse.getX(), love.mouse.getY() )
end

-- Non-player keypresses
function love.keypressed(k)
  if k=="escape" then love.event.quit() end
  if k=="tab"    then shouldDrawDebug = not shouldDrawDebug end
  if k=="delete" then collectgarbage("collect") end
end
