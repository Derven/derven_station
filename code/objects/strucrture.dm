var/list/directions = list(EAST, WEST, SOUTH, NORTH, SOUTHWEST, NORTHWEST, SOUTHEAST, NORTHEAST)

/obj/structure
	icon = 'icons/obj/structure.dmi'

/obj/structure/table/woodentable
/obj/structure/table/reinforced

/obj/structure/table/rack

	New()
		..()
		return

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
	layer = 5

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

	New()
		..()
		for(var/obj/structure/table/T in src.loc)
			if(T != src)
				del(T)
		update_icon()
		for(var/direction in list(1,2,4,8,5,6,9,10))
			if(locate(/obj/structure/table,get_step(src,direction)))
				var/obj/structure/table/T = locate(/obj/structure/table,get_step(src,direction))
				T.update_icon()

	proc/update_icon()
		spawn(2) //So it properly updates when deleting
			var/dir_sum = 0
			for(var/direction in list(1,2,4,8,5,6,9,10))
				var/skip_sum = 0
				for(var/obj/structure/window/W in src.loc)
					if(W.dir == direction) //So smooth tables don't go smooth through windows
						skip_sum = 1
						continue
				var/inv_direction //inverse direction
				switch(direction)
					if(1)
						inv_direction = 2
					if(2)
						inv_direction = 1
					if(4)
						inv_direction = 8
					if(8)
						inv_direction = 4
					if(5)
						inv_direction = 10
					if(6)
						inv_direction = 9
					if(9)
						inv_direction = 6
					if(10)
						inv_direction = 5
				for(var/obj/structure/window/W in get_step(src,direction))
					if(W.dir == inv_direction) //So smooth tables don't go smooth through windows when the window is on the other table's tile
						skip_sum = 1
						continue
				if(!skip_sum) //means there is a window between the two tiles in this direction
					if(locate(/obj/structure/table,get_step(src,direction)))
						if(direction <5)
							dir_sum += direction
						else
							if(direction == 5)	//This permits the use of all table directions. (Set up so clockwise around the central table is a higher value, from north)
								dir_sum += 16
							if(direction == 6)
								dir_sum += 32
							if(direction == 8)	//Aherp and Aderp.  Jezes I am stupid.  -- SkyMarshal
								dir_sum += 8
							if(direction == 10)
								dir_sum += 64
							if(direction == 9)
								dir_sum += 128

			//dir_sum%16:
			//  1,2,4,8 = endtable
			//  3,12 = streight 1 tile thick table
			//  5,6,9,10 = corner, if it finds a table in get_step(src,dir_sum) then it's a full corner table, else it's a 1 tile chick corner table
			//  7,11,13,14 = three way intersection = full side table piece (north ,south, east or west)
			//  15 = four way intersection = center (aka middle) table piece
			//
			//table_type:
			//  0 = stand-alone table
			//  1 = end table (1 tile thick, 1 connection)
			//  2 = 1 tile thick table (1 tile thick, 2 connections)
			//  3 = full table (full, 3 connections)
			//  4 = middle table (full, 4 connections)

			var/table_type = 0 //stand_alone table
			if(dir_sum%16 in directions)
				table_type = 1 //endtable
				dir_sum %= 16
			if(dir_sum%16 in list(3,12))
				table_type = 2 //1 tile thick, streight table
				if(dir_sum%16 == 3) //3 doesn't exist as a dir
					dir_sum = 2
				if(dir_sum%16 == 12) //12 doesn't exist as a dir.
					dir_sum = 4
			if(dir_sum%16 in list(5,6,9,10))
				if(locate(/obj/structure/table,get_step(src.loc,dir_sum%16)))
					table_type = 3 //full table (not the 1 tile thick one, but one of the 'tabledir' tables)
				else
					table_type = 2 //1 tile thick, corner table (treated the same as streight tables in code later on)
				dir_sum %= 16
			if(dir_sum%16 in list(13,14,7,11)) //Three-way intersection
				table_type = 5 //full table as three-way intersections are not sprited, would require 64 sprites to handle all combinations.  TOO BAD -- SkyMarshal
				switch(dir_sum%16)	//Begin computation of the special type tables.  --SkyMarshal
					if(7)
						if(dir_sum == 23)
							table_type = 6
							dir_sum = 8
						else if(dir_sum == 39)
							dir_sum = 4
							table_type = 6
						else if(dir_sum == 55 || dir_sum == 119 || dir_sum == 247 || dir_sum == 183)
							dir_sum = 4
							table_type = 3
						else
							dir_sum = 4
					if(11)
						if(dir_sum == 75)
							dir_sum = 5
							table_type = 6
						else if(dir_sum == 139)
							dir_sum = 9
							table_type = 6
						else if(dir_sum == 203 || dir_sum == 219 || dir_sum == 251 || dir_sum == 235)
							dir_sum = 8
							table_type = 3
						else
							dir_sum = 8
					if(13)
						if(dir_sum == 29)
							dir_sum = 10
							table_type = 6
						else if(dir_sum == 141)
							dir_sum = 6
							table_type = 6
						else if(dir_sum == 189 || dir_sum == 221 || dir_sum == 253 || dir_sum == 157)
							dir_sum = 1
							table_type = 3
						else
							dir_sum = 1
					if(14)
						if(dir_sum == 46)
							dir_sum = 1
							table_type = 6
						else if(dir_sum == 78)
							dir_sum = 2
							table_type = 6
						else if(dir_sum == 110 || dir_sum == 254 || dir_sum == 238 || dir_sum == 126)
							dir_sum = 2
							table_type = 3
						else
							dir_sum = 2 //These translate the dir_sum to the correct dirs from the 'tabledir' icon_state.
			if(dir_sum%16 == 15)
				table_type = 4 //4-way intersection, the 'middle' table sprites will be used.

			if(istype(src,/obj/structure/table/reinforced))
				switch(table_type)
					if(0)
						icon_state = "reinf_table"
					if(1)
						icon_state = "reinf_1tileendtable"
					if(2)
						icon_state = "reinf_1tilethick"
					if(3)
						icon_state = "reinf_tabledir"
					if(4)
						icon_state = "reinf_middle"
					if(5)
						icon_state = "reinf_tabledir2"
					if(6)
						icon_state = "reinf_tabledir3"
			else if(istype(src,/obj/structure/table/woodentable))
				switch(table_type)
					if(0)
						icon_state = "wood_table"
					if(1)
						icon_state = "wood_1tileendtable"
					if(2)
						icon_state = "wood_1tilethick"
					if(3)
						icon_state = "wood_tabledir"
					if(4)
						icon_state = "wood_middle"
					if(5)
						icon_state = "wood_tabledir2"
					if(6)
						icon_state = "wood_tabledir3"
			else
				switch(table_type)
					if(0)
						icon_state = "table"
					if(1)
						icon_state = "table_1tileendtable"
					if(2)
						icon_state = "table_1tilethick"
					if(3)
						icon_state = "tabledir"
					if(4)
						icon_state = "table_middle"
					if(5)
						icon_state = "tabledir2"
					if(6)
						icon_state = "tabledir3"
			if (dir_sum in list(1,2,4,8,5,6,9,10))
				dir = dir_sum
			else
				dir = 2


	act_by_item(var/obj/item/I)
		for(I in usr.contents)
			if(usr.my_hand_active == "left")
				if(istype(I, usr.lhand_items[1]))
					I.Move(src.loc)
					usr << "\bold You put [I] on [src]"
					usr.L.overlays.Cut()
					usr.lhand_items.Cut()

			if(usr.my_hand_active == "right")
				if(istype(I, usr.rhand_items[1]))
					I.Move(src.loc)
					usr << "\bold You put [I] on [src]"

					usr.R.overlays.Cut()
					usr.rhand_items.Cut()

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
		PUT(I, usr)
