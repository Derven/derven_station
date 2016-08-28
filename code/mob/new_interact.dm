//взаимодействие с различными объектами

client/show_popup_menus = 0

/atom/proc/pew(var/atom/movable/A)

/atom/proc/act()

/atom/proc/hit(var/atom/movable/A, var/direction, var/force)

	message_for_mobs(5, pick('punch_1.ogg','punch_2.ogg'))
	if(istype(A, /obj/beam))
		if(A)
			del(A)

	if(!istype(src, /obj/cable))
		if(A)
			message_for_mobs(5, "\red [A] hit to [src]")
			if(direction && force)
				var/list/directions = list(SOUTH, WEST, EAST, NORTH)
				directions -= direction
				var/my_dir = pick(directions[1], directions[2], directions[3])
				if(force > get_endurance() && force * 10 > A.weight)
					message_for_mobs(5, "\red [A] bounces from [src]")
					A.force_to(force, my_dir)

/atom/proc/act_by_item(var/obj/item/I)

/atom/proc/act_self(var/obj/item/I)

/atom/proc/del_from_hand(src)
	if(usr.my_hand_active == "right")
		for(src in usr.contents)
			if(istype(src, usr.rhand_items[1]))
				usr.rhand_items.Cut()
				usr.R.overlays -= src
				del(src)

	if(usr.my_hand_active == "left")
		for(src in usr.contents)
			if(istype(src, usr.lhand_items[1]))
				usr.lhand_items.Cut()
				usr.L.overlays -= src
				del(src)

/atom/proc/clear_hand(src)
	if(usr.my_hand_active == "right")
		for(src in usr.contents)
			if(istype(src, usr.rhand_items[1]))
				usr.rhand_items.Cut()
				usr.R.overlays -= src

	if(usr.my_hand_active == "left")
		for(src in usr.contents)
			if(istype(src, usr.lhand_items[1]))
				usr.lhand_items.Cut()
				usr.L.overlays -= src

/atom/Click(location,control,params)

	params = params2list(params)
	if("right" in params)
		if(pull == 0 && usr.my_pull_eba < 2 && weight < usr.can_get && anchored == 0)
			pull = 1
			puller = usr
			usr.my_pull_eba += 1
			return

		if(pull == 1)
			pull = 0
			puller = 0
			usr.my_pull_eba -= 1
			return

	if("left" in params)
		if(src in range(1, usr))
			if(usr.my_hand_active == "right")
				if(usr.rhand_items.len == 0)
					message_for_mobs(5, 'sound/item.ogg')
					act()

				if(usr.rhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.rhand_items[1]))
							act_by_item(O)

			if(usr.my_hand_active == "left")
				if(usr.lhand_items.len == 0)
					message_for_mobs(5, 'sound/item.ogg')
					act()

				if(usr.lhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.lhand_items[1]))
							act_by_item(O)

		if(get_dist(src,usr) > 1)
			if(usr.my_hand_active == "right")
				if(usr.rhand_items.len != 0)
					if(usr.throw_mode == 1)
						usr.throw_out(src)
						usr.throw_mode = 0
						usr.TI.icon_state = "act_throw_off"
					for(var/obj/item/weapon/gun/G in usr.contents)
						if(istype(G, usr.rhand_items[1]))
							G = usr.rhand_items[1]
							G.pew(src)
							return

			if(usr.my_hand_active == "left")
				if(usr.lhand_items.len != 0)
					if(usr.throw_mode == 1)
						usr.throw_out(src)
						usr.throw_mode = 0
						usr.TI.icon_state = "act_throw_off"
					for(var/obj/item/weapon/gun/G in usr.contents)
						if(istype(G, usr.lhand_items[1]))
							G = usr.lhand_items[1]
							G.pew(src)
							return

		if(src in usr.client.screen)
			if(!istype(src, /obj/screen/human) && !istype(src, /obj/screen/act_intent) && !istype(src, /obj/screen/run_intent) && !istype(src, /obj/screen/drop))
				if(usr.my_hand_active == "right")

					if(usr.rhand_items.len != 0)
						for(var/obj/O in usr.contents)
							if(istype(O, usr.rhand_items[1]))
								act_by_item(O)
					else
						act()

				if(usr.my_hand_active == "left")
					if(usr.lhand_items.len != 0)
						for(var/obj/O in usr.contents)
							if(istype(O, usr.lhand_items[1]))
								act_by_item(O)
					else
						act()

