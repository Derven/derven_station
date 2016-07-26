/obj/machinery/atmospherics/air_pipe/manifold
	icon = 'icons/obj/machine/atmos.dmi'
	icon_state = "pipe_manifold"
	density = 0
	layer = 2.4
	anchored = 1


/obj/machinery/atmospherics/air_pipe/manifold/gas_move()
	var/sum_of_pipe_num = 0
	if(nit > 1 || plas > 1 || oxy > 1)

		if(dir == 8)
			check_pipe_to(EAST, 4)
			check_pipe_to(NORTH, 2)
			check_pipe_to(WEST, 8)

			check_Apipe_to(WEST, 5)
			check_Apipe_to(NORTH, 2)
			check_Apipe_to(EAST, 10)
			check_Apipe_to(WEST, 6)
			check_Apipe_to(NORTH, 1)
			check_Apipe_to(EAST, 9)

			check_manifold_to()

			sum_of_pipe_num = num_of_pipe(WEST, NORTH, EAST, 4, 1, 8) + num_of_Apipe(WEST, NORTH, EAST, 4, 6, 1) + num_of_Apipe(WEST, NORTH, EAST, 2, 10, 8)

			plas = plas / sum_of_pipe_num
			oxy = oxy / sum_of_pipe_num
			nit = nit / sum_of_pipe_num

			FROM_MANIFOLD_TO_ALL_PIPES(WEST, NORTH, EAST, 4, 1, 8)
			FROM_MANIFOLD_TO_ALL_APIPES(WEST, NORTH, EAST, 4, 6, 1)
			FROM_MANIFOLD_TO_ALL_APIPES(WEST, NORTH, EAST, 2, 10, 8)

			plas = 0
			oxy = 0
			nit = 0

		if(dir == 4)
			check_pipe_to(EAST, 4)
			check_pipe_to(SOUTH, 1)
			check_pipe_to(WEST, 8)

			check_Apipe_to(WEST, 5)
			check_Apipe_to(SOUTH, 8)
			check_Apipe_to(EAST, 10)
			check_Apipe_to(WEST, 6)
			check_Apipe_to(SOUTH, 4)
			check_Apipe_to(EAST, 9)

			check_manifold_to()

			sum_of_pipe_num = num_of_pipe(WEST, SOUTH, EAST, 4, 2, 8) + num_of_Apipe(WEST, SOUTH, EAST, 4, 9, 1) + num_of_Apipe(WEST, SOUTH, EAST, 2, 5, 8)

			plas = plas / sum_of_pipe_num
			oxy = oxy / sum_of_pipe_num
			nit = nit / sum_of_pipe_num

			FROM_MANIFOLD_TO_ALL_PIPES(WEST, NORTH, EAST, 4, 2, 8)
			FROM_MANIFOLD_TO_ALL_APIPES(WEST, NORTH, EAST, 4, 9, 1)
			FROM_MANIFOLD_TO_ALL_APIPES(WEST, NORTH, EAST, 2, 5, 8)

			plas = 0
			oxy = 0
			nit = 0

		if(dir == 2)

			check_pipe_to(NORTH, 2)
			check_pipe_to(EAST, 4)
			check_pipe_to(SOUTH, 1)

			check_Apipe_to(NORTH, 2)
			check_Apipe_to(EAST, 10)
			check_Apipe_to(SOUTH, 8)
			check_Apipe_to(NORTH, 1)
			check_Apipe_to(EAST, 9)
			check_Apipe_to(SOUTH, 4)

			check_manifold_to()

			sum_of_pipe_num = num_of_pipe(NORTH, EAST, SOUTH, 1, 8, 2) + num_of_Apipe(NORTH, EAST, SOUTH, 6, 1, 9) + num_of_Apipe(NORTH, EAST, SOUTH, 10, 8, 5)

			plas = plas / sum_of_pipe_num
			oxy = oxy / sum_of_pipe_num
			nit = nit / sum_of_pipe_num

			FROM_MANIFOLD_TO_ALL_PIPES(NORTH, EAST, SOUTH, 1, 8, 2)
			FROM_MANIFOLD_TO_ALL_APIPES(NORTH, EAST, SOUTH, 6, 1, 9)
			FROM_MANIFOLD_TO_ALL_APIPES(NORTH, EAST, SOUTH, 10, 8, 5)

			plas = 0
			oxy = 0
			nit = 0

		if(dir == 1)

			check_pipe_to(NORTH, 2)
			check_pipe_to(WEST, 8)
			check_pipe_to(SOUTH, 1)

			check_Apipe_to(NORTH, 2)
			check_Apipe_to(WEST, 5)
			check_Apipe_to(SOUTH, 8)
			check_Apipe_to(NORTH, 1)
			check_Apipe_to(WEST, 6)
			check_Apipe_to(SOUTH, 4)

			check_manifold_to()

			sum_of_pipe_num = num_of_pipe(NORTH, WEST, SOUTH, 1, 4, 2) + num_of_Apipe(NORTH, WEST, SOUTH, 6, 4, 9) + num_of_Apipe(NORTH, WEST, SOUTH, 10, 2, 5)

			plas = plas / sum_of_pipe_num
			oxy = oxy / sum_of_pipe_num
			nit = nit / sum_of_pipe_num

			FROM_MANIFOLD_TO_ALL_PIPES(NORTH, WEST, SOUTH, 1, 4, 2)
			FROM_MANIFOLD_TO_ALL_APIPES(NORTH, WEST, SOUTH, 6, 4, 9)
			FROM_MANIFOLD_TO_ALL_APIPES(NORTH, WEST, SOUTH, 10, 2, 5)

			plas = 0
			oxy = 0
			nit = 0
		sleep(1)

