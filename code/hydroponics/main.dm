/obj/machinery/hydroponics
	name = "hydroponics tray"
	icon = 'icons/obj/machine/hydroponics.dmi'
	icon_state = "hydrotray"
	density = 1
	anchored = 1
	var/waterlevel = 100	//The amount of water in the tray (max 100)
	var/maxwater = 100		//The maximum amount of water in the tray
	var/nutrilevel = 10		//The amount of nutrient in the tray (max 10)
	var/maxnutri = 10		//The maximum nutrient of water in the tray
	var/pestlevel = 0		//The amount of pests in the tray (max 10)
	var/weedlevel = 0		//The amount of weeds in the tray (max 10)
	var/yieldmod = 1		//Nutriment's effect on yield
	var/mutmod = 1			//Nutriment's effect on mutations
	var/toxic = 0			//Toxicity in the tray?
	var/age = 0				//Current age
	var/dead = 0			//Is it dead?
	var/health = 0			//Its health.
	var/lastproduce = 0		//Last time it was harvested
	var/lastcycle = 0		//use for timing of cycles.
	var/cycledelay = 200	//About 10 seconds / cycle
	var/planted = 0			//Is it occupied?
	var/harvest = 0			//Ready to harvest?
	var/obj/item/seeds/myseed = null	//The currently planted seed
	var/unwrenchable = 1
	var/image/overlay

	proc
		update_icon()

	New()
		process()

obj/machinery/hydroponics/proc/applyChemicals(var/datum/reagents/S)

	// Requires 5 mutagen to possibly change species.// Poor man's mutagen.
