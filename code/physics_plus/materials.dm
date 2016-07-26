/datum/material
	var
		name = "default"
		endurance = 50
		resilience = 100

	steel
		name = "steel"
		endurance = 50
		resilience = 100
/atom
	var/list/materials = list(new /datum/material/steel)

/atom/proc/get_endurance()
	var/sum = 0
	var/count = 0
	for(var/datum/material/M in materials)
		sum += M.endurance
		count += 1
	sum = round(sum / count)
	return sum

/atom/proc/get_resilience()
	var/sum = 0
	var/count = 0
	for(var/datum/material/M in materials)
		sum += M.resilience
		count += 1
	sum = round(sum / count)
	return sum

/atom/proc/material_damage(var/damage)
	for(var/datum/material/M in materials)
		if(M.endurance > 0)
			M.endurance -= damage
		if(M.endurance <= 0)
			destroy()