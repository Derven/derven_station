/mob
	var/my_gend

/mob/proc/emote(var/act,var/m_type=1,var/message = null)
	var/param = null


	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	//var/m_type = 1


	var/t_his = "its"
	var/t_him = "it"

	if(src.stat == 2)
		return

	switch(act)
//D2K5 Emotes
		if("superfart")
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			emote("fart")
			sleep(1)
			src << "\blue Your butt falls off!"
			new /obj/decal/cleanable/poo(src.loc)
			message_for_mobs(5, 'superfart.ogg')

		if("fart")
			message_for_mobs(5, 'fart.ogg')
			m_type = 2
			switch(rand(1, 48))
				if(1)
					message = "<B>[src]</B> lets out a girly little 'toot' from \his butt."

				if(2)
					message = "<B>[src]</B> farts loudly!"

				if(3)
					message = "<B>[src]</B> lets one rip!"

				if(4)
					message = "<B>[src]</B> farts! It sounds wet and smells like rotten eggs."

				if(5)
					message = "<B>[src]</B> farts robustly!"

				if(6)
					message = "<B>[src]</B> farted! It reminds you of your grandmother's queefs."

				if(7)
					message = "<B>[src]</B> queefed out \his ass!"

				if(8)
					message = "<B>[src]</B> farted! It reminds you of your grandmother's queefs."

				if(9)
					message = "<B>[src]</B> farts a ten second long fart."

				if(10)
					message = "<B>[src]</B> groans and moans, farting like the world depended on it."

				if(11)
					message = "<B>[src]</B> breaks wind!"

				if(12)
					message = "<B>[src]</B> expels intestinal gas through the anus."

				if(13)
					message = "<B>[src]</B> release an audible discharge of intestinal gas."

				if(14)
					message = "\red <B>[src]</B> is a farting motherfucker!!!"

				if(15)
					message = "\red <B>[src]</B> suffers from flatulence!"

				if(16)
					message = "<B>[src]</B> releases flatus."

				if(17)
					message = "<B>[src]</B> releases gas generated in \his digestive tract, \his stomach and \his intestines. \red<B>It stinks way bad!</B>"

				if(18)
					message = "<B>[src]</B> farts like your mom used to!"

				if(19)
					message = "<B>[src]</B> farts. It smells like Soylent Surprise!"

				if(20)
					message = "<B>[src]</B> farts. It smells like pizza!"

				if(21)
					message = "<B>[src]</B> farts. It smells like George Melons' perfume!"

				if(22)
					message = "<B>[src]</B> farts. It smells like atmos in here now!"

				if(23)
					message = "<B>[src]</B> farts. It smells like medbay in here now!"

				if(24)
					message = "<B>[src]</B> farts. It smells like the bridge in here now!"

				if(25)
					message = "<B>[src]</B> farts like a pubby!"

				if(26)
					message = "<B>[src]</B> farts like a goone!"

				if(27)
					message = "<B>[src]</B> farts so hard he's certain poop came out with it, but dares not find out."

				if(28)
					message = "<B>[src]</B> farts delicately."

				if(29)
					message = "<B>[src]</B> farts timidly."

				if(30)
					message = "<B>[src]</B> farts very, very quietly. The stench is OVERPOWERING."

				if(31)
					message = "<B>[src]</B> farts and says, \"Mmm! Delightful aroma!\""

				if(32)
					message = "<B>[src]</B> farts and says, \"Mmm! Sexy!\""

				if(33)
					message = "<B>[src]</B> farts and fondles \his own buttocks."

				if(34)
					message = "<B>[src]</B> farts and fondles YOUR buttocks."

				if(35)
					message = "<B>[src]</B> fart in he own mouth. A shameful [src]."

				if(36)
					message = "<B>[src]</B> farts out pure plasma! \red<B>FUCK!</B>"

				if(37)
					message = "<B>[src]</B> farts out pure oxygen. What the fuck did he eat?"

				if(38)
					message = "<B>[src]</B> breaks wind noisily!"

				if(39)
					message = "<B>[src]</B> releases gas with the power of the gods! The very station trembles!!"

				if(40)
					message = "<B>[src] \red f \blue a \black r \red t \blue s \black !</B>"

				if(41)
					message = "<B>[src] shat \his pants!</B>"

				if(42)
					message = "<B>[src] shat \his pants!</B> Oh, no, that was just a really nasty fart."

				if(43)
					message = "<B>[src]</B> is a flatulent whore."

				if(44)
					message = "<B>[src]</B> likes the smell of \his own farts."

				if(45)
					message = "<B>[src]</B> doesnt wipe after he poops."

				if(46)
					message = "<B>[src]</B> farts! Now he smells like Tiny Turtle."

				if(47)
					message = "<B>[src]</B> burps! He farted out of \his mouth!! That's Showtime's style, baby."

				if(48)
					message = "<B>[src]</B> laughs! His breath smells like a fart."

			for(var/mob/M in viewers(src, null))
				if(!M.stat)
					spawn(10)
						if(prob(20))
							switch(pick(1,2))
								if(1)
									M.emote("giggle")
								if(2)
									M.emote("clap")
				m_type = 2

		if(("poo") || ("poop") || ("shit") || ("crap"))
			if(do_after(src, 100))
				src.emote("fart")
				m_type = 2
				new/obj/decal/cleanable/poo(src.loc)

		if("cum")
			message = "<B>[src]</B> attempts to cum but nothing comes out."
			new/obj/decal/cleanable/cum(src.loc)
			message = "<B>[src]</B> cums on the floor."
			m_type = 1
				//check for being in sight of a working security camera

		if(("pee") || ("urinate") || ("piss"))
			if(do_after(src, 50))
				var/obj/decal/cleanable/urine/D = new/obj/decal/cleanable/urine(src.loc)
				if(src.reagents)
					src.reagents.trans_to(D, 10)
					message = "<B>[src]</B> urinates themselves."
					m_type = 1
					// check for being in sight of a working security camera
					for(var/mob/M in viewers(src, null))
						if(!M.stat)
							spawn(10)
								if(prob(20))
									switch(pick(1,2))
										if(1)
											M.emote("giggle")
										if(2)
											M.emote("clap")

		if(("vomit") || ("puke") || ("throwup"))
			var/obj/decal/cleanable/vomit/V = new/obj/decal/cleanable/vomit(src.loc)
			if(src.reagents)
				src.reagents.trans_to(V, 10)
			message = "<B>[src]</B> vomits on the floor."

		if("rape")
			var/M = null
			if (param)
				for (var/mob/A in view(1, null))
					if (param == A.name)
						M = A
						break
			if (M == src)
				M = null
				//if (!//M:stat || //M:weakened != 0 || //M:stunned != 0)
				//	usr << "\red [M] must be knocked down!"
				//	return

				if (my_gend == 1)
					message = "<B>[src]</B>'s grabs [M] and pins [t_his] arms behind [t_his] back!"
				else if (my_gend == 0)
					message = "<B>[src]</B>'s grabs [M] and pins [t_his] arms behind [t_his] back!"
				//M:weakened = 4
				//M:bruteloss++
				src.loc = src.loc
				spawn(0)
					////src.moaning = 1
					////M:panicing = 1
					//src.underwear = 0
					////M:underwear = 0
					//M:stunned = 2
					//moansounds()
					//panicsounds()
					spawn(30)
						if (my_gend == 1)
							switch(rand(1, 3))
								if(1)
									for(var/mob/H in hearers(src, null))
										H.message_for_mobs(5, "\red [M] gasps for air as [src] grabs [t_him] and shoves his dripping erection unexpectedly between [t_his] lips.")
										spawn(5)
										H.message_for_mobs(5, "\red [src] slowly fucks [M]'s upturned face, slamming his dick into [t_his] throat.")
								if(2)
									for(var/mob/H in hearers(src, null))
										H.message_for_mobs(5, "\red [M] struggles as [src] grabs [t_him] and shoves his cock into [t_his] ass.")
										spawn(5)
										H.message_for_mobs(5, "\red [src] slowly fucks [M]'s ass, slamming his dick hard and choking [t_him].")
								if(3)
									for(var/mob/H in hearers(src, null))
										H.message_for_mobs(5, "\red [M] struggles as [src] grabs [t_him] and shoves his fingers into [t_his] ass.")
										spawn(5)
										H.message_for_mobs(5, "\red [src] slides his fingers in and out of [M]'s ass.")
						else if (my_gend == 0)
							switch(rand(1, 3))
								if(1)
									for(var/mob/H in hearers(src, null))
										H.message_for_mobs(5, "\red [src] smiles, and pulls [M] close, while they struggle to escape.")
										spawn(5)
										H.message_for_mobs(5, "\red [src] slowly rubs [M]'s genitals while fingering her own.")
								if(2)
									for(var/mob/H in hearers(src, null))
										H.message_for_mobs(5, "\red [M] panics as [src] grabs [t_him] and forces [t_him] to kneel.")
										spawn(5)
										H.message_for_mobs(5, "\red [src] forces [M]'s face against her pussy, making [t_him] lick her dripping wet cunt.")
								if(3)
									for(var/mob/H in hearers(src, null))
										H.message_for_mobs(5, "\red [M] struggles to get away as [src] grabs [t_him] and pushes [t_him] down.")
										spawn(5)
										H.message_for_mobs(5, "\red [src] slides her fingers in and out of [M]'s ass.")
					spawn(0)
						if(do_after(src, 200))
							for(var/mob/H in hearers(src, null))
								H.message_for_mobs(5, "\red [src] gasps and moans as they orgasm on [M], pushing [M] down and leaving [t_him] there.")

							var/obj/decal/cleanable/urine/D = new/obj/decal/cleanable/cum(src:loc)
							if(src.reagents)
								src.reagents.trans_to(D, 10)
							m_type = 1


		if(("sex") || ("fuck") || ("caress"))
			var/M = null
			if (param)
				for (var/mob/A in view(1, null))
					if (param == A.name)
						M = A
						break
			if (M == src)
				M = null
				//if (//M:my_gend == MALE)
			//if (//M:w_uniform)
				src << "\red You must take off their uniform first!"
				return
			message = "<B>[src]</B>'s grabs [M] and pulls [t_him] close, starting to play with them sexually."
			//M:weakened = 4
			src.loc = src.loc
			spawn(0)
				spawn(30)
					if (my_gend == 1)
						switch(rand(1, 4))
							if(1)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [M] sucks [src]'s cock.")
							if(2)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [src] slowly fucks [M]'s ass, slamming his dick hard.")
							if(3)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [src] slides his fingers in and out of [M]'s ass.")
							if(4)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [src] begins to rub [M]'s genitals.")
					else if (my_gend == 0)
						switch(rand(1, 4))
							if(1)

								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [src] gently rubs [M]'s genitals while fingering her pussy.")
							if(2)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [M] begins to lick [src]'s dripping pussy.")
							if(3)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [src] slides her fingers in and out of [M]'s ass.")
							if(4)
								for(var/mob/H in hearers(src, null))
									H.message_for_mobs(5, "\blue [src] begins to rub [M]'s genitals.")
				spawn(0)
					if(do_after(src, 200))
						for(var/mob/H in hearers(src, null))
							H.message_for_mobs(5, "\blue [src] gasps and moans as they orgasm together, both dropping down to relaxation.")
						new /obj/decal/cleanable/cum(src.loc)
						var/obj/decal/cleanable/urine/D = new/obj/decal/cleanable/cum(src.loc)
						if(src.reagents)
							src.reagents.trans_to(D, 10)
							//if (//M:my_gend == FEMALE)
								//M:contract_disease(new /datum/disease/baby,1)
							m_type = 1


		if(("wank") || ("masturbate"))
			var/M = null
			if (param)
				for (var/atom/A as mob|obj|turf|area in view(1, null))
					if (param == A.name)
						M = A
						break
			if (M == src)
				M = null
			if (M)
				src << "\red You attempt to masturbate onto [M]."
				if (my_gend == 1)
					message = "<B>[src]</B>'s eyes glaze over as he expertly strokes his aroused prong."
				else if (my_gend == 0)
					message = "<B>[src]</B> finger-fucks her pussy."
				spawn(0)
					spawn(10)
						if (my_gend == 1)
							for(var/mob/H in hearers(src, null))
								H.message_for_mobs(5, "\blue <B>[src]</B> groans and pauses, just barely stroking his dick.")
						else if (my_gend == 0)
							for(var/mob/H in hearers(src, null))
								H.message_for_mobs(5, "\blue <B>[src]</B> slides two fingers deep into her cunt, reaching for the g-spot.")
					if(do_after(src, 150))
						if (my_gend == 1)
							for(var/mob/H in hearers(src, null))
								H.message_for_mobs(5, "\blue <B>[src]</B> groans and shoots a watery spurt of semen onto [M].")
						else if (my_gend == 0)
							for(var/mob/H in hearers(src, null))
								H.message_for_mobs(5, "\blue With a shuddering moan, <B>[src]</B> draws out her orgasm onto [M], varying the speed of her finger movements to maximize the waves of pleasure.")
						new/obj/decal/cleanable/cum(src.loc)
						//src.moaning = 0
						//src.underwear = 1
					m_type = 1
					// check for being in sight of a working security camera
						// determine the name of the perp (goes by ID if wearing one)
						// find the matching security record
						//	if(R.fields["name"] == perpname)

