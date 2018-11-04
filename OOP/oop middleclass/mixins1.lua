local class = require 'middleclass'
HasWings = { -- HasWings is a module, not a class. It can be "included" into classes
	fly = function(self)
		print('Бяк-бяк-бяк (машет крыльями) я ' .. self.class.name)
	end
}

Animal = class('Животное')

Insect = class('Насекомое', Animal) -- or Animal:subclass('Insect')

Worm = class('Червь', Insect) -- worms don't have wings

Bee = class('Пчела', Insect)
Bee:include(HasWings) --Bees have wings. This adds fly() to Bee

Mammal = class('Млекопитающее', Animal)

Fox = class('Лиса', Mammal) -- foxes don't have wings, but are mammals

Bat = class('Летучая мышь', Mammal)
Bat:include(HasWings) --Bats have wings, too.

local bee = Bee() -- or Bee:new()
local bat = Bat() -- or Bat:new()
local fox = Fox() 
bee:fly()
bat:fly()
fox:fly()