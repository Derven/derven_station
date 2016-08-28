/obj/machinery/atmospherics/air_pipe/pipe/outer
	icon = 'icons/obj/machine/atmos.dmi'
	icon_state = "outer_off"
	density = 0
	layer = 2.4
	anchored = 1

	New()
		inners_outers += src

/obj/machinery/atmospherics/air_pipe/pipe/outer/process()
	out()

/obj/machinery/atmospherics/air_pipe/pipe/outer/proc/out()
	icon_state = "outer_on"
	if(oxy > 5)
		oxygen[x][y] += 1
		oxy -= 1
		if(windoors_on_turf[x-1][y] == 0)
			oxygen[x-1][y] += 1
			oxy -= 1

		if(windoors_on_turf[x+1][y] == 0)
			oxygen[x+1][y] += 1
			oxy -= 1

		if(windoors_on_turf[x][y-1] == 0)
			oxygen[x][y-1] += 1
			oxy -= 1

		if(windoors_on_turf[x][y+1] == 0)
			oxygen[x][y+1] += 1
			oxy -= 1

	if(plas > 5)
		plasma[x][y] += 1
		plas -= 1
		if(windoors_on_turf[x-1][y] == 0)
			plasma[x-1][y] += 1
			plas -= 1

		if(windoors_on_turf[x+1][y] == 0)
			plasma[x+1][y] += 1
			plas -= 1

		if(windoors_on_turf[x][y-1] == 0)
			plasma[x][y-1] += 1
			plas -= 1

		if(windoors_on_turf[x][y+1] == 0)
			plasma[x][y+1] += 1
			plas -= 1

	if(nit  > 5)
		nitrogen[x][y] += 1
		nit -= 1
		if(windoors_on_turf[x-1][y] == 0)
			nitrogen[x-1][y] += 1
			nit -= 1

		if(windoors_on_turf[x+1][y] == 0)
			nitrogen[x+1][y] += 1
			nit -= 1

		if(windoors_on_turf[x][y-1] == 0)
			nitrogen[x][y-1] += 1
			nit -= 1

		if(windoors_on_turf[x][y+1] == 0)
			nitrogen[x][y+1] += 1
			nit -= 1

	icon_state = "outer_off"

