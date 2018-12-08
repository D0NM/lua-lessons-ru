require "turtle"
-- Узнай коды клавиш
while true do
	local k = char()
	if k then
		print( k )
	end
	wait(0.1)
end
wait()