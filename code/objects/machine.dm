var/list/global/machines = list()
var/list/global/computer_can = list()
var/list/global/lamps = list()

/obj/machinery
	name = "machinery"
	var/need_voltage = 0
	var/need_amperage = 0
	var/on

/obj/machinery/recharger
	name = "recharger"
	icon = 'icons/obj/machine/shaitan_machine.dmi'
	icon_state = "recharger"
	need_amperage = 35
	on = 0

/obj/machinery/recharger/check()
	if(on == 1)
		icon_state = "recharge_on"
	else
		icon_state = "recharger"

/obj/machinery/light
	name = "light"
	icon = 'icons/obj/light.dmi'
	icon_state = "light"
	luminosity = 0
	layer = 4
	on = 0
	use_power = 1
	//resistance = 15
	need_amperage = 5
	var/pam_pam = 0
	var/broken = 0

	Del()
		luminosity = 0

/obj/machinery/light/act()
	//world << "[marker]"

/obj/machinery/New()
	on = 0
	personal_id += 1
	processing = 1
	objects += src
	my_id = personal_id
	process()

/obj/machinery/light/New()
	processing = 1
	objects += src
	lamps += src
	on = 0
	process()

/atom
	var/stop_process = 0

/obj/machinery/light/check()

	if(on == 1 && broken == 0)
		luminosity = 6
	else
		luminosity = 0

/obj/machinery/proc/check()

/obj/machinery/process()
	machines += src
	spawn while(1)
		sleep(6)
		if(stop_process == 1)
			return
		if(use_power == 1)
			var/area/MyArea = src.loc.loc
			var/obj/machinery/PIZDA/S = MyArea.power_device
			sleep(1)
			if(S)
				if(S.power > 0)
					S.power -= 1
					on = 1
				else
					on = 0
				check()
			//if(amperage >= need_amperage && marker == 0)
			//	on = 1
			//	amperage = 0
		//	else
		//		on = 0

		/*if(use_power == 1)
			for(var/obj/machinery/PIZDA/S in range(5,src))
				if(S.power > 0)
					S.power -= 1

					if(istype(src, /obj/machinery/light) || istype(src, /obj/machinery/door) || istype(src, /obj/machinery/firedoor) || istype(src, /obj/machinery/computer))
						on = 1
				else
					on = 0
				//world << "Банк энергии несет в себе [S.power] энергоединиц"
*/
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/obj/machinery
	var/computer_access

/obj/machinery/computer
	icon = 'icons/obj/machine/computer.dmi'
	icon_state = "computer"
	name = "computer"
	use_power = 1
	typer = 16
	on = 1

/obj/machinery/computer/terminal
	icon = 'icons/obj/machine/computer.dmi'
	icon_state = "terminal"
	name = "computer"
	layer = 8
	use_power = 1
	on = 1
	density = 1
	computer_access = "public_computer"
	var/base_screen

	proc/upd_disp()
		for(var/obj/item/memory_computer/MC in src)
			overlays.Cut()
			var/image/I = image(icon, "overlay_[MC.icon_state]")
			overlays += I

/obj/machinery/computer/terminal/arcade
	icon_state = "arcade"

	New()
		new /obj/item/memory_computer/arcade(src)
		upd_disp()
		find_machines()

/obj/machinery/computer/terminal/white
	icon_state = "terminal_white"

/atom/proc/message_for_mobs(var/num, var/message)
	for(var/mob/M in range(num, src))
		M << message

/obj/machinery/computer/terminal/New()
	new /obj/item/memory_computer/standart(src)
	upd_disp()
	find_machines()


/obj/machinery/computer/terminal
	act()
		find_machines()
		usr << browse(base_screen,"window=base_screen")


	proc/find_machines()
		base_screen = "<html>\
		<body>\
		[STYLE] \
		<div class=\"main\"><h1><center>DURA SYSTEM 0.1.0</center></h1></div>"
		for(var/obj/item/memory_computer/MC in src)
			base_screen += "<div class=\"module\"><br><h3>[MC.name]</h3></div><div class=\"main\">"
			for(var/obj/machinery/M in computer_can)
				if(MC.computer_access_me.Find(M.computer_access))
					base_screen += "<br><a href='?src=\ref[M];act=go'>[M]</a>"

		base_screen += "<br><a href='?src=\ref[src];act=go'>Disk</a>"
		base_screen += "</div></body>"
		base_screen += "</html>"

/obj/machinery/computer/terminal/act_by_item(var/obj/item/I)
	if(istype(I, /obj/item/memory_computer))
		var/disk_here = 0
		for(var/obj/item/memory_computer/MC in src)
			disk_here = 1
			usr << "\red disk is here"

		if(!disk_here)
			I.clear_hand(I)
			I.Move(src)
			usr << "\blue You inserts the disk"
			upd_disp()

/obj/item/memory_computer
	icon = 'icons/obj/machine/computer.dmi'
	name = "floppy"
	icon_state = "floppy"
	var/list/computer_access_me = list()

	standart
		name = "standart floppy"
		computer_access_me = list("door","public_computer") //айди определяет возможный доступ к разным устройствам, смена дисков - меняет доступ и возможности компьютера

	sensors
		name = "sensors floppy"
		computer_access_me = list("sensor") //айди определяет возможный доступ к разным устройствам, смена дисков - меняет доступ и возможности компьютера

	cargo
		icon_state = "cargo"
		name = "cargo floppy"
		computer_access_me = list("conv","public_computer") //айди определяет возможный доступ к разным устройствам, смена дисков - меняет доступ и возможности компьютера

	Katebase
		icon_state = "Kate"
		computer_access_me = list("katesensor")

	arcade
		icon_state = "arcade_floppy"

/*
/obj/machinery/gibber
	icon = 'icons/hydro.dmi'
	icon_state = "gibber"
	name = "HRUM-HRUM MACHINE"

	act_by_item(var/mob/I)

		if(I == /mob/carp)
			usr << "\red HRUM-HRUM "

			new /obj/item/meat(src.loc)

			if(usr.client.hand == 1)
				usr.client.my_rhand_contents = 0
				usr.client.R.overlays.Cut()
			if(usr.client.hand == 0)
				usr.client.my_lhand_contents = 0
				usr.client.L.overlays.Cut()
*/