instructions = [[
  bump.lua simple demo

    arrows: move
    tab: toggle debug info
    delete: run garbage collector
]]

local consoleBuffer = {}
local consoleBufferSize = 5

for i=1,consoleBufferSize do consoleBuffer[i] = "" end

function consolePrint(msg)
	table.remove(consoleBuffer,1)
	consoleBuffer[consoleBufferSize] = msg
end

function drawConsole()
	local str = table.concat(consoleBuffer, "\n")
	for i=1,consoleBufferSize do
		love.graphics.setColor(1,1,1, i/consoleBufferSize)
		love.graphics.printf(consoleBuffer[i], 10, 580-(consoleBufferSize - i)*12, 790, "left")
	end
end

-- Вывод отладочного текста на экране
function drawMessage()
	local msg = instructions:format(tostring(shouldDrawDebug))
	love.graphics.setColor(1, 1, 1)
	love.graphics.print(msg, 550, 10)
	love.graphics.print( ""..#qp_items.." "..love.mouse.getX()..
		" "..love.mouse.getY(), 10, 10) 
	for y = 1, #qp_items do
		local it = qp_items[y]
		love.graphics.print( ""..it.item.name.." "
			..it.x1.." "..it.y1.." "..it.x2.." "..it.y2
			.." "..it.ti1.." "..it.ti2, 10, 10 + y * 10) 
	end
end

function drawDebug()
	bump_debug.draw(world)
	local statistics = ("fps: %d, mem: %dKB, collisions: %d, items: %d"):format(love.timer.getFPS(), collectgarbage("count"), cols_len, world:countItems())
	love.graphics.setColor(1, 1, 1)
	love.graphics.printf(statistics, 0, 580, 790, 'right')
end
