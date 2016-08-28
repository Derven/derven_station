/mob/human
	proc/organ_damage_calculate()
		var/sum
		var/burn_damage
		for(var/obj/item/organs/O in usr)
			sum += round(O.hit_points / 6)
			burn_damage += round(O.burn_points / 6)
		state_of_health = sum - burn_damage

		if(state_of_health > 150)
			if(usr.HEALTH)
				usr.HEALTH.icon_state = "health_1"

		if(state_of_health < 150)
			if(usr.HEALTH)
				usr.HEALTH.icon_state = "health_2"

		if(state_of_health < 90)
			if(usr.HEALTH)
				usr.HEALTH.icon_state = "health_3"

		if(state_of_health < 3)
			stat |= DEAD
			lying()
			drop_all()
			var/mob/ghost/GHOST = new(src.loc)
			GHOST.client = client
			usr << 'sound/death.ogg'
			usr << "\red You are dead"
