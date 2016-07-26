/obj/machinery/collector
	icon = 'icons/obj/POWER.dmi'
	icon_state = "collector"

	proc/input_(var/my_power)
		for(var/obj/machinery/smes/S in smes)
			if(S)
				if(S.powernet == powernet)
					S.new_power += my_power
					S.power += S.new_power

	New()
		var/area/MyArea = src.loc.loc
		MyArea.collector_list += src
		..()

/obj/machinery/acceleartor

	icon = 'icons/obj/POWER.dmi'
	icon_state = "accelerator"
	density = 1

	act()
		pew(dir)

	pew(var/dir_)
		var/new_singularity = 0
		flick("accelerator_active", src)
		var/obj/beam/B = new (src.loc)
		walk(B, dir_, 2, 2)
		while(new_singularity != 1 || get_dist(B.loc, src.loc) > 10)
			sleep(1)
			var/turf/T = B.loc
			for(var/obj/singularity_target/TG in T)
				new_singularity = 1

		if(new_singularity == 1)
			var/obj/singularity/S = new(B.loc)
			world << "[S.x];[S.y]"
		del(B)

/obj/singularity_target
	icon = 'icons/obj/POWER.dmi'
	icon_state = "target"

/obj/machinery/field_generator
	icon = 'icons/obj/POWER.dmi'
	icon_state = "field_generator"
	var/POWER = 0

	proc/generate(var/POWER_PLUS)
		POWER += POWER_PLUS
		while(POWER)
			sleep(10)
			POWER -= 10


/obj/field
	icon = 'icons/obj/POWER.dmi'
	icon_state = "field"

	CheckPass(atom/movable/O, target as turf)
		/* Does SOUTHWEST do something hacky for windows, like defines a full 1 square window? --Stephen001 */
		if(istype(O, /obj/beam))
			return 1
		if(istype(O, /obj/singularity))
			var/obj/singularity/S = O
			if(S.my_state == 2)
				return 1
			else
				return 0
		if (src.dir == SOUTHWEST)
			return 0
		else if (get_dir(target, O.loc) == src.dir)
			return 0
		return 1

	CheckExit(atom/movable/O, target as turf)
		if (istype(O, /obj/beam))
			return 1
		if(istype(O, /obj/singularity))
			var/obj/singularity/S = O
			if(S.my_state == 2)
				return 1
			else
				return 0
		if (get_dir(O.loc, target) == src.dir)
			return 0
		return 1

/obj/singularity
	icon = 'icons/obj/POWER.dmi'
	icon_state = "singularity"
	var/power_gen = 0
	var/my_state = 1
	var/level_up = 0

	proc/RAND_MOVE(var/turf/T)
		var/turf/T2 = get_step(T, pick(SOUTH, WEST, EAST, NORTH))
		Move(T2)

	proc/walk_()
		//walk_rand(src, 25,2)
		var/turf/T
		spawn while(1)
			sleep(2)
			T = src.loc
			RAND_MOVE(T)
			power_gen += rand(1500, 2500)
			var/area/MyArea = src.loc.loc
			for(var/obj/machinery/collector/C in MyArea.collector_list)
				C.input_(power_gen)
			for(var/atom/AM in orange(T, my_state * 2))
				sleep(1)
				if(!istype(AM, /area))
					if(get_dist(AM, src) < 3)
						if(istype(AM, /atom/movable))
							if(my_state < 2)
								if(!istype(AM, /obj/machinery/field_generator) && !istype(AM, /obj/field))
									if(src != AM)
										message_for_mobs(5, "\red [src] do something")
										if(AM)
											AM.stop_process = 1
											sleep(3)
											AM.destroy()
											if(level_up < 100)
												level_up += 10
											else
												my_state = 2
												icon = 'icons/obj/SING.dmi'
												icon_state = "second"
							else
								if(src != AM)
									message_for_mobs(5, "\red [src] do something")
									if(AM)
										AM.stop_process = 1
										sleep(3)
										AM.destroy()
										if(level_up < 100)
											level_up += 10
										else
											my_state = 2
											icon = 'icons/obj/SING.dmi'
											icon_state = "second"
						else
							if(istype(AM, /atom/movable))
								var/atom/movable/A = AM
								if(A)
									A.density = 0
									A.anchored = 0
									walk_towards(A, src, 3, 3)
									message_for_mobs(5, "\red [src] pull [AM] to yourself")
							else
								if(!istype(AM, /turf/space))
									del(AM)
	New()
		walk_()
		..()

	Bump(var/obj/field/F)
		if(my_state < 2)
			Move(src.loc, turn(dir, 180))

/obj/tornado
	icon = null
	var/power_gen = 0
	var/my_state = 1
	var/level_up = 0

	proc/walk_()
		spawn while(1)
			sleep(2)
			var/turf/T = src.loc
			for(var/atom/AM in orange(T, my_state * 2))
				step_rand(src, 2)
				if(src != AM)
					if(AM.loc == src.loc)
						del(AM)
						if(level_up < 100)
							level_up += 10
						else
							my_state = 2
							icon = 'icons/obj/SING.dmi'
							icon_state = "second"
					else
						if(istype(AM, /atom/movable))
							var/atom/movable/A = AM
							A.density = 0
							A.anchored = 0
							walk_towards(A, src, 3, 3)
						else
							if(!istype(AM, /turf/space))
								del(AM)

	New()
		walk_()
		..()


	hit(var/atom/movable/A, var/direction, var/force)
		if(istype(A, /obj/beam))
			if(A)
				power_gen = rand(3000, 5000)
				del(A)