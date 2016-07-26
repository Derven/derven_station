
/obj/prof/assistant/New()
	layer = 1
	var/turf/T = src.loc
	assistant += T

/obj/prof/captain/New()
	layer = 1
	var/turf/T = src.loc
	captain += T

/obj/prof/security/New()
	layer = 1
	var/turf/T = src.loc
	security += T

/obj/prof/detective/New()
	layer = 1
	var/turf/T = src.loc
	detective += T

/obj/prof/HOS/New()
	layer = 1
	var/turf/T = src.loc
	HOS += T

/obj/prof/HOP/New()
	layer = 1
	var/turf/T = src.loc
	HOP += T

/obj/prof/scientist/New()
	layer = 1
	var/turf/T = src.loc
	scientist += T

/obj/prof/security/New()
	layer = 1
	var/turf/T = src.loc
	security += T

/obj/prof/doctor/New()
	layer = 1
	var/turf/T = src.loc
	doctor += T

/obj/prof/CE/New()
	layer = 1
	var/turf/T = src.loc
	CE += T

/obj/prof/engineer/New()
	layer = 1
	var/turf/T = src.loc
	engineer += T

/obj/prof/cook/New()
	layer = 1
	var/turf/T = src.loc
	cook += T

/obj/prof/assistant
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/captain
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/engineer
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/CE
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/technic
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/HOP
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/HOS
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/security
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/detective
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/doctor
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/bartender
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/scientist
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/prof/cook
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start2"
	layer = 7

/obj/start/New()
	layer = 1
	var/turf/T = src.loc
	landmarks += T