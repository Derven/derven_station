/obj/item/floodlight
	name = "Emergency Flashlight"
	icon = 'icons/obj/item/light.dmi'
	icon_state = "light0"
	density = 1
	var/on = 0

/obj/item/floodlight/proc/updateicon()
	icon_state = "light[on]"


/obj/item/floodlight/act_self(src)

	if(on)
		on = 0
		usr << "You turn off the light"
		usr.ul_SetLuminosity(0)
	else
		on = 1
		usr << "You turn on the light"
		usr.ul_SetLuminosity(4, 5, 4)

	updateicon()
