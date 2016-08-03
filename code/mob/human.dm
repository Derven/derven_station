/obj/item/organs
	icon = 'icons/mob/human.dmi'
	var/hit_points = 300
	var/burn_points = 0
	var/obj/item/organs/inner_organ
	weight = 0

/obj/item/organs/brain
	hit_points = 100

/obj/item/organs/heart
	hit_points = 100

/obj/item/organs/r_leg
	name = "RIGHT LEG"
	white
		icon_state = "human_leg_r"
	black
		icon_state = "human_leg_r_black"

/obj/item/organs/l_leg
	name = "LEFT LEG"
	white
		icon_state = "human_leg_l"

	black
		icon_state = "human_leg_l_black"

/obj/item/organs/l_arm
	name = "LEFT ARM"
	white
		icon_state = "human_arm_l"

	black
		icon_state = "human_arm_l_black"

/obj/item/organs/r_arm
	name = "RIGHT ARM"
	white
		icon_state = "human_arm_r"

	black
		icon_state = "human_arm_r_black"

/obj/item/organs/chest
	name = "CHEST"
	inner_organ = new /obj/item/organs/heart()
	white
		icon_state = "human_chest"

		fem
			icon_state = "human_chest_fem"

	black
		icon_state = "human_chest_black"

		fem
			icon_state = "human_chest_black_f"

/obj/item/organs/head
	name = "HEAD"
	inner_organ = new /obj/item/organs/brain()
	white
		icon_state = "human_head"

	black
		icon_state = "human_head_black"

/mob
	var/list/obj/item/organs/organs = list()

/mob/proc/white_overlay()
	overlays.Cut()
	organs.Cut()
	overlays += /obj/item/organs/r_leg/white
	overlays += /obj/item/organs/l_leg/white
	overlays += /obj/item/organs/chest/white
	overlays += /obj/item/organs/r_arm/white
	overlays += /obj/item/organs/l_arm/white
	overlays += /obj/item/organs/head/white


	var/obj/item/organs/r_leg/white/R_LEG = new()
	var/obj/item/organs/l_leg/white/L_LEG = new()
	var/obj/item/organs/chest/white/CHEST = new()
	var/obj/item/organs/r_arm/white/R_ARM = new()
	var/obj/item/organs/l_arm/white/L_ARM = new()
	var/obj/item/organs/head/white/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD

	var/obj/item/organs/r_leg/R_LEG_CONTENTS
	R_LEG_CONTENTS = new()
	R_LEG_CONTENTS.Move(src)

	var/obj/item/organs/l_leg/L_LEG_CONTENTS
	L_LEG_CONTENTS = new()
	L_LEG_CONTENTS.Move(src)

	var/obj/item/organs/r_arm/R_ARM_CONTENTS
	R_ARM_CONTENTS = new()
	R_ARM_CONTENTS.Move(src)

	var/obj/item/organs/l_arm/L_ARM_CONTENTS
	L_ARM_CONTENTS = new()
	L_ARM_CONTENTS.Move(src)

	var/obj/item/organs/chest/CHEST_CONTENTS
	CHEST_CONTENTS = new()
	CHEST_CONTENTS.Move(src)

	var/obj/item/organs/head/HEAD_CONTENTS
	HEAD_CONTENTS = new()
	HEAD_CONTENTS.Move(src)


/mob/proc/white_fem_overlay()
	overlays.Cut()
	organs.Cut()
	overlays += /obj/item/organs/r_leg/white
	overlays += /obj/item/organs/l_leg/white
	overlays += /obj/item/organs/chest/white/fem
	overlays += /obj/item/organs/r_arm/white
	overlays += /obj/item/organs/l_arm/white
	overlays += /obj/item/organs/head/white

	var/obj/item/organs/r_leg/white/R_LEG = new()
	var/obj/item/organs/l_leg/white/L_LEG = new()
	var/obj/item/organs/chest/white/fem/CHEST = new()
	var/obj/item/organs/r_arm/white/R_ARM = new()
	var/obj/item/organs/l_arm/white/L_ARM = new()
	var/obj/item/organs/head/white/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD


