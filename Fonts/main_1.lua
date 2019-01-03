-- Про Шрифты. УРОК 1

--    The default font (Bitstream Vera Sans)
--    Any font file supported by FreeType 2
--    An image containing glyphs (ImageFont)

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	text = "ABCxyz123#! - Не ешь, подумай! Булочки хорошие."
	font1 = love.graphics.newFont( 20 )
	font2 = love.graphics.newFont( "res/Bukhari_Script.ttf", 20 )
	font2_80 = love.graphics.newFont( "res/Bukhari_Script.ttf", 80 )
	font3 = love.graphics.newFont( "res/Certege.ttf", 20 )
	font4 = love.graphics.newFont( "res/MIROSLN.ttf", 20 )
	font5 = love.graphics.newImageFont("res/imagefont.png",
		" abcdefghijklmnopqrstuvwxyz" ..
		"ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
		"123456789.,!?-+/():;%&`'*#=[]\"", 0)
end

function love.draw()
	love.graphics.clear( 0, 0, 130 )
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.setFont(font1)
	love.graphics.print(text, 20, 10)
	love.graphics.setFont(font2)
	love.graphics.print(text, 20, 40)
--	love.graphics.setFont(font2_80)
--	love.graphics.setColor( 255, 100, 100 )
--	love.graphics.print(text, -500, 60, 0.3)
--	love.graphics.setFont(font3)
--	love.graphics.print(text, 20, 70)
--	love.graphics.setFont(font4)
--	love.graphics.print(text, 20, 100)
--	love.graphics.setFont(font5)
--	love.graphics.print(text, 20, 130)
end

function love.update(dt)
end