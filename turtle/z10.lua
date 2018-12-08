require"turtle"
pnsz(2); posn(-150, -150)
function kva (dlina)
	for i = 1, 4 do
		move(dlina)
		turn(90)
	end
	if dlina > 10 then
		move(dlina / 2)
		turn(45)
		kva( dlina * 0.7)
	end
end
kva(300)
wait()
