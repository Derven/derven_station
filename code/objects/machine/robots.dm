/obj/machinery/robot
	icon = 'icons/obj/robot.dmi'
	icon_state = "classic"

	Adam
		icon_state = "adam"

	James
		icon_state = "james"

/obj/item/robot_master
	icon = 'icons/obj/item/tools.dmi'
	icon_state = "radiotest"

	act_self(src)
		var/turf/T = usr.loc
		for(var/obj/machinery/robot/R in range(5, usr))
			R.action(T)

/obj/machinery/robot
	var/on_me = 0
	var/turf/cur_target = null

	proc/action(var/turf/T)
		if(Move_to_target(T))
			message_for_mobs(5, "\blue *BEEP*")

	proc/Move_to_target(var/turf/T)
		var/turf/TURF
		while(T != TURF)
			sleep(4)

			if(T.x > x)
				TURF = locate(x + 1, y, z)
				if(check_density(TURF))
					Move(TURF)
				else
					if(T.y > y)
						TURF = locate(x, y + 1, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.y < y)
						TURF = locate(x, y - 1, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.y == y)
						TURF = locate(x + 1, y + 1, z)

						if(check_density(TURF))
							Move(TURF)
						else
							var/turf/TURF_2 = locate(x + 1, y - 1, z)
							if(check_density(TURF_2))
								Move(TURF_2)
							else
								var/DIRECTION = pick(NORTH, SOUTH)
								while(!check_density(TURF_2) || !check_density(TURF))
									sleep(1)
									TURF = locate(x + 1, y + 1, z)
									TURF_2 = locate(x + 1, y - 1, z)
									var/turf/TURF_3
									if(DIRECTION == NORTH)
										TURF_3 = locate(x, y + 1, z)
										if(check_density(TURF_3))
											Move(TURF_3)
									else
										TURF_3 = locate(x, y - 1, z)
										if(check_density(TURF_3))
											Move(TURF_3)

			if(T.y > y)
				TURF = locate(x, y + 1, z)
				if(check_density(TURF))
					Move(TURF)
				else
					if(T.x > x)
						TURF = locate(x + 1, y, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.x < x)
						TURF = locate(x - 1, y, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.x == x)
						TURF = locate(x + 1, y + 1, z)

						if(check_density(TURF))
							Move(TURF)
						else
							var/turf/TURF_2 = locate(x - 1, y + 1, z)
							if(check_density(TURF_2))
								Move(TURF_2)
							else
								var/DIRECTION = pick(WEST, EAST)
								while(!check_density(TURF_2) || !check_density(TURF))
									sleep(1)
									TURF = locate(x - 1, y + 1, z)
									TURF_2 = locate(x + 1, y + 1, z)
									var/turf/TURF_3
									if(DIRECTION == EAST)
										TURF_3 = locate(x + 1, y, z)
										if(check_density(TURF_3))
											Move(TURF_3)
									else
										TURF_3 = locate(x - 1, y, z)
										if(check_density(TURF_3))
											Move(TURF_3)

			if(T.x < x)
				TURF = locate(x - 1, y, z)
				if(check_density(TURF))
					Move(TURF)
				else
					if(T.y < y)
						TURF = locate(x, y - 1, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.y > y)
						TURF = locate(x, y + 1, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.y == y)
						TURF = locate(x - 1, y - 1, z)

						if(check_density(TURF))
							Move(TURF)
						else
							var/turf/TURF_2 = locate(x - 1, y + 1, z)
							if(check_density(TURF_2))
								Move(TURF_2)

							else
								var/DIRECTION = pick(NORTH, SOUTH)
								while(!check_density(TURF_2) || !check_density(TURF))
									sleep(1)
									TURF = locate(x - 1, y - 1, z)
									TURF_2 = locate(x - 1, y + 1, z)
									var/turf/TURF_3
									if(DIRECTION == NORTH)
										TURF_3 = locate(x, y + 1, z)
										if(check_density(TURF_3))
											Move(TURF_3)
									else
										TURF_3 = locate(x, y - 1, z)
										if(check_density(TURF_3))
											Move(TURF_3)

			if(T.y < y)
				TURF = locate(x, y - 1, z)
				if(check_density(TURF))
					Move(TURF)
				else
					if(T.x < x)
						TURF = locate(x - 1, y, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.x > x)
						TURF = locate(x + 1, y, z)
						if(check_density(TURF))
							Move(TURF)

					if(T.x == x)
						TURF = locate(x - 1, y - 1, z)

						if(check_density(TURF))
							Move(TURF)
						else
							var/turf/TURF_2 = locate(x + 1, y - 1, z)
							if(check_density(TURF_2))
								Move(TURF_2)
							else
								var/DIRECTION = pick(WEST, EAST)
								while(!check_density(TURF_2) || !check_density(TURF))
									sleep(1)
									TURF = locate(x - 1, y - 1, z)
									TURF_2 = locate(x + 1, y - 1, z)
									var/turf/TURF_3
									if(DIRECTION == EAST)
										TURF_3 = locate(x + 1, y, z)
										if(check_density(TURF_3))
											Move(TURF_3)
									else
										TURF_3 = locate(x - 1, y, z)
										if(check_density(TURF_3))
											Move(TURF_3)
		return 1

/atom/proc/check_density(var/turf/T)
	if(T.density == 0)
		for(var/atom/movable/AM in T)
			if(AM.density == 1)
				return 0
			else
				return 1
		return 1
	else
		return 0