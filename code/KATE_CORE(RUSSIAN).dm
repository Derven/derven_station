var/global/list/unit = list()
var/global/list/objects = list()

/atom
	var/processing = 0

/datum/Kate
	var/name = "Kate"
	var/list/priority = list()
	var/list/important_words_1 = list("укажи","запомни", "расскажи", "нагрузка", "бьенд", "ВСЕ")
	var/list/important_words_2 = list("место","тип","ЭТО","НЕ")
	var/list/parameters = list("яркость","имя","температура")
	var/list/rules = list()
	var/list/memory = list()

	proc/remember()
		world << "\blue Kate просит вас ввести данные"


	proc/education()
		world << "\blue Kate просит указать вас правила для обучения"
		world << "\blue x1 ЭТО x2(x1 = x2) равенство чего-то, где x ваши значения, x1 НЕ x2 (x1 не может быть равен x2)"
		world << "\blue <b>Важно! Чтобы &#255; могла применить ваши правила, x должны быть записаны в списки</b>"
		world << "\blue <b>с которыми &#255; могу работать.</b>"


	proc/hello()
		world << "\blue <b>Kate: Привет, мастер, что будем делать сегодн&#255;?</b>"

	proc/process(var/master_commands)
		if(findtext(master_commands,"Kate")!=0 || findtext(master_commands,"Кат&#255;")!=0 || findtext(master_commands,"Кейт")!=0)
			for(var/i = 1, i <= important_words_1.len, i++)
				if(findtext(master_commands,important_words_1[i])!=0)
					var/ebat = findtext(master_commands,important_words_1[i])
					var/my_noun = copytext(master_commands, ebat)
					switch(important_words_1[i])

						if("укажи")
							//if(findtext(my_noun,important_words_2[i])!=0)
							//	switch(important_words_2[i])
							//		if("место")
							for(var/g = 1, g <= objects.len, g++)
								var/atom/k = objects[g]
								if(findtext(my_noun,k.name)!=0 || findtext(my_noun,"Дифлекс")!=0)
									for(var/l = 1, l <= important_words_2.len, l++)
										var/atom/A = k
										if(findtext(my_noun,important_words_2[l])!=0)
											switch(important_words_2[l])
												if("место")

													if(findtext(my_noun,"Дифлекс")!=0)
														world << "\blue <b>У параши. Хих</b>"
														return
													else
														var/in_cycle = 0
														for(var/f = 1, f <= parameters.len, f++)
															if(findtext(my_noun,parameters[f])!=0)
																//Здесь проверяются переменные
																var/par = 0
																in_cycle = 1
																switch(parameters[f])
																	if("яркость")
																		par = A.luminosity

																	if("температура")
																		par = A.my_temp

																	if("имя")
																		par = A.name

																var/word_1 = findtext(my_noun, parameters[f])
																var/my_second_word = copytext(my_noun, word_1)
																if(findtext(my_second_word,"больше"))
																	var/word_imp = findtext(my_second_word, "больше ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par > my_third_word)
																		world << "\blue <b>Здесь - [A.x];[A.y];[A.z]</b>"

																if(findtext(my_second_word,"меньше"))
																	var/word_imp = findtext(my_second_word, "меньше ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par < my_third_word)
																		world << "\blue <b>Здесь - [A.x];[A.y];[A.z]</b>"

														if(in_cycle == 0)
															world << "\blue <b>Здесь - [A.x];[A.y];[A.z]</b>"

												if("тип")
													if(findtext(my_noun,"Дифлекс")!=0)
														world << "\blue <b>Дифлекс - Петушок</b>"
														return
													else
														var/in_cycle = 0
														for(var/f = 1, f <= parameters.len, f++)
															if(findtext(my_noun,parameters[f])!=0)
																//Здесь проверяются переменные
																var/par = 0
																in_cycle = 1
																switch(parameters[f])
																	if("яркость")
																		par = A.luminosity

																	if("температура")
																		par = A.my_temp

																	if("имя")
																		par = A.name

																var/word_1 = findtext(my_noun, parameters[f])
																var/my_second_word = copytext(my_noun, word_1)
																if(findtext(my_second_word,"больше"))
																	var/word_imp = findtext(my_second_word, "больше ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par > my_third_word)
																		world << "\blue <b>Тип - [A.type]</b>"

																if(findtext(my_second_word,"меньше"))
																	var/word_imp = findtext(my_second_word, "меньше ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par < my_third_word)
																		world << "\blue <b>Тип - [A.type]</b>"

														if(in_cycle == 0)
															world << "\blue <b>Тип - [A.type]</b>"

						if("ВСЕ")
							if(findtext(my_noun,"АКТИВНЫЕ")!=0)
								var/sum = 0
								for(var/g = 1, g <= objects.len, g++)
									var/atom/A = objects[g]
									if(A.processing == 1)
										world << "<b>[A] - (processing); здесь - [A.x];[A.y];[A.z]; тип - [A.type]</b>"
										sum += 1

								world << "\red <b>Количество активных, обрабатываемых объектов равно [sum]</b>"
								if(sum > 100)
									world << "\red <b>Kate рекомендует вам оптимизировать ваш проект.</b>"

							if(findtext(my_noun,"плохо")!=0)
								var/word1 = pick("Мастер, смотрите внимательнее", "Не занимаетесь хуйней", "Вам есть смысл делать это")
								var/word2 = pick(":3",":)","<3")
								world << "\blue <b>[word1] [word2]</b>"

						if("нагрузка")
							world << "\blue <b>Процессор загружен на - [world.cpu]%</b>"
							if(world.cpu > 60)
								world << "\red <b>Предупреждение! Возможны лаги!</b>"

						if("бьенд")
							world << "\blue <b>Текуща&#255; верси&#255; бьенда - <i>[world.byond_version]</i></b>"

						if("расскажи")
							for(var/g = 1, g <= objects.len, g++)
								var/atom/A = objects[g]
								if(findtext(my_noun,A.name)!=0)
									if(A.desc)
										world << "\blue <b>Найдена следующа&#255; информаци&#255; по [A]: <u>[A.desc]</u></b>"
										return
									else
										world << "\blue <b>Найдена следующа&#255; информаци&#255; по [A]: <u>Записи отсутствуют</u></b>"

							if(findtext(my_noun,"себе") || findtext(my_noun,"себ&#255;"))
								world << "\blue <b>Бездушный и довольно глупый код, всему виной мой создатель. Наверное есть кака&#255;-то формула, котора&#255; определ&#255;ет коррел&#255;цию между сложностью творени&#255; и умом создател&#255;</b>"

							if(findtext(my_noun,"дервен") || findtext(my_noun,"Дервен"))
								world << "\blue <b>Полнейший кретин. Идиот. Слабак. Ненавижу эту ублюдочную мразь.</b>"

	New()
		hello()
		unit += src