/mob/proc/black_overlay()
	overlays.Cut()
	organs.Cut()

	overlays += /obj/item/organs/r_leg/black
	overlays += /obj/item/organs/l_leg/black
	overlays += /obj/item/organs/chest/black
	overlays += /obj/item/organs/r_arm/black
	overlays += /obj/item/organs/l_arm/black
	overlays += /obj/item/organs/head/black

	var/obj/item/organs/r_leg/black/R_LEG = new()
	var/obj/item/organs/l_leg/black/L_LEG = new()
	var/obj/item/organs/chest/black/CHEST = new()
	var/obj/item/organs/r_arm/black/R_ARM = new()
	var/obj/item/organs/l_arm/black/L_ARM = new()
	var/obj/item/organs/head/black/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD

/mob/proc/black_fem_overlay()
	overlays.Cut()
	organs.Cut()

	overlays += /obj/item/organs/r_leg/black
	overlays += /obj/item/organs/l_leg/black
	overlays += /obj/item/organs/chest/black/fem
	overlays += /obj/item/organs/r_arm/black
	overlays += /obj/item/organs/l_arm/black
	overlays += /obj/item/organs/head/black

	var/obj/item/organs/r_leg/black/R_LEG = new()
	var/obj/item/organs/l_leg/black/L_LEG = new()
	var/obj/item/organs/chest/black/fem/CHEST = new()
	var/obj/item/organs/r_arm/black/R_ARM = new()
	var/obj/item/organs/l_arm/black/L_ARM = new()
	var/obj/item/organs/head/black/HEAD = new()

	organs += R_LEG
	organs += L_LEG
	organs += CHEST
	organs += R_ARM
	organs += L_ARM
	organs += HEAD

/mob/proc/html_me()
	html = " \
	<html> \
	<head><title>Prefernces</title></head> \
	<body> \
	Gender: \
	<br> \
	<a href='?src=\ref[src];gend=male'>Male</a> \
	<a href='?src=\ref[src];gend=female'>Female</a> \
	<br> \
	<a href='?src=\ref[src];race=niga'>Black</a> \
	<a href='?src=\ref[src];race=white'>White</a> \
	<a href='?src=\ref[src];race=mongol'>What?</a> \
	<br>  \
	Job: \
	<br> \
	<a href='?src=\ref[src];prof=scientist'>Scientist</a> \
	<a href='?src=\ref[src];prof=engineer'>Engineer</a> \
	<a href='?src=\ref[src];prof=assistant'>Assistant</a> \
	 \
	<br> \
	</body></html>"

client
	var
		mymcolor = "white"
		mygender = 1
		var/list/obj/my_pull = list()

/mob
	var/html
	var/r_arm_broken = 0
	var/l_arm_broken = 0
	var/r_leg_broken = 0
	var/l_leg_broken = 0

/mob/human
	name = "human"
	icon = 'icons/mob/human.dmi'
	icon_state = "human"
	layer = 6
	weight = 70
	see_invisible = 0

	var/sound/S
	var/lying = 0
	var/stop = 0
	var/state_of_health = "normal"
	var/stamina = 100
	//var/temperature = 36
	var/my_oxygen = "NO ALERT"
	//var/oxygen = 100
	var/pulse = 70
	var/min_pulse = 60
	var/max_pulse = 80
	var/signal = 0
	var/a_hole_in_the_ceiling = 0
	var/reagents_max = 100
	var/cur_val = 0
	var/no_way_bro = 0
	var/mcolor = 1
	var/my_gend = 1
	var/oldloc
	var/my_weight
	var/database/query/memory

	Stat()
		statpanel("State")
		stat("appearance - ", src)
		stat("state of health - ", state_of_health)
		stat("stamina(percents) - ", stamina)
		stat("temperature(C�) - ", my_body_temp)
		stat("oxygen(ALERT) - ", my_oxygen)
		stat("ZONE - ", usr.client.zone)
		stat("pulse - ", pulse)
		stat("chem - ", cur_val)
		stat("blood - ", reagents.get_reagent_amount("blood"))
		statpanel("Organs")
		for(var/obj/item/organs/O in usr)
			stat("\[[O.name]\]", "soundness - [O.hit_points]; percent burns - [O.burn_points]")



		statpanel("Description")
		var/turf/T = locate(usr.x,usr.y, usr.z + 1)
		if(istype(T,/turf/simulated/floor/whore))
			a_hole_in_the_ceiling = 1
		else
			a_hole_in_the_ceiling = 0
		stat("A hole in the ceiling ", a_hole_in_the_ceiling)

	//shot()
	//	world << "[src.name] ������"

