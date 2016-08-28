mob/human
	var/kick_in_the_groin = 0
	var/blow_to_the_eyes = 0
	var/punch_in_the_stomach = 0

mob/human/proc/eye_attack(var/mob/M)
	if(!D)
		D = new(src)
	DARK.dark(src)
	sleep(5)
	DARK.nodark(src)
	message_for_mobs(5, "[M] hit [src] in the eyes!")

mob/human/proc/stomach_attack(var/mob/M)
	message_for_mobs(5, "[M] hit [src] in the stomach!")
	shake_me(client, 10)

mob/human/proc/groin_attack(var/mob/M)
	message_for_mobs(5, "[M] hit [src] in the groin!")
	lying()
	sleep(5)
	unlying()