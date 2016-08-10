/obj/item/weapon/paper
	var/info
	name = "Paper"
	icon = 'icons/obj/item/paper.dmi'
	icon_state = "paper"

	act_self(src)
		usr << browse(info,"window=paper")

/obj/item/weapon/pen
	var
		text_bold
		text_italic
		text_underline
		text_break
		text_color
		text_size
	name = "Pen"
	icon = 'icons/obj/item/paper.dmi'
	icon_state = "pen"


/obj/item/weapon/paper/New()

	..()
	src.pixel_y = rand(-8, 8)
	src.pixel_x = rand(-9, 9)
	return

/obj/item/weapon/pen/proc/formatText(var/s)
	if (text_size < 2 || text_size > 7)
		text_size = 3
	if (!(text_color))
		text_color = "#000000"

	var/textToAddHeader = ""
	var/textToAddFooter = ""

	if (text_color && text_size)
		textToAddHeader = "<font size=[text_size] color=[text_color]>"
		textToAddFooter = "</font>"

	if (text_bold == 1)
		textToAddHeader = "[textToAddHeader]<b>"
		textToAddFooter = "</b>[textToAddFooter]"

	if (text_underline == 1)
		textToAddHeader = "[textToAddHeader]<u>"
		textToAddFooter = "</u>[textToAddFooter]"

	if (text_italic == 1)
		textToAddHeader = "[textToAddHeader]<i>"
		textToAddFooter = "</i>[textToAddFooter]"

	if (text_break == 1)
		textToAddFooter = "[textToAddFooter]<br>"

	var/r = "[textToAddHeader][s][textToAddFooter]"
	return r

/obj/item/weapon/pen/act_self(src)
	var/dat

	dat = text("How would you like to write?<br>")

	dat = text("[formatText("example")]<br>")

	dat += text("<b>size:</b><br>")
	dat += text("<A href='?src=\ref[src];size=2'><font size=2>2</font></A> ")
	dat += text("<A href='?src=\ref[src];size=3'><font size=3>3</font></A> ")
	dat += text("<A href='?src=\ref[src];size=4'><font size=4>4</font></A> ")
	dat += text("<A href='?src=\ref[src];size=5'><font size=5>5</font></A> ")
	dat += text("<A href='?src=\ref[src];size=6'><font size=6>6</font></A> ")
	dat += text("<A href='?src=\ref[src];size=7'><font size=7>7<font></A><br><br>")

	dat += text("<b>Color:</b><br>")
	dat += text("<A href='?src=\ref[src];color=["000000"]'><font color=black>black:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["222222"]'><font color=#222222>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["444444"]'><font color=#444444>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["666666"]'><font color=#666666>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["888888"]'><font color=#888888>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["AAAAAA"]'><font color=#AAAAAA>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["CCCCCC"]'><font color=#CCCCCC>6</font></A><br>")

	dat += text("<A href='?src=\ref[src];color=["FF0000"]'><font color=#FF0000>Red:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["440000"]'><font color=#440000>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["880000"]'><font color=#880000>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["CC0000"]'><font color=#CC0000>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FF2222"]'><font color=#FF2222>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FF6666"]'><font color=#FF6666>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FFBBBB"]'><font color=#FFBBBB>6</font></A><br>")

	dat += text("<A href='?src=\ref[src];color=["FFFF00"]'><font color=#FFFF00>Yellow:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["444400"]'><font color=#444400>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["888800"]'><font color=#888800>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["CCCC00"]'><font color=#CCCC00>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FFFF22"]'><font color=#FFFF22>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FFFF66"]'><font color=#FFFF66>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FFFFBB"]'><font color=#FFFFBB>6</font></A><br>")

	dat += text("<A href='?src=\ref[src];color=["00FF00"]'><font color=#00FF00>Green:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["004400"]'><font color=#004400>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["008800"]'><font color=#008800>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["00CC00"]'><font color=#00CC00>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["22FF22"]'><font color=#22FF22>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["66FF66"]'><font color=#66FF66>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["BBFFBB"]'><font color=#BBFFBB>6</font></A><br>")

	dat += text("<A href='?src=\ref[src];color=["00FFFF"]'><font color=#00FFFF>Cyan:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["004444"]'><font color=#004444>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["008888"]'><font color=#008888>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["00CCCC"]'><font color=#00CCCC>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["22FFFF"]'><font color=#22FFFF>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["66FFFF"]'><font color=#66FFFF>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["BBFFFF"]'><font color=#BBFFFF>6</font></A><br>")

	dat += text("<A href='?src=\ref[src];color=["0000FF"]'><font color=#0000FF>Blue:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["000044"]'><font color=#000044>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["000088"]'><font color=#000088>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["0000CC"]'><font color=#0000CC>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["2222FF"]'><font color=#2222FF>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["6666FF"]'><font color=#6666FF>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["BBBBFF"]'><font color=#BBBBFF>6</font></A><br>")

	dat += text("<A href='?src=\ref[src];color=["000000"]'><font color=#FF00FF>Purple:</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["440044"]'><font color=#440044>1</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["880088"]'><font color=#880088>2</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["CC00CC"]'><font color=#CC00CC>3</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FF22FF"]'><font color=#FF22FF>4</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FF66FF"]'><font color=#FF66FF>5</font></A> ")
	dat += text("<A href='?src=\ref[src];color=["FFBBFF"]'><font color=#FFBBFF>6</font></A><br><br>")

	if (text_bold)
		dat += text("<b>Bold:</b> yes / <A href='?src=\ref[src];bold=[0]'>no</A><br>")
	else
		dat += text("<b>Bold: <A href='?src=\ref[src];bold=[1]'>yes</A> / no<br>")

	if (text_italic)
		dat += text("<b>Italic:</b> yes / <A href='?src=\ref[src];italic=[0]'>no</A><br>")
	else
		dat += text("<b>Italic: <A href='?src=\ref[src];italic=[1]'>yes</A> / no<br>")

	if (text_underline)
		dat += text("<b>Underline:</b> yes / <A href='?src=\ref[src];underline=[0]'>no</A><br>")
	else
		dat += text("<b>Underline:</b> <A href='?src=\ref[src];underline=[1]'>yes</A> / no<br>")

	if (text_break)
		dat += text("<b>Jump into a new line at the end?</b> yes / <A href='?src=\ref[src];break=[0]'>no</A><br>")
	else
		dat += text("<b>Jump into a new line at the end?</b> <A href='?src=\ref[src];break=[1]'>yes</A> / no<br>")
	usr << browse("[dat]", "window=pen")