/obj/item/act()

	if(usr.s_active)
		world << length(usr.s_active.contents)
	if(usr.my_hand_active == "left")
		if(!(usr.stat & AMP_L_ARM) && !(usr.stat & BROKEN_L_ARM))
			if(usr.lhand_items.len == 0)
				usr.lhand_items += src
				var/J = usr.lhand_items[1]
				world << "[J]"
				usr.client.screen -= src
				usr.draw_item_hand(usr.my_hand_active, src)
			else
				Move(usr)
			Move(usr)


	if(usr.my_hand_active == "right")
		if(!(usr.stat & AMP_R_ARM) && !(usr.stat & BROKEN_R_ARM))
			if(usr.rhand_items.len == 0)
				usr.rhand_items += src
				var/J = usr.rhand_items[1]
				world << "[J]"
				usr.client.screen -= src
				usr.draw_item_hand(usr.my_hand_active, src)
			else
				Move(usr)
			Move(usr)

/mob/proc/drop()
	if(usr.my_hand_active == "left")
		for(var/obj/O in usr.contents)
			if(usr.lhand_items.len)
				if(O == usr.lhand_items[1])
					usr.lhand_items.Cut()
					usr.L.overlays -= O
					O.Move(src.loc)
					return O

	if(usr.my_hand_active == "right")
		for(var/obj/O in usr.contents)
			if(usr.rhand_items.len)
				if(O == usr.rhand_items[1])
					usr.rhand_items.Cut()
					usr.R.overlays -= O
					O.Move(src.loc)
					return O

/mob/proc/throw_out(var/atom/movable/AM)
	for(var/obj/O in usr.contents)
		if(usr.my_hand_active == "left")
			if(usr.lhand_items.len)
				if(istype(O, usr.lhand_items[1]))
					usr.lhand_items.Cut()
					usr.L.overlays -= O
					O.Move(usr.loc)
					var/check_DENSITY = 0
					while((AM.x != O.x || AM.y != O.y) && check_DENSITY != 1)
						sleep(1)
						var/turf/T = get_step(O, get_dir(O, AM))
						for(var/atom/movable/A in T)
							if(A.density == 1 || istype(A, /obj/structure/window))
								check_DENSITY = 1
								A.hit(O, 3, 3)
						if(T.density != 1)
							O.Move(T)
						else
							T.hit(O, 3, 3)
							check_DENSITY = 1

		if(usr.my_hand_active == "right")
			if(usr.rhand_items.len)
				if(istype(O, usr.rhand_items[1]))
					usr.rhand_items.Cut()
					usr.R.overlays -= O
					O.Move(usr.loc)
					var/check_DENSITY = 0
					while((AM.x != O.x || AM.y != O.y) && check_DENSITY != 1)
						sleep(1)
						var/turf/T = get_step(O, get_dir(O, AM))
						for(var/atom/movable/A in T)
							if(A.density == 1 || istype(A, /obj/structure/window))
								check_DENSITY = 1
								A.hit(O, 3, 3)
						if(T.density != 1)
							O.Move(T)
						else
							T.hit(O, 3, 3)
							check_DENSITY = 1
/mob/proc/drop_all()
	for(var/obj/O in usr.contents)
		if(usr.lhand_items.len)
			if(istype(O, usr.lhand_items[1]))
				usr.lhand_items.Cut()
				usr.L.overlays -= O
				O.Move(src.loc)

		if(usr.rhand_items.len)
			if(istype(O, usr.rhand_items[1]))
				usr.rhand_items.Cut()
				usr.R.overlays -= O
				O.Move(src.loc)

/atom
	var/pull = 0
	var/puller = 0
	var/anchored = 0

