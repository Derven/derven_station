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
	if(usr.client.my_hand_active == "right")
		for(src in usr.contents)
			if(istype(src, usr.client.rhand_items[1]))
				usr.client.rhand_items.Cut()
				usr.client.R.overlays -= src
				del(src)

	if(usr.client.my_hand_active == "left")
		for(src in usr.contents)
			if(istype(src, usr.client.lhand_items[1]))
				usr.client.lhand_items.Cut()
				usr.client.L.overlays -= src
				del(src)

/atom/proc/clear_hand(src)
	if(usr.client.my_hand_active == "right")
		for(src in usr.contents)
			if(istype(src, usr.client.rhand_items[1]))
				usr.client.rhand_items.Cut()
				usr.client.R.overlays -= src

	if(usr.client.my_hand_active == "left")
		for(src in usr.contents)
			if(istype(src, usr.client.lhand_items[1]))
				usr.client.lhand_items.Cut()
				usr.client.L.overlays -= src

/atom/Click(location,control,params)

	params = params2list(params)
	if("right" in params)
		if(pull == 0 && usr.client.my_pull_eba < 2 && weight < usr.client.can_get && anchored == 0)
			pull = 1
			puller = usr
			usr.client.my_pull_eba += 1
			return

		if(pull == 1)
			pull = 0
			puller = 0
			usr.client.my_pull_eba -= 1
			return

	if("left" in params)
		if(src in range(1, usr))
			if(usr.client.my_hand_active == "right")
				if(usr.client.rhand_items.len == 0)
					message_for_mobs(5, 'sound/item.ogg')
					act()

				if(usr.client.rhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.client.rhand_items[1]))
							act_by_item(O)

			if(usr.client.my_hand_active == "left")
				if(usr.client.lhand_items.len == 0)
					message_for_mobs(5, 'sound/item.ogg')
					act()

				if(usr.client.lhand_items.len != 0)
					for(var/obj/O in usr.contents)
						if(istype(O, usr.client.lhand_items[1]))

							act_by_item(O)

		if(get_dist(src,usr) > 1)
			if(usr.client.my_hand_active == "right")
				if(usr.client.rhand_items.len != 0)
					for(var/obj/item/weapon/gun/G in usr.contents)
						if(istype(G, usr.client.rhand_items[1]))
							G = usr.client.rhand_items[1]
							G.pew(src)
							return

			if(usr.client.my_hand_active == "left")
				if(usr.client.lhand_items.len != 0)
					for(var/obj/item/weapon/gun/G in usr.contents)
						if(istype(G, usr.client.lhand_items[1]))
							G = usr.client.lhand_items[1]
							G.pew(src)
							return

		if(src in usr.client.screen)
			if(!istype(src, /obj/screen/human) && !istype(src, /obj/screen/act_intent) && !istype(src, /obj/screen/run_intent) && !istype(src, /obj/screen/drop))
				if(usr.client.my_hand_active == "right")

					if(usr.client.rhand_items.len != 0)
						for(var/obj/O in usr.contents)
							if(istype(O, usr.client.rhand_items[1]))
								act_by_item(O)
					else
						act()

				if(usr.client.my_hand_active == "left")
					if(usr.client.lhand_items.len != 0)
						for(var/obj/O in usr.contents)
							if(istype(O, usr.client.lhand_items[1]))
								act_by_item(O)
					else
						act()

/obj/item/act()

	if(usr.client.my_hand_active == "left")
		if(!usr.l_arm_broken)
			Move(usr)
			if(usr.client.lhand_items.len == 0)
				usr.client.lhand_items += src
				usr.client.draw_item_hand(usr.client.my_hand_active, src)
			else
				Move(usr)

	if(usr.client.my_hand_active == "right")
		if(!usr.r_arm_broken)
			Move(usr)
			if(usr.client.rhand_items.len == 0)
				usr.client.rhand_items += src
				usr.client.draw_item_hand(usr.client.my_hand_active, src)
			else
				return

/mob/proc/drop()
	if(usr.client.my_hand_active == "left")
		for(var/obj/O in usr.contents)
			if(usr.client.lhand_items.len)
				if(istype(O, usr.client.lhand_items[1]))
					usr.client.lhand_items.Cut()
					usr.client.L.overlays -= O
					O.Move(src.loc)

	if(usr.client.my_hand_active == "right")
		for(var/obj/O in usr.contents)
			if(usr.client.rhand_items.len)
				if(istype(O, usr.client.rhand_items[1]))
					usr.client.rhand_items.Cut()
					usr.client.R.overlays -= O
					O.Move(src.loc)

/mob/proc/drop_all()
	for(var/obj/O in usr.contents)
		if(usr.client.lhand_items.len)
			if(istype(O, usr.client.lhand_items[1]))
				usr.client.lhand_items.Cut()
				usr.client.L.overlays -= O
				O.Move(src.loc)

		if(usr.client.rhand_items.len)
			if(istype(O, usr.client.rhand_items[1]))
				usr.client.rhand_items.Cut()
				usr.client.R.overlays -= O
				O.Move(src.loc)

/atom
	var/pull = 0
	var/puller = 0
	var/anchored = 0

