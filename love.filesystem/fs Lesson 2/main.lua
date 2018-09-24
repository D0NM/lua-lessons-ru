-- файловая система в Love2D
-- УРОК 2 пишем в файл, читаем из файла, как хранить данные на диске
json = require "lib.json"

function love.load()
	if arg[#arg] == "-debug" then require("mobdebug").start() end 
	
	test = {
		{name = "gob1", type = "goblin", x = 33, y =16, draw = "fff" },
		{name = "gob2", type = "goblin", x = 23, y =100, draw = "fff" },
		{name = "gob3", type = "goblin", x = 43, y =6, draw = "fff" },
		}
--	test = {key1 = 1, key2 = 33, key3 = "ffffff", key = "green"}
	
	local to_file = json.encode(test)
	love.filesystem.write( "saveGame.txt", to_file, #to_file )
	
	local contents, size = love.filesystem.read( "saveGame.txt" )
	print (contents)
	
	test2 = json.decode(contents)
	print(test2.name)
	
end
