//Нагрев

#define LASER_POWER 420
#define WELDER 80

//Температура


#define LASER_POINT 0.03
#define WELDER_FLAME 0.25
var
	FLAMMABLE = 1<<1
	NOFLAMMABLE = 1<<2
	MELTS = 1<<3
	EXPLODE = 1<<4

/atom
	var/typer = 8
	var/MAXTEMP = 1000
	var/my_temp = 21
	var/explode_power = 5

/atom/proc/fire()

/atom/proc/melts()

/atom/proc/heat(var/temp, var/sq)
	if(typer & NOFLAMMABLE)
		return

	if(typer & FLAMMABLE)
		if(sq > 0.01 && temp > 200)
			fire()

	if(typer & MELTS)
		my_temp += round((temp * sq) / (round(weight * sq)))
		for(var/turf/simulated/floor/T in range(1, src))
			if(my_temp > temperature[T.x][T.y] + 5)
				temperature[T.x][T.y] += round((my_temp - temperature[T.x][T.y])/10)

		if(my_temp > MAXTEMP)
			for(var/mob/M in range(5,src))
				if(!istype(src, /obj/effect/fire))
					M << "\red [src] is melt"
			melts()
			if(istype(src, /turf/simulated/wall))
				src = new /turf/simulated/floor/plating(src)
			else if(istype(src, /obj/machinery/light))
				var/obj/machinery/light/L = src
				L.broken = 1
			else
				del(src)

	if(typer & EXPLODE)
		BOOM(src.loc, explode_power)


/*
/turf/simulated/floor/proc/temperature_exchange()
	sleep(4)
	for(var/atom/A in src)
		if(A.my_temp > temp)
			tempe += 1
			A.my_temp -= 1

		if(A.my_temp < temperature)
			temperature -= 1
			A.my_temp += 1

		if(A.my_temp > A.MAXTEMP)
			if(A.typer == "Melts")
				for(var/mob/M in range(5,src))
					M << "\red [src] плавитс&#255;"
				melts()
				if(istype(src, /turf/simulated/wall))
					src = new /turf/simulated/floor/plating(src)
				else
					del(src)

			if(A.typer == "Flammable")
				if(A.my_temp > 200)
					A.fire()

	for(var/turf/simulated/wall/W in range(1,src))
		sleep(4)
		if(W.my_temp > temperature)
			W.my_temp -= 1
			temperature += 1

		if(W.my_temp < temperature)
			W.my_temp += 1
			temperature -= 1

		if(W.my_temp > W.MAXTEMP)
			W.melts()
			W = new /turf/simulated/floor/plating(W)

			for(var/turf/simulated/wall/R in range(1,W))
				sleep(1)
				if(R.my_temp < W.my_temp)
					R.my_temp += 1
					W.my_temp -= 1

				if(R.my_temp > W.my_temp)
					R.my_temp -= 1
					W.my_temp += 1

				if(R.my_temp > R.MAXTEMP)
					R.melts()
					R = new /turf/simulated/floor/plating(R)
*/

/turf/simulated/wall
	typer = 8
	weight = 70
	luminosity = 1

	New()
		windoors_on_turf[x][y] = 1
		relativewall_neighbours()
		..()

	Del()
		windoors_on_turf[x][y] = 0
		relativewall_neighbours()
		..()

/turf/simulated/wall/r_wall
	MAXTEMP = 5000
	icon_state = "r_wall"

	New()
		windoors_on_turf[x][y] = 1

/turf/simulated/wall/shuttle
	icon_state = "shuttle"

	act()
		world << "[my_temp]"