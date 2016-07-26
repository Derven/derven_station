/obj/machinery/atmospherics/air_pipe/pipe/switcher
	icon = 'icons/obj/machine/atmos.dmi'
	name = "pipe"
	icon_state = "switch_on"
	density = 0
	layer = 2.4
	anchored = 1
	var/switcher = 0

/obj/machinery/atmospherics/air_pipe/pipe/switcher/gas_move()

	if(switcher == 0)
//		world << "****[oxygen];[nitrogen];[plasma]****"
		if(dir == 4)
			//pipe_check(WEST)
			//sleep(1)
			//anglepipe_check(WEST, 2, 4)
			//manifold_check(WEST, 8, 4, 2)
			pipe_check(WEST, 2, 4, 8, 4, 2)

		if(dir == 8)
			//pipe_check(EAST)
			//sleep(1)
			//anglepipe_check(EAST, 8, 1)
			//manifold_check(EAST, 8, 4, 1)
			pipe_check(EAST, 8, 1, 8, 4, 1)

		if(dir == 2)
			//pipe_check(SOUTH)
			//sleep(1)
			//anglepipe_check(SOUTH, 9, 5)
			//manifold_check(SOUTH, 2, 8, 1)
			pipe_check(SOUTH, 9, 5, 2, 8, 1)

		if(dir == 1)
			//pipe_check(NORTH)
			//sleep(1)
			//anglepipe_check(NORTH, 10, 6)
			//manifold_check(NORTH, 2, 4, 1)
			pipe_check(NORTH, 10, 6, 2, 4, 1)

/obj/machinery/atmospherics/air_pipe/pipe/switcher/act()
	if(switcher == 0)
		switcher = 1
		icon_state = "switch_off"
		return
	else
		switcher = 0
		icon_state = "switch_on"
		return