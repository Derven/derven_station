/obj/powercable
	var/powernet = 0
	name = "cable"
	icon = 'icons/obj/cable.dmi'

	proc/powergrid()
		var/list/eastwest = list(get_step(src,EAST), get_step(src,WEST))
		var/list/northsouth = list(get_step(src,SOUTH), get_step(src,NORTH))
		world << "[x];[y]"
		if(dir == 2 || dir == 6 || dir == 10 || dir == 9 || dir == 5)
			for(var/direction in northsouth)
				var/turf/T = direction
				for(var/obj/powercable/A in T)
					world << "HELLO"
					if(A.powernet != 0)
						powernet = A.powernet
					else
						if(powernet != 0)
							A.powernet = powernet
							A.powergrid()

		if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

			for(var/direction in eastwest)
				var/turf/T = direction
				for(var/obj/powercable/A in T)
					world << "HELLO"
					if(A.powernet != 0)
						powernet = A.powernet
					else
						if(powernet != 0)
							A.powernet = powernet
							A.powergrid()
	act()
		world << "[powernet]"
		if(powernet != 0)
			powergrid()