#define RHAND 1
#define LHAND 0

obj
	screen
		layer = 60
		icon = 'icons/mob/screen.dmi'
		icon_state = "screen"
		var/active = 0

		storage

		close

		throw_icon
			icon_state = "act_throw_off"

			New(var/client/C)
				screen_loc="10,0"
				C.screen+=src

			Click()
				if(usr.throw_mode == 1)
					usr.throw_mode = 0
					usr.TI.icon_state = "act_throw_off"
				else
					usr.throw_mode = 1
					usr.TI.icon_state = "act_throw_on"

		rest
			icon_state = "rest0"
			New(var/client/C)
				screen_loc="14,2"
				C.screen+=src

			Click()
				var/mob/human/H = usr
				if(usr.stat & LYING)
					H.unlying()
				else
					H.lying()
		eye
			icon_state = "foul_blow_eyes"
			New(var/client/C)
				screen_loc="14,3"
				C.screen+=src
			Click()
				usr.foul_blow = "eye"
				usr.EY.icon_state = "foul_blow_eyes_active"
				usr.ST.icon_state = "foul_blow_stomach"
				usr.GR.icon_state = "foul_blow_groin"

		stomach
			icon_state = "foul_blow_stomach"
			New(var/client/C)
				screen_loc="14,3"
				C.screen+=src
			Click()
				usr.foul_blow = "stomach"
				usr.EY.icon_state = "foul_blow_eyes"
				usr.ST.icon_state = "foul_blow_stomach_active"
				usr.GR.icon_state = "foul_blow_groin"

		groin
			icon_state = "foul_blow_groin"
			New(var/client/C)
				screen_loc="14,3"
				C.screen+=src
			Click()
				usr.foul_blow = "groin"
				usr.EY.icon_state = "foul_blow_eyes"
				usr.ST.icon_state = "foul_blow_stomach"
				usr.GR.icon_state = "foul_blow_groin_active"
		human
			head
				icon_state = "head"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "head"
					usr.HH.icon_state = "head_active"
					usr.HG.icon_state = "groin"
					usr.HC.icon_state = "chest"
					usr.HRL.icon_state = "right_leg"
					usr.HLL.icon_state = "left_leg"
					usr.HRA.icon_state = "right_arm"
					usr.HLA.icon_state = "left_arm"

			chest
				icon_state = "chest"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "chest"
					usr.HH.icon_state = "head"
					usr.HG.icon_state = "groin"
					usr.HC.icon_state = "chest_active"
					usr.HRL.icon_state = "right_leg"
					usr.HLL.icon_state = "left_leg"
					usr.HRA.icon_state = "right_arm"
					usr.HLA.icon_state = "left_arm"

			right_leg
				icon_state = "right_leg"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "r_leg"
					usr.HH.icon_state = "head"
					usr.HG.icon_state = "groin"
					usr.HC.icon_state = "chest"
					usr.HRL.icon_state = "right_leg_active"
					usr.HLL.icon_state = "left_leg"
					usr.HRA.icon_state = "right_arm"
					usr.HLA.icon_state = "left_arm"

			left_leg
				icon_state = "left_leg"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "l_leg"
					usr.HH.icon_state = "head"
					usr.HG.icon_state = "groin"
					usr.HC.icon_state = "chest"
					usr.HRL.icon_state = "right_leg"
					usr.HLL.icon_state = "left_leg_active"
					usr.HRA.icon_state = "right_arm"
					usr.HLA.icon_state = "left_arm"

			left_arm
				icon_state = "left_arm"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "l_arm"
					usr.HH.icon_state = "head"
					usr.HG.icon_state = "groin"
					usr.HC.icon_state = "chest"
					usr.HRL.icon_state = "right_leg"
					usr.HLL.icon_state = "left_leg"
					usr.HRA.icon_state = "right_arm"
					usr.HLA.icon_state = "left_arm_active"


			right_arm
				icon_state = "right_arm"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "r_arm"
					usr.HH.icon_state = "head"
					usr.HG.icon_state = "groin"
					usr.HC.icon_state = "chest"
					usr.HRL.icon_state = "right_leg"
					usr.HLL.icon_state = "left_leg"
					usr.HRA.icon_state = "right_arm_active"
					usr.HLA.icon_state = "left_arm"

			groin
				icon_state = "groin"
				icon = 'icons/mob/big_screen.dmi'
				layer = 60
				New(var/client/C)
					screen_loc="14,13"
					C.screen+=src

				Click()
					usr.zone = "groin"
					usr.HH.icon_state = "head"
					usr.HG.icon_state = "groin_active"
					usr.HC.icon_state = "chest"
					usr.HRL.icon_state = "right_leg"
					usr.HLL.icon_state = "left_leg"
					usr.HRA.icon_state = "right_arm"
					usr.HLA.icon_state = "left_arm"
		shit
			icon_state = "shit"
			layer = 22
			New(var/client/C)
				screen_loc="1,0 to 14,0"
				C.screen+=src

		shit1
			icon_state = "shit"
			layer = 22
			New(var/client/C)
				screen_loc="1,1 to 2,1"
				C.screen+=src

		shit2
			icon_state = "shit2"
			layer = 22
			New(var/client/C)
				screen_loc="14,0 to 14,14"
				C.screen+=src

		shit3
			icon_state = "shit3"
			layer = 27
			New(var/client/C)
				screen_loc="14,0"
				C.screen+=src

		temperature
			icon_state = "temperature_1"
			layer = 27
			New(var/client/C)
				screen_loc="14,8"
				C.screen+=src



		health
			icon_state = "health_1"
			layer = 27
			New(var/client/C)
				screen_loc="14,6"
				C.screen+=src

		alert
			icon_state = "oxygen_0"
			layer = 27
			New(var/client/C)
				screen_loc="14,9"
				C.screen+=src

		toxin
			icon_state = "tox0"
			layer = 27
			New(var/client/C)
				screen_loc="14,10"
				C.screen+=src

		internal
			icon_state = "internal0"
			layer = 27
			New(var/client/C)
				screen_loc="14,11"
				C.screen+=src

		PULL
			icon_state = "pull0"
			layer = 27
			New(var/client/C)
				screen_loc="12,0"
				C.screen+=src

		nutrition
			icon_state = "nut1"
			layer = 27
			New(var/client/C)
				screen_loc="14,7"
				C.screen+=src

		lhand
			layer = 23
			icon_state = "lhand_active"
			active = 1
			New(var/client/C)
				screen_loc="8,0"
				C.screen+=src
			var/mob/C

			Click()
				if(usr.lhand_items.len > 0)
					for(var/obj/O in usr.contents)
						if(istype(O,usr.lhand_items[1]))
							O.act_self(O)
				else
					if(C.my_hand_active == "left")
						C.my_hand_active = "right"
						C.change_hands()
						return

					if(C.my_hand_active == "right")
						C.my_hand_active = "left"
						C.change_hands()
						return

		rhand
			layer = 23
			icon_state = "rhand"
			New(var/client/C)
				screen_loc="7,0"
				C.screen+=src
			var/mob/C

			Click()
				if(usr.rhand_items.len > 0)
					for(var/obj/O in usr.contents)
						if(istype(O,usr.rhand_items[1]))
							O.act_self(O)
				else
					if(C.my_hand_active == "left")
						C.my_hand_active = "right"
						C.change_hands()
						return

					if(C.my_hand_active == "right")
						C.my_hand_active = "left"
						C.change_hands()
						return

		drop
			icon_state = "drop"
			New(var/client/C)
				screen_loc="9,0"
				C.screen+=src

			Click()
				var/mob/human/iam = usr
				iam.drop()


		uniform
			icon_state = "uniform"
			New(var/client/C)
				screen_loc="4,0"
				C.screen+=src
			var/client/C

			act_by_item(var/obj/item/clothing/uniform/I)
				if(usr.uniform_items.len == 0)
					if(istype(I,/obj/item/clothing/uniform))

						I.wear(usr)
						usr.uniform_items += I
						usr.body_parts_covered |= TORSO_DEF

						var/obj/cloth = I.type
						cloth = new cloth()
						cloth.layer = 60
						usr.U.overlays += cloth

						if(usr.my_hand_active == "right")
							usr.rhand_items -= I
							usr.R.overlays.Cut()

						if(usr.my_hand_active == "left")
							usr.lhand_items -= I
							usr.L.overlays.Cut()

			proc/undress_my_uniform_baby()
				usr.body_parts_covered &= ~TORSO_DEF
				var/obj/item/clothing/I = usr.uniform_items[1]
				I.undress(usr)
				usr.U.overlays.Cut()
				usr.uniform_items.Cut()

			proc/add_to_rhand()


				usr.R.overlays += usr.uniform_items[1]
				usr.rhand_items += usr.uniform_items[1]


			proc/add_to_lhand()
				usr.L.overlays += usr.uniform_items[1]
				usr.lhand_items += usr.uniform_items[1]

			act()
				usr.U.undress_my_uniform_baby()

		mask
			layer = 23
			icon_state = "mask"
			New(var/client/C)
				screen_loc="3,0"
				C.screen+=src

			act_by_item(var/obj/item/weapon/tank/I)
				if(usr.mask_items.len == 0)
					if(istype(I,/obj/item/weapon/tank))

						var/obj/cloth = I.type
						cloth = new cloth()
						cloth.layer = 60

						usr.mask_items += I
						usr.M.overlays += cloth

						if(usr.my_hand_active == "right")
							usr.rhand_items -= I
							usr.R.overlays.Cut()
							usr.mask_items.Cut()


						if(usr.my_hand_active == "left")
							usr.lhand_items -= I
							usr.L.overlays.Cut()
							usr.mask_items.Cut()

						return

			proc/undress_my_uniform_baby()
				usr.M.overlays.Cut()
				if(usr.my_hand_active == "right")
					add_to_rhand()
				else
					add_to_lhand()

			proc/add_to_rhand()

				usr.R.overlays += usr.mask_items[1]
				usr.rhand_items += usr.mask_items[1]

			proc/add_to_lhand()
				usr.L.overlays += usr.mask_items[1]
				usr.lhand_items += usr.mask_items[1]

			act()
				usr.M.undress_my_uniform_baby()

		ear
			layer = 23
			icon_state = "ear"
			New(var/client/C)
				screen_loc="2,0"
				C.screen+=src

		gloves
			layer = 23
			icon_state = "gloves"
			New(var/client/C)
				screen_loc="1,0"
				C.screen+=src

		foot
			layer = 60
			icon_state = "foot"
			New(var/client/C)
				screen_loc="1,1"
				C.screen+=src

			act_by_item(var/obj/item/clothing/I)
				if(usr.foot_items.len == 0)
					if(istype(I,/obj/item/clothing/shoes))

						I.wear(usr)
						usr.body_parts_covered |= RIGHT_LEG
						usr.body_parts_covered |= LEFT_LEG

						var/obj/cloth = I.type
						cloth = new cloth()
						cloth.layer = 60

						usr.foot_items += I
						usr.F.overlays += cloth

						if(usr.my_hand_active == "right")
							usr.rhand_items -= I
							usr.R.overlays.Cut()

						if(usr.my_hand_active == "left")
							usr.lhand_items -= I
							usr.L.overlays.Cut()

						return

			proc/undress_my_uniform_baby()
				var/obj/item/clothing/I = usr.foot_items[1]
				I.undress(usr)
				usr.F.overlays.Cut()
				usr.body_parts_covered &= ~RIGHT_LEG
				usr.body_parts_covered &= ~LEFT_LEG
				usr.foot_items.Cut()


			proc/add_to_rhand()


				usr.R.overlays += usr.foot_items[1]
				usr.rhand_items += usr.foot_items[1]

			proc/add_to_lhand()
				usr.L.overlays += usr.foot_items[1]
				usr.lhand_items += usr.foot_items[1]

			act()
				usr.F.undress_my_uniform_baby()

		head
			layer = 60
			icon_state = "head"
			New(var/client/C)
				screen_loc="2,1"
				C.screen+=src


			act_by_item(var/obj/item/clothing/I)
				if(usr.head_items.len == 0)
					if(istype(I,/obj/item/clothing/head))

						I.wear(usr)
						var/obj/cloth = I.type
						cloth = new cloth()
						cloth.layer = 60

						usr.head_items += I
						usr.H.overlays += cloth
						usr.body_parts_covered |= HEAD_DEF

						if(usr.my_hand_active == "right")
							usr.rhand_items -= I
							usr.R.overlays.Cut()


						if(usr.my_hand_active == "left")
							usr.lhand_items -= I
							usr.L.overlays.Cut()

						return

			proc/undress_my_uniform_baby()
				var/obj/item/clothing/I = usr.head_items[1]
				I.undress(usr)
				usr.H.overlays.Cut()
				usr.body_parts_covered &= ~HEAD_DEF
				usr.head_items.Cut()

			proc/add_to_rhand()


				usr.R.overlays += usr.head_items[1]
				usr.rhand_items += usr.head_items[1]

			proc/add_to_lhand()
				usr.L.overlays += usr.head_items[1]
				usr.lhand_items += usr.head_items[1]

			act()
				usr.H.undress_my_uniform_baby()

		clothing
			layer = 23
			icon_state = "clothes"
			New(var/client/C)
				screen_loc="5,0"
				C.screen+=src

			act_by_item(var/obj/item/clothing/I)
				if(usr.clothing_items.len == 0)
					if(istype(I,/obj/item/clothing/suit))

						I.wear(usr)

						var/obj/cloth = I.type
						cloth = new cloth()
						cloth.layer = 60
						usr.body_parts_covered |= TORSO_DEF

						usr.clothing_items += I
						usr.C.overlays += cloth

						if(usr.my_hand_active == "right")
							usr.rhand_items -= I
							usr.R.overlays.Cut()


						if(usr.my_hand_active == "left")
							usr.lhand_items -= I
							usr.L.overlays.Cut()
						return

			proc/undress_my_uniform_baby()
				var/obj/item/clothing/I = usr.clothing_items[1]
				I.undress(usr)
				usr.C.overlays.Cut()
				usr.body_parts_covered &= ~TORSO_DEF
				usr.clothing_items.Cut()

			proc/add_to_rhand()


				usr.R.overlays += usr.clothing_items[1]
				usr.rhand_items += usr.clothing_items[1]

			proc/add_to_lhand()
				usr.L.overlays += usr.clothing_items[1]
				usr.lhand_items += usr.clothing_items[1]

			act()
				usr.C.undress_my_uniform_baby()

		act_intent
			icon_state = "help"
			New(var/client/C)
				screen_loc="11,0"
				C.screen+=src

			Click()
				if(usr.act == "help")
					usr.act = "grab"
					usr.ACT.icon_state = "grab"
					return

				if(usr.act == "harm")
					usr.act = "help"
					usr.ACT.icon_state = "help"
					return

				if(usr.act == "grab")
					usr.act = "harm"
					usr.ACT.icon_state = "harm"
					return

		run_intent
			icon_state = "walk"
			New(var/client/C)
				screen_loc="13,0"
				C.screen+=src

			Click()
				if(usr.r_int == "walk")
					usr.r_int = "run"
					usr.RUN.icon_state = "run"
					return

				if(usr.r_int == "run")
					usr.r_int = "walk"
					usr.RUN.icon_state = "walk"
					return


		proc/check_act_hand()
			if(active == 1)
				icon_state = "hand_act"
			else
				icon_state = "hand"

