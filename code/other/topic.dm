/mob/Topic(href,href_list[])

	if(href_list["name"] == "input" && usr.ouch == 1)
		usr.name = input("Choose a name for your character.",
                    "Your Name",
                    usr.name)

	if(href_list["hair"] == "input" && usr.ouch == 1)
		usr.remove_hair_from_overlay(usr.hair_style, usr.facial_hair_style)
		usr.hair_style = input("Choose a hair for your character.",
                    "Your Hair",
                    usr.hair_style) in hair_styles_list
		usr.draw_my_hair()

	if(href_list["fhair"] == "input" && usr.ouch == 1)
		usr.remove_hair_from_overlay(usr.hair_style, usr.facial_hair_style)
		usr.facial_hair_style = input("Choose a facial hair for your character.",
                    "Your Facial Hair",
                    usr.facial_hair_style) in facial_hair_styles_list
		usr.draw_my_hair()

	if(href_list["prof"] == "scientist" && usr.ouch == 1)
		usr.loc = captain[rand(1,captain.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/CHATERED/C = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		C.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "assistant" && usr.ouch == 1)
		usr.loc =assistant[rand(1,assistant.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "engineer" && usr.ouch == 1)
		usr.loc = engineer[rand(1,engineer.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/ENG/E = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		E.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "security" && usr.ouch == 1)
		usr.loc =security[rand(1,security.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "captain" && usr.ouch == 1)
		usr.loc =captain[rand(1,captain.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "doctor" && usr.ouch == 1)
		usr.loc =doctor[rand(1,doctor.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "detective" && usr.ouch == 1)
		usr.loc =detective[rand(1,detective.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "bartender" && usr.ouch == 1)
		usr.loc =bartender[rand(1,bartender.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "cook" && usr.ouch == 1)
		usr.loc =cook[rand(1,cook.len)]
		usr.create_hud()
		usr.ouch = 0

		var/obj/item/clothing/uniform/BLACK/B = new()
		var/obj/item/clothing/shoes/BLACK/B_S = new()

		B.wear_to_slot(src, usr.uniform_items, usr.U)
		B_S.wear_to_slot(src, usr.foot_items, usr.F)

	if(href_list["prof"] == "CE" && usr.ouch == 1)
		usr.loc = CE[rand(1,CE.len)]
		usr.create_hud()

		usr.ouch = 0

	if(href_list["race"] == "niga" && usr.ouch == 1)
		usr.mymcolor = "chocolate"
		usr.time_to_change = 1
		usr << "\blue please wait..."

	if(href_list["race"] == "white" && usr.ouch == 1)
		usr.mymcolor = "white"
		usr.time_to_change = 1
		usr << "\blue please wait..."

	if(href_list["gend"] == "male" && usr.ouch == 1)
		usr.mygender = 1
		usr << "\blue please wait..."
		usr.time_to_change = 1

	if(href_list["gend"] == "female" && usr.ouch == 1)
		usr.mygender = 0
		usr.time_to_change = 1
		usr << "\blue please wait..."

/obj/machinery/chemdispenser/Topic(href,href_list[])
	///CHEM DISPENSER
	if(href_list["chem"] == "blood")
		dispense("blood")

	if(href_list["chem"] == "oil")
		dispense("oil")

	if(href_list["chem"] == "eth")
		dispense("ethanol")

	if(href_list["chem"] == "car")
		dispense("carbon")

	if(href_list["chem"] == "nit")
		dispense("nitrogen")

	if(href_list["chem"] == "oxy")
		dispense("oxygen")

	if(href_list["chem"] == "sil")
		dispense("silicon")

	if(href_list["chem"] == "get_")
		get_container(usr)

	//RADIO
/obj/machinery/radio/transmitter/Topic(href,href_list[])

	if(href_list["rad"] == "plus_freq")
		frequency += 1
		del_all_waves()
		waves()
		on = 0

	if(href_list["rad"] == "minus_freq")
		frequency -= 1
		del_all_waves()
		waves()
		on = 0

	if(href_list["rad"] == "plus_length")
		wave_length += 1
		del_all_waves()
		waves()
		on = 0

	if(href_list["rad"] == "minus_length")
		wave_length -= 1
		del_all_waves()
		waves()
		on = 0

/obj/machinery/logic_elements/number/Topic(href,href_list[])
	if(href_list["num"] == "one")
		current_state = 1
		icon_state = "one"

	if(href_list["num"] == "zero")
		current_state = 0
		icon_state = "zero"

	if(href_list["submit"] == "ok")
		start()


/obj/machinery/radio/receiver/Topic(href,href_list[])

	if(href_list["rad"] == "plus_freq")
		frequency += 1
		del_all_waves()
		waves()
		on = 0

	if(href_list["rad"] == "minus_freq")
		frequency -= 1
		del_all_waves()
		waves()
		on = 0

	if(href_list["rad"] == "plus_length")
		wave_length += 1
		del_all_waves()
		waves()
		on = 0

	if(href_list["rad"] == "minus_length")
		wave_length -= 1
		del_all_waves()
		waves()
		on = 0

	//RADIO
/*
/obj/electro/powerbox/Topic(href,href_list[])

	if(href_list["electro"] == "on")
		var/turf/T = src.loc
		for(var/area/A in T)
			for(var/obj/machinery/M in A.power_machines)
				if(M.powernet == powernet)
					M.marker = 0

	if(href_list["electro"] == "off")
		var/turf/T = src.loc
		for(var/area/A in T)
			for(var/obj/machinery/M in A.power_machines)
				if(M.powernet == powernet)
					M.marker = 1
*/
/obj/machinery/vending/Topic(href,href_list[])
	var/l = href_list["my_item"]
	var/what = text2num(href_list["my_what"])
	if(items_num[what] > 0)
		items_num[what] -= 1
		new l(src.loc)
		usr << "\blue <b>[src] dropped [my_items[what]]</b>"

		if(items_num[what] == 0)
			usr << "\red <b[my_items[what]] has ended</b>"

		winshow(usr,"my_text",0)

/obj/machinery/computer/Topic(href,href_list[])
	var/disk_here = 0
	if(href_list["act"] == "go")
		for(var/obj/item/memory_computer/MC in src)
			disk_here = 1
			MC.Move(src.loc)
			usr << "\blue You get the disk"

		if(!disk_here)
			usr << "\red insert the disk"

/obj/machinery/conveyor/Topic(href,href_list[])
	if(href_list["act"] == "go")
		switch_me()

	//VENDING
/obj/machinery/door/airlock/Topic(href,href_list[])
	if(href_list["act"] == "go")
		if(on == 1)
			if(close == 1)
				icon_state = "[mydooor]_open"
				close = 0
				density = 0
				pass_gas = 1
			else
				icon_state = "[mydooor]_close"
				close = 1
				density = 1
				pass_gas = 0
		else
			usr << "No power"