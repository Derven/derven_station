var/global/list/pipes_master_first = list()
var/global/list/pipes_master_second = list()
var/global/list/pipes_master_third = list()
var/global/list/pipes_master_fourth = list()
var/global/list/pipes_master_fifth = list()

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
	if(x < 50 && y < 50)
		pipes_master_first += src
	else if(x < 100 && y < 100)
		pipes_master_second += src
	else if(x < 155 && y < 155)
		pipes_master_second += src
	else if(x < 200 && y < 200)
		pipes_master_fourth += src
	else
		pipes_master_fifth += src
	process()


/datum/pipe_controller

	proc/PROCESSING(var/list/L)
		spawn while(1)
			sleep(1)
			for(var/obj/machinery/atmospherics/air_pipe/AP in L)
				if(world.cpu > 40)
					sleep(1)
				if(!istype(AP,/obj/machinery/atmospherics/air_pipe/pipe/inner) && !istype(AP,/obj/machinery/atmospherics/air_pipe/pipe/outer))
					if(AP.oxy > 0 || AP.nit > 0 || AP.plas > 0)
						AP.process()
	New(var/list/L)
		PROCESSING(L)

/datum/pipe_controller/pipe_controller_master_1
/datum/pipe_controller/pipe_controller_master_2
/datum/pipe_controller/pipe_controller_master_3
/datum/pipe_controller/pipe_controller_master_4
/datum/pipe_controller/pipe_controller_master_5

/obj/machinery/atmospherics/air_pipe/process()
	//spawn while(1)
	if(oxy > 0 || nit > 0 || plas > 0)
//		world << "[x];[y];[z]"
		gas_move()

/obj/machinery/atmospherics/air_pipe/pipe/act()
	world << "[plas]"

/obj/machinery/atmospherics/air_pipe/pipe/gas_move()

	//
	// Передаем газ из одной трубы в другую
	//
	if(world.cpu > 50)
		sleep(1)

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
		if(istype(AP,/obj/machinery/atmospherics/air_pipe/pipe))
			if(AP.dir == dir)
				AP.oxy += oxy
				AP.nit += nit
				AP.plas += plas
				AP.temp = temp
				oxy = 0
				nit = 0
				plas = 0
				temp = 0

		if(istype(AP,/obj/machinery/atmospherics/air_pipe/pipe_angle))
			if(AP.dir == dir_num || AP.dir == dir_num2)
				AP.oxy += oxy
				AP.nit += nit
				AP.plas += plas
				AP.temp = temp
				oxy = 0
				nit = 0
				plas = 0
				temp = 0

		if(istype(AP,/obj/machinery/atmospherics/air_pipe/manifold))
			if(AP.dir == dir_num3 || AP.dir == dir_num4 || AP.dir == dir_num5)
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
