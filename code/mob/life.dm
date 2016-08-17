#define self_regulation_is_not_possible 60

/mob/human
	var/oxydamage = 0
	var/my_body_temp = 36

/mob/human/proc/checking_turf()
	var/atom/T = src.loc
	if(usr.client.cloth_ == 0 || usr.client.helmet_ == 0)

	//OXY
		if(istype(T, /turf))
			if(oxygen[x][y] < 200)
				sleep(1)
				oxydamage += pick(1,2)

			if(oxygen[x][y] > 300)
				if(oxydamage > 0)
					oxydamage -= 1

	//OXY

	//TEMPERATURE

		if(temperature[x][y] > self_regulation_is_not_possible)
			if(my_body_temp < temperature[x][y])
				my_body_temp += 1
				if(my_body_temp > 70)
					if(usr.client.TEMP)
						usr.client.TEMP.icon_state = "temperature_2"

		if(temperature[x][y] < self_regulation_is_not_possible * -1)
			if(my_body_temp > temperature[x][y])
				my_body_temp -= 1
				if(my_body_temp < 0)
					if(usr.client.TEMP)
						usr.client.TEMP.icon_state = "temperature_0"

		if(!(temperature[x][y] < self_regulation_is_not_possible * -1) && !(temperature[x][y] > self_regulation_is_not_possible))

			if(my_body_temp < self_regulation_is_not_possible)
				my_body_temp += 1
				if(my_body_temp > 70)
					if(usr.client.TEMP)
						usr.client.TEMP.icon_state = "temperature_2"

			if(my_body_temp < self_regulation_is_not_possible)
				my_body_temp -= 1
				if(my_body_temp < 0)
					if(usr.client.TEMP)
						usr.client.TEMP.icon_state = "temperature_0"

		if(my_body_temp > 36 && my_body_temp > temperature[x][y])
			my_body_temp -= 1
			if(my_body_temp < 0)
				if(usr.client.TEMP)
					usr.client.TEMP.icon_state = "temperature_0"

	//TEMPERATURE

/mob/human/proc/checking_my_system()

	if(oxydamage > 15)
		my_oxygen = "ALERT!"
		if(usr.client.ALERT)
			usr.client.ALERT.icon_state = "oxygen_1"

	if(oxydamage < 15)
		my_oxygen = "NO ALERT"
		if(usr.client.ALERT)
			usr.client.ALERT.icon_state = "oxygen_0"

	if(oxydamage > 25)
		usr << 'sound/death.ogg'
		usr << "You are dead."

		var/mob/ghost/G = new(src.loc)
		G.client = client
		lying()
		stat |= DEAD

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
			var/mob/ghost/G = new(src.loc)
			G.client = client
			stat |= DEAD

	if(pulse > 120)
		var/chance = rand(0,120)
		if(chance < 4)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'

			lying()
			drop_all()
			var/mob/ghost/G = new(src.loc)
			G.client = client
			stat |= DEAD

	if(pulse > 150)
		var/chance = rand(0,120)
		if(chance < 6)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'

			lying()
			drop_all()
			var/mob/ghost/G = new(src.loc)
			G.client = client
			stat |= DEAD

	for(var/obj/item/organs/head/H in src)
		var/obj/item/organs/brain/B = H.inner_organ
		if(B.hit_points < 25)
			usr << "\red <font size = 5>Brain is dead</font>"
			usr << 'sound/death.ogg'
			lying()
			drop_all()
			var/mob/ghost/G = new(src.loc)
			G.client = client
			stat |= DEAD

	for(var/obj/item/organs/chest/C in src)
		var/obj/item/organs/heart/H = C.inner_organ
		if(H.hit_points < 25)
			usr << "\red <font size = 5>Heart is stopped</font>"
			usr << 'sound/death.ogg'
			lying()
			drop_all()
			var/mob/ghost/G = new(src.loc)
			G.client = client
			stat |= DEAD