var/global/list/unit = list()
var/global/list/objects = list()

/atom
	var/processing = 0

/datum/Kate
	var/name = "Kate"
	var/list/priority = list()
	var/list/important_words_1 = list("�����","�������", "��������", "��������", "�����", "���")
	var/list/important_words_2 = list("�����","���","���","��")
	var/list/parameters = list("�������","���","�����������")
	var/list/rules = list()
	var/list/memory = list()

	proc/remember()
		world << "\blue Kate ������ ��� ������ ������"


	proc/education()
		world << "\blue Kate ������ ������� ��� ������� ��� ��������"
		world << "\blue x1 ��� x2(x1 = x2) ��������� ����-��, ��� x ���� ��������, x1 �� x2 (x1 �� ����� ���� ����� x2)"
		world << "\blue <b>�����! ����� &#255; ����� ��������� ���� �������, x ������ ���� �������� � ������</b>"
		world << "\blue <b>� �������� &#255; ���� ��������.</b>"


	proc/hello()
		world << "\blue <b>Kate: ������, ������, ��� ����� ������ ������&#255;?</b>"

	proc/process(var/master_commands)
		if(findtext(master_commands,"Kate")!=0 || findtext(master_commands,"���&#255;")!=0 || findtext(master_commands,"����")!=0)
			for(var/i = 1, i <= important_words_1.len, i++)
				if(findtext(master_commands,important_words_1[i])!=0)
					var/ebat = findtext(master_commands,important_words_1[i])
					var/my_noun = copytext(master_commands, ebat)
					switch(important_words_1[i])

						if("�����")
							//if(findtext(my_noun,important_words_2[i])!=0)
							//	switch(important_words_2[i])
							//		if("�����")
							for(var/g = 1, g <= objects.len, g++)
								var/atom/k = objects[g]
								if(findtext(my_noun,k.name)!=0 || findtext(my_noun,"�������")!=0)
									for(var/l = 1, l <= important_words_2.len, l++)
										var/atom/A = k
										if(findtext(my_noun,important_words_2[l])!=0)
											switch(important_words_2[l])
												if("�����")

													if(findtext(my_noun,"�������")!=0)
														world << "\blue <b>� ������. ���</b>"
														return
													else
														var/in_cycle = 0
														for(var/f = 1, f <= parameters.len, f++)
															if(findtext(my_noun,parameters[f])!=0)
																//����� ����������� ����������
																var/par = 0
																in_cycle = 1
																switch(parameters[f])
																	if("�������")
																		par = A.luminosity

																	if("�����������")
																		par = A.my_temp

																	if("���")
																		par = A.name

																var/word_1 = findtext(my_noun, parameters[f])
																var/my_second_word = copytext(my_noun, word_1)
																if(findtext(my_second_word,"������"))
																	var/word_imp = findtext(my_second_word, "������ ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par > my_third_word)
																		world << "\blue <b>����� - [A.x];[A.y];[A.z]</b>"

																if(findtext(my_second_word,"������"))
																	var/word_imp = findtext(my_second_word, "������ ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par < my_third_word)
																		world << "\blue <b>����� - [A.x];[A.y];[A.z]</b>"

														if(in_cycle == 0)
															world << "\blue <b>����� - [A.x];[A.y];[A.z]</b>"

												if("���")
													if(findtext(my_noun,"�������")!=0)
														world << "\blue <b>������� - �������</b>"
														return
													else
														var/in_cycle = 0
														for(var/f = 1, f <= parameters.len, f++)
															if(findtext(my_noun,parameters[f])!=0)
																//����� ����������� ����������
																var/par = 0
																in_cycle = 1
																switch(parameters[f])
																	if("�������")
																		par = A.luminosity

																	if("�����������")
																		par = A.my_temp

																	if("���")
																		par = A.name

																var/word_1 = findtext(my_noun, parameters[f])
																var/my_second_word = copytext(my_noun, word_1)
																if(findtext(my_second_word,"������"))
																	var/word_imp = findtext(my_second_word, "������ ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par > my_third_word)
																		world << "\blue <b>��� - [A.type]</b>"

																if(findtext(my_second_word,"������"))
																	var/word_imp = findtext(my_second_word, "������ ")
																	var/my_third_word = copytext(my_second_word, word_imp+7)
																	my_third_word = text2num(my_third_word)
																	if(par < my_third_word)
																		world << "\blue <b>��� - [A.type]</b>"

														if(in_cycle == 0)
															world << "\blue <b>��� - [A.type]</b>"

						if("���")
							if(findtext(my_noun,"��������")!=0)
								var/sum = 0
								for(var/g = 1, g <= objects.len, g++)
									var/atom/A = objects[g]
									if(A.processing == 1)
										world << "<b>[A] - (processing); ����� - [A.x];[A.y];[A.z]; ��� - [A.type]</b>"
										sum += 1

								world << "\red <b>���������� ��������, �������������� �������� ����� [sum]</b>"
								if(sum > 100)
									world << "\red <b>Kate ����������� ��� �������������� ��� ������.</b>"

							if(findtext(my_noun,"�����")!=0)
								var/word1 = pick("������, �������� ������������", "�� ����������� ������", "��� ���� ����� ������ ���")
								var/word2 = pick(":3",":)","<3")
								world << "\blue <b>[word1] [word2]</b>"

						if("��������")
							world << "\blue <b>��������� �������� �� - [world.cpu]%</b>"
							if(world.cpu > 60)
								world << "\red <b>��������������! �������� ����!</b>"

						if("�����")
							world << "\blue <b>������&#255; �����&#255; ������ - <i>[world.byond_version]</i></b>"

						if("��������")
							for(var/g = 1, g <= objects.len, g++)
								var/atom/A = objects[g]
								if(findtext(my_noun,A.name)!=0)
									if(A.desc)
										world << "\blue <b>������� ��������&#255; ���������&#255; �� [A]: <u>[A.desc]</u></b>"
										return
									else
										world << "\blue <b>������� ��������&#255; ���������&#255; �� [A]: <u>������ �����������</u></b>"

							if(findtext(my_noun,"����") || findtext(my_noun,"���&#255;"))
								world << "\blue <b>��������� � �������� ������ ���, ����� ����� ��� ���������. �������� ���� ����&#255;-�� �������, ������&#255; �������&#255;�� ������&#255;��� ����� ���������� �������&#255; � ���� ��������&#255;</b>"

							if(findtext(my_noun,"������") || findtext(my_noun,"������"))
								world << "\blue <b>��������� ������. �����. ������. �������� ��� ���������� �����.</b>"

	New()
		hello()
		unit += src