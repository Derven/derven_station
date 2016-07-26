/obj/machinery/logic_elements
	icon = 'icons/obj/machine/logical.dmi'
	var/current_state = 0 //0 or 1

	proc/calculate()

	proc/connect()
		var/turf/levo = get_step(src, turn(dir, 90))
		var/turf/pravo = get_step(src, turn(dir, -90))

		var/turf/pered = get_step(src, dir)

		var/count = 0
		var/list/nums = list(0,0)

		for(var/obj/machinery/logic_elements/LE in levo)
			count += 1
			nums[1] = LE.current_state

		for(var/obj/machinery/logic_elements/LE in pravo)
			count += 1
			nums[2] = LE.current_state

		if(count == 2)
			current_state = calculate(nums[1], nums[2])

		for(var/obj/machinery/logic_elements/LE in pered)
			return LE

		return 0

	proc/start()
		var/obj/machinery/logic_elements/LE = connect()
		if(LE)
			world << current_state
			LE.start()

	act()
		start()

/obj/machinery/logic_elements/negative
	icon_state = "no"

	calculate(var/n)
		return !n

	connect()
		var/turf/zad = get_step(src, turn(dir, 180))
		var/turf/pered = get_step(src, dir)

		for(var/obj/machinery/logic_elements/LE in zad)
			current_state = calculate(LE.current_state)

		for(var/obj/machinery/logic_elements/LE in pered)
			return LE

		return 0

/obj/machinery/logic_elements/number
	icon_state = "zero"
	var/base_screen

	calculate(var/n)
		return !n

	act()
		base_screen = "<html>\
		<body>\
		[STYLE] \
		<div class=\"main\"><h1><center>DURA LOGIC 0.1.0</center></h1></div>"
		base_screen += "<br><a href='?src=\ref[src];num=one'>One</a>"
		base_screen += "<br><a href='?src=\ref[src];num=zero'>Zero</a>"
		base_screen += "<br><a href='?src=\ref[src];submit=ok'>Go!</a>"
		base_screen += "</div></body>"
		base_screen += "</html>"
		usr << browse(base_screen,"window=base_screen")


	connect()
		var/turf/pered = get_step(src, dir)

		for(var/obj/machinery/logic_elements/LE in pered)
			return LE

		return 0

/obj/machinery/logic_elements/triangle
	icon_state = "triangle"

	start()
		var/turf/zad = get_step(src, turn(dir, 180))
		var/turf/levo = get_step(src, turn(dir, 90))
		var/turf/pravo = get_step(src, turn(dir, -90))
		var/turf/pered = get_step(src, dir)

		for(var/obj/machinery/logic_elements/LE in zad)
			current_state = LE.current_state

		var/obj/machinery/logic_elements/LE
		var/list_of_ways = list(levo, pravo, pered)

		for(LE in list_of_ways)
			if(istype(LE, /obj/machinery/logic_elements/negative))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/multiply))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/addition))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/equal))
				if(LE)
					LE.start()

/obj/machinery/logic_elements/oneway
	icon_state = "oneway"

	start()
		var/turf/zad = get_step(src, turn(dir, 180))
		var/turf/pered = get_step(src, dir)

		for(var/obj/machinery/logic_elements/LE in zad)
			current_state = LE.current_state

		world << "HELLO [current_state]"

		var/obj/machinery/logic_elements/LE

		for(LE in pered)
			if(istype(LE, /obj/machinery/logic_elements/negative))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/multiply))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/addition))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/equal))
				if(LE)
					LE.start()

			if(LE)
				LE.start()

/obj/machinery/logic_elements/oneway_2
	icon_state = "oneway_2"

	start()
		var/turf/levo = get_step(src, turn(dir, 90))
		var/turf/pered = get_step(src, dir)

		for(var/obj/machinery/logic_elements/LE in levo)
			current_state = LE.current_state

		var/obj/machinery/logic_elements/LE

		for(LE in pered)
			if(istype(LE, /obj/machinery/logic_elements/negative))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/multiply))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/addition))
				if(LE)
					LE.start()

			if(istype(LE, /obj/machinery/logic_elements/equal))
				if(LE)
					LE.start()

			if(LE)
				LE.start()

/obj/machinery/logic_elements/buffer
	icon_state = "buffer"

	calculate()

	connect()

	start()
		var/turf/T = src.loc
		var/turf/zad = get_step(src, turn(dir, 180))
		for(var/obj/machinery/logic_elements/LE in zad)
			current_state = LE.current_state

		world << "HELLO [current_state]"


		for(var/obj/machinery/M in T)
			if(M.iscon == 1)
				if(current_state == 1)
					M.act()


/obj/machinery/logic_elements/multiply
	icon_state = "logic_multiply"

	calculate(var/a, var/b)
		return a && b

/obj/machinery/logic_elements/addition
	icon_state = "logic_add"

	calculate(var/a, var/b)
		return a || b

/obj/machinery/logic_elements/equal
	icon_state = "logic_equal"

	calculate(var/a, var/b)
		return a == b