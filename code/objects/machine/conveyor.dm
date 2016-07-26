/obj/machinery/conveyor
	name = "conveyor"
	icon = 'icons/obj/machine/conveyor.dmi'
	icon_state = "conveyor0"
	on = 0
	use_power = 1
	var/close = 1
	var/my_dir = 0
	pass_gas = 0
	layer = 7
	need_amperage = 20
	computer_access = "conv"

	New()
		computer_can += src

/obj/machinery/conveyor/proc/switch_me()
	if(on == 1)
		on = 0
		return
	else
		on = 1
		move_me()
		return

/obj/machinery/conveyor/proc/move_me()
	while(on == 1)
		sleep(1)
		if(my_dir == 0)
			icon_state = "conveyor1"
			var/turf/T = src.loc
			if(dir == 2)
				for(var/atom/movable/M in T)
					if(M != src)
						M.Move(get_step(src, SOUTH))
			if(dir == 4)
				for(var/atom/movable/M in T)
					if(M != src)
						M.Move(get_step(src, WEST))

		if(my_dir == 1)
			icon_state = "conveyor-1"
			var/turf/T = src.loc
			if(dir == 2)
				for(var/atom/movable/M in T)
					if(M != src)
						M.Move(get_step(src, NORTH))
			if(dir == 4)
				for(var/atom/movable/M in T)
					if(M != src)
						M.Move(get_step(src, EAST))
		sleep(1)