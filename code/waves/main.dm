#define MAX_FREQ 127

var/global/list/obj/machinery/radio/radio_ = list()
var/global/list/wave/waves = list()

/atom
	var/freq = 0

/obj/machinery/radio
	var/frequency = 0
	var/wave_length = 0
	var/id = 0
	icon = 'icons/obj/machine/shaitan_machine.dmi'

	proc/del_all_waves()
		for(var/wave/W in waves)
			if(W.id == id)
				del(W)

	proc/waves()
		var/wave/radio/RAD
		for(var/turf/simulated/floor/F in range(round(frequency/pow(wave_length,2) * 15), src))
			RAD = new(F)
			RAD.id = id
			RAD.frequency = frequency
			RAD.length = wave_length
			RAD.force = (get_dist(src, RAD)*-1) + wave_length
			if(RAD.force <= 0)
				del(RAD)

/wave
	parent_type = /atom/movable
	var/frequency = 0
	var/length = 0
	var/force = 0
	var/id = 0
	icon = 'icons/wave.dmi'
	icon_state = "1"
	layer = 0

	act()
		world << "force: [force]"

	New()
		waves += src

/wave/radio

/wave/radioactive

/wave/radio/psi

/wave/colorlight

/wave/sound

/wave/force
	var/pressure
	var/speed

