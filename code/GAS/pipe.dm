var/global/list/pipes_list = list()

/obj/machinery/atmospherics/air_pipe
	var/oxy = 0
	var/nit = 0
	var/plas = 0
	var/temp = 0
	var/obj/machinery/atmospherics/air_pipe/connected_pipe

	proc/gas_move()

/obj/machinery/atmospherics/air_pipe/pipe
	icon = 'icons/obj/machine/atmos.dmi'
	name = "pipe"
	icon_state = "pipe"
	density = 0
	layer = 2.4
	anchored = 1


/obj/machinery/atmospherics/air_pipe/pipe_angle
	icon = 'icons/obj/machine/atmos.dmi'
	name = "pipe"
	icon_state = "pipe_angle"
	density = 0
	layer = 2.4
	anchored = 1

/obj/machinery/atmospherics/air_pipe/pipe_angle/gas_move()

//	world << "[oxy];[nit];[plas]"
	if(dir == 6)
		anglepipe_check(EAST, 8, 1)
		pipe_check(EAST, 8)
		manifold_check(EAST, 8, 4, 1)

	if(dir == 2)
		anglepipe_check(SOUTH, 9, 5)
		pipe_check(SOUTH, 2)
		manifold_check(SOUTH, 2, 8, 1)

	if(dir == 5)
		anglepipe_check(EAST, 8, 1)
		pipe_check(EAST, 8)
		manifold_check(EAST, 8, 4, 1)

	if(dir == 9)
		anglepipe_check(WEST, 4, 2)
		pipe_check(WEST, 4)
		manifold_check(WEST, 8, 4, 2)

	if(dir == 1)
		anglepipe_check(SOUTH, 9, 5)
		pipe_check(SOUTH, 2)
		manifold_check(SOUTH, 2, 8, 1)

	if(dir == 4)
		anglepipe_check(NORTH, 6, 10)
		pipe_check(NORTH, 1)
		manifold_check(NORTH, 2, 4, 1)

	if(dir == 8)
		anglepipe_check(NORTH, 6, 10)
		pipe_check(NORTH, 1)
		manifold_check(NORTH, 2, 4, 1)

	if(dir == 10)
		anglepipe_check(WEST, 4, 2)
		pipe_check(WEST, 4)
		manifold_check(WEST, 8, 4, 2)

/obj/machinery/atmospherics/air_pipe/New()
	pipes_list += src
	process()


/datum/pipe_controller

	proc/PROCESSING()
		spawn while(1)
			sleep(1)
			for(var/obj/machinery/atmospherics/air_pipe/AP in pipes_list)
				if(!istype(AP,/obj/machinery/atmospherics/air_pipe/pipe/inner) && !istype(AP,/obj/machinery/atmospherics/air_pipe/pipe/outer))
					AP.gas_move()

	New()
		PROCESSING()

/obj/machinery/atmospherics/air_pipe/pipe/act()
	world << "[plas]"

/obj/machinery/atmospherics/air_pipe/pipe/gas_move()

	//
	// Передаем газ из одной трубы в другую
	//
	if(oxy > 0 || nit > 0 || plas > 0)
//	world << "****[oxy];[nit];[plas]****"
		if(dir == 4)
			pipe_check(WEST, 2, 4, 8, 4, 2)

		if(dir == 8)
			pipe_check(EAST, 8, 1, 8, 4, 1)

		if(dir == 2)
			pipe_check(SOUTH, 9, 5, 2, 8, 1)

		if(dir == 1)
			pipe_check(NORTH, 10, 6, 2, 4, 1)

/obj/machinery/atmospherics/air_pipe/pipe/proc/pipe_check(var/direction, var/dir_num, var/dir_num2, var/dir_num3, var/dir_num4, var/dir_num5)
	var/turf/T = get_step(src, direction)
	for(var/obj/machinery/atmospherics/air_pipe/AP in T)
		if(istype(AP,/obj/machinery/atmospherics/air_pipe/pipe) && AP.dir == dir)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

		if(istype(AP,/obj/machinery/atmospherics/air_pipe/pipe_angle) && AP.dir == dir_num || AP.dir == dir_num2)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

		if(istype(AP,/obj/machinery/atmospherics/air_pipe/manifold) && AP.dir == dir_num3 || AP.dir == dir_num4 || AP.dir == dir_num5)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/proc/anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe_angle/proc/anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe_angle/proc/pipe_check(var/direction, var/dir_num)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir_num)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/proc/manifold_check(var/direction, var/dir_num, var/dir_num2, var/dir_num3)
	for(var/obj/machinery/atmospherics/air_pipe/manifold/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2 || AP.dir == dir_num3)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe_angle/proc/manifold_check(var/direction, var/dir_num, var/dir_num2, var/dir_num3)
	for(var/obj/machinery/atmospherics/air_pipe/manifold/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2 || AP.dir == dir_num3)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0