//D2K5 Emotes


/mob/verb/handshake()
	set name = "Shake hands with"
	set desc = "Shake hands with someone"
	set src in oview(1)
	set category = "Emote"
	usr.emote("handshake-[src.name]")

/mob/verb/brofist()
	set name = "Brofist"
	set desc = "Brofist someone"
	set src in oview(1)
	set category = "Emote"
	usr.emote("brofist-[src.name]")

/mob/verb/salute()
	set name = "Salute to"
	set desc = "Salute to someone"
	set src in oview(10)
	usr.emote("salute-[src.name]")

/mob/verb/glare()
	set name = "Glare"
	set desc = "Glare at someone"
	set category = "Emote"
	set src in oview(10)
	usr.emote("glare-[src.name]")

/mob/verb/fart()
	set name = "Fart"
	set desc = "Glare at someone"
	set category = "Emote"
	usr.emote("fart-[src.name]")

/mob/verb/superfart()
	set name = "Superfart"
	set desc = "Glare at someone"
	set category = "Emote"
	usr.emote("superfart-[src.name]")

/mob/verb/pee()
	set name = "Pee"
	set desc = "Glare at someone"
	set category = "Emote"
	usr.emote("pee-[src.name]")

/mob/verb/poo()
	set name = "Poo"
	set desc = "Glare at someone"
	set category = "Emote"
	usr.emote("poo-[src.name]")

