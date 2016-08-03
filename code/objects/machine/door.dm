var/global/DOOR_ID = 1
var/global/list/doors = list()

/obj/machinery/door/airlock
	name = "door"
	icon = 'icons/obj/machine/door.dmi'
	var/mydooor = "door"
	icon_state = "door_close"
	density = 1
	opacity = 1
	on = 1
	weight = 50
	use_power = 1
	var/close = 1
	var/turf/T
	pass_gas = 0
	layer = 7
	need_amperage = 20
	computer_access = "door"
	iscon = 1
	typer = 16
	var/id

	New()
		//T.here_windoors = 1
		windoors_on_turf[x][y] = 1

	Move()
		..()
		if(T != src.loc)
			//T.here_windoors = 0
			windoors_on_turf[T.x][T.y] = 0
			T = src.loc
			//T.here_windoors = 1
			windoors_on_turf[T.x][T.y] = 1

	Del()
		var/turf/simulated/floor/F = src.loc
		windoors_on_turf[F.x][F.y] = 0
		..()

/obj/machinery/door/airlock/out
	icon_state = "out_close"
	mydooor = "out"

/obj/machinery/door/airlock/sec
	icon_state = "secdoor_close"
	mydooor = "secdoor"

/obj/machinery/door/airlock/maint
	icon_state = "maint_close"
	mydooor = "maint"

/obj/machinery/door/airlock/mining
	icon_state = "mining_close"
	mydooor = "mining"

/obj/machinery/door/airlock/eng
	icon_state = "eng_close"
	mydooor = "eng"

/obj/machinery/door/airlock/com
	icon_state = "com_close"
	mydooor = "com"

/obj/machinery/door/airlock/med
	icon_state = "med_close"
	mydooor = "med"

/obj/machinery/door/airlock/sci
	icon_state = "sci_close"
	mydooor = "sci"

/obj/machinery/door/airlock
	New()
		id = DOOR_ID
		DOOR_ID += 1
		doors += src
		computer_can += src
		windoors_on_turf[x][y] = 1

	Del()
		windoors_on_turf[x][y] = 0
		..()

/obj/machinery/firedoor
	name = "firedoor"
	icon = 'icons/obj/machine/door.dmi'
	icon_state = "firedoor_open"
	density = 0
	on = 1
	use_power = 1
	var/close = 1
	pass_gas = 1

/obj/machinery/firedoor/check()
	var/say_chance = pick(0,200)
	if(on == 1)
		if(oxygen[x][y] < 300 || nitrogen[x][y] > 100 || plasma[x][y] > 100 || temperature[x][y] > 70 || temperature[x][y] < -10)
			icon_state = "firedoor_close"
			if(say_chance < 15)
				for(var/mob/M in range(5,src))
					M << "DANGER!"
			pass_gas = 0
			density = 1
			opacity = 1
		else
			icon_state = "firedoor_open"
			density = 0
			opacity = 0
			pass_gas = 1

/obj/machinery/door/airlock/act()
	process()
	if(on == 1)
		if(close == 1)
			usr << "[src] opened"
			icon_state = "[mydooor]_open"
			windoors_on_turf[x][y] = 0
			close = 0
			density = 0
			pass_gas = 1
		else
			usr << "[src] closed"
			icon_state = "[mydooor]_close"
			windoors_on_turf[x][y] = 1
			close = 1
			density = 1
			pass_gas = 0
	else
		usr << "No power"

/obj/machinery/door/airlock/proc/open()
	icon_state = "door_open"
	windoors_on_turf[x][y] = 0
	close = 0
	density = 0
	opacity = 0
	pass_gas = 1

/obj/machinery/door/airlock/proc/close()
	icon_state = "door_close"
	windoors_on_turf[x][y] = 1
	close = 1
	density = 1
	opacity = 1
	pass_gas = 0