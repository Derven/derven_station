var/global/list/inners_outers = list()

/obj/machinery/atmospherics/air_pipe/pipe/inner
	icon = 'icons/obj/machine/atmos.dmi'
	icon_state = "inner_off"
	density = 0
	layer = 2.4
	anchored = 1

	New()
		inners_outers += src

/obj/machinery/atmospherics/air_pipe/pipe/inner/process()
	in_()
	if(oxy > 0 || nit > 0 || plas > 0)
	//			world << "[x];[y];[z]"
		gas_move()

/datum/innerouter_controller

	proc/control()
		spawn while(1)
			sleep(4)

			for(var/obj/machinery/atmospherics/air_pipe/pipe/I in inners_outers)
				if(istype(I, /obj/machinery/atmospherics/air_pipe/pipe/outer) || istype(I, /obj/machinery/atmospherics/air_pipe/pipe/inner))
					I.process()

	New()
		control()



/obj/machinery/atmospherics/air_pipe/pipe/inner/gas_move()
	if(dir == 4)
		pipe_check(WEST)
		anglepipe_check(WEST, 2, 4)
		manifold_check(WEST, 8, 4, 2)

	if(dir == 8)
		pipe_check(EAST)
		anglepipe_check(EAST, 8, 1)
		manifold_check(EAST, 8, 4, 1)

	if(dir == 2)
		pipe_check(SOUTH)
		anglepipe_check(SOUTH, 9, 5)
		manifold_check(SOUTH, 2, 8, 1)

	if(dir == 1)
		pipe_check(NORTH)
		anglepipe_check(NORTH, 10, 6)
		manifold_check(NORTH, 2, 4, 1)


/obj/machinery/atmospherics/air_pipe/pipe/inner/proc/in_()
	icon_state = "inner_on"

	if(oxygen[x][y] > 5)

		oxygen[x][y] -= 1
		oxy += 1
		if(windoors_on_turf[x-1][y] == 0)
			if(oxygen[x][y] > 5)
				oxygen[x-1][y] -= 1
				oxy += 1

		if(windoors_on_turf[x+1][y] == 0)
			if(oxygen[x][y] > 5)
				oxygen[x+1][y] -= 1
				oxy += 1

		if(windoors_on_turf[x][y-1] == 0)
			if(oxygen[x][y] > 5)
				oxygen[x][y-1] -= 1
				oxy += 1

		if(windoors_on_turf[x][y+1] == 0)
			if(oxygen[x][y] > 5)
				oxygen[x][y+1] -= 1
				oxy += 1

	if(plasma[x][y] > 5)

		plasma[x][y] -= 1
		plas += 1
		if(windoors_on_turf[x-1][y] == 0)
			if(plasma[x][y] > 5)
				plasma[x-1][y] -= 1
				plas += 1

		if(windoors_on_turf[x+1][y] == 0)
			if(plasma[x][y] > 5)
				plasma[x+1][y] -= 1
				plas += 1

		if(windoors_on_turf[x][y-1] == 0)
			if(plasma[x][y] > 5)
				plasma[x][y-1] -= 1
				plas += 1

		if(windoors_on_turf[x][y+1] == 0)
			if(plasma[x][y] > 5)
				plasma[x][y+1] -= 1
				plas += 1

	if(nitrogen[x][y] > 5)

		nitrogen[x][y] -= 1
		nit += 1
		if(windoors_on_turf[x-1][y] == 0)
			if(nitrogen[x][y] > 5)
				nitrogen[x-1][y] -= 1
				nit += 1

		if(windoors_on_turf[x+1][y] == 0)
			if(nitrogen[x][y] > 5)
				nitrogen[x+1][y] -= 1
				nit += 1

		if(windoors_on_turf[x][y-1] == 0)
			if(nitrogen[x][y] > 5)
				nitrogen[x][y-1] -= 1
				nit += 1

		if(windoors_on_turf[x][y+1] == 0)
			if(nitrogen[x][y] > 5)
				nitrogen[x][y+1] -= 1
				nit += 1

	icon_state = "inner_off"