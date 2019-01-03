-- Про Вывод Текста и Шрифты. УРОК 3
function love.load()
	y2, y3 = 0, 50
	xLimit = 800
	speed = 40

	white = { 255, 255, 255 }
	red = 	{ 255, 20, 20, 200 }
	green = { 0, 255, 20 }
	black = { 0, 0, 0,  255 }
	blue = { 0, 0, 130 }	-- для фона экрана

	text1 = "ТЕКСТ ОДИН"
	text2 = "текст ДВА"
	textRed = "КРАСНЫЕ буквы"

	coloredText = { green, text1, black, text2, red, textRed }

	font = love.graphics.newFont( "res/Bukhari_Script.ttf", 40 )
	love.graphics.setFont(font) -- Шрифт
end

function love.draw()
	local x, y = 20, 10
	local xf, yf = 20, 260
	love.graphics.clear( unpack(blue) )
	love.graphics.setColor( unpack(black) )
	love.graphics.rectangle("fill", xLimit + xf, 0, 2, love.graphics.getHeight())

	love.graphics.setColor( 255, 0, 0, 90 )
	love.graphics.rectangle("fill", 0, y2, love.graphics.getWidth(), 10)
	love.graphics.setColor( 150, 255, 150, 90 )	
	love.graphics.rectangle("fill", 0, y3, love.graphics.getWidth(), 10)

	love.graphics.setColor( unpack(white) )	-- Белый. Без искажения.
	love.graphics.print(coloredText, x, y)	-- Нормальный вывод
	love.graphics.setColor( 255, 255, 255, 100 )
	love.graphics.print(coloredText, x, y + 120)	-- Подмешиваем цвет

	love.graphics.setColor( unpack(white) )	-- Белый. Без искажения.
	love.graphics.printf(coloredText, xf, yf, xLimit, "center") -- Форматируем вывод
end

function love.update(dt)
	xLimit = xLimit - dt * speed -- Двигаем лимит (ширину) вывода текста
	if xLimit < 200 then
		xLimit = love.graphics.getWidth()
	end

	y2 = y2 + speed * dt	-- Полосы под первым текстом
	y3 = y3 - speed * dt
	if y2 > 100 then
		y2 = -10
	end
	if y3 < -10 then
		y3 = 100
	end
	
	red[3] = red[3] + dt * speed	-- Меняем цвет red
	if red[3] > 255 then
		red[3] = 0
	end

	black[4] = black[4] + dt * speed	-- Меняем прозрачность цвета black
	if black[4] > 255 then
		black[4] = 0
	end
end
