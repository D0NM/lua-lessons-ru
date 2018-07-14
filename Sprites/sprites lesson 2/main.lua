-- Про загрузку картинок и спрайты (дополнение)
-- УРОК 3

function love.load()
	spr = love.graphics.newImage( "res/spr0.png" )
	
	spr1 = love.graphics.newImage( "res/spr1.png" )
	quad1 = love.graphics.newQuad( 93, 96, 100, 98, spr1:getDimensions() )
	
	font = love.graphics.newFont( 64 )
	txtSpr = love.graphics.newText( font, "GAME OVER" )
	x, y = 400, 300
	ugol = 0
	scale_x, scale_y = 2, 2
	origin_x, origin_y = 32, 32
end

function love.draw()
	love.graphics.clear( 50, 50, 50 ) -- Love2D 10.2
	love.graphics.setColor( 50, 50, 50, 127 ) -- Red, Green, Blue, Alpha
	love.graphics.draw( spr, x + 24, y + 24, ugol, scale_x, scale_y, origin_x, origin_y )
	love.graphics.setColor( 255, 255, 255 ) -- Red, Green, Blue, Alpha
	love.graphics.draw( spr, x, y, ugol, scale_x, scale_y, origin_x, origin_y, -0.1, 0.3 )
	love.graphics.draw( txtSpr, 0, 0 )
	love.graphics.draw( spr1, quad1, 50, 70, 1)
end

function love.update(dt)

end
