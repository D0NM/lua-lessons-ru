-- Про Шрифты. УРОК 2

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	text = "ABCxyz123#|{[\\ - Не ешь, подумай!\n Булочки хорошие."
	font = love.graphics.newFont( 20 )
	font1 = love.graphics.newFont( 40 )
--	font1:setLineHeight(0.7)
	font2 = love.graphics.newFont( "res/Bukhari_Script.ttf", 40 )
	font1:setFallbacks( font2 )

	font1_base_line = font1:getBaseline()
	font2_base_line = font2:getBaseline()
	font1_ascent = font1:getAscent()
	font2_ascent = font2:getAscent()
	font1_descent = font1:getDescent()
	font2_descent = font2:getDescent()
end

function love.draw()
	local x, y1, y2 = 20, 10, 120

	love.graphics.clear( 0, 0, 130 )
	love.graphics.setColor( 255, 0, 0 )
	love.graphics.line(x, y1 + font1_base_line, font1:getWidth(text), y1 + font1_base_line)
	love.graphics.line(x, y2 + font2_base_line, 600, y2 + font2_base_line)
	love.graphics.setColor( 255, 150, 150 )	
	love.graphics.line(x, y1 + font1_base_line - font1_ascent, 600, y1 + font1_base_line - font1_ascent)
	love.graphics.line(x, y2 + font2_base_line - font2_ascent, 600, y2 + font2_base_line - font2_ascent)
	love.graphics.setColor( 150, 255, 150 )	
	love.graphics.line(x, y1 + font1_base_line - font1_descent, 600, y1 + font1_base_line - font1_descent)
	love.graphics.line(x, y2 + font2_base_line - font2_descent, 600, y2 + font2_base_line - font2_descent)

	love.graphics.setColor( 255, 255, 255 )
	love.graphics.setFont(font1) -- Шрифт 1
	love.graphics.print(text, x, y1)

	love.graphics.setFont(font2) -- Рус шрифт 2
	love.graphics.print(text, x, y2)

	love.graphics.setFont(font)	-- Просто инфо по шрифтам
	love.graphics.print( "font1 Base Line, Ascent, Descent:"..font1_base_line..","..font1_ascent..","..font1_descent, 20, y2 + 100)
	love.graphics.print( "font2 Base Line, Ascent, Descent:"..font2_base_line..","..font2_ascent..","..font2_descent, 20, y2 + 120)

	love.graphics.print( "font2 height:"..font2:getHeight( ), 20, y2 + 140)
	if font2:hasGlyphs( "ой, привеееет!" ) then
		love.graphics.print( "The font has the listed Glyphs", 20, y2 + 160)
	end
	local width, wrappedtext = font:getWrap( text, 160 )
	love.graphics.print( "getWrap 160px width, wrappedtext:"..width..", "..#wrappedtext, 20, y2 + 180)
	love.graphics.print( "font2 width of 12345:"..font2:getWidth("12345"), 20, y2 + 200)
end