/*
	if(S.has_reagent("mutagen", 5) || S.has_reagent("radium", 10) || S.has_reagent("uranium", 10))
		switch(rand(100))										//old value --> new value
			if(95 to 100)	plantdies()									//10% -->  6%
			if(75 to 94)	mutatespecie()								//10% --> 20%
			if(66 to 74)	hardmutate()								//15% -->  9%
			if(52 to 65)	mutate()									//25% --> 14%
			if(40 to 51)	usr << "The plants don't seem to react..."	//20% --> 12%
			if(20 to 39)	mutateweed()								//10% --> 20%
			if(00 to 19)	mutatepest()								//10% --> 20%
//			else 			usr << "Nothing happens..."					// 1% -->  0%

																		//101%--> 101%
	// 2 or 1 units is enough to change the yield and other stats.// Can change the yield and other stats, but requires more than mutagen
	else if(S.has_reagent("mutagen", 2) || S.has_reagent("radium", 5) || S.has_reagent("uranium", 5))
		hardmutate()
	else if(S.has_reagent("mutagen", 1) || S.has_reagent("radium", 2) || S.has_reagent("uranium", 2))
		mutate()

	// After handling the mutating, we now handle the damage from adding crude radioactives...
	if(S.has_reagent("uranium", 1))
		adjustHealth(-round(S.get_reagent_amount("uranium")*1))
		adjustToxic(round(S.get_reagent_amount("uranium")*2))
	if(S.has_reagent("radium", 1))
		adjustHealth(-round(S.get_reagent_amount("radium")*1))
		adjustToxic(round(S.get_reagent_amount("radium")*3)) // Radium is harsher (OOC: also easier to produce)
*/
	// Nutriments
	if(S.has_reagent("eznutriment", 1))
		yieldmod = 1
		mutmod = 1
		adjustNutri(round(S.get_reagent_amount("eznutriment")*1))

	if(S.has_reagent("left4zednutriment", 1))
		yieldmod = 0
		mutmod = 2
		adjustNutri(round(S.get_reagent_amount("left4zednutriment")*1))

	if(S.has_reagent("robustharvestnutriment", 1))
		yieldmod = 2
		mutmod = 0
		adjustNutri(round(S.get_reagent_amount("robustharvestnutriment")*1))

	// Antitoxin binds shit pretty well. So the tox goes significantly down
	if(S.has_reagent("anti_toxin", 1))
		adjustToxic(-round(S.get_reagent_amount("anti_toxin")*2))

	// NIGGA, YOU JUST WENT ON FULL RETARD.
	if(S.has_reagent("toxin", 1))
		adjustToxic(round(S.get_reagent_amount("toxin")*2))

	// Milk is good for humans, but bad for plants. The sugars canot be used by plants, and the milk fat fucks up growth. Not shrooms though. I can't deal with this now...
	if(S.has_reagent("milk", 1))
		adjustNutri(round(S.get_reagent_amount("milk")*0.1))
		adjustWater(round(S.get_reagent_amount("milk")*0.9))

	// Beer is a chemical composition of alcohol and various other things. It's a shitty nutrient but hey, it's still one. Also alcohol is bad, mmmkay?
	if(S.has_reagent("beer", 1))
		adjustHealth(-round(S.get_reagent_amount("beer")*0.05))
		adjustNutri(round(S.get_reagent_amount("beer")*0.25))
		adjustWater(round(S.get_reagent_amount("beer")*0.7))

	// You're an idiot for thinking that one of the most corrosive and deadly gasses would be beneficial
	if(S.has_reagent("fluorine", 1))
		adjustHealth(-round(S.get_reagent_amount("fluorine")*2))
		adjustToxic(round(S.get_reagent_amount("flourine")*2.5))
		adjustWater(-round(S.get_reagent_amount("flourine")*0.5))
		adjustWeeds(-rand(1,4))

	// You're an idiot for thinking that one of the most corrosive and deadly gasses would be beneficial
	if(S.has_reagent("chlorine", 1))
		adjustHealth(-round(S.get_reagent_amount("chlorine")*1))
		adjustToxic(round(S.get_reagent_amount("chlorine")*1.5))
		adjustWater(-round(S.get_reagent_amount("chlorine")*0.5))
		adjustWeeds(-rand(1,3))

	// White Phosphorous + water -> phosphoric acid. That's not a good thing really. Phosphoric salts are beneficial though. And even if the plant suffers, in the long run the tray gets some nutrients. The benefit isn't worth that much.
	if(S.has_reagent("phosphorus", 1))
		adjustHealth(-round(S.get_reagent_amount("phosphorus")*0.75))
		adjustNutri(round(S.get_reagent_amount("phosphorus")*0.1))
		adjustWater(-round(S.get_reagent_amount("phosphorus")*0.5))
		adjustWeeds(-rand(1,2))

	// Plants should not have sugar, they can't use it and it prevents them getting water/ nutients, it is good for mold though...
	if(S.has_reagent("sugar", 1))
		adjustWeeds(rand(1,2))
		adjustPests(rand(1,2))
		adjustNutri(round(S.get_reagent_amount("sugar")*0.1))

	// It is water!
	if(S.has_reagent("water", 1))
		adjustWater(round(S.get_reagent_amount("water")*1))

	// Holy water. Mostly the same as water, it also heals the plant a little with the power of the spirits~
	if(S.has_reagent("holywater", 1))
		adjustWater(round(S.get_reagent_amount("holywater")*1))
		adjustHealth(round(S.get_reagent_amount("holywater")*0.1))

	// A variety of nutrients are dissolved in club soda, without sugar. These nutrients include carbon, oxygen, hydrogen, phosphorous, potassium, sulfur and sodium, all of which are needed for healthy plant growth.
	if(S.has_reagent("sodawater", 1))
		adjustWater(round(S.get_reagent_amount("sodawater")*1))
		adjustHealth(round(S.get_reagent_amount("sodawater")*0.1))
		adjustNutri(round(S.get_reagent_amount("sodawater")*0.1))

	// Man, you guys are retards
	if(S.has_reagent("sacid", 1))
		adjustHealth(-round(S.get_reagent_amount("sacid")*1))
		adjustToxic(round(S.get_reagent_amount("sacid")*1.5))
		adjustWeeds(-rand(1,2))

	// SERIOUSLY
	if(S.has_reagent("pacid", 1))
		adjustHealth(-round(S.get_reagent_amount("pacid")*2))
		adjustToxic(round(S.get_reagent_amount("pacid")*3))
		adjustWeeds(-rand(1,4))

	// Plant-B-Gone is just as bad
	if(S.has_reagent("plantbgone", 1))
		adjustHealth(-round(S.get_reagent_amount("plantbgone")*2))
		adjustToxic(-round(S.get_reagent_amount("plantbgone")*3))
		adjustWeeds(-rand(4,8))

	//Weed Spray
	if(S.has_reagent("weedkiller", 1))
		adjustToxic(round(S.get_reagent_amount("weedkiller")*0.5))
		//old toxicity was 4, each spray is default 10 (minimal of 5) so 5 and 2.5 are the new ammounts
		adjustWeeds(-rand(1,2))

	//Pest Spray
	if(S.has_reagent("pestkiller", 1))
		adjustToxic(round(S.get_reagent_amount("pestkiller")*0.5))
		adjustPests(-rand(1,2))

	// Healing
	if(S.has_reagent("cryoxadone", 1))
		adjustHealth(round(S.get_reagent_amount("cryoxadone")*3))
		adjustToxic(-round(S.get_reagent_amount("cryoxadone")*3))

	// Ammonia is bad ass.
	if(S.has_reagent("ammonia", 1))
		adjustHealth(round(S.get_reagent_amount("ammonia")*0.5))
		adjustNutri(round(S.get_reagent_amount("ammonia")*1))

	// This is more bad ass, and pests get hurt by the corrosive nature of it, not the plant.
	if(S.has_reagent("diethylamine", 1))
		adjustHealth(round(S.get_reagent_amount("diethylamine")*1))
		adjustPests(-rand(1,2))

	// Compost, effectively
	if(S.has_reagent("nutriment", 1))
		adjustHealth(round(S.get_reagent_amount("nutriment")*0.5))
		adjustNutri(round(S.get_reagent_amount("nutriment")*1))

	// The best stuff there is. For testing/debugging.

