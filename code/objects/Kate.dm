/obj/machinery/Kate_status
	icon = 'icons/obj/machine/Kate.dmi'
	icon_state = "status_display_1"

	proc/Emotion(var/num)
		icon_state = "status_display_[num]"

	New()
		computer_can += src

/atom/proc

/obj/machinery/soundkate
	icon = 'icons/obj/machine/Kate.dmi'
	icon_state = "sound"

	New()
		computer_can += src

	proc/speak(var/message)
		message_for_mobs(8, "\blue Kate say, \"[message]\"")

/obj/LUNALIGHT
	New()
		src.ul_SetLuminosity(0, 2, 5)

/obj/machinery/computer/terminal/Kate
	icon = 'icons/obj/machine/Kate.dmi'
	icon_state = "kate"
	name = "Kate"
	var/message
	var/emote = 1

	proc/KateLife()
		spawn while(1)
			sleep(3)
			for(var/obj/machinery/computer/terminal/katebase/KB in computer_can)
				KB.scan()

			for(var/obj/machinery/soundkate/SK in computer_can)
				if(message)
					SK.speak(message)
					message = null

			for(var/obj/machinery/Kate_status/KS in computer_can)
				KS.Emotion(emote)

	New()
		computer_can += src
		KateLife()

/obj/machinery/computer/terminal/katebase
	icon_state = "terminal_kate"
	var/list/my_data = list()
	var/list/danger = list()

	proc/scan()
		for(var/obj/machinery/sensor/S in computer_can)
			var/check_me = 0
			if(S.data)
				message_for_mobs(8, "\blue Kate load!")
				sleep(2)
				for(var/data_unit in my_data)
					if(data_unit == S.data)
						check_me = 1
						S.data = null
				if(check_me == 0)
					my_data += S.data
					message_for_mobs(8, "\blue Added to the base!")

				for(S.data in danger)
					message_for_mobs(8, "\red Danger!")



/obj/machinery/computer/terminal/katebase/New()
	new /obj/item/memory_computer/Katebase(src)
	computer_can += src
	find_machines()