/mob/verb/look()
	set name = "Look at"
	set desc = "Look at someone"
	set src in oview(10)
	set category = "Emote"
	usr.emote("look-[src.name]")

/mob/verb/stare()
	set name = "Stare at"
	set desc = "Stare at someone"
	set category = "Emote"
	set src in oview(10)
	usr.emote("stare-[src.name]")

/mob/verb/bow()
	set name = "Bow down to"
	set desc = "Bow down to someone"
	set category = "Emote"
	set src in oview(10)
	usr.emote("bow-[src.name]")

/mob/verb/hug()
	set name = "Hug"
	set desc = "Hug someone"
	set src in oview(1)
	usr.emote("hug-[src.name]")

/mob/verb/kiss()
	set name = "Kiss"
	set desc = "Kiss someone"
	set src in oview(1)
	set category = "Emote"
	usr.emote("kiss-[src.name]")

/mob/verb/cuddle()
	set name = "Cuddle"
	set desc = "Cuddle someone"
	set src in oview(1)
	set category = "Emote"
	usr.emote("cuddle-[src.name]")

/mob/verb/snuggle()
	set name = "Snuggle"
	set desc = "snuggle someone"
	set src in oview(1)
	set category = "Emote"
	usr.emote("snuggle-[src.name]")

/mob/verb/sex()
	set name = "Sex"
	set desc = "Attempt to have sex with a person"
	set src in oview(1)
	set category = "Emote"
	usr.emote("sex-[src.name]")

/mob/verb/milk()
	set name = "Milk"
	set desc = "Attempt to milk a person"
	set src in oview(1)
	set category = "Emote"
	usr.emote("milk-[src.name]")

/mob/verb/rape()
	set name = "Rape"
	set desc = "Attempt to rape a person"
	set src in oview(1)
	set category = "Emote"
	usr.emote("rape-[src.name]")

/atom/verb/wank()
	set name = "Masturbate Onto"
	set src in oview(1)
	set category = "Emote"
	usr.emote("wank-[src.name]")
