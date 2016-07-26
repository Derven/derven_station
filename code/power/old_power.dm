var/global/DERVENPOWER = 0
var/global/list/smes = list()
var/global/list/apc = list()
var/global/list/cables = list()

/obj/cable
	name = "cable"
	icon = 'icons/obj/cable.dmi'
	var/powernet = 0
	var/reset = 0
	alpha = 128
	typer = 4

/obj/machinery/smes
	name = "smes"
	icon = 'icons/obj/POWER.dmi'
	icon_state = "smes"
	layer = 4
	var/power = 120000
	var/new_power = 0
	//

/obj/machinery
	var/use_power = 0
	var/powernet = 0

/obj/machinery/PIZDA
	name = "power intensity zone device assistant(PIZDA)"
	icon = 'icons/obj/POWER.dmi'
	icon_state = "apc"
	layer = 4
	var/reset = 0

	//
	var/power = 1000
	var/new_power = 0

/obj/machinery/PIZDA/act()
	world << "[powernet]; [power]"

/obj/machinery/PIZDA/New()
	apc += src
	var/area/MyArea = src.loc.loc
	MyArea.power_device = src
	process()

/obj/machinery/PIZDA/process()
	spawn while(1)
		sleep(1)
		if(reset == 1)
			reset = 0
			powernet = 0

/obj/machinery/smes/process()
	spawn while(1)
		sleep(1)
		for(var/obj/machinery/PIZDA/epta in apc)
			if(epta.powernet == powernet)
				if(power > 0)
					power -= 100
					epta.power += 100

/obj/cable/New()
	cables += src

/proc/CABLES()
	spawn while(1)
		sleep(1)
		for(var/obj/cable/C in cables)
			C.process()

/obj/cable/process()
	if(dir == 2 || dir == 1 ||  dir == 6 || dir == 10 || dir == 9 || dir == 5)

		for(var/obj/cable/A in get_step(src,NORTH))
			if(A.powernet != 0)
				powernet = A.powernet

		for(var/obj/cable/A in get_step(src,SOUTH))
			if(A.powernet != 0)
				powernet = A.powernet

		for(var/obj/machinery/PIZDA/A in get_step(src,SOUTH))
			if(powernet != 0)
				A.powernet = powernet

		for(var/obj/machinery/PIZDA/A in get_step(src,NORTH))
			if(powernet != 0)
				A.powernet = powernet

		for(var/obj/machinery/smes/S in get_step(src,SOUTH))
			powernet = S.powernet

		for(var/obj/machinery/smes/S in get_step(src,NORTH))
			powernet = S.powernet

		for(var/obj/machinery/generator/S in get_step(src,SOUTH))
			S.powernet = powernet

		for(var/obj/machinery/collector/S in get_step(src,SOUTH))
			S.powernet = powernet

		for(var/obj/machinery/collector/S in get_step(src,NORTH))
			S.powernet = powernet

		for(var/obj/machinery/generator/S in get_step(src,NORTH))
			S.powernet = powernet

	if(dir == 4 || dir == 6 || dir == 10 || dir == 9 || dir == 5)

		for(var/obj/cable/A in get_step(src,EAST))
			if(A.powernet != 0)
				powernet = A.powernet

		for(var/obj/cable/A in get_step(src,WEST))
			if(A.powernet != 0)
				powernet = A.powernet

		for(var/obj/machinery/smes/S in get_step(src,EAST))
			powernet = S.powernet

		for(var/obj/machinery/smes/S in get_step(src,WEST))
			powernet = S.powernet

		for(var/obj/machinery/generator/S in get_step(src,WEST))
			S.powernet = powernet

		for(var/obj/machinery/generator/S in get_step(src,EAST))
			S.powernet = powernet

		for(var/obj/machinery/collector/S in get_step(src,EAST))
			S.powernet = powernet

		for(var/obj/machinery/collector/S in get_step(src,WEST))
			S.powernet = powernet

		for(var/obj/machinery/PIZDA/A in get_step(src,EAST))
			if(powernet != 0)
				A.powernet = powernet

		for(var/obj/machinery/PIZDA/A in get_step(src,WEST))
			if(powernet != 0)
				A.powernet = powernet

	if(reset == 1) // åáàñáðîñ
		powernet = 0
		reset = 0
		world << "ÎÁÐÛÂ ÊÀÁÅËß Ê ÕÓßÌ ÁËßÄÜ"

/obj/cable/Del()

	for(var/obj/cable/P in world)
		if(powernet == P.powernet)
			P.reset = 1

	for(var/obj/machinery/PIZDA/A in apc)
		if(powernet == A.powernet)
			A.reset = 1

/obj/cable/act()
	world << "[powernet]"

/obj/machinery/smes/New()
	DERVENPOWER ++
	powernet = DERVENPOWER
	smes += src
	var/area/MyArea = src.loc.loc
	MyArea.SMES = src
	process()

/obj/machinery/generator
	name = "generator"
	icon = 'icons/obj/POWER.dmi'
	icon_state = "generator"
	layer = 4

/obj/machinery/smes/act()
	usr << "Power equal [power]"

/obj/machinery/generator/act()
	usr << "Wow. Energy"
	for(var/obj/machinery/smes/S in smes)
		if(S)
			if(S.powernet == powernet)
				S.new_power += 100
				S.power += S.new_power