/*	verb/emerge()
		var/turf/T = locate(usr.x,usr.y, usr.z + 1)
		var/turf/TU = src.loc
		if(istype(T,/turf/simulated/floor/whore) && TU.water > 15)
			usr.z += 1
		else
			usr << "\red ����� �����&#255; ���������!"
*/
	proc/lying()
		lying = 1

		for(var/obj/item/organs/O in organs)
			overlays -= O
			O.icon = 'icons/mob/human_lying.dmi'
			overlays += O

		if(usr.client.foot_items.len > 0)
			var/obj/item/clothing/C = usr.client.foot_items[1]
			C.lying_me(usr)

		if(usr.client.head_items.len > 0)
			var/obj/item/clothing/C = usr.client.head_items[1]
			C.lying_me(usr)

		if(usr.client.uniform_items.len > 0)
			var/obj/item/clothing/C = usr.client.uniform_items[1]
			C.lying_me(usr)

		if(usr.client.clothing_items.len > 0)
			var/obj/item/clothing/C = usr.client.clothing_items[1]
			C.lying_me(usr)

	proc/unlying()
		lying = 0

		for(var/obj/item/organs/O in organs)
			overlays -= O
			O.icon = 'icons/mob/human.dmi'
			overlays += O

		if(usr.client.foot_items.len > 0)
			var/obj/item/clothing/C = usr.client.foot_items[1]
			C.unlying_me(usr)

		if(usr.client.head_items.len > 0)
			var/obj/item/clothing/C = usr.client.head_items[1]
			C.unlying_me(usr)

		if(usr.client.uniform_items.len > 0)
			var/obj/item/clothing/C = usr.client.uniform_items[1]
			C.unlying_me(usr)

		if(usr.client.clothing_items.len > 0)
			var/obj/item/clothing/C = usr.client.clothing_items[1]
			C.unlying_me(usr)

