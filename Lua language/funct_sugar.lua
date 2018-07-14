-- Сахарок для вызова функции
-- когда можно использовать . или : при вызове функции в таблице
kitty = { says = "мя-мя", food = "кактусы", x = 2,
	foo = function() print(1) end }
doge = { says = "woff", food = "crabs", x = 5}
--kitty.foo()
kitty.eat = function(self)
	print("ест",self.food)
end

function kitty:say(a)
	print("говорит", self.says, a)
end
kitty:eat()
kitty:say(4)
kitty.say(doge, 77)