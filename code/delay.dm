
mob/var
	speeding = 0
	rundelay = 0.5  //Set this to different settings to control how slow the mob walks.

client/Move()
	if(mob.speeding <= 0)
		mob.speeding = 1
		..()
		sleep(mob.rundelay)
		mob.speeding = 0
	else
		return

mob/Login()
	speeding = 0
	..()
