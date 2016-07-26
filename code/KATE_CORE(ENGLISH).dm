var/global/list/unit = list()
var/global/list/objects = list()

/atom
	var/processing = 0

/datum/Kate
	var/name = "Kate"
	var/list/priority = list()
	var/list/important_words_1 = list("tell","remember", "explain", "load", "byond", "ALL")
	var/list/important_words_2 = list("locate","type","THIS","NOT")
	var/list/parameters = list("brightness","name","temperature")
	var/list/rules = list()
	var/list/memory = list()

	proc/hello()
		world << "\blue <b>Kate: Hello bro!</b>"

	proc/process(var/master_commands)
		if(findtext(master_commands,"Kate")!=0)
			for(var/i = 1, i <= important_words_1.len, i++)
				if(findtext(master_commands,important_words_1[i])!=0)
					var/ebat = findtext(master_commands,important_words_1[i])
					var/my_noun = copytext(master_commands, ebat)
					switch(important_words_1[i])

						if("tell")
							for(var/g = 1, g <= objects.len, g++)
								var/atom/k = objects[g]
								if(findtext(my_noun,k.name)!=0 || findtext(my_noun,"Difilex")!=0)
									for(var/l = 1, l <= important_words_2.len, l++)
										var/atom/A = k
										if(findtext(my_noun,important_words_2[l])!=0)
											switch(important_words_2[l])
												if("locate")

													if(findtext(my_noun,"Difilex")!=0)
														world << "\blue <b>in the ass</b>"
														return
													else
														var/in_cycle = 0
														for(var/f = 1, f <= parameters.len, f++)
															if(findtext(my_noun,parameters[f])!=0)
																var/par = 0
																in_cycle = 1
																switch(parameters[f])
																	if("brightness")
																		par = A.luminosity

																	if("temperature")
																		par = A.my_temp

																	if("name")
																		par = A.name

																var/word_1 = findtext(my_noun, parameters[f])
																var/my_second_word = copytext(my_noun, word_1)
																if(findtext(my_second_word,"greater"))
																	var/word_imp = findtext(my_second_word, "greater")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par > my_third_word)
																		world << "\blue <b>here - [A.x];[A.y];[A.z]</b>"

																if(findtext(my_second_word,"less"))
																	var/word_imp = findtext(my_second_word, "less ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par < my_third_word)
																		world << "\blue <b>here - [A.x];[A.y];[A.z]</b>"

														if(in_cycle == 0)
															world << "\blue <b>here - [A.x];[A.y];[A.z]</b>"

												if("type")
													if(findtext(my_noun,"Difilex")!=0)
														world << "\blue <b>Difilex - cocksucker</b>"
														return
													else
														var/in_cycle = 0
														for(var/f = 1, f <= parameters.len, f++)
															if(findtext(my_noun,parameters[f])!=0)
																var/par = 0
																in_cycle = 1
																switch(parameters[f])
																	if("brightness")
																		par = A.luminosity

																	if("temperature")
																		par = A.my_temp

																	if("name")
																		par = A.name

																var/word_1 = findtext(my_noun, parameters[f])
																var/my_second_word = copytext(my_noun, word_1)
																if(findtext(my_second_word,"greater"))
																	var/word_imp = findtext(my_second_word, "greater ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par > my_third_word)
																		world << "\blue <b>Type - [A.type]</b>"

																if(findtext(my_second_word,"less"))
																	var/word_imp = findtext(my_second_word, "less")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par < my_third_word)
																		world << "\blue <b>Type - [A.type]</b>"

														if(in_cycle == 0)
															world << "\blue <b>Type - [A.type]</b>"

						if("ALL")
							if(findtext(my_noun,"ACTIVE")!=0)
								var/sum = 0
								for(var/g = 1, g <= objects.len, g++)
									var/atom/A = objects[g]
									if(A.processing == 1)
										world << "<b>[A] - (processing); here - [A.x];[A.y];[A.z]; type - [A.type]</b>"
										sum += 1

								world << "\red <b>Active objects: [sum]</b>"
								if(sum > 100)
									world << "\red <b>Kate is recommended to optimize this shit.</b>"

							if(findtext(my_noun,"bad")!=0)
								var/word1 = pick("Look on the code", "Do not waste your time in vain", "I love you!")
								var/word2 = pick(":3",":)","<3")
								world << "\blue <b>[word1] [word2]</b>"

						if("load")
							world << "\blue <b>processor loaded - [world.cpu]%</b>"
							if(world.cpu > 60)
								world << "\red <b>Warning! Lags!</b>"

						if("byond")
							world << "\blue <b>Current Byond version - <i>[world.byond_version]</i></b>"

						if("explain")
							for(var/g = 1, g <= objects.len, g++)
								var/atom/A = objects[g]
								if(findtext(my_noun,A.name)!=0)
									if(A.desc)
										world << "\blue <b>I found some information about [A]: <u>[A.desc]</u></b>"
										return
									else
										world << "\blue <b>[A]: <u>No information</u></b>"

							if(findtext(my_noun,"yourself"))
								world << "\blue <b>Nothing interesting</b>"

							if(findtext(my_noun,"Derven"))
								world << "\blue <b>Idiot from Siberia!</b>"

	New()
		hello()
		unit += src