/mob
	var/viruses = list() // replaces var/datum/disease/virus

//Monkey/infected mode
	var/list/resistances = list()
	var/datum/disease/virus = null

/mob/proc/contract_disease(var/datum/disease/virus, var/skip_this = 0, var/force_species_check=1)
//	world << "Contract_disease called by [src] with virus [virus]"
	if(stat >=2) return
	if(virus.type in resistances)
		if(prob(99.9)) return
		resistances.Remove(virus.type)//the resistance is futile

	for(var/datum/disease/D in viruses)
		if(istype(D, virus.type))
			return // two viruses of the same kind can't infect a body at once!!

	if(force_species_check)
		var/fail = 1
		for(var/name in virus.affected_species)
			var/mob_type = text2path("/mob/human/[lowertext(name)]")
			if(mob_type && istype(src, mob_type))
				fail = 0
				break
		if(fail) return

	if(skip_this == 1)
		//if(src.virus)				< -- this used to replace the current disease. Not anymore!
			//src.virus.cure(0)

		var/datum/disease/v = new virus.type
		viruses += v
		v.affected_mob = src
		v.strain_data = v.strain_data.Copy()
		v.holder = src
		if(prob(5))
			v.carrier = 1
		return

	//if(virus) //
		//return //


/*
	var/list/clothing_areas	= list()
	var/list/covers = list(UPPER_TORSO,LOWER_TORSO,LEGS,FEET,ARMS,HANDS)
	for(var/Covers in covers)
		clothing_areas[Covers] = list()

	for(var/obj/item/clothing/Clothing in src)
		if(Clothing)
			for(var/Covers in covers)
				if(Clothing&Covers)
					clothing_areas[Covers] += Clothing

*/
		//world << "Infection in the mob [src]. YAY"


/*
	var/score = 0
	if(istype(src, /mob/living/carbon/human))
		if(src:gloves) score += 5
		if(istype(src:wear_suit, /obj/item/clothing/suit/space)) score += 10
		if(istype(src:wear_suit, /obj/item/clothing/suit/bio_suit)) score += 10
		if(istype(src:head, /obj/item/clothing/head/helmet/space)) score += 5
		if(istype(src:head, /obj/item/clothing/head/bio_hood)) score += 5
	if(wear_mask)
		score += 5
		if((istype(src:wear_mask, /obj/item/clothing/mask) || istype(src:wear_mask, /obj/item/clothing/mask/surgical)) && !internal)
			score += 5
		if(internal)
			score += 5
	if(score > 20)
		return
	else if(score == 20 && prob(95))
		return
	else if(score >= 15 && prob(75))
		return
	else if(score >= 10 && prob(55))
		return
	else if(score >= 5 && prob(35))
		return
	else if(prob(15))
		return
	else*/
	var/datum/disease/v = new virus.type
	viruses += v
	v.affected_mob = src
	v.strain_data = v.strain_data.Copy()
	v.holder = src
	if(prob(5))
		v.carrier = 1
	return