/*
		for(I in usr.contents)
			if(usr.my_hand_active == "left")
				if(istype(I, usr.lhand_items[1]))
					I.Move(src)
					usr << "\bold You put [I] in [src]"
					usr.L.overlays.Cut()
					usr.lhand_items.Cut()

			if(usr.my_hand_active == "right")
				if(istype(I, usr.rhand_items[1]))
					I.Move(src)
					usr << "\bold You put [I] in [src]"
					usr.R.overlays.Cut()
					usr.rhand_items.Cut()
*/
/obj/proc/PUT(var/obj/item/I, var/mob/usr)
	for(I in usr.contents)
		if(usr.my_hand_active == "left")
			if(istype(I, usr.lhand_items[1]))
				I.Move(src)
				usr << "\bold You put [I] in [src]"
				usr.L.overlays.Cut()
				usr.lhand_items.Cut()

		if(usr.my_hand_active == "right")
			if(istype(I, usr.rhand_items[1]))
				I.Move(src)
				usr << "\bold You put [I] in [src]"
				usr.R.overlays.Cut()
				usr.rhand_items.Cut()

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
				if(usr.my_hand_active == "left")
					if(istype(I, usr.lhand_items[1]))
						I.Move(src)
						icon_state = "book-1"
						usr << "\bold You put [I] in [src]"
						usr.L.overlays.Cut()
						usr.lhand_items.Cut()

				if(usr.my_hand_active == "right")
					if(istype(I, usr.rhand_items[1]))
						I.Move(src)
						icon_state = "book-1"
						usr << "\bold You put [I] in [src]"
						usr.R.overlays.Cut()
						usr.rhand_items.Cut()

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