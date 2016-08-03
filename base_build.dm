/*
	These are simple defaults for your project.
 */

mob
	step_size = 8

obj
	step_size = 8
#define DEBUG 1
var/global/list/areas_list = list()
var/global/MAIN_PRIORITY = 0
var/global/NO_PRIORITY = 0

world
	fps = 15	// 10 frames per second
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
		new /datum/pipe_controller/pipe_controller_master_1(pipes_master_first)
		new /datum/pipe_controller/pipe_controller_master_2(pipes_master_second)
		new /datum/pipe_controller/pipe_controller_master_3(pipes_master_third)
		new /datum/pipe_controller/pipe_controller_master_4(pipes_master_fourth)
		new /datum/pipe_controller/pipe_controller_master_5(pipes_master_fifth)
		new /datum/innerouter_controller() //6
		CABLES()
		name = "DERVENLAND 47"


#define DMM_IGNORE_AREAS 1
#define DMM_IGNORE_TURFS 2
#define DMM_IGNORE_OBJS 4
#define DMM_IGNORE_NPCS 8
#define DMM_IGNORE_PLAYERS 16
#define DMM_IGNORE_MOBS 24