/obj/item/weapon/pen/Topic(href, href_list)
	if(href_list["color"])
		src.text_color = "#"
		src.text_color += href_list["color"]
	if(href_list["size"])
		src.text_size = text2num(href_list["size"])
	if(href_list["bold"])
		src.text_bold = text2num(href_list["bold"])
	if(href_list["underline"])
		src.text_underline = text2num(href_list["underline"])
	if(href_list["italic"])
		src.text_italic = text2num(href_list["italic"])
	if(href_list["break"])
		src.text_break = text2num(href_list["break"])
	act_self(usr)
	return

/obj/item/weapon/paper/act_by_item(var/obj/item/weapon/P)
	..()

	if (istype(P, /obj/item/weapon/pen))
		var/obj/item/weapon/pen/PEN = P

		var/t = input("What text do you wish to add?", text("[]", src.name)) as message
		t = text("[PEN.formatText(t)]")
		/*
		t = copytext(sanitize(t),1,MAX_MESSAGE_LEN)
		t = dd_replacetext(t, "\n", "<BR>")
		t = dd_replacetext(t, "\[b\]", "<B>")
		t = dd_replacetext(t, "\[/b\]", "</B>")
		t = dd_replacetext(t, "\[i\]", "<I>")
		t = dd_replacetext(t, "\[/i\]", "</I>")
		t = dd_replacetext(t, "\[u\]", "<U>")
		t = dd_replacetext(t, "\[/u\]", "</U>")
		t = dd_replacetext(t, "\[sign\]", text("<font face=vivaldi>[]</font>", user.real_name))
		*/
		t = text("<font face=calligrapher>[]</font>", t)

		src.info += fix1103(t)
	return


