/obj/item/weapon/reagent_containers
	name = "Rgnt_Cntnr"
	icon = 'icons/obj/item/medbay.dmi'
	icon_state = "pill"
	var/amount_per_transfer_from_this = 5
	var/possible_transfer_amounts = list(5,10,15,25,30)
	var/volume = 100

	verb/set_APTFT() //set amount_per_transfer_from_this
		set name = "Set transfer amount"
		set category = "Object"
		set src in range(0)
		var/N = input("Amount per transfer from this:","[src]") as null|anything in possible_transfer_amounts
		if (N)
			amount_per_transfer_from_this = N

	New()
		..()
		if (!possible_transfer_amounts)
			src.verbs -= /obj/item/weapon/reagent_containers/verb/set_APTFT
		var/datum/reagents/R = new/datum/reagents(volume)
		reagents = R
		R.my_atom = src


	act_self(src)
		usr << "\blue You use [src]."
		message_for_mobs(5, 'sound/chomp.ogg')
		do_after(usr, 4)
		if(reagents.total_volume)
			reagents.reaction(usr)
			spawn(5)
				reagents.trans_to(usr, reagents.total_volume)
		del_from_hand()
		del(src)


	act_by_item(var/obj/item/weapon/reagent_containers/I)
		if(istype(I, /obj/item/weapon/reagent_containers))
			var/trans = reagents.trans_to(I, 5)
			usr << "\blue You transfer [trans] units of the [reagents.get_master_reagent_name()] to [I]."

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
			..()
			reagents.add_reagent("milk", 10)

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