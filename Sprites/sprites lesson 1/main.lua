-- Про загрузку картинок и спрайты
-- УРОК 1

function love.load()
	spr = {
		love.graphics.newImage( "res/shipUp.png" ),
		love.graphics.newImage( "res/shipUpFire.png" )
		}	
	
	rotate = {}
	rotate[1] = 0
	rotate[2] = math.pi / 2
	rotate[3] = math.pi
	rotate[4] = -math.pi / 2
	
	x, y = 200, 100
	speed = 30
	speed2 = 10
	vpravo = false
	frame = 1
	slow = 0
	MYRG = 0.1
	rot = 1
	slowRot = 0
	MAX_ROT = 0.8
end

function love.draw()
	love.graphics.clear( 0, 0, 130 )
	if vpravo then
		love.graphics.draw( spr[frame], x, y, rotate[rot] + math.pi / 2, nil, nil, 32, 32 )
	else
		love.graphics.draw( spr[frame], x, y, rotate[rot], nil, nil, 32, 32 )
	end
end

function love.update(dt)
	x = x + speed * dt
	y = y + speed2 * dt
	vpravo = love.mouse.isDown( 2 )
	slow = slow + dt
	if slow > MYRG then
		slow = 0
		frame = frame + 1
		if frame > #spr then
			frame = 1
		end
	end
	
	slowRot = slowRot + dt
	if slowRot > MAX_ROT then
		slowRot = 0
		
		rot = rot + 1
		if rot > #rotate then
			rot = 1
		end
	end
end
