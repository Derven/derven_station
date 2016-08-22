/obj/machinery/disease2/diseaseanalyser
	name = "Disease Analyser"
	icon = 'icons/obj/machine/virology.dmi'
	icon_state = "analyser"
	anchored = 1
	density = 1

	var/scanning = 0
	var/pause = 0

	var/obj/item/weapon/virusdish/dish = null

/obj/item/weapon/virusdish

/obj/machinery/disease2/diseaseanalyser/act_by_item(var/obj/I)
	if(istype(I,/obj/item/weapon/virusdish))
		var/mob/c = usr
		if(!dish)

			dish = I
			c.drop()
			I.loc = src
			message_for_mobs(5, "\blue [usr.name] inserts the [dish.name] in the [src.name]")

		else
			usr << "There is already a dish inserted"

	//else
	return


/obj/machinery/disease2/diseaseanalyser/process()

	if(scanning)
		scanning -= 1
		if(scanning == 0)
			var/r = "GNAv2 based virus lifeform"
			r += "<BR>Infection rate : [dish.virus2.infectionchance * 10]"
			r += "<BR>Spread form : [dish.virus2.spreadtype]"
			r += "<BR>Progress Speed : [dish.virus2.stageprob * 10]"
			for(var/datum/disease2/effectholder/E in dish.virus2.effects)
				r += "<BR>Effect:[E.effect.name]. Strength : [E.multiplier * 8]. Verosity : [E.chance * 15]. Type : [5-E.stage]."
			// display the antigens
			var/code = ""
			for(var/V in ANTIGENS) if(text2num(V) & dish.virus2.antigen) code += ANTIGENS[V]
			r += "<BR>Antigen pattern: [code]"

			var/obj/item/weapon/paper/P = new /obj/item/weapon/paper(src.loc)
			P.info = r
			dish.info = r
			dish.analysed = 1
			dish.loc = src.loc
			dish = null
			icon_state = "analyser"

			for(var/mob/O in hearers(src, null))
				O.show_message("\icon[src] \blue The [src.name] prints a sheet of paper", 3)
	else if(dish && !scanning && !pause)
		if(dish.virus2 && dish.growth > 50)
			dish.growth -= 10
			scanning = 5
			icon_state = "analyser_processing"
		else
			pause = 1
			spawn(25)
				dish.loc = src.loc
				dish = null
				for(var/mob/M in viewers(src))
					M.show_message("\icon[src] \blue The [src.name] buzzes", 2)
				pause = 0

	return