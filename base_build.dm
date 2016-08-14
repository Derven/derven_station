#define DEBUG 1

world
	fps = 18	// 10 frames per second
	icon_size = 32	// 32x32 icon size by default
	view = 6		// show up to 6 tiles outward from center (13x13 view)
	hub = "S_Sting.FireSimulator"

// Make objects move 32 pixels per tick when walking

mob
	step_size = 32

obj
	step_size = 32

atom/proc/process()
	spawn while(1)
		sleep(0.001)

world
	mob = /mob/human
	turf = /turf/space

	New()

		init()
		move_gas()

		world << "\blue <b>Initializations...</b>"
		new /datum/Kate()
		new /datum/innerouter_controller()
		new /datum/pipe_controller()
		CABLES()
		name = "DERVENLAND 47"