
/obj/effect/fire/New()
	sleep(1)
	for(var/turf/simulated/wall/W in orange(1,src))
		W.heat(temperature[x][y], 20)

	for(var/atom/movable/A in orange(1,src))
		if(A)
			if(temperature[x][y] > 100)
				A.heat(temperature[x][y], 20)

	process()

/turf

/obj/effect/fire/proc/part(var/X, var/Y)
	var/turf/L = locate(X, Y, 1)
	if(windoors_on_turf[X][Y] == 0)
		if(temperature[X][Y] < 2048) //maximum of temperature
			temperature[X][Y] += 2 //transfer of heat
			if(temperature[X][Y] > 600) //temperature of burn oxygen
				if(oxygen[X][Y] > 100)
					oxygen[X][Y] -= 2
					temperature[X][Y] += 2
					var/check = 0
					for(var/obj/effect/fire/F in L)
						check = 1
					if(check == 0)
						new /obj/effect/fire(L)

		if(oxygen[X][Y] > 100 && plasma[X][Y] > 5) //heat
			temperature[X][Y] += 2
			oxygen[X][Y] -= 2
			plasma[X][Y] -= 2
			var/check = 0
			for(var/obj/effect/fire/F in L)
				check = 1
			if(check == 0)
				new /obj/effect/fire(L)

		if(oxygen[X][Y] < 100)
			del(src)

/obj/effect/fire/process()
	spawn while(1)
		sleep(1)
		part(x, y)
		part(x-1, y)
		part(x+1, y)
		part(x, y-1)
		part(x, y+1)
		sleep(1)

/obj/machinery
	var/iscon = 0

/obj/machinery/lighter
	iscon = 1
	icon = 'icons/effects/effects.dmi'
	icon_state = "fire_switch"

	act()
		message_for_mobs(8, "\blue *Click*")
		fire_()

	proc/fire_()
		var/turf/T = src.loc
		if(oxygen[x][y] > 100 && plasma[x][y] > 5)

			usr << "Flaring flames!"
			new /obj/effect/fire(T)