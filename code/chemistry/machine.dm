/obj/machinery/chemdispenser
	icon = 'icons/obj/machine/chem.dmi'
	icon_state = "dispenser"
	density = 1

	proc/dispense(var/reagent)
		for(var/obj/item/weapon/reagent_containers/glass/G in contents)
			G.reagents.add_reagent(reagent, 10)
			for(var/mob/M in range(3,src))
				M << "<b>Glass is filled with liquid [reagent]</b>"
				world << "<b>[G.reagents.total_volume]"

	proc/get_container()
		for(var/obj/item/weapon/reagent_containers/glass/G in contents)
			G.Move(src.loc)

/obj/machinery/chemdispenser/act()
	var/my_text
	if(contents.len > 0)
		my_text = {"
		<html>
		<head><title>Chemistry dispenser</title></head>
		<body>
		Choose reagent:

		<br><a href='?src=\ref[src];chem=blood'>blood</a>
		<br><a href='?src=\ref[src];chem=oil'>oil</a>
		<br><a href='?src=\ref[src];chem=eth'>ethanol</a>
		<br><a href='?src=\ref[src];chem=car'>carbon</a>
		<br><a href='?src=\ref[src];chem=oxy'>oxygen</a>
		<br><a href='?src=\ref[src];chem=sil'>silicon</a>
		<br><a href='?src=\ref[src];chem=nit'>nitrogen</a>

		<br>

		<br><a href='?src=\ref[src];chem=get_'>Get the glass</a>

		</body>
		</html>
		"}
	else
		my_text = {"
		<html>
		<head><title>Chemistry dispenser</title></head>
		<body>

		<h1>Insert glass in machine!</h1>

		</body>
		</html>
		"}

	usr << browse(my_text,"window=my_text")

/obj/machinery/chemdispenser/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/weapon/reagent_containers/glass))
		if(contents.len == 0)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold You inserts [I] in [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold You inserts [I] in [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()
		else
			usr << "\red it is busy"


/obj/machinery/juicer
	icon = 'icons/obj/machine/chem.dmi'
	icon_state = "juicer"
	layer = 7

/obj/machinery/juicer/act_by_item(var/obj/item/I)
	if(istype(I,/obj/item/weapon/reagent_containers))
		for(I in usr.contents)
			if(usr.client.my_hand_active == "left")
				if(istype(I, usr.client.lhand_items[1]))
					I.Move(src)
					usr << "\bold You inserts [I] in [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(I, usr.client.rhand_items[1]))
					I.Move(src)
					usr << "\bold You inserts [I] in [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()

/obj/machinery/juicer/act()
	var/obj/item/weapon/reagent_containers/glass/stakan = new()
	for(var/obj/item/weapon/reagent_containers/I in contents)
		I.reagents.trans_to(stakan, 50, 1)
		usr << "\blue Changing..."
	stakan.Move(src.loc)