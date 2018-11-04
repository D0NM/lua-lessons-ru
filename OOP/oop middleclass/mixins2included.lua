local class = require 'middleclass'
DrinksCoffee = {}

-- This is another valid way of declaring functions on a mixin.
-- Note that we are using the : operator, so there's an implicit self parameter
function DrinksCoffee:drink(drinkTime)
	if(drinkTime~=self.class.coffeeTime) then
		print(self.name .. ': Сейчас не время пить кофе!')
	else
		print(self.name .. ': Ммм, обожаю пить кофе в ' .. drinkTime)
	end
end

-- the included method is invoked every time DrinksCoffee is included on a class
-- notice that paramters can be passed around
function DrinksCoffee:included(klass)
	print(klass.name .. ' пьёт кофе в ' .. klass.coffeeTime)
end

EnglishMan = class('Англичанин')
EnglishMan.static.coffeeTime = 5
EnglishMan:include(DrinksCoffee)
function EnglishMan:initialize(name) self.name = name end

Spaniard = class('Испанец')
Spaniard.static.coffeeTime = 6
Spaniard:include(DrinksCoffee)
function Spaniard:initialize(name) self.name = name end

tom = EnglishMan:new('Том')
juan = Spaniard:new('Гуан')

tom:drink(5)
juan:drink(5)
juan:drink(6)