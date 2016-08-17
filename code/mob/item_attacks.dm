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

/mob
	proc
		shake_me(var/client/C, var/END)
			if(C)
				var/count = 0
				while(count < END)
					C.eye = pick(locate(x - 1, y, z), locate(x + 1, y, z), locate(x, y - 1, z), locate(x, y + 1, z))
					sleep(1)
					count += 1
				C.eye = src

/mob/human/proc/punch_me_doc(var/obj/item/I, var/obj/item/organs/O)
	if(usr.client.foul_blow == "eye")
		eye_attack(usr)
	if(usr.client.foul_blow == "stomach")
		stomach_attack(usr)
	if(usr.client.foul_blow == "groin")
		groin_attack(usr)
	usr.client.foul_blow = "no"
	usr.client.EY.icon_state = "foul_blow_eyes"
	usr.client.ST.icon_state = "foul_blow_stomach"
	usr.client.GR.icon_state = "foul_blow_groin"
	usr << "\red You attack [src] with [I]!"
	src << "\red [usr] attack you with [I] "
	message_for_mobs(5, pick('punch_1.ogg','punch_2.ogg'))
	shake_me(client, 5)
	if(O.hit_points > 1 && O.burn_points < 100 && get_armor(usr) < I.brute_damage + I.burn_damage)
		if(I.brute_damage - get_armor(usr) > 0)
			O.hit_points -= I.brute_damage - get_armor(usr)
			if(O.inner_organ)
				O.inner_organ.hit_points -= round((I.brute_damage/2) - (get_armor(usr) / 2))
				world << "[O.inner_organ.hit_points]"
		if(I.burn_damage - get_armor(usr) > 0)
			O.burn_points += I.burn_damage - get_armor(usr)

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

					if(I.brute_damage - get_armor(usr) > 20)
						stat |= BROKEN_R_LEG
						src << "\red <font size = 5>*Click* Right leg is broken!</font>"
						lying()

			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor(usr) > 20)
						stat |= BROKEN_L_LEG
						src << "\red <font size = 5>*Click* Left leg is broken!</font>"
						lying()

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_arm/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor(usr) > 20)
						stat |= BROKEN_L_ARM
						src << "\red <font size = 5>*Click* Left arm is broken!</font>"
						drop_all()
						world << "[stat]"

			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/r_arm/O in src)
					punch_me_doc(I, O)

					if(I.brute_damage - get_armor(usr) > 20)
						stat |= BROKEN_R_ARM
						src << "\red <font size = 5>*Click* Right arm is broken!</font>"
						drop_all()
						world << "[stat]"

		if(istype(I,/obj/item/weapon/stunbaton))
			var/obj/item/weapon/stunbaton/S = I
			if(usr.client.act == "help")
				src << "\red <b>You feel some shock!</b>"
				usr.client.D.act()
				lying()
				sleep(S.force)
				unlying()

		if(istype(I,/obj/item/bonefixer))
			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					if(r_leg_broken == 1)
						src << "\blue <font size = 5>Right leg fixed!</font>"
						stat &= ~BROKEN_R_LEG

			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					if(l_leg_broken == 1)
						src << "\blue <font size = 5>Left leg fixed!</font>"
						stat &= ~BROKEN_L_LEG

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_arm/O in src)
					if(l_arm_broken == 1)
						src << "\blue <font size = 5>Left arm fixed!</font>"
						stat &= ~BROKEN_L_ARM


			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/r_arm/O in src)
					if(r_arm_broken == 1)
						src << "\blue <font size = 5>Right arm fixed!</font>"
						stat &= ~BROKEN_R_ARM

		if(istype(I,/obj/item/scalpel))
			if(usr.client.zone == "chest")
				for(var/obj/item/organs/chest/O in src)
					switch(O.step_of_operation)
						if(0)
							O.step_of_operation = 1
							var/msg = "\red [usr] starts to pry open the incision on [src]'s  with \the [I]."
							message_for_mobs(5, msg)
						if(2)
							var/msg = "\red[usr] is beginning to amputate [src]'s heart with \the [I]."
							message_for_mobs(5, msg)
							var/obj/item/organs/heart/H = O.inner_organ
							usr << 'sound/death.ogg'
							lying()
							drop_all()
							var/mob/ghost/G = new(src.loc)
							G.client = client
							stat |= DEAD
							H.Move(src.loc)

			if(usr.client.zone == "head")
				for(var/obj/item/organs/head/O in src)
					switch(O.step_of_operation)
						if(0)
							O.step_of_operation = 1
							var/msg = "\red [usr] starts to pry open the incision on [src]'s  with \the [I]."
							message_for_mobs(5, msg)
						if(2)
							var/msg = "\red[usr] is beginning to amputate [src]'s brain with \the [I]."
							message_for_mobs(5, msg)
							var/obj/item/organs/brain/B = O.inner_organ
							usr << 'sound/death.ogg'
							lying()
							drop_all()
							var/mob/ghost/G = new(src.loc)
							G.client = client
							stat |= DEAD
							B.Move(src.loc)

			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					switch(O.step_of_operation)
						if(0)
							O.step_of_operation = 1
							var/msg = "\red [usr] starts to pry open the incision on [src]'s  with \the [I]."
							message_for_mobs(5, msg)
						if(2)
							var/msg = "\red[usr] is beginning to amputate [src]'s [O] with \the [I]."
							message_for_mobs(5, msg)
							if(skin_color == "white")
								overlays -= /obj/item/organs/r_leg/white
								new /obj/item/organs/r_leg/white(src.loc)
							else
								overlays -= /obj/item/organs/r_leg/black
								new /obj/item/organs/r_leg/black(src.loc)
							del(O)
							stat |= AMP_R_LEG
							lying()

			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					switch(O.step_of_operation)
						if(0)
							O.step_of_operation = 1
							var/msg = "\red [usr] starts to pry open the incision on [src]'s  with \the [I]."
							message_for_mobs(5, msg)
						if(2)
							var/msg = "\red[usr] is beginning to amputate [src]'s [O] with \the [I]."
							message_for_mobs(5, msg)
							if(skin_color == "white")
								overlays -= /obj/item/organs/l_leg/white
								new /obj/item/organs/l_leg/white(src.loc)
							else
								overlays -= /obj/item/organs/l_leg/black
								new /obj/item/organs/l_leg/black(src.loc)
							del(O)
							stat |= AMP_L_LEG
							lying()

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_arm/O in src)
					switch(O.step_of_operation)
						if(0)
							O.step_of_operation = 1
							var/msg = "\red [usr] starts to pry open the incision on [src]'s  with \the [I]."
							message_for_mobs(5, msg)
						if(2)
							var/msg = "\red[usr] is beginning to amputate [src]'s [O] with \the [I]."
							message_for_mobs(5, msg)
							if(skin_color == "white")
								overlays -= /obj/item/organs/l_arm/white
								new /obj/item/organs/l_arm/white(src.loc)
							else
								overlays -= /obj/item/organs/l_arm/black
								new /obj/item/organs/l_arm/black(src.loc)
							del(O)
							stat |= AMP_L_ARM


			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/r_arm/O in src)
					switch(O.step_of_operation)
						if(0)
							O.step_of_operation = 1
							var/msg = "\red [usr] starts to pry open the incision on [src]'s  with \the [I]."
							message_for_mobs(5, msg)
						if(2)
							var/msg = "\red[usr] is beginning to amputate [src]'s [O] with \the [I]."
							message_for_mobs(5, msg)
							if(skin_color == "white")
								overlays -= /obj/item/organs/r_arm/white
								new /obj/item/organs/r_arm/white(src.loc)
							else
								overlays -= /obj/item/organs/r_arm/black
								new /obj/item/organs/r_arm/black(src.loc)
							del(O)
							stat |= AMP_R_ARM

		if(istype(I,/obj/item/saw))
			if(usr.client.zone == "chest")
				for(var/obj/item/organs/chest/O in src)
					switch(O.step_of_operation)
						if(1)
							O.step_of_operation = 2
							var/msg = "\red *VZH-VZH-VZH*"
							message_for_mobs(5, msg)

			if(usr.client.zone == "head")
				for(var/obj/item/organs/head/O in src)
					switch(O.step_of_operation)
						if(1)
							O.step_of_operation = 2
							var/msg = "\red *VZH-VZH-VZH*"
							message_for_mobs(5, msg)

			if(usr.client.zone == "r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					switch(O.step_of_operation)
						if(1)
							O.step_of_operation = 2
							var/msg = "\red *VZH-VZH-VZH*"
							message_for_mobs(5, msg)

			if(usr.client.zone == "l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					switch(O.step_of_operation)
						if(1)
							O.step_of_operation = 2
							var/msg = "\red *VZH-VZH-VZH*"
							message_for_mobs(5, msg)

			if(usr.client.zone == "l_arm")
				for(var/obj/item/organs/l_arm/O in src)
					switch(O.step_of_operation)
						if(1)
							O.step_of_operation = 2
							var/msg = "\red *VZH-VZH-VZH*"
							message_for_mobs(5, msg)

			if(usr.client.zone == "r_arm")
				for(var/obj/item/organs/r_arm/O in src)
					switch(O.step_of_operation)
						if(1)
							O.step_of_operation = 2
							var/msg = "\red *VZH-VZH-VZH*"
							message_for_mobs(5, msg)

		if(istype(I,/obj/item/defib))
			if(signal == 1)
				for(var/mob/ghost/G in world)
					if(G.ckey == my_key)
						client = G.client
						signal = 0
						unlying()
						var/msg = "\blue  <b>[src] resurrected</b>"
						message_for_mobs(5, msg)
						del(G)