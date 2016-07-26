/atom/movable
	proc/force_to(var/value_of_force, var/dir_of_force)
		if(anchored == 0 && weight < value_of_force * 10 && density == 0)
			var/turf/T2 = get_step(src, dir_of_force)
			while(value_of_force > 0)
				if(istype(src, /obj/machinery/light) || istype(src, /obj/cable))
					value_of_force = 0
					destroy()
				else
					for(var/atom/movable/M in T2) // попадание во что-то
						sleep(1)
						if(M.density == 1)
							if(M.get_endurance() < value_of_force)
								frag(value_of_force)
								destroy()
							else if(M.get_endurance() + M.get_resilience() < round(get_endurance() * value_of_force / 2))
								M.frag(value_of_force)
								M.destroy()
							else
								M.hit(src, dir_of_force, value_of_force)
								return

					if(istype(T2, /turf/simulated/wall)) // попадание в стену
						var/turf/simulated/wall/W = T2
						sleep(1)
						if(W.get_endurance() < value_of_force)
							frag(value_of_force)
							destroy()
						else if(W.get_endurance() + W.get_resilience() < round(get_endurance() * value_of_force / 2))
							W.frag(value_of_force)
							W.destroy()
						else
							W.hit(src, dir_of_force, value_of_force)
						return

					Move(get_step(src, dir_of_force))
					sleep(1)
					var/cur_gas = oxygen[x][y] + nitrogen[x][y] + plasma[x][y]
					value_of_force -= round(cur_gas/100) //атмосфера тормозит движение
					if(value_of_force < 0)
						value_of_force = 0

					var/turf/T = src.loc
					var/turf/zad = get_step(src, turn(dir, 180))

					if(istype(T, /turf/simulated/wall))
						if(T.get_endurance() < value_of_force)
							frag(value_of_force)
							destroy()
						else if(T.get_endurance() + T.get_resilience() < round(get_endurance() * value_of_force / 2))
							T.frag(value_of_force)
							T.destroy()
						else
							T.hit(src, dir_of_force, value_of_force)
							Move(zad)

					for(var/atom/movable/M in T) // попадание во что-то
						sleep(1)
						if(M.density == 1)
							if(M.get_endurance() < value_of_force)
								frag(value_of_force)
								destroy()
							else if(M.get_endurance() + M.get_resilience() < round(get_endurance() * value_of_force / 2))
								M.frag(value_of_force)
								M.destroy()
							else
								M.hit(src, dir_of_force, value_of_force)
								Move(zad)

/proc/BOOM(var/turf/center_of_explode, var/force_v)
	var/list/directions = list(SOUTH, WEST, NORTH, EAST)
	pressure[center_of_explode.x][center_of_explode.y] += force_v * 12
	for(var/my_direction in directions)

		if(force_v > 25)
			for(var/turf/simulated/wall/W in get_step(center_of_explode, my_direction))
				del(W)

		for(var/atom/movable/AM in range(round(force_v / 15), center_of_explode))
			if(!istype(AM, /obj/beam))
				AM.force_to(force_v, my_direction)

		for(var/atom/movable/AM in center_of_explode)
			del(AM)

atom/proc/frag(var/force_)
	for(var/atom/movable/AM in range(round(force_ / 4), src))
		AM.frag_damage()

/atom/proc/frag_damage()

/obj/item/explode_generator
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "radiotest"

	act_self(src)
		var/turf/T = usr.loc
		BOOM(T, 15)

/obj/item/plasma_generator
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "radiotest"

	act_self(src)
		plasma[usr.x][usr.y] += 600

/obj/item/pressure_generator
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "radiotest"

	act_self(src)
		pressure[usr.x][usr.y] += 600

/atom/proc/destroy()
	del(src)

/obj/machinery/light/destroy()
	broken = 1

/obj/cable/destroy()
	return