/obj/machinery/atmospherics/air_pipe/manifold/proc/check_pipe_to(var/direction, var/dir_num)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction))
		if(P.dir == dir_num)
			plas += P.plas
			oxy += P.oxy
			nit += P.nit
			temp = P.temp
			P.plas = 0
			P.oxy = 0
			P.nit = 0

/obj/machinery/atmospherics/air_pipe/manifold/proc/check_Apipe_to(var/direction, var/dir_num)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction))
		if(P.dir == dir_num)
			plas += P.plas
			oxy += P.oxy
			nit += P.nit
			temp = P.temp
			P.plas = 0
			P.oxy = 0
			P.nit = 0

/obj/machinery/atmospherics/air_pipe/manifold/proc/check_manifold_to()
	for(var/obj/machinery/atmospherics/air_pipe/manifold/P in range(src, 1))
		if(P.plas > plas)
			plas += P.plas
			P.plas = 0

		if(P.oxy > oxy)
			oxy += P.oxy
			P.oxy = 0

		if(P.nit > nit)
			nit += P.nit
			P.nit = 0

		temp = P.temp

/obj/machinery/atmospherics/air_pipe/manifold/proc/num_of_pipe(var/direction_1, var/direction_2, var/direction_3, var/dirnum1, var/dirnum2, var/dirnum3)
	var/num_of_pipe = 0
	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction_1))
		if(P.dir == dirnum1)
			num_of_pipe += 1

	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction_2))
		if(P.dir == dirnum2)
			num_of_pipe += 1

	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction_3))
		if(P.dir == dirnum3)
			num_of_pipe += 1

	return num_of_pipe

/obj/machinery/atmospherics/air_pipe/manifold/proc/num_of_Apipe(var/direction_1, var/direction_2, var/direction_3, var/dirnum1, var/dirnum2, var/dirnum3)
	var/num_of_pipe = 0
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction_1))
		if(P.dir == dirnum1)
			num_of_pipe += 1

	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction_2))
		if(P.dir == dirnum2)
			num_of_pipe += 1

	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction_3))
		if(P.dir == dirnum3)
			num_of_pipe += 1

	return num_of_pipe

/obj/machinery/atmospherics/air_pipe/manifold/proc/FROM_MANIFOLD_TO_ALL_PIPES(var/direction_1, var/direction_2, var/direction_3, var/dirnum1, var/dirnum2, var/dirnum3)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction_1))
		if(P.dir == dirnum1)
			P.oxy += oxy
			P.plas += plas
			P.nit += nit

	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction_2))
		if(P.dir == dirnum2)
			P.oxy += oxy
			P.plas += plas
			P.nit += nit

	for(var/obj/machinery/atmospherics/air_pipe/pipe/P in get_step(src, direction_3))
		if(P.dir == dirnum3)
			P.oxy += oxy
			P.plas += plas
			P.nit += nit

/obj/machinery/atmospherics/air_pipe/manifold/proc/FROM_MANIFOLD_TO_ALL_APIPES(var/direction_1, var/direction_2, var/direction_3, var/dirnum1, var/dirnum2, var/dirnum3)
	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction_1))
		if(P.dir == dirnum1)
			P.oxy += oxy
			P.plas += plas
			P.nit += nit

	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction_2))
		if(P.dir == dirnum2)
			P.oxy += oxy
			P.plas += plas
			P.nit += nit

	for(var/obj/machinery/atmospherics/air_pipe/pipe_angle/P in get_step(src, direction_3))
		if(P.dir == dirnum3)
			P.oxy += oxy
			P.plas += plas
			P.nit += nit