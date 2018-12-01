var/firstStar=1
mob/var/boost=1
proc/MakyoStar()
	sleep(28800)
	firstStar=0
	for(var/mob/M) if(M.player)
		M<<"The sky turns dark red as the Makyo Star appears in the sky."
		if(M.Race=="Demon"|M.Race=="Makyojin") if(M.boost==1) M.MakyoBoost()
	sleep(18000)
	spawn MakyoStar2()
proc/MakyoStar2()
	firstStar=1
	for(var/mob/M) if(M.player)
		M<<"The sky returns to normal as the Makyo Star moves away."
		if(M.Race=="Demon"|M.Race=="Makyojin") if(M.boost==0) M.MakyoDrain()
	spawn MakyoStar()
mob/proc/MakyoBoost()
		boost=0
		src<<"You feel power flood your body."
		absorbadd+=RecordPL*1.3
mob/proc/MakyoDrain()
		boost=1
		src<<"You suddenly feel weaker."
		absorbadd-=RecordPL*1.3