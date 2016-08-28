/obj/item/clothing/proc/wear_to_slot(var/mob/human/M, var/list/L, var/obj/O)
	wear(usr)

	var/obj/cloth = type
	cloth = new cloth()
	cloth.layer = 60

	L += src
	O.overlays += cloth

/obj/item/clothing
	icon = 'icons/obj/clothing.dmi'
	var/icon_for_mob = 'icons/obj/clothing_mob.dmi'
	var/old_layer = 0

	proc
		wear(var/mob/human/M)
			M.contents += src
			icon = icon_for_mob
			M.overlays += src

		undress(var/mob/human/M)
			if(src in M.contents)
				M.overlays -= src
				icon = 'icons/obj/clothing.dmi'
				if(M.my_hand_active == "right")
					M.rhand_items += src
					M.R.overlays += src


				if(M.my_hand_active == "left")
					M.lhand_items += src
					M.L.overlays += src

		lying_me(var/mob/human/M)
			//icon = 'icons/obj/clothing_lying.dmi'
			M.overlays -= src
			icon = 'icons/obj/clothing_lying.dmi'
			M.overlays += src

		unlying_me(var/mob/human/M)
			M.overlays -= src
			icon = 'icons/obj/clothing_mob.dmi'
			M.overlays += src