/mob

	var/my_pull_eba = 0
	var/can_get = 35
	var/my_weight = 0
	var/throw_mode = 0

	var/ouch = 0

	var/hand = RHAND
	var/act = "help"
	var/r_int = "walk"
	var/foul_blow = "no"

	var/my_hand_active = "left"

	var/helmet_ = 0
	var/shoes_ = 0
	var/uniform_ = 0
	var/time_to_change = 0

	var/zone = "chest"

	var/list/obj/item/rhand_items = list()
	var/list/obj/item/lhand_items = list()
	var/list/obj/item/uniform_items = list()
	var/list/obj/item/clothing_items = list()
	var/list/obj/item/head_items = list()
	var/list/obj/item/foot_items = list()
	var/list/obj/item/mask_items = list() //Elon Musk
	var/cloth_ = 0

	var/obj/screen/human/head/HH
	var/obj/screen/human/chest/HC
	var/obj/screen/human/groin/HG
	var/obj/screen/human/right_leg/HRL
	var/obj/screen/human/left_leg/HLL
	var/obj/screen/human/right_arm/HRA
	var/obj/screen/human/left_arm/HLA

	var/obj/screen/lhand/L
	var/obj/screen/rhand/R
	var/obj/screen/drop/D

	var/obj/screen/clothing/C
	var/obj/screen/uniform/U
	var/obj/screen/head/H
	var/obj/screen/gloves/G
	var/obj/screen/foot/F
	var/obj/screen/mask/M
	var/obj/screen/ear/E
	var/obj/screen/rest/RST

	var/obj/screen/temperature/TEMP
	var/obj/screen/health/HEALTH
	var/obj/screen/alert/ALERT

	var/obj/screen/shit/S
	var/obj/screen/shit1/S1
	var/obj/screen/shit2/S2
	var/obj/screen/shit3/S3

	var/obj/screen/act_intent/ACT
	var/obj/screen/run_intent/RUN

	var/obj/screen/eye/EY
	var/obj/screen/stomach/ST
	var/obj/screen/groin/GR
	var/obj/screen/throw_icon/TI

	var/obj/screen/internal/INTERN
	var/obj/screen/PULL/PULL
	var/obj/screen/toxin/TOX
	var/obj/screen/nutrition/NUT

	proc/create_hud()
		HC = new(usr.client)
		HH = new(usr.client)
		HG = new(usr.client)
		HRL = new(usr.client)
		HLL = new(usr.client)
		HRA = new(usr.client)
		HLA = new(usr.client)

		TEMP = new(usr.client)
		HEALTH = new(usr.client)
		ALERT = new(usr.client)

		L = new(usr.client)
		L.C = src

		R = new(usr.client)
		R.C = src

		D = new(usr.client)

		C = new(usr.client)
		H = new(usr.client)
		G = new(usr.client)
		F = new(usr.client)
		M = new(usr.client)
		E = new(usr.client)
		U = new(usr.client)
		U.C = src

		S = new(usr.client)
		S1 = new(usr.client)
		S2 = new(usr.client)
		S3 = new(usr.client)

		ACT = new(usr.client)
		RUN = new(usr.client)

		ST = new(usr.client)
		EY = new(usr.client)
		GR = new(usr.client)
		RST = new(usr.client)
		TI = new(usr.client)

		INTERN = new(usr.client)
		PULL = new(usr.client)
		NUT = new(usr.client)
		TOX = new(usr.client)

	proc/clear_hud()
		usr.client.screen -= HC
		usr.client.screen -= HH
		usr.client.screen -= HG
		usr.client.screen -= HRL
		usr.client.screen -= HLL
		usr.client.screen -= HRA
		usr.client.screen -= HLA

		usr.client.screen -= TEMP
		usr.client.screen -= HEALTH
		usr.client.screen -= ALERT

		usr.client.screen -= L
		usr.client.screen -= L.C

		usr.client.screen -= R
		usr.client.screen -= R.C
		usr.client.screen -= D

		usr.client.screen -= C
		usr.client.screen -= H
		usr.client.screen -= G
		usr.client.screen -= F
		usr.client.screen -= M
		usr.client.screen -= E
		usr.client.screen -= U

		usr.client.screen -= S
		usr.client.screen -= S1
		usr.client.screen -= S2
		usr.client.screen -= S3

		usr.client.screen -= ACT
		usr.client.screen -= RUN

		usr.client.screen -= ST
		usr.client.screen -= EY
		usr.client.screen -= GR
		usr.client.screen -= RST
		usr.client.screen -= TI

		usr.client.screen -= INTERN
		usr.client.screen -= PULL
		usr.client.screen -= NUT
		usr.client.screen -= TOX

	proc/draw_item_hand(var/hand, var/obj/item/I)
		if(my_hand_active == "left")
			L.overlays += I

		if(my_hand_active == "right")
			R.overlays += I

	proc/change_hands()
		if(R.icon_state == "rhand_active")
			R.icon_state = "rhand"
			L.icon_state = "lhand_active"
			return

		if(L.icon_state == "lhand_active")
			L.icon_state = "lhand"
			R.icon_state = "rhand_active"
			return


	proc/draw_hud_item()
		if(rhand_items.len > 0)
			var/obj/cloth = rhand_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			R.overlays += cloth

		if(lhand_items.len > 0)
			var/obj/cloth = lhand_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			L.overlays += cloth

		if(uniform_items.len > 0)
			var/obj/cloth = uniform_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			U.overlays += cloth

		if(clothing_items.len > 0)
			var/obj/cloth = clothing_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			C.overlays += cloth

		if(head_items.len > 0)
			var/obj/cloth = head_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			H.overlays += cloth

		if(foot_items.len > 0)
			var/obj/cloth = foot_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			F.overlays += cloth

		if(mask_items.len > 0)
			var/obj/cloth = mask_items[1]
			cloth = cloth.type
			cloth = new cloth()
			cloth.layer = 60
			M.overlays += cloth