/mob/var/obj/item/weapon/storage/s_active = null

/obj/screen
	var/master

/obj/screen/close
	name = "close"
	master = null

	Click()
		usr.s_active.close(usr)

/obj/screen/storage
	name = "storage"
	master = null

/obj/item/weapon/storage
	icon = 'icons/obj/item/storage.dmi'
	icon_state = "box"
	name = "storage"
	var/list/can_hold = new/list()
	var/obj/screen/storage/boxes = null
	var/obj/screen/close/closer = null

/obj/item/weapon/storage/New()

	src.boxes = new /obj/screen/storage(  )
	src.boxes.name = "storage"
	src.boxes.master = src
	src.boxes.icon_state = "block"
	src.boxes.screen_loc = "7,7 to 10,8"
	src.boxes.layer = 19

	src.closer = new /obj/screen/close( )
	src.closer.master = src
	src.closer.icon_state = "x"
	src.closer.layer = 20

	spawn( 5 )
		src.orient_objs(7, 8, 10, 7)
		return

	return

/obj/item/weapon/storage

/obj/item/weapon/storage/act_by_item(var/obj/item/weapon/W)
	if (src.contents.len >= 7)
		return

	if ((istype(W, /obj/item/weapon/storage) || src.loc == W))
		return

	//user.u_equip(W)
	usr.drop()
	W.loc = src

	src.orient2hud(usr)
	//W.dropped(user)

	message_for_mobs(5, "\blue [usr] has added [W] to [src]!")

	return

/obj/item/weapon/storage/act_self(src)
	if (loc == usr)
		show_to(usr)
	else
		..()
		for(var/mob/M in range(1))
			if (M.s_active == src)
				close(M)
			//Foreach goto(76)
		orient2hud(usr)
	return

/obj/item/weapon/storage/proc/return_inv()

	var/list/L = list(  )

	L += src.contents

	for(var/obj/item/weapon/storage/S in src)
		L += S.return_inv()
	return L

/obj/item/weapon/storage/proc/show_to(mob/user as mob)
	user.client.screen -= src.boxes
	user.client.screen -= src.closer
	user.client.screen -= src.contents
	user.client.screen += src.boxes
	user.client.screen += src.closer
	user.client.screen += src.contents
	user.s_active = src
	return

/obj/item/weapon/storage/proc/hide_from(mob/user as mob)

	if(!user.client)
		return
	user.client.screen -= src.boxes
	user.client.screen -= src.closer
	user.client.screen -= src.contents
	return

/obj/item/weapon/storage/proc/close(mob/user as mob)

	src.hide_from(user)
	user.s_active = null
	return

/obj/item/weapon/storage/proc/orient_objs(tx, ty, mx, my)

	var/cx = tx
	var/cy = ty
	src.boxes.screen_loc = text("[],[] to [],[]", tx, ty, mx, my)
	for(var/obj/O in src.contents)
		O.screen_loc = text("[],[]", cx, cy)
		cx++
		if (cx > mx)
			cx = tx
			cy--
		//Foreach goto(56)
	src.closer.screen_loc = text("[],[]", mx, my)
	return

/obj/item/weapon/storage/proc/orient2hud(mob/user as mob)
	src.orient_objs(1, 9, 1, 2)

/obj/item/weapon/storage/box/New()
//	new /obj/item/clothing/mask/breath( src )
//	new /obj/item/weapon/tank/emergency_oxygen( src )
	..()
	return

/obj/item/weapon/storage/rtoolbox
	icon_state = "red_toolbox"
	name = "storage"

/obj/item/weapon/storage/btoolbox
	icon_state = "blue_toolbox"
	name = "storage"

/obj/item/weapon/storage/ytoolbox
	icon_state = "yel_toolbox"
	name = "storage"