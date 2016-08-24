/obj/item/weapon/reagent_containers/syringe
	icon_state = "syringe"

	act_self(src)
		usr << "\blue You use [src]."
		message_for_mobs(5, 'sound/chomp.ogg')
		do_after(usr, 4)
		if(reagents.total_volume)
			reagents.reaction(usr)
			spawn(5)
				reagents.trans_to(usr, reagents.total_volume)
		else
			usr << "\red [src] is empty."