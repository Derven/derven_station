/obj/machinery/atmospherics/air_pipe/pipe/filter/oxy
	icon_state = "filter"

/obj/machinery/atmospherics/air_pipe/pipe/filter/plas
	icon_state = "filter"

/obj/machinery/atmospherics/air_pipe/pipe/filter/nit
	icon_state = "filter"

/obj/machinery/atmospherics/air_pipe/pipe/filter/gas_move()
	//
	// Передаем газ из одной трубы в другую
	//
//	world << "****[oxy];[nit];[plas]****"
	if(dir == 4)
		pipe_check(WEST)
		anglepipe_check(WEST, 2, 4)
		manifold_check(WEST, 8, 4, 2)

		middle_pipe_check(SOUTH, 2)
		middle_anglepipe_check(SOUTH, 9, 5)

	if(dir == 8)
		pipe_check(EAST)
		anglepipe_check(EAST, 8, 1)
		manifold_check(EAST, 8, 4, 1)

		middle_pipe_check(NORTH, 1)
		middle_anglepipe_check(NORTH, 10, 6)

	if(dir == 2)
		pipe_check(SOUTH)
		anglepipe_check(SOUTH, 9, 5)
		manifold_check(SOUTH, 2, 8, 1)

		middle_pipe_check(EAST, 8)
		middle_anglepipe_check(EAST, 8, 1)

	if(dir == 1)
		pipe_check(NORTH)
		anglepipe_check(NORTH, 10, 6)
		manifold_check(NORTH, 2, 4, 1)

		middle_pipe_check(WEST, 4)
		middle_anglepipe_check(WEST, 2, 4)

/obj/machinery/atmospherics/air_pipe/pipe/filter/proc/middle_pipe_check(var/direction, var/dir_num)
/obj/machinery/atmospherics/air_pipe/pipe/filter/proc/middle_anglepipe_check(var/direction, var/dir_num, var/dir_num2)

/obj/machinery/atmospherics/air_pipe/pipe/filter/oxy/pipe_check(var/direction)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir)
			//AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			//oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/oxy/middle_pipe_check(var/direction, var/dir_num)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir_num)
			AP.oxy += oxy
			AP.temp = temp
			oxy = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/oxy/anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			//AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			//oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/oxy/middle_anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			AP.oxy += oxy
			AP.temp = temp
			oxy = 0
			temp = 0

//nit
//да, знаю, индусский код, исправлю потом
//Времени-то мало, а нужна ТГ карта и вагон фич

/obj/machinery/atmospherics/air_pipe/pipe/filter/nit/pipe_check(var/direction)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir)
			AP.oxy += oxy
			//AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			//nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/nit/middle_pipe_check(var/direction, var/dir_num)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir_num)
			AP.nit += nit
			AP.temp = temp
			nit = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/nit/anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			//AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			//oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/nit/middle_anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			AP.nit += nit
			AP.temp = temp
			nit = 0
			temp = 0

//plas


/obj/machinery/atmospherics/air_pipe/pipe/filter/plas/pipe_check(var/direction)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir)
			AP.oxy += oxy
			AP.nit += nit
			//AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			//plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/plas/middle_pipe_check(var/direction, var/dir_num)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir_num)
			AP.plas += plas
			AP.temp = temp
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/plas/anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			AP.oxy += oxy
			AP.nit += nit
			//AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			//plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/filter/plas/middle_anglepipe_check(var/direction, var/dir_num, var/dir_num2)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/AP in get_step(src, direction))
		if(AP.dir == dir_num || AP.dir == dir_num2)
			AP.plas += plas
			AP.temp = temp
			plas = 0
			temp = 0
