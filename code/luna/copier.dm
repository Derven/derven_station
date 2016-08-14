// Contains: copy machine

/obj/machinery/copier
	name = "Copy Machine"
	icon = 'icons/obj/item/paper.dmi'
	icon_state = "copier"
	density = 1
	anchored = 1
	var/num_copies = 1		// number of copies selected, will be maintained between jobs
	var/copying = 0			// are we copying
	var/job_num_copies = 0	// number of copies remaining
	var/top_open = 1		// the top is open
	var/obj/item/weapon/paper/template // the paper OR photo being scanned
	var/copy_wait = 0		// wait for current page to finish
	var/max_copies = 10		// MAP EDITOR: can set the number of max copies, possibly to 5 or something for public, more for QM, robutist, etc.

/obj/machinery/copier/New()
	..()
	update()

/obj/machinery/copier/act_by_item(var/obj/item/weapon/O)
	if(!top_open)
		return

	if (istype(O, /obj/item/weapon/paper))
		// put it inside
		template = O
		PUT(O, usr)
		top_open = 0
		update()
	//	updateDialog()

/obj/machinery/copier/act()
	// da UI
	var/dat

	dat = "<HEAD><TITLE>Copy Machine</TITLE></HEAD><TT><b>Xeno Corp. Copying Machine</b><hr>"

	if(copying)
		dat += "[job_num_copies] copies remaining.<br><br>"
		dat += "<A href='?src=\ref[src];cancel=1'>Cancel</a>"
	else
		if(!top_open)
			dat += "<A href='?src=\ref[src];open=1'>Open Top</a><br><br>"

		dat += "Number of Copies: "

		dat += "<A href='?src=\ref[src];num=-10'>-</a>"
		dat += "<A href='?src=\ref[src];num=-1'>-</a>"
		dat += " [num_copies] "
		dat += "<A href='?src=\ref[src];num=1'>+</a>"
		dat += "<A href='?src=\ref[src];num=10'>+</a><br><br>"

		if(template)
			dat += "<A href='?src=\ref[src];copy=1'>Copy</a>"
		else
			dat += "<b>No paper to be copied.<br>"
			dat += "Please place a paper or photograph on top and close the lid.</b>"

	dat += "<hr></TT>"

	usr << browse(dat, "window=copy_machine")

/obj/machinery/copier/proc/update()
	if(top_open)
		icon_state = "copier_o"
	else if(copying)
		icon_state = "copier_s"
	else
		icon_state = "copier"

/obj/machinery/copier/Topic(href,href_list[])
	if(href_list["num"])
		num_copies += text2num(href_list["num"])
		if(num_copies < 1)
			num_copies = 1
		else if(num_copies > max_copies)
			num_copies = max_copies
	if(href_list["open"])
		template.loc = src.loc
		template = null
		top_open = 1
		update()
	if(href_list["copy"])
		copying = 1
		job_num_copies = num_copies
		update()
		process()
	if(href_list["cancel"])
		copying = 0
		job_num_copies = 0
		update()

/obj/machinery/copier/process()

	if(copying && !copy_wait)
		copy_wait = 1
		// make noise
		spawn(5)
			if(!copying)
				return // user cancelled

			if(istype(template, /obj/item/weapon/paper))
				// make duplicate paper
				var/obj/item/weapon/paper/P = new(src.loc)
				P.name = template.name
				P.info = template.info

			// copy counting stuff
			job_num_copies -= 1
			if(job_num_copies == 0)
				usr << "[name] beeps happily."
				copying = 0
				update()
			copy_wait = 0