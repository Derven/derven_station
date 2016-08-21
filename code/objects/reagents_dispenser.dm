/obj/reagent_dispensers
	name = "Dispenser"
	desc = "..."
	icon = 'icons/obj/structure.dmi'
	icon_state = "watertank"
	density = 1
	anchored = 0

	var/amount_per_transfer_from_this = 10

	New()
		var/datum/reagents/R = new/datum/reagents(3000)
		reagents = R
		R.my_atom = src

	act_by_item(var/obj/item/I)
		if(istype(I, /obj/item/weapon/reagent_containers))
			reagents.trans_to(I, amount_per_transfer_from_this, 1)
			usr << "You draw some [reagents.get_master_reagent_name()] from [src]"

/obj/reagent_dispensers/watertank
	name = "watertank"
	desc = "A watertank"
	icon_state = "watertank"
	amount_per_transfer_from_this = 10

	New()
		..()
		reagents.add_reagent("water",1000)


/obj/reagent_dispensers/composttank
	name = "composttank"
	desc = "A composttank"
	icon_state = "composttank"
	amount_per_transfer_from_this = 10

	New()
		..()
		reagents.add_reagent("ammonia",1000)