/obj/machinery/hydroponics/proc/adjustNutri(var/NUTRI)
	nutrilevel += NUTRI

/obj/machinery/hydroponics/proc/adjustHealth(var/HEALTH)
	health += HEALTH

/obj/machinery/hydroponics/proc/adjustWater(var/WATER)
	waterlevel += WATER

/obj/machinery/hydroponics/proc/adjustWeeds(var/WEED)
	weedlevel += WEED

/obj/machinery/hydroponics/proc/adjustToxic(var/TOXIC)
	toxic += TOXIC

/obj/machinery/hydroponics/proc/adjustPests(var/PEST)
	pestlevel += PEST

/obj/machinery/hydroponics/proc/plantdies() // OH NOES!!!!! I put this all in one function to make things easier
	health = 0
	harvest = 0
	pestlevel = 0 // Pests die
	if(!dead)
		update_icon()
		dead = 1

/obj/machinery/hydroponics/proc/upd_icn()
	overlays -= overlay
	if(!overlay)
		if(harvest)
			overlay = image('icons/obj/machine/hydroponics.dmi', "plants")
			overlays += overlay
		else if(dead)
			overlay = image('icons/obj/machine/hydroponics.dmi', "dead")
			overlays += overlay
		else
			overlay = null
	else
		if(harvest)
			overlay = image('icons/obj/machine/hydroponics.dmi', "plants")
			overlays += overlay
		else if(dead)
			overlay = image('icons/obj/machine/hydroponics.dmi', "dead")
			overlays += overlay


/obj/machinery/hydroponics/act_by_item(var/obj/item/O)
	if(istype(O, /obj/item/seeds))
		if(!planted)
			dead = 0
			planted = 1
			age = 1
			if(usr.client.my_hand_active == "left")
				if(istype(O, usr.client.lhand_items[1]))
					O.Move(src)
					usr << "\bold �� ����� [O] � [src]"
					usr.client.L.overlays.Cut()
					usr.client.lhand_items.Cut()

			if(usr.client.my_hand_active == "right")
				if(istype(O, usr.client.rhand_items[1]))
					O.Move(src)
					usr << "\bold �� ����� [O] � [src]"
					usr.client.R.overlays.Cut()
					usr.client.rhand_items.Cut()
			myseed = O
			health = myseed.endurance
			lastcycle = world.time

		else
			usr << "\red The [src] already has seeds in it!"
	if(istype(O, /obj/item/weapon/reagent_containers/glass))
		do_after(usr, 4)
		if(O.reagents.total_volume)
			message_for_mobs(5, 'sound/chomp.ogg')
			spawn(5)
				applyChemicals(O.reagents)
				O.reagents.clear_reagents()
		else
			usr << "\red [src] is empty."

