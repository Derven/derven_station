/obj/item/book
	var/data = "HELLO"
	icon = 'icons/obj/library.dmi'
	icon_state = "book"

	act_self(src)
		usr << browse(data,"window=book")

	Paint_it_black
		data = {"
		I see a red door and I want it painted black
		No colors anymore, I want them to turn black
		I see the girls walk by dressed in their summer clothes
		I have to turn my head until my darkness goes
		I see a line of cars and they're all painted black
		With flowers and my love, both never to come back
		I see people turn their heads and quickly look away
		Like a new born baby it just happens every day
		I look inside myself and see my heart is black
		I see my red door, I must have it painted black
		Maybe then I'll fade away and not have to face the facts
		It's not easy facing up when your whole world is black
		No more will my green sea go turn a deeper blue
		I could not foresee this thing happening to you
		If I look hard enough into the setting sun
		"}