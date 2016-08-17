#define SUIT_LAYER 28
#define HEAD_LAYER 28
#define UNIFORM_LAYER 27
#define SHOES_LAYER 26

/obj/item/clothing
	//icon = 'icons/obj/clothes.dmi'
	var/list/zones = list() //chest head r_arm l_arm l_leg r_leg groin
	var/block_damage = 0

//// SUITS ////

/mob/human/proc/get_armor(var/mob/O)
	var/armor = 0
	for(var/obj/item/clothing/CL in src)
		if(CL.iszone(O.client.zone))
			armor += CL.block_damage
	return armor

/obj/item/clothing/proc/iszone(var/my_zone)
	for(var/UNIT in zones)
		if(UNIT == my_zone)
			return 1
	return 0

/obj/item/clothing/suit
	layer = SUIT_LAYER
	zones = list("chest", "r_arm", "l_arm", "l_leg", "r_leg", "groin")
	block_damage = 15

/obj/item/clothing/suit/SYN
	name = "space_suit"
	icon_state = "syndi"
	weight = 34

/obj/item/clothing/suit/SPACE
	name = "space_suit"
	icon_state = "space"
	weight = 34

//// HEAD ////

/obj/item/clothing/head
	layer = HEAD_LAYER
	zones = list("head")
	block_damage = 15

/obj/item/clothing/head/HELMET
	name = "space_helmet"
	icon_state = "space_helm"

/obj/item/clothing/head/HELMET_SYN
	name = "space_helmet"
	icon_state = "syndi_helm"

//// UNIFORM ////

/obj/item/clothing/uniform
	layer = UNIFORM_LAYER
	zones = list("chest", "groin", "r_arm", "l_arm", "l_leg", "r_leg")
	block_damage = 3

/obj/item/clothing/uniform/ENG
	name = "engsuit"
	icon_state = "eng"

/obj/item/clothing/uniform/BLACK
	name = "blacksuit"
	icon_state = "blacksuit"

/obj/item/clothing/uniform/CHATERED
	name = "checkered"
	icon_state = "checkered"

//// SHOES ////

/obj/item/clothing/shoes
	layer = SHOES_LAYER
	zones = list("l_leg", "r_leg")
	block_damage = 5

/obj/item/clothing/shoes/BLACK
	name = "black_shoes"
	icon_state = "bl"

/obj/item/clothing/shoes/COOL
	name = "warmboots"
	icon_state = "wr"

/obj/item/body
	icon = 'icons/obj/clothes.dmi'

/obj/item/body/head
	layer = HEAD_LAYER

/obj/item/body/head/HELMET
	name = "space_helmet"
	icon_state = "space_h"

/obj/item/body/head/HELMET_SYN
	name = "space_helmet"
	icon_state = "syndi_h"

/obj/item/body/shoes
	layer = SHOES_LAYER

/obj/item/body/shoes/BLACK
	name = "black shoes"
	icon_state = "black"

/obj/item/body/shoes/COOL
	name = "warmboots"
	icon_state = "warmboots"