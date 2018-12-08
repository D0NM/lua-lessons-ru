require"turtle"
size(700,700)
--hide()

function ВЕТВИ(x)
	move( x )
	turn( 45 )
	move( x )
	jump( -x )
	turn( -45 )

	turn( -45 )
	move( x )
	jump( -x )
	turn( 45 )
	
	jump( -x )
end

turn(-90)
jump(-100)

ВЕТВИ(50)
	
wait()