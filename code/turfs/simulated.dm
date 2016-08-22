#define gas_number 21

/turf/space
	name = "space"
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	pass_gas = 1

	New()
		if(z == 1)
			space_is_here[x][y] = 1
			ul_SetLuminosity(0, 0, 1)
			icon_state = "[((x + y) ^ ~(x * y) + z) % 25]"
			..()

	Del()
		if(z == 1)
			space_is_here[x][y] = 0

/atom
	var/pass_gas = 1

/turf
	var/gas_max = 600
	var/cur_gas
	var/transfer_gas
	var/limit = 0
	var/here_windoors = 0
	luminosity = 0

/turf

/turf/simulated

	Del()
		space_is_here[x][y] = 1
		oxygen[x][y] = 0
		plasma[x][y] = 0
		nitrogen[x][y] = 0
		pressure[x][y] = 0
		temperature[x][y] = -300
		..()

/turf/simulated/floor/act()
	var/oxy = oxygen[x][y]
	var/WD = windoors_on_turf[x][y]
	var/temp = temperature[src.x][src.y]
	var/pr = pressure[src.x][src.y]
	var/plasm = plasma[x][y]
	world << "Oxygen [oxy]; WD [WD]; temperature [temp]; plasma [plasm]; pressure [pr]"