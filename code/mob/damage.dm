
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
			signal = 1
			usr << 'sound/death.ogg'
			src << "<b>Goodbye...</b>"
	Del()
		var/mob/ghost/G = new(src.loc)
		G.client = client
		..()

	proc/blood_new() //восстановление крови
		if(reagents.get_reagent_amount("blood") < 300)
			if(reagents.get_reagent_amount("nutrments") > 1)
				reagents.add_reagent("blood", rand(3,6))
				reagents.remove_reagent("nutriments", 1)