/obj/structure
	icon = 'icons/obj/structure.dmi'

/obj/structure/window
	name = "window"
	icon_state = "windows"
	density = 1
	opacity = 0
	pass_gas = 0
	pass = 1
	freq = 21
	layer = 8

	proc/check_move(var/atom/movable/O)
		if(O.dir != src.dir)
			return 0
		else
			return 1

		if(dir == 1)
			if(O.y > y)
				return 1

			if(O.y > y)
				return 1

		if(dir == 2)
			if(O.y < y)
				return 1

			if(O.y > y)
				return 1

		if(dir == 4)
			if(O.x < x)
				return 1

			if(O.x > x)
				return 1

		if(dir == 8)
			if(O.x < x)
				return 1

			if(O.x > x)
				return 1

/obj/structure/grille
	name = "hatch"
	icon_state = "hatch"
	density = 1
	opacity = 0
	pass_gas = 1
	pass = 1
	layer = 7

/obj/structure/flora
	icon = 'icons/effects/flora.dmi'

/obj/structure/stool
	name = "stool"
	icon_state = "stool"

/obj/structure/toilet
	icon = 'icons/obj/trash.dmi'
	icon_state = "toilet"

/obj/structure/table
	name = "table"
	icon = 'icons/obj/table.dmi'
	density = 1
	layer = 6

	act_by_item(var/obj/item/I)
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src.loc)
					usr << "\bold You put [I] on [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src.loc)
					usr << "\bold You put [I] on [src]"

					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/structure/table/surgery
	icon = 'icons/obj/surgery.dmi'
	icon_state = "table1"
	alpha = 255

/obj/structure/table/surgery/act()
	usr.loc = src.loc
	usr.dir = 2

/obj/structure/closet/crate
	name = "crate"
	desc = "The crate"
	icon = 'icons/obj/crate.dmi'
	icon_state = "closed"

/obj/structure/closet/crate/classic
	name = "crate"
	icon = 'icons/obj/crate.dmi'
	icon_state = "crateclosed"
	mycloset = "crate"

/obj/structure/closet/crate/radiation
	name = "crate"
	icon = 'icons/obj/crate.dmi'
	icon_state = "radiationclosed"
	mycloset = "radiation"

/obj/structure/closet/crate/medical
	name = "crate"
	icon = 'icons/obj/crate.dmi'
	icon_state = "medicalcrateclosed"
	mycloset = "medicalcrate"

/obj/structure/closet/crate/o2
	name = "crate"
	icon = 'icons/obj/crate.dmi'
	icon_state = "o2crateclosed"
	mycloset = "o2crate"

/obj/structure/closet
	name = "closet"
	icon = 'icons/obj/closet.dmi'
	icon_state = "closed"
	var/mycloset = ""
	density = 1
	var/open = 0
	var/list/obj/item/container = list()

	act()
		if(open == 0)
			open = 1
			icon_state = "[mycloset]open"
			usr << "\blue [src] is  opened"
			for(var/obj/item/IT in contents)
				IT.Move(src.loc)
		else
			open = 0
			icon_state = "[mycloset]closed"
			var/turf/T = src.loc
			for(var/obj/item/IT in T)
				IT.Move(src)
			usr << "\blue [src] is closed"
			return
	New()
		open = 0
		objects += src
		sleep(1)
		for(var/obj/item/IT in src.loc)
			IT.Move(src)

	act_by_item(var/obj/item/I)
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold You put [I] in [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold You put [I] in [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/structure/closet/library
	icon = 'icons/obj/library.dmi'
	icon_state = "book-0"

	act()
		if(open == 0)
			open = 1
			for(var/obj/item/IT in contents)
				IT.Move(src.loc)
			if(contents.len == 0)
				icon_state = "book-0"
		else
			open = 0
			if(contents.len != 0)
				icon_state = "book-1"
			var/turf/T = src.loc
			for(var/obj/item/IT in T)
				IT.Move(src)
			return

	act_by_item(var/obj/item/I)
		for(I in usr.contents)
			if(istype(I, /obj/item/book))
				if(usr.client.my_hand_active == "left")
					if(istype(I, usr.client.lhand_items[1]))
						I.Move(src)
						icon_state = "book-1"
						usr << "\bold You put [I] in [src]"
						usr.client.L.overlays.Cut()
						usr.client.lhand_items.Cut()

				if(usr.client.my_hand_active == "right")
					if(istype(I, usr.client.rhand_items[1]))
						I.Move(src)
						icon_state = "book-1"
						usr << "\bold You put [I] in [src]"
						usr.client.R.overlays.Cut()
						usr.client.rhand_items.Cut()

/obj/structure/closet/sec_1
	icon_state = "sec_closed"
	mycloset = "sec_"

/obj/structure/closet/mining
	icon_state = "mining_closed"
	mycloset = "mining_"

/obj/structure/closet/sec_2
	icon_state = "sec2_closed"
	mycloset = "sec2_"

/obj/lobb_y
	name = "lobby"
	icon = 'icons/lobby.dmi'
	layer = 33


/obj/structure/chair
	icon_state = "chair"

	act()
		var/turf/T = usr.loc
		if(T == src.loc)
			if(usr.buckled == 0)
				usr << "\blue You buckled to the chair"
				usr.buckled = 1
				anchored = 1
				usr.dir = dir
				return
			else
				usr << "\blue You unbuckled from the chair"
				usr.buckled = 0
				layer = 2.2
				anchored = 0
				return

/mob
	var/buckled = 0

/obj/structure/chair/bed
	icon_state = "bed"

	act()
		var/turf/T = usr.loc
		if(istype(usr,/mob/human))
			var/mob/human/H = usr
			if(T == src.loc)
				if(usr.buckled == 0)
					usr << "\blue You buckled to the bed"
					usr.buckled = 1
					H.lying()
					anchored = 1
					usr.dir = dir
					return
				else
					usr << "\blue You unbuckled from the bed"
					usr.buckled = 0
					H.unlying()
					anchored = 0
					H.lying = 0
					return

/obj/structure/lattice
	icon_state = "lattice"

/*
obj/structure/hatch
	name = "hatch"
	icon = 'icons/obj/structure.dmi'
	icon_state = "hatch"
	pass_gas = 0
*/