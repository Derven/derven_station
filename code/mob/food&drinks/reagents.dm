/obj/item/weapon/reagent_containers
	name = "Rgnt_Cntnr"
	icon = 'icons/obj/item/medbay.dmi'
	icon_state = "pill"

	New()
		var/datum/reagents/R = new/datum/reagents(100)
		reagents = R
		R.my_atom = src
		R.add_reagent("nothing", 30)

	act_self(src)
		usr << "\blue You use [src]."
		message_for_mobs(5, 'sound/chomp.ogg')
		if(reagents.total_volume)
			reagents.reaction(usr)
			spawn(5)
				reagents.trans_to(usr, reagents.total_volume)
		del_from_hand()
		del(src)


	act_by_item(var/obj/item/I)
		if(istype(I, /obj/item/weapon/reagent_containers))
			usr << "\blue You mixed [src] with [I]."
			reagents.trans_to(src, 5)

	poison
		name = "poison"

		New()
			var/datum/reagents/R = new/datum/reagents(100)
			reagents = R
			R.my_atom = src
			R.add_reagent("poison", 30)

		act_self(src)
			usr << "\blue You use [src]."
			message_for_mobs(5, 'sound/chomp.ogg')
			if(reagents.total_volume)
				reagents.reaction(usr)
				spawn(5)
					reagents.trans_to(usr, reagents.total_volume)
			del_from_hand()
			del(src)

	caffeine
		name = "SOLID COFE"
		icon_state = "caffeine"

		New()
			var/datum/reagents/R = new/datum/reagents(100)
			reagents = R
			R.my_atom = src
			R.add_reagent("caffeine", 30)

		act_self(src)
			usr << "\blue You use [src]."
			if(reagents.total_volume)
				reagents.reaction(usr)
				spawn(5)
					reagents.trans_to(usr, reagents.total_volume)
			del_from_hand()
			del(src)

	SPIRT
		name = "SOVIET SPIRT"
		icon_state = "ethanol"

		New()
			var/datum/reagents/R = new/datum/reagents(100)
			reagents = R
			R.my_atom = src
			R.add_reagent("ethanol", 30)

		act_self(src)
			usr << "\blue You use [src]."
			message_for_mobs(5, 'sound/chomp.ogg')
			if(reagents.total_volume)
				reagents.reaction(usr)
				spawn(5)
					reagents.trans_to(usr, reagents.total_volume)
			del_from_hand()
			del(src)

	milk
		name = "JUST MILK"
		icon_state = "milk"

		New()
			var/datum/reagents/R = new/datum/reagents(100)
			reagents = R
			R.my_atom = src
			R.add_reagent("milk", 30)

	glass
		icon_state = "container"
		New()
			var/datum/reagents/R = new/datum/reagents(200)
			reagents = R
			R.my_atom = src

/turf/simulated/floor/act_by_item(var/obj/item/I)
	if(istype(I, /obj/item/weapon/reagent_containers))
		I.reagents.trans_to(src, 50, 1)
		usr << "You poured contents of glass on the floor"