/obj/machinery/hydroponics/process()
	spawn while(1)
		sleep(10)
		if(waterlevel > maxwater)
			waterlevel = maxwater

		if(nutrilevel > maxnutri)
			nutrilevel = maxnutri

		if(myseed && (myseed.loc != src))
			myseed.loc = src

		if(planted && !dead)
				// Advance age
			age++

		//Nutrients//////////////////////////////////////////////////////////////
					// Nutrients deplete slowly
			if(prob(50))
				adjustNutri(-1)

					// Lack of nutrients hurts non-weeds
			if(nutrilevel <= 0 && myseed.plant_type != 1)
				adjustHealth(-rand(1,3))

		//Photosynthesis/////////////////////////////////////////////////////////
					// Lack of light hurts non-mushrooms
			if(isturf(loc))
				var/turf/currentTurf = loc
				var/lightAmt = currentTurf.luminosity
				if(myseed.plant_type == 2) // Mushroom
					if(lightAmt < 2)
						adjustHealth(-1)
				else // Non-mushroom
					if(lightAmt < 4)
						adjustHealth(-2)

		//Water//////////////////////////////////////////////////////////////////
					// Drink random amount of water
			adjustWater(-rand(1,6))

					// If the plant is dry, it loses health pretty fast, unless mushroom
			if(waterlevel <= 10 && myseed.plant_type != 2)
				adjustHealth(-rand(0,1))
				if(waterlevel <= 0)
					adjustHealth(-rand(0,2))

				// Sufficient water level and nutrient level = plant healthy
			else if(waterlevel > 10 && nutrilevel > 0)
				adjustHealth(rand(1,2))
				if(prob(5))  //5 percent chance the weed population will increase
					adjustWeeds(1)

		//Toxins/////////////////////////////////////////////////////////////////

					// Too much toxins cause harm, but when the plant drinks the contaiminated water, the toxins disappear slowly
			if(toxic >= 40 && toxic < 80)
				adjustHealth(-1)
				adjustToxic(-rand(1,10))
			else if(toxic >= 80) // I don't think it ever gets here tbh unless above is commented out
				adjustHealth(-3)
				adjustToxic(-rand(1,10))

		//Pests & Weeds//////////////////////////////////////////////////////////

			else if(pestlevel >= 5)
				adjustHealth(-1)

					// If it's a weed, it doesn't stunt the growth
			if(weedlevel >= 5 && myseed.plant_type != 1 )
				adjustHealth(-1)

		//Health & Age///////////////////////////////////////////////////////////

					// Plant dies if health <= 0
			if(health <= 0)
				plantdies()
				adjustWeeds(1) // Weeds flourish

					// If the plant is too old, lose health fast
			if(age > myseed.lifespan)
				adjustHealth(-rand(1,5))

					// Harvest code
			if(age > myseed.production && (age - lastproduce) > myseed.production && (!harvest && !dead))
				if(myseed && myseed.yield != -1) // Unharvestable shouldn't be harvested
					harvest = 1
				else
					lastproduce = age
			if(prob(5))  // On each tick, there's a 5 percent chance the pest population will increase
				adjustPests(1)
		else
			if(waterlevel > 10 && nutrilevel > 0 && prob(10))  // If there's no plant, the percentage chance is 10%
				adjustWeeds(1)
				// Weeeeeeeeeeeeeeedddssss
		upd_icn()

/obj/machinery/hydroponics/act(mob/user as mob)
	if(harvest)
		if(!user in range(1,src))
			return
		myseed.harvest()
		harvest = 0
	else if(dead)
		planted = 0
		dead = 0
		usr << text("You remove the dead plant from the [src].")
		del(myseed)
	else
		if(planted && !dead)
			usr << text("The [src] has \blue [myseed.plantname] \black planted.")
			if(health <= (myseed.endurance / 2))
				usr << text("The plant looks unhealthy")
		else
			usr << text("The [src] is empty.")
		usr << text("Water: [waterlevel]/100")
		usr << text("Nutrient: [nutrilevel]/10")
		if(weedlevel >= 5) // Visual aid for those blind
			usr << text("The [src] is filled with weeds!")
		if(pestlevel >= 5) // Visual aid for those blind
			usr << text("The [src] is filled with tiny worms!")
		usr << text ("") // Empty line for readability.

/obj/item/seeds/proc/harvest(mob/user = usr)
	var/obj/item/seeds/produce = product
	//var/obj/machinery/hydroponics/parent = loc //for ease of access
//	var/t_amount = 0


	var/num_of_harvest = rand(0,5)
	while(num_of_harvest > 0)
		new produce(user.loc, potency) // User gets a consumable
		num_of_harvest -= 1