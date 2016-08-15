var/static/image/time_icon = image('icons/mob/overlay.dmi', icon_state = "waiting")

/proc/do_after(mob/M as mob, time as num)
	var/turf/T = M.loc
	if(!time_icon)
		time_icon = new()
		time_icon.layer = 8
	M.overlays += time_icon
	sleep(time)
	if(M)
		if (M.loc == T)
			M.overlays -= time_icon
			return 1
		else
			M.overlays -= time_icon
			return 0

/proc/is_type_in_list(var/atom/A, var/list/L)
	for(var/type in L)
		if(istype(A, type))
			return 1
	return 0