#define self_regulation_is_not_possible 60

/mob/human
	var/oxydamage = 0
	var/my_body_temp = 36

/mob/human/proc/checking_turf()
	var/atom/T = src.loc
	if(usr.cloth_ == 0 || usr.helmet_ == 0)

	//OXY
		if(istype(T, /turf))
			breathe()
	//OXY

	//TEMPERATURE

		if(temperature[x][y] > self_regulation_is_not_possible)
			if(my_body_temp < temperature[x][y])
				my_body_temp += 1
				if(my_body_temp > 70)
					if(usr.TEMP)
						usr.TEMP.icon_state = "temperature_2"

		if(temperature[x][y] < self_regulation_is_not_possible * -1)
			if(my_body_temp > temperature[x][y])
				my_body_temp -= 1
				if(my_body_temp < 0)
					if(usr.TEMP)
						usr.TEMP.icon_state = "temperature_0"

		if(!(temperature[x][y] < self_regulation_is_not_possible * -1) && !(temperature[x][y] > self_regulation_is_not_possible))

			if(my_body_temp < self_regulation_is_not_possible)
				my_body_temp += 1
				if(my_body_temp > 70)
					if(usr.TEMP)
						usr.TEMP.icon_state = "temperature_2"

			if(my_body_temp < self_regulation_is_not_possible)
				my_body_temp -= 1
				if(my_body_temp < 0)
					if(usr.TEMP)
						usr.TEMP.icon_state = "temperature_0"

		if(my_body_temp > 36 && my_body_temp > temperature[x][y])
			my_body_temp -= 1

		if(my_body_temp < 36 && temperature[x][y] > 0)
			my_body_temp += 1
			if(my_body_temp > 0 && my_body_temp < 70)
				if(usr.TEMP)
					usr.TEMP.icon_state = "temperature_1"

	//TEMPERATURE

/mob/human/proc/checking_my_system()

	if(oxydamage > 15)
		my_oxygen = "ALERT!"
		if(usr.ALERT)
			usr.ALERT.icon_state = "oxygen_1"

	if(oxydamage < 15)
		my_oxygen = "NO ALERT"
		if(usr.ALERT)
			usr.ALERT.icon_state = "oxygen_0"

	if(oxydamage > 25)
		usr << 'sound/death.ogg'
		usr << "You are dead."

		if(usr && client)
			usr.clear_hud()
		lying()
		stat |= DEAD
		if(client)
			var/mob/ghost/GHOST = new(src.loc)
			GHOST.client = client

	if(my_body_temp < -30 || my_body_temp > 100)
		for(var/obj/item/organs/O in src)
			O.burn_points += pick(1,2)

	if(stamina == 0)
		if(max_pulse < 150)
			max_pulse += pick(0,1)

	if(!(stamina == 0))
		if(max_pulse > 80)
			max_pulse -= 1

	if(pulse > 100)
		var/chance = rand(0,100)
		if(chance < 2)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'

			lying()
			drop_all()
			if(usr && client)
				usr.clear_hud()
			stat |= DEAD
			if(client)
				var/mob/ghost/GHOST = new(src.loc)
				GHOST.client = client

	if(pulse > 120)
		var/chance = rand(0,120)
		if(chance < 4)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'

			lying()
			drop_all()
			if(usr && client)
				usr.clear_hud()
			stat |= DEAD
			if(client)
				var/mob/ghost/GHOST = new(src.loc)
				GHOST.client = client

	if(pulse > 150)
		var/chance = rand(0,120)
		if(chance < 6)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'
			lying()
			drop_all()
			if(usr && client)
				usr.clear_hud()


			stat |= DEAD
			if(client)
				var/mob/ghost/GHOST = new(src.loc)
				GHOST.client = client

	for(var/obj/item/organs/head/H in src)
		var/obj/item/organs/brain/B = H.inner_organ
		if(B.hit_points < 25)
			usr << "\red <font size = 5>Brain is dead</font>"
			usr << 'sound/death.ogg'
			lying()
			drop_all()
			if(usr && client)
				usr.clear_hud()

			stat |= DEAD
			if(client)
				var/mob/ghost/GHOST = new(src.loc)
				GHOST.client = client

	for(var/obj/item/organs/chest/C in src)
		var/obj/item/organs/heart/H = C.inner_organ
		if(H.hit_points < 25)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'
			lying()
			drop_all()
			if(usr && client)
				usr.clear_hud()
			stat |= DEAD
			if(client)
				var/mob/ghost/GHOST = new(src.loc)
				GHOST.client = client