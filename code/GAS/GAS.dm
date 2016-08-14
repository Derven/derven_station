#define OXY_BT -183 //boiling temperature
#define PLASMA_BT 1000

//GAS - Great "Atmos" System
var/global/list/plasma[250][250]
var/global/list/oxygen[250][250]
var/global/list/nitrogen[250][250]
var/global/list/temperature[250][250]
var/global/list/windoors_on_turf[250][250]
var/global/list/space_is_here[250][250]
var/global/list/pressure[250][250]

var/global/square_of_calc_min = 1
var/global/square_of_calc_max = 25

proc/init()
	for(var/g = 1, g < 250, g++)
		for(var/i = 1, i < 250, i++)
			plasma[g][i] = 0
			oxygen[g][i] = 500
			nitrogen[g][i] = 25
			temperature[g][i] = 21
			pressure[g][i] = 740

			if(windoors_on_turf[g][i] != 1)
				windoors_on_turf[g][i] = 0

			if(space_is_here[g][i] != 1)
				space_is_here[g][i] = 0
			else
				oxygen[g][i] = 0
				plasma[g][i] = 0
				nitrogen[g][i] = 0
				pressure[g][i] = 0
				temperature[g][i] = -300

var
	SOO //oxygen
	NOO //oxygen
	WEO //oxygen
	EAO //oxygen

	SOPR //pressure
	NOPR //pressure
	WEPR //pressure
	EAPR //pressure

	SOP //plasma
	NOP //plasma
	WEP //plasma
	EAP //plasma

	SON //nitrogen
	NON //nitrogen
	WEN //nitrogen
	EAN //nitrogen

	SOT //temperature
	NOT //temperature
	WET //temperature
	EAT //temperature

	SRCO //oxygen
	SRCP //plasma
	SRCN //nitrogen
	SRCT //temperature
	SRCPR //pressure

	JN //just number

	GPLUS
	GMINUS
	IMINUS
	IPLUS

	turf/L_1
	turf/L_2
	delay = 4

proc/move_gas()

	spawn while(1)
		sleep(delay)
		part_of_processing(1, 50, 1, 50)
		sleep(delay)
		part_of_processing(1, 50, 50, 100)
		sleep(delay)
		part_of_processing(1, 50, 100, 150)
		sleep(delay)
		part_of_processing(1, 50, 150, 200)
		sleep(delay)
		part_of_processing(50, 100, 1, 50)
		sleep(delay)
		part_of_processing(50, 100, 50, 100)
		sleep(delay)
		part_of_processing(50, 100, 100, 150)
		sleep(delay)
		part_of_processing(50, 100, 150, 200)
		sleep(delay)
		part_of_processing(100, 150, 1, 50)
		sleep(delay)
		part_of_processing(100, 150, 50, 100)
		sleep(delay)
		part_of_processing(100, 150, 100, 150)
		sleep(delay)
		part_of_processing(100, 150, 150, 200)
		sleep(delay)
		part_of_processing(150, 200, 150, 200)

proc/my_min_my_max(var/a, var/b)
	var/MAX = max(a, b)
	var/MIN = min(a, b)
	a = MIN
	b = MAX

