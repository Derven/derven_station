/obj/item/weapon/tank
	name = "Tank"
	icon = 'icons/obj/item/tank.dmi'
	var/connected = null
	var/oxy = 0
	var/nit = 0
	var/plasm = 0

	proc/connect(var/mob/M)
		if(connected)
			connected = null
			M << "\red You unconnected [src]"
		else
			connected = M
			M << "\blue You connected [src]"

	act_self(src)
		connect(usr)

/obj/item/weapon/tank/oxygen
	icon_state = "oxygen"
	oxy = 200

/obj/item/weapon/tank/plasma
	icon_state = "plasma"
	plasm = 200

/obj/item/weapon/tank/plasmagen
	icon_state = "oxygen"
	oxy = 100
	plasm = 100

/mob/human/proc/breathe()
	var/obj/item/weapon/tank/TANK
	if(usr.client.TOX)
		usr.client.TOX.icon_state = "tox0"
	for(TANK in contents)
		if(TANK && TANK.connected == src)
			if(TANK.plasm > 0)
				toxic_damage(pick(3,2))
				src << "\blue How wonderfull! It is plasma!"
				if(usr.client.TOX)
					usr.client.TOX.icon_state = "tox1"
				return

			if(TANK.oxy > 0)
				TANK.oxy -= 1
				if(oxydamage > 0)
					oxydamage -= 1
			else
				oxydamage += pick(1,2)
				src << "\red [src] is empty"
			if(usr.client.INTERN)
				usr.client.INTERN.icon_state = "internal1"
			return
	if(usr.client.INTERN)
		usr.client.INTERN.icon_state = "internal0"

	if(plasma[x][y] > 0)
		if(usr.client.TOX)
			usr.client.TOX.icon_state = "tox1"
		toxic_damage(pick(3,2))
		src << "\blue How wonderfull! It is plasma!"

	if (oxygen[x][y] > 0)
		oxygen[x][y] -= 1
		if(oxydamage > 0)
			oxydamage -= 1
	else
		oxydamage += pick(1,2)

