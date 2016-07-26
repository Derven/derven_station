/obj/item/weapon/gun
	icon = 'icons/obj/item/gun.dmi'
	icon_state = "advancelaser"

	pew(var/atom/AM)
		var/obj/beam/B = new (src.loc)
		if(B)
			walk_towards(B, AM, 2, 2)
			while(AM && B)
				sleep(1)
				if(AM && B)
					if(!(B.x == AM.x && B.y == AM.y))
						sleep(1)

					else if(AM.density == 1 && AM.pass != 1)
						AM.heat(LASER_POWER, ADVANCE_LASER_POINT)
						del(B)

					else if(B && B.move_ == 0)
						B.move_ = 1
						walk(B, B.dir, 2, 2)

/obj/item/weapon/gun/mini
	icon = 'icons/obj/item/gun.dmi'
	icon_state = "advancelaser_2"

	pew(var/atom/AM)
		var/obj/beam/B = new (src.loc)
		if(B)
			walk_towards(B, AM, 2, 2)
			while(AM && B)
				sleep(1)
				if(AM && B)
					if(!(B.x == AM.x && B.y == AM.y))
						sleep(1)

					else if(AM.density == 1 && AM.pass != 1)
						AM.heat(200, ADVANCE_LASER_POINT)
						del(B)

					else if(B && B.move_ == 0)
						B.move_ = 1
						walk(B, B.dir, 2, 2)



/obj/beam
	var/move_ = 0