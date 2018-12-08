require"turtle"
function kva(dlina)
	for i = 1, 4 do
		move(dlina)
		turn(90)
	end
	kva(dlina - 10)
end
kva(200)
wait()