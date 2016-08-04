/image
	override = 1

/turf
	name = "space"
	icon = 'icons/turf/turfs.dmi'
	icon_state = "space"
	var/water = 0
	var/list/datum/reagents/chemical = list()
	pass_gas = 0
	///REAGENTS


/turf/simulated
	name = "simulated"
//	oxygen = 500 //500 газоединиц
//	nitrogen = 35

	//act_by_item(var/obj/item/I)
		//if(istype(I, /obj/item/unlimited_reagent))
		//	var/obj/item/unlimited_reagent/R = I
		//	R.spawn_me(src)


/turf/simulated/wall
	name = "wall"
	icon_state = "wall"
	density = 1
	opacity = 1
	pass_gas = 0
//	temperature = 21
	var/ISSCRDRI = 0
	var/ISWRN = 0

	act_by_item(var/obj/item/tools/I)
		if(istype(I, /obj/item/tools/screwdriver))
			if(ISSCRDRI == 0)
				ISSCRDRI = 1
				return

			if(ISSCRDRI == 1)
				ISSCRDRI = 0
				return

		if(istype(I, /obj/item/tools/wrench))
			if(ISSCRDRI == 1 && ISWRN == 0)
				ISWRN = 1
				src = new /turf/simulated/floor/plating(src)
				return

/turf/simulated/floor/whore
	icon_state = "belck"
//	oxygen = 500 //500 газоединиц
//	nitrogen = 35
/obj/roof
	icon = 'icons/obj/roof.dmi'
	layer = 18
	mouse_opacity = 0
	var/image/ROOF
	var/image/NOROOF

//	New()
//		NOROOF = image(null, src)


/turf/simulated/floor
	name = "floor"
	icon_state = "floor"

/turf/simulated/floor/upbitch
	name = "floor"
	icon_state = "up"

/turf/simulated/floor/downbitch
	name = "floor"
	icon_state = "down"

/turf/simulated/floor/upbitch/Enter(atom/movable/O)
	O.z += 1

/turf/simulated/floor/downbitch/Enter(atom/movable/O)
	O.z -= 1

/turf/simulated/floor/whore/Enter(atom/movable/O)
	O.z -= 1

/turf/simulated/floor/plating
	name = "plating"
	icon_state = "plating"

/turf/simulated/floor/bar
	name = "bar"
	icon_state = "bar"

/turf/simulated/floor/cafe
	name = "bar"
	icon_state = "cafe"

/turf/simulated/floor/wood
	name = "wood"
	icon_state = "wood"
