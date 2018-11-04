local class = require 'middleclass'

Point = class('Point')
function Point:initialize(x,y)
	self.x = x
	self.y = y
end
function Point:__tostring()
	return 'Point: [' .. tostring(self.x) .. ', ' .. tostring(self.y) .. ']'
end

p1 = Point(100, 200)
p2 = Point(35, -10)
print(p1)
print(p2)