/obj/machinery/radio/receiver
	icon_state = "receiver"
	frequency = 34
	wave_length = 4

	act()
		var/my_text
		my_text = {"
		<html>
		<head><title>Radio</title></head>
		<body>[STYLE]
		Settings:

		<br><a href='?src=\ref[src];rad=plus_freq'>Increase freq</a>
		<br><a href='?src=\ref[src];rad=minus_freq'>Decrease freq</a>
		<br><a href='?src=\ref[src];rad=plus_length'>Increase length</a>
		<br><a href='?src=\ref[src];rad=minus_length'>Decrease length</a>
		<br>
		<br>length - [wave_length]
		<br>freq - [frequency]

		</div></body>
		</html>
		"}

		usr << browse(my_text,"window=my_text")

/obj/machinery/radio/transmitter
	frequency = 36
	wave_length = 4
	use_power = 1
	need_amperage = 50
	on = 0
	var/on_ = 0

	icon_state = "transmitter"
	var/counter = 0

	New()
		radio_ += src
		waves()
		process()

	check()
		if(on != 1)
			del_all_waves()
			on_ = 0
		else
			if(on_ == 0)
				waves()
				on_ = 1
	act()
		var/my_text
		my_text = {"
		<html>
		<head><title>Radio</title></head>
		<body>[STYLE]
		Settings:

		<br><a href='?src=\ref[src];rad=plus_freq'>Increase freq</a>
		<br><a href='?src=\ref[src];rad=minus_freq'>Decrease freq</a>
		<br><a href='?src=\ref[src];rad=plus_length'>Increase length</a>
		<br><a href='?src=\ref[src];rad=minus_length'>Decrease length</a>
		<br>
		<br>length - [wave_length]
		<br>freq - [frequency]

		</div></body>
		</html>
		"}

		usr << browse(my_text,"window=my_text")

/obj/machinery/radio/intercom
	icon_state = "intercom"

	proc/send_message(var/message)
		for(var/wave/W in waves)
			if(W.id == id && W.force > 1)
				for(var/obj/machinery/radio/receiver/R in W.loc)
					if(R.frequency == W.frequency)
						for(var/mob/M in range(6, R))
							M << "\bold \[radio] [message]"


/obj/machinery/radio/button_lentgh_plus
	icon_state = "plus"

	act()
		for(var/obj/machinery/radio/R in radio_)
			if(R.id == id)
				if(R.wave_length < 25)
					R.wave_length += 1

					if(istype(R, /obj/machinery/radio/transmitter))
						R.del_all_waves()
						R.waves()

/obj/machinery/radio/button_length_minus
	icon_state = "minus"

	act()
		for(var/obj/machinery/radio/R in radio_)
			if(R.id == id)
				if(R.wave_length > 0)
					R.wave_length -= 1

					if(istype(R, /obj/machinery/radio/transmitter))
						R.del_all_waves()
						R.waves()


/obj/machinery/radio/button_frequency_plus
	icon_state = "plus"

	act()
		for(var/obj/machinery/radio/R in radio_)
			if(R.id == id)
				if(R.frequency < MAX_FREQ)
					R.frequency += 1

					if(istype(R, /obj/machinery/radio/transmitter))
						R.del_all_waves()
						R.waves()

/obj/machinery/radio/button_frequency_minus
	icon_state = "minus"

	act()
		for(var/obj/machinery/radio/R in radio_)
			if(R.id == id)
				if(R.frequency > 0)
					R.frequency -= 1

					if(istype(R, /obj/machinery/radio/transmitter))
						R.del_all_waves()
						R.waves()

//RESONANCE

/obj/machinery/sound
	var/frequency = 0
	var/wave_length = 0
	var/id = 0
	icon = 'icons/obj/machine/shaitan_machine.dmi'

/obj/machinery/sound/transmitter
	frequency = 27
	wave_length = 3
	use_power = 1
	need_amperage = 115
	on = 0
	var/on_ = 0

	icon_state = "transmitter_s"
	var/counter = 0

	proc/waves()
		var/wave/sound/RAD
		for(var/turf/simulated/floor/F in range(round(frequency/pow(wave_length,2)), src))
			RAD = new(F)
			RAD.id = id
			RAD.frequency = frequency
			RAD.length = wave_length
			RAD.force = (get_dist(src, RAD)*-1) + wave_length

			if(on == 1)
				for(var/atom/A in range(1,RAD))
					if(A.freq == frequency)
						if(RAD)
							if(RAD.force > 1)
								if(istype(A, /turf/simulated/wall))
									A = new /turf/simulated/floor/plating(A)
								else
									del(A)

			if(RAD.force <= 0)
				del(RAD)

	proc/del_all_waves()
		for(var/wave/W in waves)
			if(W.id == id)
				del(W)

	New()
		radio_ += src
		waves()
		process()

	check()
		if(on != 1)
			del_all_waves()
			on_ = 0
		else
			if(on_ == 0)
				waves()
				on_ = 1

/obj/machinery/sound/button_lentgh_plus
	icon_state = "plus"

	act()
		for(var/obj/machinery/sound/transmitter/R in radio_)
			if(R.id == id)
				if(R.wave_length < 25)
					R.wave_length += 1

					R.del_all_waves()
					R.waves()

/obj/machinery/sound/button_length_minus
	icon_state = "minus"

	act()
		for(var/obj/machinery/sound/transmitter/R in radio_)
			if(R.id == id)
				if(R.wave_length > 0)
					R.wave_length -= 1

					R.del_all_waves()
					R.waves()

/obj/machinery/sound/button_frequency_plus
	icon_state = "plus"

	act()
		for(var/obj/machinery/sound/transmitter/R in radio_)
			if(R.id == id)
				if(R.frequency < MAX_FREQ)
					R.frequency += 1

					R.del_all_waves()

					R.waves()

/obj/machinery/sound/button_frequency_minus
	icon_state = "minus"

	act()
		for(var/obj/machinery/sound/transmitter/R in radio_)
			if(R.id == id)
				if(R.frequency > 0)
					R.frequency -= 1

					R.del_all_waves()
					R.waves()


/obj/machinery/forcewave
	var/frequency = 27
	var/wave_length = 3
	var/id = 0
	icon = 'icons/obj/machine/shaitan_machine.dmi'

/obj/machinery/forcewave/transmitter
	use_power = 1
	need_amperage = 115
	on = 0
	var/on_ = 0

	icon_state = "transmitter_explode"
	var/counter = 0

	proc/waves()
		if(on == 1)
			force_wave(frequency, wave_length)

	proc/del_all_waves()
		for(var/wave/W in waves)
			if(W.id == id)
				del(W)

	New()
		radio_ += src
		waves()
		process()

	check()
		if(on != 1)
			del_all_waves()
			on_ = 0
		else
			if(on_ == 0)
				//waves()
				on_ = 1

/obj/machinery/forcewave/transmitter/act()
	waves()


/turf/simulated/wall
	freq = 31

/turf/simulated/floor
	freq = 56