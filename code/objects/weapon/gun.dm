/obj/item/weapon/gun/lasergun
	icon = 'icons/obj/item/gun.dmi'
	icon_state = "advancelaser"

	pew()
		for(var/mob/M in range(5,src))
			M << "\red <b>Pew-pew!</b>"

		if(usr.dir == 1)
			var/turf/T = locate(usr.x, usr.y+1, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 1
			B.attack_zone = usr.zone
			usr.force_to(5, SOUTH)
			B.fly()
			return

		if(usr.dir == 2)
			var/turf/T = locate(usr.x, usr.y-1, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 2
			B.attack_zone = usr.zone
			usr.force_to(5, NORTH)
			B.fly()
			return

		if(usr.dir == 4)
			var/turf/T = locate(usr.x+1, usr.y, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 4
			B.attack_zone = usr.zone
			usr.force_to(5, WEST)
			B.fly()
			return

		if(usr.dir == 8)
			var/turf/T = locate(usr.x-1, usr.y, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 8
			B.attack_zone = usr.zone
			usr.force_to(5, EAST)
			B.fly()
			return

		return

/obj/item/weapon/gun/lasergun/grandfather
	pew()
		for(var/mob/M in range(5,src))
			M << "\red <b>Pew-pew!</b>"

		if(usr.dir == 1)
			var/turf/T = locate(usr.x, usr.y+1, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 1
			B.attack_zone = usr.zone
			usr.force_to(65, SOUTH)
			B.fly()
			return

		if(usr.dir == 2)
			var/turf/T = locate(usr.x, usr.y-1, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 2
			B.attack_zone = usr.zone
			usr.force_to(65, NORTH)
			B.fly()
			return

		if(usr.dir == 4)
			var/turf/T = locate(usr.x+1, usr.y, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 4
			B.attack_zone = usr.zone
			usr.force_to(65, WEST)
			B.fly()
			return

		if(usr.dir == 8)
			var/turf/T = locate(usr.x-1, usr.y, usr.z)
			var/obj/beam/B = new(T)
			B.dir = 8
			B.attack_zone = usr.zone
			usr.force_to(65, EAST)
			B.fly()
			return

		return