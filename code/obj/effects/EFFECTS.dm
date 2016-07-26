var/global/list/landmarks = list()

var/global/list/captain = list()
var/global/list/assistant = list()
var/global/list/HOS = list()
var/global/list/HOP = list()
var/global/list/CE = list()
var/global/list/engineer = list()
var/global/list/technic = list()
var/global/list/scientist = list()
var/global/list/doctor = list()
var/global/list/bartender = list()
var/global/list/cook = list()
var/global/list/security = list()
var/global/list/detective = list()

/obj/effect/blood
	icon = 'icons/effects/effects.dmi'
	icon_state = "blood1"

/obj/effect/blood/New()
	var/blood_sprite = pick(1,2,3)
	icon_state = "blood[blood_sprite]"

/obj/effect/fire
	name = "fire"
	icon = 'icons/effects/effects.dmi'
	icon_state = "fire"
	typer = 4
	luminosity = 2

	act_by_item(var/obj/item/I)

		if(I == /obj/item/fire_ballon)
			usr << "\blue You extinguish the fire!"
			del(src)

/obj/effect/explode
	name = "explode"
	icon = 'icons/effects/effects.dmi'
	icon_state = "explode"
	var/destroy = 0
	var/EXPLODE = 0

/obj/start
	name = "start"
	icon = 'icons/effects/effects.dmi'
	icon_state = "start"
	layer = 7