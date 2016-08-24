
/mob/human
	name = "human"
	typer = 4
	proc/bloodloss()
		for(var/obj/item/organs/O in src)
			if(O.hit_points < 20 || O.burn_points > 100)
				sleep(rand(5,8))
				reagents.remove_reagent("blood", rand(1,3))

		if(reagents.get_reagent_amount("blood") < 150)
			var/random_message = rand(0,250)
			if(random_message <= 15)
				src << "<b>You feel dizziness</b>"
				new /obj/effect/blood(src.loc)

		if(reagents.get_reagent_amount("blood") < 50)
			lying()
			stat |= DEAD
			usr << 'sound/death.ogg'
			var/mob/ghost/G = new(src.loc)
			G.client = client
			src << "<b>Goodbye...</b>"
	Del()
		var/mob/ghost/G = new(src.loc)
		G.client = client
		..()

	proc/blood_new() //blood reproduction
		if(reagents.get_reagent_amount("blood") < 300)
			if(reagents.get_reagent_amount("nutriments") > 1)
				reagents.add_reagent("blood", rand(1,2))
				reagents.remove_reagent("nutriments", 1)
				for(var/obj/item/organs/O in src)
					if(O.hit_points < 40)
						O.hit_points += 1

	proc/toxic_damage(var/value)
		for(var/obj/item/organs/head/O in src)
			var/obj/item/organs/brain/B = O.inner_organ
			B.hit_points -= value