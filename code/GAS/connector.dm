/obj/machinery/portable_atmospherics
	var/oxy = 0
	var/nit = 0
	var/plas = 0
	var/list/datum/reagents/chemical = list()
	icon = 'icons/obj/machine/atmos.dmi'
	density = 1

/obj/machinery/portable_atmospherics/canister
	var/connected = 0
	weight = 20
	var/open = 0

	act_by_item(var/obj/item/I)
		if(istype(I, /obj/item/weapon/tank))
			var/obj/item/weapon/tank/TANK = I
			if(oxy + plas + nit > 0)
				while(TANK.oxy + TANK.plasm + TANK.nit < 200 && oxy + plas + nit > 0)
					if(oxy > 0)
						TANK.oxy += 1
						oxy -=1
					if(plas > 0)
						TANK.plasm += 1
						plas -=1
					if(nit > 0)
						TANK.nit += 1
						nit -=1
				usr << "\blue You filled \icon[TANK]"
				usr << "\blue \icon[TANK] value: [TANK.oxy + TANK.plasm + TANK.nit]"


/obj/machinery/portable_atmospherics/canister/oxy
	oxy = 500
	nit = 0
	plas = 0
	icon_state = "canister_o"

/obj/machinery/portable_atmospherics/canister/nit
	oxy = 0
	nit = 500
	plas = 0
	icon_state = "canister_n"

/obj/machinery/portable_atmospherics/canister/plas
	oxy = 0
	nit = 0
	plas = 500
	icon_state = "canister_p"

/obj/machinery/atmospherics/air_pipe/pipe/connector
	icon = 'icons/obj/machine/atmos.dmi'
	icon_state = "connector"
	density = 0
	layer = 2.4
	anchored = 1

	New()
		pipes_list += src

/obj/machinery/portable_atmospherics/canister/act()
	var/turf/T = src.loc
	world << "oxy [oxy]; plas [plas]; nit [nit];"
	if(connected == 0 && open == 0)
		for(var/obj/machinery/atmospherics/air_pipe/pipe/connector/C in T)
			if(T)
				connected = 1
				usr << "You connected canister to the pipes"
				return

	if(connected == 1 && open == 1)
		for(var/obj/machinery/atmospherics/air_pipe/pipe/connector/C in T)
			if(T)
				connected = 0
				usr << "You unconnected canister to the pipes"
				return

	if(open == 0)
		open = 1
		usr << "You opened the canister"
		process()
		return

	if(open == 1)
		open = 0
		usr << "You closed the canister"
		return

/obj/machinery/portable_atmospherics/canister/process()
	while(open == 1 && (nit > 0 || plas > 0 || oxy > 0))
		sleep(1)
		for(var/turf/simulated/floor/F in range(1, src))
			if(windoors_on_turf[F.x][F.y] == 0)
				if(open == 1)
					if(nit > 5)
						nitrogen[F.x][F.y] += 5
						nit -= 5
					if(plas > 5)
						plasma[F.x][F.y] += 5
						plas -= 5
					if(oxy > 5)
						oxygen[F.x][F.y] += 5
						oxy -= 5

/obj/machinery/atmospherics/air_pipe/pipe/connector/gas_move()
	//
	// Передаем газ из одной трубы в другую
	//
//	world << "\red ****[oxy];[nit];[plas]****"
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
	use_canister()

/obj/machinery/atmospherics/air_pipe/pipe/connector/proc/use_canister()
	var/turf/T = src.loc
	for(var/obj/machinery/portable_atmospherics/canister/C in T)
		if(C.connected)
			if(C.oxy > 5)
				oxy += 5
				C.oxy -= 5

			if(C.plas > 5)
				plas += 5
				C.plas -=5

			if(C.nit > 5)
				nit += 5
				C.nit -=5

/obj/machinery/atmospherics/air_pipe/pipe/connector/process()
	use_canister()
	if(oxy > 0 || nit > 0 || plas > 0)
		gas_move()

/obj/machinery/atmospherics/air_pipe/pipe/connector/pipe_check(var/direction)
	for(var/obj/machinery/atmospherics/air_pipe/pipe/AP in get_step(src, direction))
		if(AP.dir == dir)
			AP.oxy += oxy
			AP.nit += nit
			AP.plas += plas
			AP.temp = temp
			oxy = 0
			nit = 0
			plas = 0
			temp = 0

/obj/machinery/atmospherics/air_pipe/pipe/connector/anglepipe_check(var/direction, var/dir_num, var/dir_num2)
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