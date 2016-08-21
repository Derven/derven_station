/obj/item/weapon/storage/bag/plants

/proc/seedify(var/obj/item/O as obj, var/t_max)
	var/t_amount = 0
	if(t_max == -1)
		t_max = rand(1,4)

	if(istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown/))
		var/obj/item/weapon/reagent_containers/food/snacks/grown/F = O
		while(t_amount < t_max)
			var/obj/item/seeds/t_prod = new F.seed(O.loc, O)
			t_prod.lifespan = F.lifespan
			t_prod.endurance = F.endurance
			t_prod.maturation = F.maturation
			t_prod.production = F.production
			t_prod.yield = F.yield
			t_prod.potency = F.potency
			t_amount++
		del(O)
		return 1

	/*else if(istype(O, /obj/item/stack/tile/grass))
		var/obj/item/stack/tile/grass/S = O
		new /obj/item/seeds/grassseed(O.loc)
		S.use(1)
		return 1*/
	else
		return 0


/obj/machinery/seed_extractor
	name = "seed extractor"
	desc = "Extracts and bags seeds from produce."
	icon = 'icons/obj/machine/hydroponics.dmi'
	icon_state = "sextractor"
	density = 1
	anchored = 1
	var/piles = list()

	New()
		src.ul_SetLuminosity(0, 2, 0)

obj/machinery/seed_extractor/act_by_item(var/obj/item/O)
	if (istype(O,/obj/item/weapon/storage/bag/plants))
		var/obj/item/weapon/storage/P = O
		var/loaded = 0
		for(var/obj/item/seeds/G in P.contents)
			if(contents.len >= 999)
				break
			++loaded
			add(G)
		if (loaded)
			usr << "<span class='notice'>You put the seeds from \the [O.name] into [src].</span>"
		else
			usr << "<span class='notice'>There are no seeds in \the [O.name].</span>"
		return

	if(!usr.drop()) //couldn't drop the item
		usr << "<span class='notice'>\The [O] is stuck to your hand, you cannot put it in the seed extractor!</span>"
		return

	if(O && O.loc)
		O.loc = src.loc

	if(seedify(O,-1))
		usr << "<span class='notice'>You extract some seeds.</span>"
		return
	else if (istype(O,/obj/item/seeds))
		add(O)
		usr << "<span class='notice'>You add [O] to [src.name].</span>"
		return
	else
		usr << "<span class='notice'>You can't extract any seeds from \the [O.name].</span>"

datum/seed_pile
	var/name = ""
	var/lifespan = 0	//Saved stats
	var/endurance = 0
	var/maturation = 0
	var/production = 0
	var/yield = 0
	var/potency = 0
	var/amount = 0

datum/seed_pile/New(var/name, var/life, var/endur, var/matur, var/prod, var/yie, var/poten, var/am = 1)
	src.name = name
	src.lifespan = life
	src.endurance = endur
	src.maturation = matur
	src.production = prod
	src.yield = yie
	src.potency = poten
	src.amount = am

obj/machinery/seed_extractor/proc/add(var/obj/item/seeds/O as obj)
	if(contents.len >= 999)
		usr << "<span class='notice'>\The [src] is full.</span>"
		return 0

	O.loc = src

	for (var/datum/seed_pile/N in piles)
		if (O.plantname == N.name && O.lifespan == N.lifespan && O.endurance == N.endurance && O.maturation == N.maturation && O.production == N.production && O.yield == N.yield && O.potency == N.potency)
			++N.amount
			return

	piles += new /datum/seed_pile(O.plantname, O.lifespan, O.endurance, O.maturation, O.production, O.yield, O.potency)
	return