proc/part_of_processing(var/X, var/Y, var/A, var/B)
	my_min_my_max(A, B)
	for(var/i = X, i <= Y, i += 1)
		for(var/g = A, g <= B, g += 1)
			if(windoors_on_turf[i][g] == 0 && space_is_here[i][g] == 0)
				SRCO = oxygen[i][g]
				SRCP = plasma[i][g]
				SRCN = nitrogen[i][g]
				SRCT = temperature[i][g]
				SRCPR = pressure[i][g]

				GPLUS = g + 1
				GMINUS = g - 1
				IMINUS = i - 1
				IPLUS = i + 1

				if(SRCT <= OXY_BT && SRCO > 300 || SRCT >= PLASMA_BT && SRCP > 300 || SRCT > 200) //pressure increases
					pressure[i][g] += 100

				if(SRCT < 0 || SRCO + SRCP + SRCN < 300 && SRCO + SRCP + SRCN > 100)  //pressure decreases
					pressure[i][g] -= 100

				if(g > 1)
					if(windoors_on_turf[i][GMINUS] == 0)
						SOO = oxygen[i][GMINUS]
						SOP = plasma[i][GMINUS]
						SON = nitrogen[i][GMINUS]
						SOT = temperature[i][GMINUS]
						SOPR = pressure[i][GMINUS]

						if(SRCO > SOO)
							JN = round((SRCO - SOO)/3)
							if(space_is_here[i][GMINUS] == 0)
								oxygen[i][GMINUS] += JN
							oxygen[i][g] -= JN

						if(SRCP > SOP)
							JN = round((SRCP - SOP)/3)
							if(space_is_here[i][GMINUS] == 0)
								plasma[i][GMINUS] += JN
							plasma[i][g] -= JN

						if(SRCN > SON)
							JN = round((SRCN - SON)/3)
							if(space_is_here[i][GMINUS] == 0)
								nitrogen[i][GMINUS] += JN
							nitrogen[i][g] -= JN

						if(SRCT > SOT)
							JN = round((SRCT - SOT)/3)
							if(space_is_here[i][GMINUS] == 0)
								temperature[i][GMINUS] += JN
							temperature[i][g] -= JN
							if(temperature[i][GMINUS] < -320)
								temperature[i][GMINUS] -= 320
							if(temperature[i][g] < -320)
								temperature[i][g] -= 320

						if(SRCPR > SOPR)
							JN = round((SRCPR - SOPR)/3)
							if(space_is_here[i][GMINUS] == 0)
								pressure[i][GMINUS] += JN
							pressure[i][g] -= JN
							if(JN > 300)
								L_1 = locate(i, g, 1)
								L_2 = locate(i, GMINUS, 1)
								GAS_move(L_1, L_2)

					if(g < 250)
						if(windoors_on_turf[i][GPLUS] == 0)
							NOO = oxygen[i][GPLUS]
							NOP = plasma[i][GPLUS]
							NON = nitrogen[i][GPLUS]
							NOT = temperature[i][GPLUS]
							NOPR = pressure[i][GPLUS]

							if(SRCO > NOO)
								JN = round((SRCO - NOO)/3)
								if(space_is_here[i][GPLUS] == 0)
									oxygen[i][GPLUS] += JN
								oxygen[i][g] -= JN

							if(SRCP > NOP)
								JN = round((SRCP - NOP)/3)
								if(space_is_here[i][GPLUS] == 0)
									plasma[i][GPLUS] += JN
								plasma[i][g] -= JN

							if(SRCN > NON)
								JN = round((SRCN - NON)/3)
								if(space_is_here[i][GPLUS] == 0)
									nitrogen[i][GPLUS] += JN
								nitrogen[i][g] -= JN

							if(SRCT > NOT)
								JN = round((SRCT - NOT)/3)
								if(space_is_here[i][GPLUS] == 0)
									temperature[i][GPLUS] += JN
								temperature[i][g] -= JN
								if(temperature[i][GPLUS] < -320)
									temperature[i][GPLUS] -= 320
								if(temperature[i][g] < -320)
									temperature[i][g] -= 320

							if(SRCPR > NOPR)
								JN = round((SRCPR - NOPR)/3)
								if(space_is_here[i][GPLUS] == 0)
									pressure[i][GPLUS] += JN
								pressure[i][g] -= JN
								if(JN > 300)
									L_1 = locate(i, g, 1)
									L_2 = locate(i, GPLUS, 1)
									GAS_move(L_1, L_2)

					if(i > 1)
						if(windoors_on_turf[IMINUS][g] == 0)
							WEO = oxygen[IMINUS][g]
							WEP = plasma[IMINUS][g]
							WEN = nitrogen[IMINUS][g]
							WET = temperature[IMINUS][g]
							WEPR = pressure[IMINUS][g]
							var/turf/L_2 = locate(IMINUS, g, 1)

							if(SRCO > WEO)
								JN = round((SRCO - WEO)/3)
								if(space_is_here[IMINUS][g] == 0)
									oxygen[IMINUS][g] += JN
								oxygen[i][g] -= JN

							if(SRCP > WEP)
								JN = round((SRCP - WEP)/3)
								if(space_is_here[IMINUS][g] == 0)
									plasma[IMINUS][g] += JN
								plasma[i][g] -= JN

							if(SRCN > WEN)
								JN = round((SRCN - WEN)/3)
								if(space_is_here[IMINUS][g] == 0)
									nitrogen[IMINUS][g] += JN
								nitrogen[i][g] -= JN

							if(SRCT > WET)
								JN = round((SRCT - WET)/3)
								if(space_is_here[IMINUS][g] == 0)
									temperature[IMINUS][g] += JN
								temperature[i][g] -= JN
								if(temperature[IMINUS][g] < -320)
									temperature[IMINUS][g] -= 320
								if(temperature[i][g] < -320)
									temperature[i][g] -= 320

							if(SRCPR > WEPR)
								JN = round((SRCPR - WEPR)/3)
								if(space_is_here[IMINUS][g] == 0)
									pressure[IMINUS][g] += JN
								pressure[i][g] -= JN
								if(JN > 300)
									L_1 = locate(i, g, 1)
									L_2 = locate(IMINUS, g, 1)
									GAS_move(L_1, L_2)

					if(i < 250)
						if(windoors_on_turf[IPLUS][g] == 0)
							EAO = oxygen[IPLUS][g]
							EAP = plasma[IPLUS][g]
							EAN = nitrogen[IPLUS][g]
							EAT = temperature[IPLUS][g]
							EAPR = pressure[IPLUS][g]

							if(SRCO > EAO)
								JN = round((SRCO - EAO)/3)
								if(space_is_here[IPLUS][g] == 0)
									oxygen[IPLUS][g] += JN
								oxygen[i][g] -= JN

							if(SRCP > EAP)
								JN = round((SRCP - EAP)/3)
								if(space_is_here[IPLUS][g] == 0)
									plasma[IPLUS][g] += JN
								plasma[i][g] -= JN

							if(SRCN > EAN)
								JN = round((SRCN - EAN)/3)
								if(space_is_here[IPLUS][g] == 0)
									nitrogen[IPLUS][g] += JN
								nitrogen[i][g] -= JN

							if(SRCT > EAT)
								JN = round((SRCT - EAT)/3)
								if(space_is_here[IPLUS][g] == 0)
									temperature[IPLUS][g] += JN
								temperature[i][g] -= JN
								if(temperature[IPLUS][g] < -320)
									temperature[IPLUS][g] -= 320
								if(temperature[i][g] < -320)
									temperature[i][g] -= 320

							if(SRCPR > EAPR)
								JN = round((SRCPR - EAPR)/3)
								if(space_is_here[IPLUS][g] == 0)
									pressure[IPLUS][g] += JN
								pressure[i][g] -= JN
								if(JN > 300)
									L_1 = locate(i, g, 1)
									L_2 = locate(IPLUS, g, 1)
									GAS_move(L_1, L_2)

/proc/GAS_move(var/turf/L_1, var/turf/L_2)

	for(var/atom/movable/M in L_1)
		sleep(1)
		if(M)
			M.message_for_mobs(5, "\red <b>the wind blows [M]</b>")
			if(M.anchored == 0 && !istype(M, /obj/cable) && !istype(M, /obj/machinery/light))
				M.Move(L_2)