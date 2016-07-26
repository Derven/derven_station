/mob/human/proc/help_me_doctor(var/obj/item/I, var/obj/item/organs/O)
	if(istype(I,/obj/item/medical/brute/gel))
		for(O in src)
			usr << "\blue You use [I]!"
			src << "\blue [usr] use [I] "
			while(O.hit_points < 100 && I.medical_power > 1)
				O.hit_points += 1
				I.medical_power -= 1

				if(I.medical_power == 1)
					usr << "\red [I] has ended"

/mob/human/proc/EXTINGUISH(var/obj/item/I, var/obj/item/organs/O) ///NO
	if(istype(I,/obj/item/medical/burn/gel))
		for(O in src)
			usr << "\blue You use [I]!"
			src << "\blue [usr] use [I] "
			while(O.burn_points > 0 && I.medical_power > 1)
				O.burn_points -= 1
				I.medical_power -= 1

			if(I.medical_power == 1)
				usr << "\red [I] has ended"

/mob/human/proc/punch_me_doc(var/obj/item/I, var/obj/item/organs/O)
	usr << "\red You attack [src] with [I]!"
	src << "\red [usr] attack you with [I] "
	if(O.hit_points > 1 && O.burn_points < 100 && get_armor() < I.brute_damage + I.burn_damage)
		if(I.brute_damage - get_armor() > 0)
			O.hit_points -= I.brute_damage - get_armor()
			if(O.inner_organ)
				O.inner_organ.hit_points -= round((I.brute_damage/2) - (get_armor() / 2))
				world << "[O.inner_organ.hit_points]"
		if(I.burn_damage - get_armor() > 0)
			O.burn_points += I.burn_damage - get_armor()

/mob/human/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/medical/brute/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				var/obj/item/organs/chest/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "head")
				var/obj/item/organs/head/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "r_leg")
				var/obj/item/organs/r_leg/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "l_leg")
				var/obj/item/organs/l_leg/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "l_arm")
				var/obj/item/organs/l_arm/O = new()
				help_me_doctor(I, O)

			if(usr.client.zone == "r_arm")
				var/obj/item/organs/r_arm/O = new()
				help_me_doctor(I, O)

//FIRE FIRE FIRE

	if(istype(I,/obj/item/medical/burn/gel))
		if(usr.client.act == "help")
			if(usr.client.zone == "chest")
				var/obj/item/organs/chest/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "head")
				var/obj/item/organs/head/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "r_leg")
				var/obj/item/organs/r_leg/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "l_leg")
				var/obj/item/organs/l_leg/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "l_arm")
				var/obj/item/organs/l_arm/O = new()
				EXTINGUISH(I, O)

			if(usr.client.zone == "r_arm")
				var/obj/item/organs/r_arm/O = new()
				EXTINGUISH(I, O)

	if(!istype(I,/obj/item/medical))
		if(usr.client.act == "harm")
			if(usr.client.zone == "chest")
				for(var/obj/item/organs/chest/O in src)
					punch_me_doc(I, O)

			if(usr.client.zone == "head")
				for(var/obj/item/organs/head/O in src)
					punch_me_doc(I, O)

			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor() > 20)
						r_leg_broken = 1
						src << "\red <font size = 5>*Click* Right leg is broken!</font>"
						lying()

			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor() > 20)
						l_leg_broken = 1
						src << "\red <font size = 5>*Click* Left leg is broken!</font>"
						lying()

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_arm/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor() > 20)
						l_arm_broken = 1
						src << "\red <font size = 5>*Click* Left arm is broken!</font>"
						drop_all()

			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/r_arm/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor() > 20)
						r_arm_broken = 1
						src << "\red <font size = 5>*Click* Right arm is broken!</font>"
						drop_all()

		if(istype(I,/obj/item/weapon/stunbaton))
			var/obj/item/weapon/stunbaton/S = I
			if(usr.client.act == "help")
				src << "\red <b>You feel some shock!</b>"
				usr.client.D.act()
				lying()
				sleep(S.force)
				unlying()