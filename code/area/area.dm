var/global/image/roof = image('icons/obj/roof.dmi')

/mob
	var/image/IMAGE

/area
	icon = 'icons/turf/areas.dmi'
	icon_state = "area"
	mouse_opacity = 0
	var/list/here = list()
	var/area/exited
	var/list/obj/roof/area_roof
	var/turf/simulated/floor/F
	var/list/power_machines = list()
	var/obj/machinery/PIZDA/power_device
	var/obj/machinery/smes/SMES
	var/list/collector_list = list()
	var/datum/machine_controller/MC

	station
		New()
			luminosity = 0
			layer = 0
			ul_Prep()
	/*
		Entered(var/mob/O)
			if(O && istype(O, /mob))
				if(O == usr)
					for(var/obj/roof/my_roof in O.loc.loc)
						usr << my_roof.NOROOF
						my_roof.NOROOF.override = 1
						exited = O.loc.loc

		Exited(var/mob/O)
			if(O && istype(O, /mob))
				if(O == usr)
					for(var/obj/roof/my_roof in exited)
						my_roof.NOROOF.override = 0
	*/
		arrival
			icon_state = "arrival"
			layer = 12


		AI
			icon_state = "AI"
			layer = 12

			Entered(var/mob/O)
				for(var/obj/machinery/computer/terminal/Kate/K in computer_can)
					//if(O //проверки
					var/checked = 0
					for(var/obj/machinery/computer/terminal/katebase/K2 in computer_can)
						for(O.name in K2.my_data)
							checked = 1

					if(checked == 1)
						K.message = "Greetings!"
					else
						K.message = "No access!"
						//место для процедуры

			Exited(var/mob/O)
				for(var/obj/machinery/computer/terminal/Kate/K in computer_can)
					//if(O //проверки
					var/checked = 0
					for(var/obj/machinery/computer/terminal/katebase/K2 in computer_can)
						for(O.name in K2.my_data)
							checked = 1

					if(checked == 1)
						K.message = "See you!"


		hallway1
			icon_state = "hall1"
			layer = 12

		hallway2
			icon_state = "hall2"
			layer = 12

		hallway3
			icon_state = "hall3"
			layer = 12

		hallway4
			icon_state = "hall4"
			layer = 12

		cargo
			icon_state = "cargo"
			layer = 12

		command
			icon_state = "command"
			layer = 12

		eng
			icon_state = "eng"
			layer = 12

		civilian
			icon_state = "civ"
			layer = 12

		med
			icon_state = "med"
			layer = 12

		sci
			icon_state = "sci"
			layer = 12

		sec
			icon_state = "sec"
			layer = 12

		maint1
			icon_state = "maint1"
			layer = 12

		maint2
			icon_state = "maint2"
			layer = 12

		maint3
			icon_state = "maint3"
			layer = 12