/mob/human/process()
	S = new()
	S.file = 'sound/beep-02.ogg'
	usr << S
	//var/FT = "data/chicken.epta"
	//text2file("HELLO",FT)

	objects += src
	var/datum/reagents/R = new/datum/reagents(380)
	reagents = R
	R.my_atom = src
	R.add_reagent("blood", 300)

	spawn while(1)
		//if(src == usr)
		sleep(1)

		if(usr.client.ouch == 0)
			S.volume = 0
			usr << S
			for(var/obj/roof/my_roof in loc.loc)
				usr << my_roof.NOROOF
				my_roof.NOROOF.override = 1
				var/area/A = loc.loc
				A.exited = loc.loc
			usr.client.D.iam = src
			if(usr.client.U.overlays.len == 0)
				usr.client.uniform_items.Cut()

			if(usr.client.C.overlays.len == 0)
				usr.client.clothing_items.Cut()

			if(usr.client.H.overlays.len == 0)
				usr.client.head_items.Cut()

			if(usr.client.F.overlays.len == 0)
				usr.client.foot_items.Cut()

		//analyaze_me()

		var/turf/T = locate(x,y,z)
		sleep(0.5)

		///***REAGENTS***///

		if(reagents) reagents.metabolize(src)

		///***REAGENTS***///


		organ_damage_calculate()
		bloodloss()
		blood_new()
		for(var/obj/O in usr.contents)
			usr.client.my_weight += O.weight

		if(usr.client.my_weight > usr.client.can_get)
			stamina -= 2

		usr.client.my_weight = 0

		if(usr.client.mygender == 1)
			icon_state = "human"
			//var/lleg = 0
			//var/rleg = 0
			//var/rarm = 0
			//var/larm = 0
			//var/chest = 0
			//var/head = 0

		sleep(1)

		if(usr.client.time_to_change == 1)
			if(usr.client.mygender == 0 && usr.client.mymcolor != "chocolate")
				white_fem_overlay()
				usr.client.time_to_change = 0
				mcolor = 1
				my_gend = 0

			if(usr.client.mygender == 1 && usr.client.mymcolor != "chocolate")
				white_overlay()
				usr.client.time_to_change = 0
				mcolor = 1
				my_gend = 1

			if(usr.client.mygender == 1 && usr.client.mymcolor == "chocolate")
				black_overlay()
				usr.client.time_to_change = 0
				mcolor = 0
				my_gend = 1

			if(usr.client.mygender == 0 && usr.client.mymcolor == "chocolate")
				black_fem_overlay()
				usr.client.time_to_change = 0
				mcolor = 0
				my_gend = 0

		if(usr.client.mygender == 0)
			icon_state = "human_f"

		if(usr.client.mymcolor == "chocolate" && usr.client.mygender == 0)
			icon_state = "human_black_f"

		if(usr.client.mymcolor == "chocolate" && usr.client.mygender == 1)
			icon_state = "human_black"
		if(usr.client.r_int == "walk")
			if(stamina < 100)
				stamina += 1
		if(signal == 1)
			return
		pulse = rand(min_pulse, max_pulse)
		checking_turf()
		checking_my_system()
	//	on_turf_react()
		for(var/turf/F in range(1,src))
			if(F.density == 0)
				if(T.cur_gas - F.cur_gas > 121) //��� ������� � 121 ����������� ����� �� �����
					Move(locate(F.x, F.y, F.z))
		/*if(src == usr)
			if(usr.client.ouch == 0)
				if(usr.client.D.time_to_drop == 1)
					usr.client.D.time_to_drop = 0
					if(usr.client.hand == 1)
						var/obj/item/I = usr.client.my_rhand_contents
						for(I in src)
							I.Move(src.loc)

						usr.client.my_rhand_contents = 0
						usr.client.R.overlays.Cut()
					if(usr.client.hand == 0)
						var/obj/item/I = usr.client.my_lhand_contents
						for(I in src)
							I.Move(src.loc)
						usr.client.my_lhand_contents = 0
						usr.client.L.overlays.Cut()
*/
mob/human/Move()
	if(signal != 1 && buckled == 0 && lying != 1 && !r_leg_broken && !l_leg_broken)
		..()
		for(var/obj/A in range(2,usr))
			if(A.pull == 1 && A.puller == usr)
				A.Move(oldloc)

		if(usr.client.r_int == "walk")
			step_size = 32
			//see_in_night()
		oldloc = usr.loc

		return

mob/human/proc/start_game()
	usr.client.ouch = 1
	return ..()

/mob/human/New()
	html_me()
	white_overlay()

	if(src == usr)
		sleep(0.1)
		usr << "\red <h1>Hello!</h1>"
		usr << browse(html,"window=setup")
		no_way_bro = 1
		start_game()
		usr.loc = landmarks[rand(1,landmarks.len)]
		//light_fom_my_heart_babe()

		process()

/mob/human/proc/punch_organ(var/obj/item/organs/O)
	for(O in src)
		usr << "\red You hit [src]!"
		src << "\red [usr] hit you!"
		O.hit_points -= 1

/mob/human/act()
	if(usr.client.act == "harm")
		message_for_mobs(5, pick('punch_1.ogg','punch_2.ogg'))
		shake_me(client)
		switch(usr.client.zone)
			if("chest")
				for(var/obj/item/organs/chest/O in src)
					punch_organ(O)

			if("head")
				for(var/obj/item/organs/head/O in src)
					punch_organ(O)

			if("r_leg")
				for(var/obj/item/organs/r_leg/O in src)
					punch_organ(O)

			if("l_leg")
				for(var/obj/item/organs/l_leg/O in src)
					punch_organ(O)

			if("l_arm")
				for(var/obj/item/organs/l_arm/O in src)
					punch_organ(O)

			if("r_arm")
				for(var/obj/item/organs/r_arm/O in src)
					punch_organ(O)