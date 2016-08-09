#define LASER_POWER 700
#define DERVENUS_LASER_POWER 99999
//�����������

#define ADVANCE_LASER_POINT 0.25
#define SUPER_MEGA_LASER_POINT 3

/obj/machinery/laser
	icon = 'icons/obj/machine/shaitan_machine.dmi'
	icon_state = "laser"

	act()
		for(var/mob/M in range(5,src))
			M << "\red <b>Pew-pew!</b>"
		if(dir == 1)
			var/turf/T = locate(x, y+1, z)
			var/obj/beam/B = new(T)
			B.dir = 1
			B.fly()

		if(dir == 2)
			var/turf/T = locate(x, y-1, z)
			var/obj/beam/B = new(T)
			B.dir = 2
			B.fly()

		if(dir == 4)
			var/turf/T = locate(x+1, y, z)
			var/obj/beam/B = new(T)
			B.dir = 4
			B.fly()

		if(dir == 8)
			var/turf/T = locate(x-1, y, z)
			var/obj/beam/B = new(T)
			B.dir = 8
			B.fly()

/obj/beam
	icon = 'icons/obj/machine/shaitan_machine.dmi'
	icon_state = "beam"
	name = "beam"
	density = 0
	var/brute_damage = 0
	var/burn_damage = 20
	var/attack_zone = 0

	Move()
		..()
		fly()

	proc/fly()
		var/hit = 0
		while(hit != 1)
			if(istype(loc, /turf/simulated/wall))
				hit = 1
				loc.hit()
				loc.heat(LASER_POWER, ADVANCE_LASER_POINT)

			for(var/atom/A in loc)
				if(A.density == 1 && A.pass != 1)
					hit = 1
					A.hit()
					A.heat(LASER_POWER, ADVANCE_LASER_POINT)

				if(istype(A, /mob/human))
					if(attack_zone != 0)
						switch(attack_zone)
							if("head")
								for(var/obj/item/organs/head/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("chest")
								for(var/obj/item/organs/chest/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("r_leg")
								for(var/obj/item/organs/r_leg/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("l_leg")
								for(var/obj/item/organs/l_leg/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("r_arm")
								for(var/obj/item/organs/r_arm/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("l_arm")
								for(var/obj/item/organs/l_arm/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

					if(attack_zone == 0)
						attack_zone = pick("head", "chest", "r_leg", "l_leg", "r_arm", "l_arm")
						switch(attack_zone)
							if("head")
								for(var/obj/item/organs/head/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("chest")
								for(var/obj/item/organs/chest/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("r_leg")
								for(var/obj/item/organs/r_leg/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("l_leg")
								for(var/obj/item/organs/l_leg/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("r_arm")
								for(var/obj/item/organs/r_arm/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

							if("l_arm")
								for(var/obj/item/organs/l_arm/O in A)
									if(O.hit_points > 1 && O.burn_points < 100)
										O.hit_points -= brute_damage
										O.burn_points += burn_damage

			sleep(1)
/*			if(dir == 2)
				y -= 1

			if(dir == 4)
				x += 1

			if(dir == 8)
				x -= 1

			if(dir == 1)
				y += 1
*/
		if(hit == 1)
			del(src)
			return

/obj/machinery/laser/big_gun
	act()
		for(var/mob/M in range(5,src))
			M << "\red <b>PEEEW!</b>"
		if(dir == 1)
			var/turf/T = locate(x, y+1, z)
			var/obj/beam/HAHAHA/B = new(T)
			B.dir = 1
			B.fly()

		if(dir == 2)
			var/turf/T = locate(x, y-1, z)
			var/obj/beam/HAHAHA/B = new(T)
			B.dir = 2
			B.fly()

		if(dir == 4)
			var/turf/T = locate(x+1, y, z)
			var/obj/beam/HAHAHA/B = new(T)
			B.dir = 4
			B.fly()

		if(dir == 8)
			var/turf/T = locate(x-1, y, z)
			var/obj/beam/HAHAHA/B = new(T)
			B.dir = 8
			B.fly()

/obj/beam/proc/for_you(var/mob/human/A, var/obj/item/organs/O)
	for(O in A)
		if(O.hit_points > 1 && O.burn_points < 100)
			O.hit_points -= brute_damage
			O.burn_points += burn_damage

/obj/beam/HAHAHA
	burn_damage = 1000
	fly()
		var/hit = 0
		while(hit != 1)
			if(istype(loc, /turf/simulated/wall))
				hit = 1
				loc.hit(src)
				loc.heat(DERVENUS_LASER_POWER, SUPER_MEGA_LASER_POINT)

			for(var/atom/A in loc)
				if(A.density == 1 && A.pass != 1)
					hit = 1
					A.hit()
					A.heat(DERVENUS_LASER_POWER, SUPER_MEGA_LASER_POINT)
					if(istype(A, /atom/movable))
						var/atom/movable/M = A
						M.force_to(round(burn_damage/100, dir))

				if(istype(A, /mob/human))
					if(attack_zone != 0)
						switch(attack_zone)
							if("head")
								var/obj/item/organs/head/O = new()
								for_you(O, A)

							if("chest")
								var/obj/item/organs/chest/O = new()
								for_you(O, A)

							if("r_leg")
								var/obj/item/organs/r_leg/O = new()
								for_you(O, A)

							if("l_leg")
								var/obj/item/organs/l_leg/O = new()
								for_you(O, A)

							if("r_arm")
								var/obj/item/organs/r_arm/O = new()
								for_you(O, A)

							if("l_arm")
								var/obj/item/organs/l_arm/O = new()
								for_you(O, A)

					if(attack_zone == 0)
						attack_zone = pick("head", "chest", "r_leg", "l_leg", "r_arm", "l_arm")
						switch(attack_zone)
							if("head")
								var/obj/item/organs/head/O = new()
								for_you(O, A)

							if("chest")
								var/obj/item/organs/chest/O = new()
								for_you(O, A)

							if("r_leg")
								var/obj/item/organs/r_leg/O = new()
								for_you(O, A)

							if("l_leg")
								var/obj/item/organs/l_leg/O = new()
								for_you(O, A)

							if("r_arm")
								var/obj/item/organs/r_arm/O = new()
								for_you(O, A)

							if("l_arm")
								var/obj/item/organs/l_arm/O = new()
								for_you(O, A)
			sleep(1)
			if(dir == 2)
				y -= 1

			if(dir == 4)
				x += 1

			if(dir == 8)
				x -= 1

			if(dir == 1)
				y += 1

		if(hit == 1)
			del(src)
