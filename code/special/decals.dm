/obj/decal/New()
	..()
	src.pixel_x = rand(-3.0, 3)
	src.pixel_y = rand(-3.0, 3)
	/*
	var/decalcount = 0
	if(locate(/obj/decal/) in src.loc)
		for(var/obj/decal/g in src.loc)
			if(decalcount >= 3)
				spawn(5)
					del(g)
			decalcount++
	*/

/obj/decal/ash
	name = "Ashes"
	desc = "Ashes to ashes, dust to dust, and into space."
	icon = 'icons/effects/decal.dmi'
	icon_state = "ash"
	anchored = 1

/obj/decal/remains/human
	name = "remains"
	desc = "These remains have a strange sense about them..."
	icon = 'icons/effects/decal.dmi'
	icon_state = "remains"
	anchored = 1

/obj/decal/remains/xeno
	name = "remains"
	desc = "These remains have a strange sense about them..."
	icon = 'icons/effects/decal.dmi'
	icon_state = "remainsxeno"
	anchored = 1

/obj/decal/remains/robot
	name = "remains"
	desc = "These remains have a strange sense about them..."
	icon = 'icons/effects/decal.dmi'
	icon_state = "remainsrobot"
	anchored = 1

/obj/decal/cleanable
	var/list/random_icon_states = list()
	var/decaltype = null

//HUMANS

/*
	Del()
		for(var/datum/disease/D in viruses)
			D.cure(0)
		..()*/

//ALIENS

//ROBOTS

/obj/decal/cleanable/robot_debris
	name = "robot debris"
	desc = "Useless heap of junk...or is it..."
	density = 0
	anchored = 0
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "gib1"
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6", "gib7")

/obj/decal/cleanable/robot_debris/limb
	random_icon_states = list("gibarm", "gibleg")

/obj/decal/cleanable/robot_debris/up
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6", "gib7","gibup1","gibup1") //2:7 is close enough to 1:4

/obj/decal/cleanable/robot_debris/down
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6", "gib7","gibdown1","gibdown1") //2:7 is close enough to 1:4

/obj/decal/cleanable/oil
	name = "motor oil"
	desc = "It's black. Beepsky made another mess."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "floor1"
	var/viruses = list()
	random_icon_states = list("floor1", "floor2", "floor3", "floor4", "floor5", "floor6", "floor7")
/*
	Del()
		for(var/datum/disease/D in viruses)
			D.cure(0)
		..()*/

/obj/decal/cleanable/oil/streak
	random_icon_states = list("streak1", "streak2", "streak3", "streak4", "streak5")

//OTHER

/obj/decal/cleanable/generic
	name = "clutter"
	desc = "Someone should clean that up."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "shards"

/obj/decal/cleanable/tomatosplat
	name = "Splattered tomato"
	desc = "What a mess."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "floor1"
	random_icon_states = list("floor1", "floor2", "floor3", "floor4", "floor5", "floor6", "floor7")

/obj/decal/cleanable/eggsplat
	name = "Splattered egg"
	desc = "What a mess."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "eggsplat"

/obj/decal/cleanable/poo
	name = "poo"
	desc = "It's a poo stain..."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/poo.dmi'
	icon_state = "floor1"
	random_icon_states = list("floor1", "floor2", "floor3", "floor4", "floor5", "floor6", "floor7", "floor8")
//	var/datum/disease/virus = null
	var/dried = 0
	decaltype = "poo"
//	blood_DNA = null
//	blood_type = null

/obj/decal/cleanable/poo/New()
	src.icon = 'icons/effects/poo.dmi'
	src.icon_state = pick(src.random_icon_states)
//	spawn(5) src.reagents.add_reagent("poo",5)
	spawn(400)
		src.dried = 1

/obj/decal/cleanable/poo/tracks
	icon_state = "tracks"
	random_icon_states = null

/obj/decal/cleanable/poo/drip
	name = "drips of poo"
	desc = "It's brown."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "drip1"
	random_icon_states = list("drip1", "drip2", "drip3", "drip4", "drip5")
//	blood_DNA = null
//	blood_type = null

/obj/decal/cleanable/poo/proc/streak(var/list/directions)
	spawn (0)
		var/direction = pick(directions)
		for (var/i = 0, i < pick(1, 200; 2, 150; 3, 50; 4), i++)
			sleep(3)
			//if (i > 0)
			//	var/obj/decal/cleanable/poo/b = new /obj/decal/cleanable/poo(src.loc)
			//	if (src.virus)
			//		b.virus = src.virus
			if (step_to(src, get_step(src, direction), 0))
				break

/obj/decal/cleanable/urine
	name = "Urine puddle"
	desc = "Someone couldn't hold it.."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "pee1"
	random_icon_states = list("pee1", "pee2", "pee3")
//	var/datum/disease/virus = null
	decaltype = "urine"
//	blood_DNA = null
//	blood_type = null

/obj/decal/cleanable/urine/New()
	src.icon_state = pick(src.random_icon_states)
//	spawn(10) src.reagents.add_reagent("urine",5)
//	..()
	spawn(800)
		del(src)

/obj/decal/cleanable/dirt
	name = "dirt"
	desc = "Someone should clean that up."
	density = 0
	anchored = 1
	layer = 2
	icon = 'effects.dmi'
	icon_state = "dirt"

/obj/decal/cleanable/greenglow
	name = "green glow"
	desc = "Eerie. This makes you feel creepy."
	density = 0
	anchored = 1
	layer = 2
	icon = 'effects.dmi'
	icon_state = "greenglow"

/obj/decal/cleanable/cobweb
	name = "cobweb"
	desc = "Someone should remove that."
	density = 0
	anchored = 1
	layer = 3
	icon = 'effects.dmi'
	icon_state = "cobweb1"

/obj/decal/cleanable/cobweb2
	name = "cobweb"
	desc = "Someone should remove that."
	density = 0
	anchored = 1
	layer = 3
	icon = 'effects.dmi'
	icon_state = "cobweb2"

// Used for spray that you spray at walls, tables, hydrovats etc
/obj/decal/spraystill
	density = 0
	anchored = 1
	layer = 50

/obj/decal/cleanable/foam
	name = "foam"
	desc = "It's foam, dumbshit."
	density = 0
	anchored = 1
	layer = 2
	icon = 'effects.dmi'
	icon_state = "foam"

/obj/decal/cleanable/foam/New()
	spawn(80)
	del(src)

/obj/decal/cleanable/cum
	name = "cum"
	desc = "Uh oh, better clean this up..."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "cum1"
	random_icon_states = list("cum1", "cum2", "cum3", "cum4", "cum5")
//	var/datum/disease/virus = null
	decaltype = "cum"
//	blood_DNA = null
//	blood_type = null

/obj/decal/cleanable/cum/New()
	src.icon_state = pick(src.random_icon_states)
//	spawn(10) src.reagents.add_reagent("urine",5)
//	..()
//	spawn(800)
//		del(src)

/obj/decal/cleanable/vomit
	name = "vomit"
	desc = "Gosh, how unpleasant."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/decal.dmi'
	icon_state = "vomit1"
	decaltype = "vomit"
	random_icon_states = list("vomit1", "vomit2", "vomit3")
	/*var/list/viruses = list()

	Del()
		for(var/datum/disease/D in viruses)
			D.cure(0)
		..()*/

// ITT DECAL SCRAPING WITH CLOTHES
/obj/decal/cleanable/act_by_item(var/obj/item/I)
	..()
	if(istype(I, /obj/item/clothing/))
		I:name = "[src.name] covered [I:name]"
		del(src)