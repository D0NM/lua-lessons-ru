require "turtle"
print "Черепашка готова"

пауза = wait
вперед = move
назад = function(n) move(-n) end
направо = turn
налево = function(n) turn(-n) end
function переменная(name)
	_G[name] = 0
end

перо = pnsz
цветRGB = function(r, g, b)
	pncl( colr( r,g,b ))
end
очистить_фон = wipe
показать_черепашку = show
спрятать_черепашку = hide
место= posn

function домой()
	posn(0, 0)
	налево(90)
end

function повтори(n, st)
	for i = 1, n do
		loadstring(st)()
	end
end

домой()