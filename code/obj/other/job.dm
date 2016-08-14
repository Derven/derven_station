
/obj/prof/assistant/New()
	alpha = 0
	var/turf/T = src.loc
	assistant += T

/obj/prof/captain/New()
	alpha = 0
	var/turf/T = src.loc
	captain += T

/obj/prof/security/New()
	alpha = 0
	var/turf/T = src.loc
	security += T

/obj/prof/detective/New()
	alpha = 0
	var/turf/T = src.loc
	detective += T

/obj/prof/HOS/New()
	alpha = 0
	var/turf/T = src.loc
	HOS += T

/obj/prof/HOP/New()
	alpha = 0
	var/turf/T = src.loc
	HOP += T

/obj/prof/scientist/New()
	alpha = 0
	var/turf/T = src.loc
	scientist += T

/obj/prof/security/New()
	alpha = 0
	var/turf/T = src.loc
	security += T

/obj/prof/doctor/New()
	alpha = 0
	var/turf/T = src.loc
	doctor += T

/obj/prof/CE/New()
	alpha = 0
	var/turf/T = src.loc
	CE += T

/obj/prof/engineer/New()
	alpha = 0
	var/turf/T = src.loc
	engineer += T

/obj/prof/cook/New()
	alpha = 0
	var/turf/T = src.loc
	cook += T

/obj/prof/bartender/New()
	alpha = 0
	var/turf/T = src.loc
	bartender += T

/obj/prof/assistant
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/captain
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/engineer
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/CE
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/technic
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/HOP
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/HOS
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/security
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/detective
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/doctor
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/bartender
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/scientist
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/prof/cook
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	alpha = 255

/obj/start/New()
	alpha = 0
	var/turf/T = src.loc
	landmarks += T