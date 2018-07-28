-- Библиотека анимации peachy (анимация из редактора aseprite) by Josh Perry
-- УРОК 5
local peachy = require("peachy")

function love.load()
  love.window.setTitle("Peachy example")
  spriteSheet = love.graphics.newImage("res/spr/astst.png")

  jumpy = peachy.new("res/spr/astst.json", spriteSheet, "wiggle")

end

function love.draw()
  jumpy:draw(50, 80)
end

function love.update(dt)
  jumpy:update(dt)
end

function love.keypressed(key)
  if key == "space" then
  end
end
