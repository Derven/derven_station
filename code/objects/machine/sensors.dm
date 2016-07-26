/obj/machinery/sensor
	icon = 'icons/obj/machine/computer.dmi'
	icon_state = "sensor"
	computer_access = "sensor"
	var/signal = 0
	var/data

	New()
		computer_can += src
		name = "SENSOR SIGNAL = \[NO\]; \[[x];[y][z]\]"

	Crossed(mob/O)
		signal = 1
		name = "SENSOR SIGNAL = \[YES\]; \[[x];[y][z]\]"
		data = "[O.name]"
		..()

	Uncrossed(mob/O)
		signal = 0
		name = "SENSOR SIGNAL = \[NO\]; \[[x];[y][z]\]"
		return
