/proc/do_after(mob/M as mob, time as num)
	var/turf/T = M.loc
	sleep(time)
	if(M)
		if (M.loc == T)
			return 1
		else
			return 0

/proc/is_type_in_list(var/atom/A, var/list/L)
	for(var/type in L)
		if(istype(A, type))
			return 1
	return 0