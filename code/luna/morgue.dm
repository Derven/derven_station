/obj/morgue
	name = "morgue"
	icon = 'icons/obj/morgue.dmi'
	icon_state = "morgue0"
	density = 1
	var/obj/m_tray/connected = null
	anchored = 1.0

/obj/m_tray
	name = "morgue tray"
	icon = 'icons/obj/morgue.dmi'
	icon_state = "morguet"
	density = 0
	layer = 2.0
	var/obj/morgue/connected = null
	anchored = 1.0

/obj/morgue/proc/update()
	if (src.connected)
		src.icon_state = "morgue0"
	else
		if (src.contents.len)
			src.icon_state = "morgue1"
		else
			src.icon_state = "morgue0"
	return

/obj/morgue/act()
	if (src.connected)
		for(var/atom/movable/A as mob|obj in src.connected.loc)
			if (!( A.anchored ))
				A.loc = src
		message_for_mobs(5, pick('punch_1.ogg','punch_2.ogg'))
		//src.connected = null
		del(src.connected)
	else
		message_for_mobs(5, pick('punch_1.ogg','punch_2.ogg'))
		src.connected = new /obj/m_tray( src.loc )
		step(src.connected, EAST)
		src.connected.layer = OBJ_LAYER
		var/turf/T = get_step(src, EAST)
		if (T.contents.Find(src.connected))
			src.connected.connected = src
			src.icon_state = "morgue0"
			for(var/atom/movable/A as mob|obj in src)
				A.loc = src.connected.loc
			src.connected.icon_state = "morguet"
		else
			//src.connected = null
			del(src.connected)
	update()
	return

/obj/morgue/proc/relaymove(mob/user as mob)
	src.connected = new /obj/m_tray( src.loc )
	step(src.connected, EAST)
	src.connected.layer = OBJ_LAYER
	var/turf/T = get_step(src, EAST)
	if (T.contents.Find(src.connected))
		src.connected.connected = src
		src.icon_state = "morgue0"
		for(var/atom/movable/A as mob|obj in src)
			A.loc = src.connected.loc
			//Foreach goto(106)
		src.connected.icon_state = "morguet"
	else
		//src.connected = null
		del(src.connected)
	return

/obj/m_tray/act()
	if (src.connected)
		for(var/atom/movable/A as mob|obj in src.loc)
			if (!( A.anchored ))
				A.loc = src.connected
			//Foreach goto(26)
		src.connected.connected = null
		src.connected.update()
		//SN src = null
		del(src)
		return
	return