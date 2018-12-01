world/map_format = TILED_ICON_MAP
mob/var/maxlearn=5
mob/var
	DRenabled=1 //1 if enabled, 0 if not.
	KiSet=0 //0 for KO or 1 for Kill
	oldHPregen=0
	oldKiregen=0
	oldssjdrain=0
	oldssjmod=0
	oldssj2drain=0
	oldssj2mod=0
	oldssj3drain=0
	oldssj3mod=0
	RPFight=0
	hastransform=0
	oldzanzoskill=0
	ZanzoToggle=0
mob/verb
	RPFight()
		set category="Other"
		if(!RPFight)
			RPFight=1
			oldHPregen=HPRegen
			oldKiregen=KiRegen
			oldssjdrain=ssjdrain
			oldssjmod=ssjmod
			oldssj2drain=ssj2drain
			oldssj2mod=ssj2mod
			oldssj3drain=ssj3drain
			oldssj3mod=ssj3mod
			KiRegen=0
			HPRegen=0
			ssjmod=0
			ssjdrain=0
			ssj2permdrain=0
			ssj2drain=0
			ssj2mod=0
			ssj3permdrain=0
			ssj3drain=0
			ssj3mod=0
			usr<<"RPFight enabled."
		else
			RPFight=0
			HPRegen=oldHPregen
			KiRegen=oldKiregen
			ssjdrain=oldssjdrain
			ssjmod=oldssjmod
			ssj2drain=oldssj2drain
			ssj2permdrain=200
			ssj2mod=oldssj2mod
			ssj3drain=oldssj3drain
			ssj3mod=oldssj3mod
			ssj3permdrain=100
			usr<<"RPFight disabled."
mob/verb
	Advanceturn()
		set category="Other"
		range()<< "<font color=[usr.SayFont]><font size=[usr.TextSize]>[usr] Is Advancing a turn..."
		for(var/mob/A in view(src)) A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]) Is Advancing a turn...<br>
</body><html>"}
		RPFight()
		sleep(60)
		RPFight()
		range()<< "<font color=[usr.SayFont]><font size=[usr.TextSize]>[usr] Advanced a turn."
		for(var/mob/A in view(src)) A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]) Advanced a turn.<br>
</body><html>"}

mob/verb
	ZanzoToggle()
		set category="Other"
		if(!ZanzoToggle)
			ZanzoToggle=1
			oldzanzoskill=zanzoskill
			zanzoskill=0
			usr<<"Zanzoken disabled."
		else
			ZanzoToggle=0
			zanzoskill=oldzanzoskill
			usr<<"Zanzoken enabled."
mob/verb
	EnergySetting()
		set category="Other"
		if(!KiSet)
			KiSet=1
			usr<<"Energy attacks set to kill."
		else
			KiSet=0
			usr<<"Energy attacks set to knock out."
	DeflectionSetting()
		set category="Other"
		if(DRenabled)
			DRenabled=0
			usr<<"Blast Deflection/Reflection is disabled."
		else
			DRenabled=1
			usr<<"Blast Deflection/Reflection is enabled."
client/North()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=7#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/South()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/East()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/West()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/Northwest()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/Southwest()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/Northeast()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
client/Southeast()
	if(!usr.move) return
	if(usr.Oozarou&&usr.Oozarouskill<10) return
	if(usr.KB) return
	if(usr.grabberSTR&&prob(5)) for(var/mob/A in view(1,usr)) if(A.grabbee==usr)
		var/escapechance=(usr.Str*usr.PL*5)/usr.grabberSTR
		if(prob(escapechance))
			A.grabbee=null
			usr.attacking=0
			A.attacking=0
			usr.grabberSTR=null
			view(usr)<<"<font color=#FFFF00>[usr] breaks free of [A]'s hold!"
		else view(usr)<<"<font color=#FFFFFF>[usr] struggles against [A]'s hold!"
		return
	..()
mob/proc/Zenkai() if(prob(15)) RecordPL+=2*BPRank*GG*timemult*gain*PLMod*ZenkaiMod
mob/proc/Add_Anger() if(Anger<MaxAnger) Anger+=((MaxAnger-100)/20)
mob/var/tmp
	attacking=0
	finishing=0
	disciplemod=1
	minuteshot
mob/var
	rivalisssj
	hitcountermain=0
	refire=20
	orefire=20
	dead=0
	KO=0
	buudead=0
mob/var
	pfocus="Balanced"
	sfocus="Balanced"
	mfocus="Balanced"
mob/proc/Fight() if(!Oozarou&&attacking) flick("Attack",src)
mob/proc/Blast() if(!Oozarou&&attacking) flick("Blast",src)
mob/proc/Attack_Gain()
	if(player) Fight()
	hitcountermain+=1
	if(Ki<MaxKi)
		if(dead)
			if(z==1|z==2|z==3|z==4|z==5|z==6|z==7|z==8|z==9|z==11|z==15|z==19|z==20)
			else Ki+=((MaxKi/200)*KiRegen)
		else Ki+=((MaxKi/200)*KiRegen)
	if(!RPFight)
		var/gravincrease
		if(planetgrav*gravmult<GravMastered) gravincrease=(GravMastered/10)+1
		else gravincrease=(planetgrav*gravmult/10)+1
		RecordPL+=5*BPRank*GG*gain*timemult*PLMod*gravincrease*HBTCMod*disciplemod*SparMod*weight
		MaxKi+=0.008*KiMod*timemult
		if(pfocus=="Balanced")
			if(prob(10)) Str+=0.024*StrMod*timemult*StatRank
			if(prob(10)) End+=0.024*EndMod*timemult*StatRank
		if(sfocus=="Balanced")
			if(prob(10)) Pow+=0.020*PowMod*timemult*StatRank
			if(prob(10)) Res+=0.020*ResMod*timemult*StatRank
		if(prob(10)) Spd+=0.026*SpdMod*timemult*StatRank
		if(mfocus=="Balanced")
			if(prob(10)) Offense+=0.020*OffenseMod*timemult*StatRank
			if(prob(10)) Defense+=0.025*DefenseMod*timemult*StatRank
		if(prob(10))
			gain+=gainget*5*timemult
	else
		return
mob/proc/Blast_Gain()
	if(player) Blast()
	if(!RPFight)
		var/gravincrease
		if(planetgrav*gravmult<GravMastered) gravincrease=(GravMastered/10)+1
		else gravincrease=(planetgrav*gravmult/10)+1
		RecordPL+=2*BPRank*GG*gain*PLMod*gravincrease*HBTCMod*weight*timemult*2
		MaxKi+=0.0002*KiMod*2*timemult
		if(prob(10)) Pow+=0.008*PowMod*timemult*StatRank
		if(prob(10)) Offense+=0.008*OffenseMod*timemult*StatRank
		if(prob(10))
			gain+=gainget*2*timemult
	else
		return
mob/proc/KO()
	if(Race=="Android"&&prob(95)) return
	if(player&&!KO)
		if(Savable) icon_state="KO"
		view(src)<<"[src] is knocked out!"
		for(var/mob/A in view(src))
			A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]) is knocked out!<br>
</body><html>"}
		move=0
		HP=0
		KO=1
		train=0
		med=0
		for(var/obj/items/Gravity/A in contents) A.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		for(var/obj/items/Saibaman_Seed/A in contents) A.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		for(var/obj/items/Artificial_Moon/A in contents) A.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		for(var/obj/items/Regenerator/A in contents) A.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		for(var/obj/items/dbs/D in contents) D.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		for(var/obj/items/Radar/A in contents) A.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		for(var/obj/items/Amulet/A in contents) A.loc=locate(x+rand(-1,1),y+rand(-1,1),z)
		if(ssj>0)
			if(ssjdrain>300&&ssj==1)
			else Revert()
		blasting=0
		overlays-='Blast Charging.dmi'
		move=0
		firable=1
	else if(monster)
		KO=1
		move=0
		HP=0
		view(7)<<"[src] is knocked out!"
		spawn(600)
		Un_KO()
	if(dummy)
		KO=1
		move=0
		HP=0
		view(src)<<"[src] has been destroyed!"
		del(src)
mob/proc/Un_KO()
	if(player&&KO&&!RPFight)
		move=1
		attackable=1
		if(Savable) icon_state=""
		attacking=0
		blasting=0
		if(HP<1) HP=1
		Ki=0
		view(src)<<"[src] regains consciousness."
		if(Savable) icon_state=""
		sleep(20)
		KO=0
	if(monster&&KO)
		KO=0
		HP=50
		move=1
		view(src)<<"[src] regains consciousness."
		step_rand(src)
mob/var/firstdeath=1
mob/proc/Death()
	for(var/mob/A in view(src)) if(A.grabbee==src)
		view()<<"[A] is forced to release [A.grabbee]!"
		A.grabbee=null
	var/xx=x
	var/yy=y
	var/zz=z
	var/randoz
	if(player&&!dead)
		if(firstdeath)
			firstdeath=0
			var/DeathBP=gain*5000*PLMod*UPMod*StatRank
			if(DeathBP>RecordPL) DeathBP=RecordPL
			RecordPL+=DeathBP
		if(Race=="Majin"&&!buudead) //If your a majin who wasnt completely destroyed.
			//Begin the regeneration cycle.
			var/stuff=overlays
			overlays-=overlays
			var/amount=5
			while(amount)
				amount-=1
				var/obj/A=new/obj
				A.icon='Majin1.dmi'
				A.icon_state="chunk1"
				A.loc=locate(x+rand(-5,5),y+rand(-5,5),z)
			loc=locate(100,100,14)
			src<<"You will regenerate in 1 minute."
			sleep(600)
			icon_state="Regenerate"
			loc=locate(xx,yy,zz)
			for(var/obj/A in view(src)) if(A.icon=='Majin1.dmi')
				spawn walk_towards(A,src,2)
				spawn(100) del(A)
			sleep(100)
			icon_state=""
			overlays+=stuff
			dead=0
			buudead=0
			return //End the cycle and do not continue
		if(Race=="Bio-Android"&&!buudead) //else, if you are a Bio who was NOT destroyed...
			//Begin regenerating...
			var/stuff=overlays
			overlays-=overlays
			loc=locate(63,308,8)
			src<<"You will regenerate in 2 minutes."
			sleep(1200)
			loc=locate(xx,yy,zz)
			overlays+=stuff
			dead=0
			buudead=0
			return //End the cycle and do not continue
		if(Race=="Android"&&!dead) //Else, if your an android who IS NOT dead.
			randoz=rand(1,5) //Calculate the chances of being rebuilt, or not being rebuilt...
			if(randoz==5) //If 5, do not rebuild, die further down in the code.
				src<<"<font color=red>The android ship has decided not to rebuild you."
			else //Else, be rebuilt on the ship...
				overlays-='Obj Halo.dmi'
				src<<"<font color=red>Android Ship says, 'Your memories have been saved and implanted into a new body. Your old body was terminated or reached expiration.'"
				loc=locate(63,308,8)
				dead=0
				return //And then go no further.
		if(Race=="Majin"&&buudead) //else, if you ARE a majin who was destroyed...
			buudead=0
			loc=locate(100,100,2)
		if(!dead) //The actual death happens here, if not stopped by above circumstances.
			RecordPL+=gain*10*PLMod*ZenkaiMod*GG
			Oozarou_Revert()
			dead=1
			overlays-='Obj Halo.dmi'
			overlays+='Obj Halo.dmi'
			loc=locate(173,173,15) //And finally, send them to the death checkpoint...
		Un_KO() //Whether dead or not when death runs, and if not stopped by above circumstances,
mob/verb/Finish()
	set category="Skills"
	for(var/mob/M in get_step(src,dir)) if(!KO&&M.KO&&!med&&!train&&M.attackable)
		if(!M.immortal)
			if(M.player) if(!finishing)
				finishing=1
				view(src)<<"[M] was just killed by [usr]([displaykey])!"
				for(var/mob/A in view(src))
					A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [M]([M.key]) was just killed by [usr]([displaykey])!<br>
</body><html>"}
				//Deleting them if they are a good contact
				for(var/obj/Contact/A in contents) if(A.name=="[M.name] ([M.displaykey])")
					if(A.relation=="Good"|A.relation=="Friend"|A.relation=="Family"|A.relation=="Rival/Good")
						usr<<"[A.name] contact deleted. Obviously if your killing your friends they must not actually be your friends."
						del(A)
				//Onlooker Super Saiyan chance...
				var/KOerIsBad
				var/DyerIsGood
				for(var/mob/A in view()) //A being the friend looking...
					for(var/obj/Contact/C in A.contents)
						if(C.name=="[name] ([displaykey])") if(C.relation=="Bad"|C.relation=="Enemy") KOerIsBad=1
						if(C.name=="[M.name] ([M.displaykey])") if(C.relation=="Good"|C.relation=="Friend"|C.relation=="Family") DyerIsGood=1
					if(KOerIsBad&&DyerIsGood)
						A.Anger+=A.MaxAnger-100
						view(A)<<"<font color=red>[A] has become insane with rage!!!"
						if(A.Class!="Bebi"&&A.PL>=A.ssjat)
							if(A.Race=="Saiyan"|A.Race=="Half-Saiyan")
								if(!A.hasssj/*&&!A.KaiokenBP*/&&!A.ssj)
									if(A.Class=="Legendary")
										A.hasssj=1
										A.SSj()
									else if(A.kimanip>2&&A.MaxPLpcnt>150&&A.zanzoskill>10&&A.Offense>20&&A.Defense>20)
										A.SSj()
								if(A.PL>=A.ssj2at&&A.hasssj) A.hasssj2=1
						break
				if(!dead)	if(King_of_Vegeta==M.key)
					if(Race=="Saiyan")
						usr<<"By killing the former King Vegeta, you have become the new King Vegeta!"
						M<<"You have lost your throne and [usr] becomes the new King Vegeta."
						King_of_Vegeta=key
						Rank_Verb_Assign()
					else for(var/mob/A) if(A.Race=="Saiyan"&&!A.dead)
						King_of_Vegeta=A.key
						A<<"<font color=yellow>The King of Vegeta has been murdered, you have inherited the throne because you are the next in line of the Royal Family of Vegeta!"
						A.Rank_Verb_Assign()
						break
					else King_of_Vegeta=null
				if(!dead) if(Race=="Changeling"|Class=="Changeling")
					if(Changeling_Lord==M.key)
						usr<<"You have become the new Changeling Lord!"
						M<<"You have lost your status as Changeling Lord to [usr]."
						Changeling_Lord=key
				M.buudead=0
				M.Death()
				sleep(refire)
				finishing=0
			if(M) if(M.monster|M.pet)
				if(!finishing)
					finishing=1
					view(6)<<"[M] was just killed by [usr]!"
					del(M)
					sleep(refire)
					finishing=0
		else view(6)<<"[usr] tries to finish [M] off, but they wont die!"
mob/verb/Attack()
	set category="Skills"
	MeleeAttack()
mob/proc/MeleeAttack()
	for(var/mob/M in get_step(src,dir)) if(M.attackable&&!med&&!train&&!KO&&!M.KO&&move)
		if(M.client&&client&&!exempt) if(M.client.address==client.address)
			usr<<"DO NOT INTERACT WITH MULTIKEYS."
			Bans.Add(usr.key)
			usr.Logout()
			del(src)
		if(istype(M,/mob/Dummy))
			if(!attacking)
				attacking=1
				spawn(2) attacking=0
				if(M.icon_state=="Off") spawn(3000) if(M) M.icon_state="Off"
				M.icon_state="On"
				if(M.dir==turn(dir,180))
					Attack_Gain()
					if(prob(50)) M.dir=turn(M.dir,90)
					else M.dir=turn(M.dir,-90)
				else flick("Attack",usr)
				var/dmg=((Str/M.End)+(PL/(M.PL*10)))*rand(1,15)
				M.HP-=dmg
				if(M.HP<=0)
					spawn M.KO()
					M.icon_state="KO"
					spawn(600) if(M) del(M)
		else if(istype(M,/mob/Punching_Bag)) if(M.HP>0&&dir==EAST&&Ki>0.1)
			if(!attacking)
				attacking=1
				Ki-=0.1
				spawn(refire*0.5) attacking=0
				flick("Hit",M)
				Attack_Gain()
				flick("Attack",usr)
				var/dmg=((Str/M.End)+(PL/(M.PL*10)))*rand(1,15)
				M.HP-=dmg
				if(M.HP<=0) M.icon_state="Destroyed"
		else if(!attacking)
			attacking=1
			if(!minuteshot)
				minuteshot=0
				spawn(600) minuteshot=0
			if(M.minuteshot)
				Attack_Gain()
				Attack_Gain()
			if(client) M.Attack_Gain()
			if(M.PL>PL&&M.client) disciplemod=3
			else disciplemod=1
			if(M.client&&client) M.Add_Anger()
			var/dmg=((Str/M.End)+((PL+1)/((M.PL+1)*10)))*rand(1,15)
			var/evasion=(M.PL/PL)*(M.Defense/Offense)*(M.Spd/Spd)
			if(M.med) evasion*=0.1
			if(prob(evasion*50))
				if(prob(60)) //Block
					view(1)<<"<font size=1><font color=white>[M] blocks [usr]'s attack!"
					M.HP-=dmg*0.1
					flick('Zanzoken.dmi',M)
				else if(prob(60)) //Dodge
					view(1)<<"<font size=1><font color=white>[M] dodges [usr]'s attack!"
					flick('Zanzoken.dmi',M)
				else //Counter
					view(1)<<"<font size=1><font color=yellow>[M] counters [usr]'s attack!"
					HP-=(dmg/EndMod)
			else //Successful hit
				view(1)<<"<font size=1><font color=red>[usr] attacks [M]!"
				if(M.KB<round(dmg)) M.KB=round(dmg)
				if(M.KB>20) M.KB=20
				while(M.KB&&M)
					if(M.client) M.icon_state="KB"
					if(PL>10000000) for(var/turf/T in get_step(M,M.dir)) T.Destroy()
					if(PL>50000000) for(var/turf/T in view(1,M)) T.Destroy()
					step_away(M,usr)
					M.KB-=1
					sleep(pick(0,1))
					if(!M.KB&&!KO)
						if(M.client) M.icon_state=""
						if(prob(zanzoskill*0.1))
							if(density)
								density=0
							sleep(refire*0.2)
							attacking=0
							if(M) loc=locate(M.x,M.y,M.z)
							if(M) step_away(src,M)
							dir=turn(dir,180)
							if(!flight)
								density=1
					if(!src&&M) M.KB=0
				M.HP-=dmg
			PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]) attacks [M]([M.key]).<br>
</body><html>"}
			M.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]) attacks [M]([M.key]).<br>
</body><html>"}
			spawn(refire) attacking=0
mob/var/tmp/KB=0
turf/proc/Destroy() if(type!=/turf/Special/Teleporter&&type!=/turf/buildables/SecurityDoor&&type!=/turf/buildables/SecurityWall&&type!=/turf/Other/Blank&&type!=/turf) new/turf/Ground8(locate(x,y,z))
mob/verb/Steal()
	set category="Skills"
	for(var/mob/M in get_step(src,dir)) if(!KO&&M.KO&&!med&&!train&&M.attackable&&!Oozarou)
		if(M.KO)
			view(usr)<<"[src]([displaykey]) steals [M]'s zenni! ([M.zenni]z)"
			zenni+=M.zenni
			M.zenni=0
		else usr<<"They must be knocked out to do this."
mob/var/tmp
	mob/grabbee //who is grabbing you
	grabberSTR //the strength of the person grabbing you.
	obj/objgrabbee
mob/verb
	Grab()
		set category="Skills"
		for(var/obj/Zenni/A in get_step(src,dir)) if(!KO&&!attacking)
			usr<<"You pick up [A]."
			oview(usr)<<"<font size=1><font color=teal>[usr] picks up [A.zenni]z."
			for(var/mob/B in view(src)) B.PlayerLog+={"<html><head><title></head></title><body><body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>[time2text(world.realtime,"Day DD hh:mm")] [usr]([key]) picks up [A.zenni]z.<br></body><html>"}
			usr.zenni+=A.zenni
			if(A.getkey!=usr.key&&A.getIP==usr.client.address)
				world<<"[usr]([usr.key]) tried to pick up Multikey dropped Zenni. They have been key banned for being an abuser."
				usr.zenni-=A.zenni*2
				Bans.Add(usr.key)
				usr.Logout()
			del(A)
			return
		for(var/obj/items/A in get_step(src,dir)) if(!KO&&!attacking)
			if(A.Bolted)
				src<<"It is bolted to the ground, you cannot get it."
				return
			if(client&&world.host!=key)
				if(A.IP1==client.address&&A.key1!=key)
					src<<"You cannot pick up items dropped by your multikey."
					return
				else if(A.IP2==client.address&&A.key2!=key)
					src<<"You cannot pick up items dropped by your multikey."
					return
				else if(A.IP3==client.address&&A.key3!=key)
					src<<"You cannot pick up items dropped by your multikey."
					return
			if(src)
				if(!KO)
					for(var/turf/G in view(A)) G.gravity=0
					A.Move(src)
					view(src)<<"<font color=teal><font size=1>[src] picks up [A]."
					for(var/mob/B in view(src)) B.PlayerLog+={"<html><head><title></head></title><body><body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>[time2text(world.realtime,"Day DD hh:mm")] [usr]([key]) picks up [A].<br></body><html>"}
				else usr<<"You cant, you are knocked out."
			return
		if(!objgrabbee) for(var/obj/A in get_step(src,dir)) if(!istype(A,/obj/attack/blast)) if(!KO&&!attacking)
			usr<<"You grab [A]"
			objgrabbee=A
			attacking=1
			spawn objgrab()
			return
		else
			usr<<"You release [objgrabbee]"
			attacking=0
			objgrabbee=null
			return
		if(!grabbee) for(var/mob/M in get_step(src,dir)) if(!KO&&!attacking)
			usr<<"You grab [M]."
			grabbee=M
			M.grabberSTR=(Str*PL)
			attacking=1
			M.attacking=1
			spawn grab()
			return
		else
			usr<<"You release [grabbee]."
			attacking=0
			grabbee.attacking=0
			grabbee.grabberSTR=null
			grabbee=null
mob/proc/grab()
	while(grabbee)
		grabbee.loc=locate(x,y,z)
		grabbee.grabberSTR=Str*PL
		grabbee.dir=turn(dir,180)
		if(KO)
			view()<<"[usr] is forced to release [grabbee]!"
			grabbee.grabberSTR=null
			grabbee.attacking=0
			attacking=0
			grabbee=null
		sleep(1)
mob/proc/objgrab()
	while(objgrabbee)
		objgrabbee.loc=locate(x,y,z)
		if(KO)
			view()<<"[usr] is forced to release [objgrabbee]!"
			attacking=0
			objgrabbee=null
		sleep(1)
mob/var/viewstats=1
mob/var/CurrentAnger="Calm"
var/firstcleaner=1
proc/Cleaner()
	for(var/mob/A) if(!A.client&&A.player) del(A)
	CheckIfOwnerIsBanned()
	worldtime+=1
	if(prob(5))
		world<<"Player action logs erased."
		for(var/mob/A) A.PlayerLog={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
<font color="#00FFFF">**[A]'s Logged Activities**<br>
</body><html>"}
	for(var/obj/attack/A) del(A)
	for(var/obj/BigCrater/C) del(C)
	for(var/obj/destroyed/D) del(D)
	firstcleaner=0
	dbtimer+=1
	if(dbtimer>=7)
		world.Repop()
		if(!Monsters) for(var/mob/M) if(M.monster) del(M)
		for(var/obj/items/dbs/D) D.icon_state=D.ostate
		dbtimer=0
		eactive=1
		nactive=1
	for(var/mob/M) if(M.player)
		M<<"The moon comes out..."
		if(M.Osetting) for(var/area/H in view(0,M)) if(!istype(H,/area/Inside)) M.Oozarou()
		else src<<"You try your best not to look..."
		if(M.Race=="Saiyan"|M.Race=="Half-Saiyan") if(M.Age<=16) if(!M.Tail) M.Tail_Grow()
	spawn(12000) Cleaner()
mob/var
	hasshenron=0
	hasporunga=0
mob/proc/Tail_Grow()
	if(!Tail)
		Tail=1
		src<<"Your tail grew back!"
		Str*=1.1
		End*=1.1
		Spd/=1.1
	var/TailColor='Modified Tail.dmi'
	TailColor+=rgb(HairR,HairG,HairB)
	overlays+=TailColor
	//The reverse of this in the ki attack bump proc...
mob/var
	cangeteye=0
	spacebreather
	exempt
	hashomingfinisher
	tmp/highdamage
	tmp/lowenergy
	tmp/returning
	Walkthroughwalls
	hasmegaburst

mob/proc/Stats() while(src)
	//Taiyoken
	if(sight&&!taiyokenusr) if(prob(HPRegen*0.2)) sight=0
	//Negative age prevention.
	if(Age<0.1) Age=0.1
	if(SAge<0.1) SAge=0.1
	if(Body<0.1) Body=0.1
	//Demon Conjuration...
	if(prob(0.002)) if(Race=="Makyojin")
		var/alreadyhasit
		for(var/obj/Skills/Conjure/A in contents) alreadyhasit=1
		if(!alreadyhasit)
			usr<<"You have gained the ability to conjure demons."
			contents+=new/obj/Skills/Conjure
	//1000 powerup % max as long as energy holds out...
	if(prob(0.1)) MaxPLpcnt=1000
	//Learning basic skills.
	if(prob(0.5)) spawn Learn()
	//Random learning of Kienzan or Kikoho.
	if(prob(0.002)) if(Race=="Human"|Race=="Changeling"|Race=="Bio-Android"|Race=="Android"|Race=="Demon"|Race=="Makyojin"|Race=="Arconian")
		var/alreadyhasit
		for(var/obj/KiAttacks/Kienzan/A in contents) alreadyhasit=1
		if(!alreadyhasit)
			usr<<"You have learned the Kienzan disc attack."
			contents+=new/obj/KiAttacks/Kienzan
	if(prob(0.002)) if(Race=="Human"|Race=="Arconian")
		var/alreadyhasit
		for(var/obj/KiAttacks/Kikoho/A in contents) alreadyhasit=1
		if(!alreadyhasit)
			usr<<"You have learned the Kikoho attack."
			contents+=new/obj/KiAttacks/Kikoho
	//Kaio learning shield...
	if(prob(0.002)) if(Race=="Kai")
		var/alreadyhasit
		for(var/obj/KiAttacks/Shield/A in contents) alreadyhasit=1
		if(!alreadyhasit)
			usr<<"You have learned Shield."
			contents+=new/obj/KiAttacks/Shield
	//Giving power timer...
	if(gavepower&&prob(0.1)) gavepower=0
	//Splitform learning...
	if(prob(0.0005)) if(Race=="Namekian"|Race=="Bio-Android"|Race=="Majin"|Race=="Demon"|Race=="Arconian")
		if(!hassplitform)
			hassplitform=1
			contents+=new/obj/SplitForm
	//Chance to learn to transfer power.
	if(!cangivepower&&prob(0.00001*givepowerchance))
		cangivepower=1
		usr<<"You have gained the ability to temporarily transfer your health and energy to others to boost their power. (by clicking them)"
	//Ancient Namek soul absorb.
	if(Race=="Ancient Namek"&&prob(0.01))
		var/learned=0
		for(var/obj/Skills/Soul_Absorb/A in contents) learned=1
		if(!learned) contents+=new/obj/Skills/Soul_Absorb
	//Demon Skill Learning
	if(Race=="Demon"&&Class!="Bebi"&&prob(0.01))
		var/choice=rand(1,2)
		var/learned
		if(choice==1)
			for(var/obj/Skills/Body_Expand/A in contents) learned=1
			if(!learned) contents+=new/obj/Skills/Body_Expand
		if(choice==2)
			for(var/obj/Skills/Ki_Burst/A in contents) learned=1
			if(!learned) contents+=new/obj/Skills/Ki_Burst
	//Arconian random skill learning...
	if(Race=="Arconian"&&Class!="Bebi"&&prob(0.05))
		var/choice=rand(1,10)
		var/learned=0
		if(usr.maxlearn>=0)
			if(choice==1)
				for(var/obj/Skills/Imitation/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Imitation
			if(choice==2)
				for(var/obj/Skills/Body_Expand/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Body_Expand
			if(choice==3)
				for(var/obj/Skills/Ki_Burst/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Ki_Burst
			if(choice==4)
				for(var/obj/Skills/Soul_Absorb/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Soul_Absorb
			if(choice==5)
				for(var/obj/Skills/Regenerate/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Regenerate
			if(choice==6)
				for(var/obj/Skills/TimeFreeze/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/TimeFreeze
			if(choice==7)
				for(var/obj/Skills/Materialization/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Materialization
			if(choice==8)
				for(var/obj/Skills/Heal/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Heal
			if(choice==9)
				for(var/obj/Skills/Invisibility/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Invisibility
			if(choice==10)
				for(var/obj/Skills/Observe/A in contents) learned=1
				usr.maxlearn-=1
				if(!learned) contents+=new/obj/Skills/Observe
			if(!learned) usr<<"You have learned a new skill."
			if(usr.maxlearn==0)
				return
	//Escaping from Time Freeze
	if(Frozen) move=0
	if(Frozen&&prob(1*ResMod*10))
		Frozen=0
		overlays-='Ki Time Freeze.dmi'
		if(!KO) move=1
	//Escaping from Snare
	if(Snared) move=0
	if(Snared&&prob(1*ResMod))
		Snared=0
		overlays-='Ki Energy Web.dmi'
		if(!KO) move=1
	//Precognition
	if(precognitive&&Race!="Kanassa-Jin"&&prob(1))
		for(var/obj/Skills/Observe/A in contents) del(A)
		precognitive=0
		usr<<"You seem to have lost your precognitive abilities all of a sudden..."
	if(precognitive&&!blasting) for(var/obj/attack/blast/A in view(1)) if(A.owner!=src)
		dir=A.dir
		dir=turn(dir,90)
		step(src,dir)
		break
	//Kanassa burst
	if(!haskanassaburst&&prob(0.2)&&Race=="Kanassa-Jin"&&Class!="Bebi")
		haskanassaburst=1
		contents+=new/obj/Skills/Burst
		usr<<"You have learned your races psychic burst technique."
	if(kanassaburst&&prob(0.5))
		var/bicon=bursticon
		bicon+=usr.AuraColor
		var/image/I=image(icon=bicon,icon_state=usr.burststate)
		overlays-=I
		orefire*=4
		HPRegen/=2
		KiRegen/=2
		Pow/=2
		absorbadd=0
		kanassaburst=0
		usr<<"You lose your energy and revert to your normal form."
		Ki=0
		spawn KO()
	//Age thing
	if(Age<=10) Body=Age
	//Thingy that makes you gain faster when you log out and come back after some time.
	if(prob(0.1))
		timemult=0.2*((worldtime+1))
		if(timemult>10) timemult=10
		if(timemult<1) timemult=1
	//Oozarou SSj4 thingy
	if(Oozarou)
		icon_state=""
		Oozarouskill+=0.01
		if(prob(0.5)) if(golden&&Oozarouskill>=10&&hasssj&&!hasssj4&&!ssj)
			Oozarou_Revert()
			SSj4()
	//Afterlife Return Timer...
	if(dead) if(z==1|z==2|z==3|z==4|z==5|z==6|z==7|z==8|z==9|z==11|z==15|z==19|z==20)
		if(Ki<=(MaxKi/20))
			if(!returning)
				returning=1
				usr<<"You can no longer sustain yourself in the living world, you will soon be returned to the afterlife if you remain below 5% energy."
			if(prob(0.1))
				HP=100
				loc=locate(173,173,15)
				view(usr)<<"[src]'s time in the living world has expired."
				returning=0
				Death()
	//Elite learning BE...
	if(!hasexpand)
		if(Race=="Saiyan"&&elite&&ssjdrain>=220)
			usr<<"You have learned the ability to expand your body to increase your super saiyan power drastically... (Super Saiyan + Body Expand=Ultra Super Saiyan)"
			contents+=new/obj/Skills/Body_Expand
			hasexpand=1
		if(prob(0.1)) if(Race=="Half-Saiyan"&&Class=="Vegeta Halfie")
			for(var/mob/M in view(usr)) if(hasssj&&M.expandlevel&&M.ssj)
				usr<<"You have learned the ability to expand your body in super saiyan form (Ultra Super Saiyan) from watching [M] use it."
				contents+=new/obj/Skills/Body_Expand
				hasexpand=1
		if(Race=="Changeling"&&Class=="Frieza Type"&&MaxKi>=250)
			usr<<"You have learned the body expand ability."
			usr.contents+=new/obj/Skills/Body_Expand
			hasexpand=1
	//Bebi Stuff...
	if(BebiAbsorber)
		var/found
		for(var/mob/M)
			if(M.name==BebiAbsorber) found=1
			if(M.name==BebiAbsorber&&M.KO)
				M<<"You give up the body you possessed."
				M.icon=M.oicon
				M.overlays-=M.overlays
				M.underlays-=M.underlays
				M.hair=null
				M.ssj=0
				M.f2=0
				M.f3=0
				M.f4=0
				M.Body=25-(M.Age-M.DeclineAge)
				M.Class="None"
				M.Race="Bebi"
				M.spacebreather=1
				M.absorbadd=0
				M.overlays-='Bebi Face Stripes.dmi'
				loc=locate(M.x,M.y,M.z)
				BebiAbsorber=null
		if(!found)
			client.perspective=EYE_PERSPECTIVE
			client.eye=usr
			BebiAbsorber=null
			usr<<"The Bebi has left your body."
			if(z==27) loc=locate(rand(1,300),rand(1,300),rand(1,5))
	if(Race=="Tsufurujin"|Class=="Tsufurujin")
		if(techskill>=150&&!GotBebi)
			contents+=new/obj/Bebi
			GotBebi=1
			usr<<"You have learned advanced Cybernetics. (New Skill in Skill tab.)"
	if(Race=="Bebi"|Class=="Bebi")
		if(Body>25) Body=25
		if(prob(10)) BebiGain()
	//Demon learning invisilibility at random...
	if(prob(0.01)&&Race=="Demon")
		var/learned=1
		for(var/obj/Skills/Invisibility/A in contents) learned=0
		if(learned) contents+=new/obj/Skills/Invisibility
	//Stats below 1 thing...
	if(Str<StrMod*1) Str=StrMod*1
	if(Spd<SpdMod*1) Spd=SpdMod*1
	if(End<EndMod*1) End=EndMod*1
	if(Pow<PowMod*1) Pow=PowMod*1
	if(Res<ResMod*1) Res=ResMod*1
	if(Offense<OffenseMod) Offense=OffenseMod
	if(Defense<DefenseMod) Defense=DefenseMod
	//Anger display text...
	if(CurrentAnger!=Emotion)
		CurrentAnger=Emotion
		view(usr)<<"<font color=#FF0000>[usr] appears [Emotion]"
	//If the King is dead...
	if(King_of_Vegeta==name) if(dead)
		usr<<"You are no longer King of Vegeta, since you are dead."
		King_of_Vegeta=null
	//Absorbtion decline...
	if(absorbadd>10000000&&!ssj) absorbadd*=0.9999
	if(prob(0.5)) if(!absorbable) absorbable=1
	//High damage / low energy notifiers
	if(!highdamage&&HP<=20)
		view(usr)<<"<font color=red>You notice [usr] has become highly damaged..."
		highdamage=1
	if(highdamage&&HP>20) highdamage=0
	if(!lowenergy&&Ki<=MaxKi*0.2)
		view(usr)<<"<font color=red>You notice [usr] has become very fatigued..."
		lowenergy=1
	if(lowenergy&&Ki>MaxKi*0.2) lowenergy=0
	//Consciousness probability...
	if(KO)
		regen=0
		if(prob(1*HPRegen)) Un_KO()
	if(HP<=0) spawn KO()
	//BP Ranking...
	if(prob(1)) spawn StatRank()
	//Majins
	if(Race=="Majin") if(MaxPLpcnt>=100) MaxPLpcnt=100
	//Shield
	if(shielding)
		if(Ki>=((MaxKi/2)/shieldskill))
			Ki-=((MaxKi/2)/shieldskill)
			for(var/obj/KiAttacks/Shield/S in contents)
				S.kixp+=0.2
				if(!S.firstfire)
					S.firstfire=1
					S.kinxt=kinxt
				if(S.kixp>=S.kinxt)
					S.kixp-=S.kinxt
					S.kilevel+=1
					S.kinxt+=kinxtadd
					Learn_Attack()
					usr<<"<font color=yellow>Shield level +1"
					shieldskill+=1
				S.suffix="Level [S.kilevel-2] ([round(S.kixp)]/[round(S.kinxt)])"
		else
			shielding=0
			blasting=0
			overlays-=shieldcolor
	//Prevents HP from going below 0
	if(HP<0) HP=0
	if(Ki<0) Ki=0
	//Finding stat percentages
	spawn Greatest_Stat()
	//Weighted Clothing
	refire=(orefire*weight)
	if(Baseweight/(Str+End)<1) weight=1
	else weight=(Baseweight/(Str+End))
	//Grand Kaio Planet Effect
	if(z==50&&Ki<MaxKi) Ki+=0.5
	//Dragonballs.
	if(prob(1))
		if(Earth_Guardian==key) GuardianPower=(MaxKi*500)
		if(Namekian_Elder==key) ElderPower=(MaxKi*500)
		var/Edbs=0
		var/Ndbs=0
		if(eactive) for(var/obj/items/dbs/edbs/E in oview(1))
			if(E.name=="edb1") Edbs+=1
			if(E.name=="edb2") Edbs+=1
			if(E.name=="edb3") Edbs+=1
			if(E.name=="edb4") Edbs+=1
			if(E.name=="edb5") Edbs+=1
			if(E.name=="edb6") Edbs+=1
			if(E.name=="edb7") Edbs+=1
		if(nactive) for(var/obj/items/dbs/ndbs/E in oview(1))
			if(E.name=="ndb1") Ndbs+=1
			if(E.name=="ndb2") Ndbs+=1
			if(E.name=="ndb3") Ndbs+=1
			if(E.name=="ndb4") Ndbs+=1
			if(E.name=="ndb5") Ndbs+=1
			if(E.name=="ndb6") Ndbs+=1
			if(E.name=="ndb7") Ndbs+=1
		if(Edbs==7&&eactive&&!hasshenron)
			contents+=new/obj/DB/EDB
			hasshenron=1
		else if(Edbs!=7|!eactive) for(var/obj/DB/EDB/E in contents)
			hasshenron=0
			del(E)
		if(Ndbs==7&&nactive&&!hasporunga)
			contents+=new/obj/DB/NDB
			hasporunga=1
		else if(Ndbs!=7|!nactive) for(var/obj/DB/NDB/N in contents)
			hasporunga=0
			del(N)
	//Makes sure that the Supreme Kaio can grant Mystic indefinitely.
	if(prob(1)) if(Supreme_Kaio==key) mystified=0
	//Enslavement for Demon Lord
	if(prob(1)) if(Demon_Lord==key) enslaved=0
	//Ki Burst
	if(burst)
		if(Ki>=1) Ki*=0.995
		else
			usr.Pow/=3
			usr.absorbadd=0
			usr<<"You stop using ki burst, you are too tired..."
			burst=0

	//Third Eye
	if(Race=="Human"&&PL>geteye&&kimanip>150&&!thirdeye&&cangeteye)
		geteye=0 //Disables getting it again
		ThirdEye()
		usr<<"You have managed to awaken your third eye."
	//Regenerate
	if(regen)
		if(Ki>=0.5|KO)
			Ki-=0.5
			if(HP<100) HP+=(0.5*HPRegen)
			if(PLpcnt>5) PLpcnt-=1
		else
			usr<<"You are too exhausted to regenerate"
			regen=0
	//Power Up
	if(powerup==1)
		if(Ki>=0.1&&!KO)
			if(PLpcnt<MaxPLpcnt)
				Ki-=0.05
				if(PLpcnt>=1) PLpcnt+=(0.25*KiRegen)
				else PLpcnt+=(0.005*KiRegen)
			Increase_Powerup()
			if(PLpcnt>MaxPLpcnt) PLpcnt=MaxPLpcnt
		else
			usr<<"You are too tired to power up."
			underlays-=AURA
			overlays-=AURA
			overlays-='SSj Aura.dmi'
			overlays-='SSj Aura.dmi'
			underlays-='Aura SSj3.dmi'
			underlays-=ssj4aura
			powerup=0
	else if(powerup==2)
		if(Ki>=0.15&&!KO)
			if(PLpcnt<MaxPLpcnt)
				Ki-=0.15
				PLpcnt+=(0.75*KiRegen)
			Increase_Powerup()
			Increase_Powerup()
			Increase_Powerup()
			if(PLpcnt>MaxPLpcnt) PLpcnt=MaxPLpcnt
		else
			usr<<"You are too tired to power up."
			underlays-=AURA
			overlays-=AURA
			overlays-='SSj Aura.dmi'
			overlays-='SSj Aura.dmi'
			underlays-='Aura SSj3.dmi'
			underlays-=ssj4aura
			powerup=0
	//Power Down
	if(powerdown&&!powerup&&PLpcnt>0.01&&!KO)
		PLpcnt*=0.98
		Increase_Powerup()
		Increase_Powerup()
		Increase_Powerup()
	//Beyond 100% Drain
	if(!KO&&PLpcnt>100)
		if(Ki>=1) Ki-=(0.005*(PLpcnt-100)*(PLpcnt-100)*(1/KiRegen))
		else
			Ki=1
			PLpcnt=100
			powerup=0
			underlays-=AURA
			overlays-=AURA
			overlays-='SSj Aura.dmi'
			overlays-='SSj Aura.dmi'
			underlays-='SNj Elec.dmi'
			underlays-='SNj Elec.dmi'
			underlays-='Aura SSj3.dmi'
			underlays-=ssj4aura
			if(Race=="Saiyan"|Race=="Half-Saiyan") Revert()
			usr<<"You are too tired to hold the energy you gathered, your energy levels return to normal."
	if(Ki>MaxKi*1.1) Ki*=0.995
	if(HP>110) HP*=0.995
	//Train
	if(train)
		if(Ki>=(1/KiRegen)*weight*weight&&!KO&&!Oozarou)
			Ki-=(1/KiRegen)*weight*weight
			Train_Gain()
		else
			usr<<"You stop training."
			icon_state=""
			train=0
			move=1
	//Meditate
	var/agemult=1
	if(med) if(!train&&!KO)
		Med_Gain()
		if(HP<100)
			if(Age>=DeclineAge) agemult=Body/25
			HP+=0.4*HPRegen*agemult
			if(prob(15))
				Zenkai()
		if(Ki<MaxKi&&!burst&&!expandlevel)
			if(dead)
				if(z==1|z==2|z==3|z==4|z==5|z==6|z==7|z==8|z==9|z==11|z==15|z==19|z==20)
				else Ki+=(((MaxKi/250)+0.3)*KiRegen)
			if(Race=="Demon"|Race=="Saiyan"|Race=="Half-Saiyan"|Race=="Quarter-Saiyan"|Race=="Demi-God"|Race=="Hybrid"|Race=="Ancient Namek"|Race=="Majin"|Race=="Bio-Android"|Race=="Human"|Race=="Namek"|Race=="Arconian"|Race=="Makyojin"|Race=="Spirit Doll"|Race=="Android"|Race=="Tsufu"|Race=="Changeling"|Race=="Human"|Race=="Spirit Doll"|Race=="Tsufurujin")
				if(z==16)
				else Ki+=(((MaxKi/250)+0.3)*KiRegen)
			if(Race=="Kai"|Race=="Saiyan"|Race=="Half-Saiyan"|Race=="Quarter-Saiyan"|Race=="Demi-God"|Race=="Hybrid"|Race=="Ancient Namek"|Race=="Majin"|Race=="Bio-Android"|Race=="Human"|Race=="Namek"|Race=="Arconian"|Race=="Makyojin"|Race=="Spirit Doll"|Race=="Android"|Race=="Tsufu"|Race=="Changeling"|Race=="Human"|Race=="Spirit Doll"|Race=="Tsufurujin")
				if(z==17)
				else Ki+=(((MaxKi/250)+0.3)*KiRegen)
			else Ki+=(((MaxKi/250)+0.3)*KiRegen)
			if(Ki>MaxKi) Ki=MaxKi
		if(Oozarou)
			med=0
			move=1
			usr<<"You are forced to stop meditating."
	//Gravity
	if(planetgrav<1) planetgrav=1
	if(gravmult<0) gravmult=0
	Grav()
	//Flight
	if(flight)
		if(Ki>MaxKi*0.05)
			if(icon_state!="Flight") icon_state="Flight"
			Flight_Gain()
			Ki-=5+(MaxKi*(0.2/flightskill/KiMod))
			flightskill+=(0.3*flightmod)
			if(Ki<0) Ki=0
		else
			usr<<"You stop flying."
			if(flight) step(usr,SOUTH)
			density=1
			flight=0
			med=0
			train=0
			move=1
			Ki=0
			if(Savable) icon_state=""
	//Healing
	if(!KO)
		if(HP<100)
			if(Age>=DeclineAge) agemult=Body/25
//			if(z==22) HP+=0.4*HPRegen //GK's
			HP+=0.2*HPRegen*agemult*agemult
			if(prob(15))
				Zenkai()
		if(!train&&!blasting&&!burst&&!expandlevel&&PLpcnt<=100)
			if(dead)
				if(z==1|z==2|z==3|z==4|z==5|z==6|z==7|z==8|z==9|z==11|z==15|z==19|z==20)
				else if(Ki<MaxKi)
					Ki+=(MaxKi/500)*KiRegen
//					if(z==22) Ki+=(MaxKi/250)*KiRegen //GK's
					if(Ki>MaxKi) Ki=MaxKi
			else if(Race=="Demon"|Race=="Saiyan"|Race=="Half-Saiyan"|Race=="Quarter-Saiyan"|Race=="Demi-God"|Race=="Hybrid"|Race=="Ancient Namek"|Race=="Majin"|Race=="Bio-Android"|Race=="Human"|Race=="Namek"|Race=="Arconian"|Race=="Makyojin"|Race=="Spirit Doll"|Race=="Android"|Race=="Tsufu"|Race=="Changeling"|Race=="Human"|Race=="Spirit Doll"|Race=="Tsufurujin")
				if(z==16)
				else if(Ki<MaxKi)
					Ki+=(MaxKi/500)*KiRegen
					if(Ki>MaxKi) Ki=MaxKi
			else if(Race=="Kai"|Race=="Saiyan"|Race=="Half-Saiyan"|Race=="Quarter-Saiyan"|Race=="Demi-God"|Race=="Hybrid"|Race=="Ancient Namek"|Race=="Majin"|Race=="Bio-Android"|Race=="Human"|Race=="Namek"|Race=="Arconian"|Race=="Makyojin"|Race=="Spirit Doll"|Race=="Android"|Race=="Tsufu"|Race=="Changeling"|Race=="Human"|Race=="Spirit Doll"|Race=="Tsufurujin")
				if(z==17)
				else if(Ki<MaxKi)
					Ki+=(MaxKi/500)*KiRegen
					if(Ki>MaxKi) Ki=MaxKi
			else if(Ki<MaxKi)
				Ki+=(MaxKi/500)*KiRegen
//				if(z==22) Ki+=(MaxKi/250)*KiRegen //GK's
				if(Ki>MaxKi) Ki=MaxKi
	if(HP<0) HP=0
	//Beer wearing off...
	if(Beer>4) Beer=4
	if(prob(2)&&Beer) Beer-=1
	if(Beer<0) Beer=0
	//Senzu wearing off...
	if(Senzu>4) Senzu=4
	if(prob(2)&&Senzu) Senzu-=1
	if(Senzu<0) Senzu=0
	//Auto Gain
	Auto_Gain()
	//Super Saiyan Drain
	if(Race=="Saiyan"|Race=="Half-Saiyan") if(ssj==1|ssj==2)
		if(Ki>=MaxKi/ssjdrain)
			if(ssjdrain<300)
				if(!ismystic) Ki-=MaxKi/ssjdrain
				if(!legendary) ssjdrain+=0.02*ssjmod
				if(legendary) ssjdrain+=0.01*ssjmod
				if(legendary) RecordPL+=PLMod*ssjmod
			if(Ki<=10&&ssjdrain<300)
				Revert()
				usr<<"You are too tired to sustain your form."
	//Super Saiyan 2 Drain
	if(Race=="Saiyan"|Race=="Half-Saiyan") if(ssj==2) if(Ki>=MaxKi/ssj2drain)
		if(ssj2drain<300)
			if(!ismystic) Ki-=(MaxKi/ssj2drain)
			ssj2drain+=(0.02*ssj2mod)
			RecordPL+=PLMod*ssj2mod
		if(Ki<=(MaxKi/100))
			Revert()
			usr<<"You are too tired to sustain your form."
		if(!ismystic) Ki-=(MaxKi/300)
	//Super Saiyan 3 Drain
	if(Race=="Saiyan"|Race=="Half-Saiyan") if(ssj==3) if(Ki+1>=MaxKi/ssj3drain)
		if(ssj3drain<300)
			Ki-=MaxKi/ssj3drain
			ssj3drain+=0.02*ssj3mod
			RecordPL+=PLMod*ssj3mod
		if(Ki<=(MaxKi/100))
			Revert()
			usr<<"You are too tired to sustain your form."
		Ki-=MaxKi/150
	//Cell Drain
	if(Race=="Bio-Android"&&ssj)
		if(Ki>=MaxKi/ssjdrain)
			if(!ismystic) Ki-=(MaxKi/cell4drain)
			if(Ki<=10)
				Revert()
				usr<<"You are too tired to sustain your form."
		else Revert()
	//Anger Decline
	if(Anger>MaxAnger*2) Anger=MaxAnger*2
	if(Anger>100) Anger-=((MaxAnger-100)/100)
	if(Anger<100) Anger=100
	if(Anger<(((MaxAnger-100)/5)+100)) Emotion="Calm"
	if(Anger>(((MaxAnger-100)/5)+100)) Emotion="Annoyed"
	if(Anger>(((MaxAnger-100)/2.5)+100)) Emotion="Slightly Angry"
	if(Anger>(((MaxAnger-100)/1.66)+100)) Emotion="Angry"
	if(Anger>(((MaxAnger-100)/1.25)+100)) Emotion="Very Angry"
	//BP Percent Protection
	if(PLpcnt<0.01) PLpcnt=0.01
	//Power Correction
	if(dead&&!KeepsBody&&PL<10000000) PLpcnt=1
	if(techrate)
		if(absorbadd<20000*(techrate**2)) absorbadd=20000*(techrate**2)
		if(Race=="Android") if(absorbadd<40000*(techrate**2)) absorbadd=40000*(techrate**2)
	MaxPL=BasePL
	BasePL=(RecordPL*Body)/weight
	var/energypercent=(Ki/MaxKi)
	var/healthpercent=(HP/100)
	var/percentfinal=energypercent*healthpercent
	PL=percentfinal*(((MaxPL+absorbadd/*+KaiokenBP*/)*(PLpcnt/100))*(Anger/100))
	//Faction update
	if(prob(0.1)) spawn FactionUpdate()
	//Contacts
	if(prob(0.5)) for(var/mob/M in oview()) if(M.client)
		//Gain inheriting.
		if(M.gain>gain*1.2&&M.RecordPL/M.PLMod>RecordPL/PLMod) if(M.blasting|M.attacking|M.HP<50|M.flight)
			usr<<"<font color=#FFFF00>After seeing [M]'s power, you feel a little more motivated."
			gain=M.gain
		//----------------
		for(var/obj/Contact/A in contents) if(A.name=="[M.name] ([M.displaykey])")
			A.familiarity+=1
			A.icon=M.icon
			A.overlays=M.overlays
			A.suffix="[A.familiarity] / [A.relation]"
			if(A.relation=="Rival/Bad"&&M.ssj&&!rivalisssj&&!hasssj)
				usr<<"Your hate and humiliation grow as your rival has done what you could not, they have become a Super Saiyan."
				rivalisssj=1
			if(A.relation=="Rival/Good"&&M.ssj&&!rivalisssj&&!hasssj)
				usr<<"You become a little more determined from seeing your rival as a Super Saiyan."
				rivalisssj=1
	//Kaioken
	if(KaiokenLevel>0)
		if(prob(0.05))
			KaiokenMastery+=1
			usr<<"You feel the strain of Kaioken getting easier."
	//RoSaT
	if(z==19)
		HBTCTime-=1
		if(HBTCTime==500) usr<<"You have been in the Time Chamber for 360 days."
		if(HBTCTime==1000) usr<<"You have been in the Time Chamber for 330 days."
		if(HBTCTime==1500) usr<<"You have been in the Time Chamber for 300 days."
		if(HBTCTime==2000) usr<<"You have been in the Time Chamber for 270 days."
		if(HBTCTime==2500) usr<<"You have been in the Time Chamber for 240 days."
		if(HBTCTime==3000) usr<<"You have been in the Time Chamber for 210 days."
		if(HBTCTime==3500) usr<<"You have been in the Time Chamber for 180 days."
		if(HBTCTime==4000) usr<<"You have been in the Time Chamber for 150 days."
		if(HBTCTime==4500) usr<<"You have been in the Time Chamber for 120 days."
		if(HBTCTime==5000) usr<<"You have been in the Time Chamber for 90 days."
		if(HBTCTime==5500) usr<<"You have been in the Time Chamber for 60 days."
		if(HBTCTime==6000) usr<<"You have been in the Time Chamber for 30 days."
		if(!HBTCTime)
			loc=locate(50,337,35)
			usr<<"You have spent an entire year in the room."
			Age+=1
			SAge+=1
	else HBTCMod=1
	sleep(10)
mob/Stat() if(statstab&&Created)
	statpanel("Status")
	if(showstats)
		if(Race=="Android"|Race=="Bebi"|Race=="Cyborg") stat("Battle Power","[num2text(round(PL),20)] ( [round(PLpcnt,0.1)]% )")
		else stat("Battle Power","[round(PLpcnt,0.1)]%")
		stat("Health","[round(HP)]%")
		if(Race=="Android"|Race=="Bebi"|Race=="Cyborg") stat("Energy","[round(Ki*1)] ( [round((Ki/MaxKi)*100,0.1)]% )")
		else stat("Energy","[round((Ki/MaxKi)*100,0.1)]%")
	else if(Race=="Android"|Race=="Bebi"|Race=="Cyborg") stat("Battle Power","[num2text(round(PL),20)] ( [round(PLpcnt,0.1)]% )")
	if(showstats&&viewstats)
		stat("Strength","[round((Str*1)-(StrMod*1))]")
		stat("Endurance","[round((End*1)-(EndMod*1))]")
		stat("Force","[round((Pow*1)-(PowMod*1))]")
		stat("Resistance","[round((Res*1)-(ResMod*1))]")
		stat("Speed","[round((Spd*1)-(SpdMod*1))]")
		stat("Offense","[round((Offense)-(OffenseMod*1))]")
		stat("Defense","[round((Defense)-(DefenseMod*1))]")
	if(!showstats&&viewstats)
		stat("Strength","[round(strpcnt,0.1)]%")
		stat("Endurance","[round(endpcnt,0.1)]%")
		stat("Force","[round(powpcnt,0.1)]%")
		stat("Resistance","[round(respcnt,0.1)]%")
		stat("Speed","[round(spdpcnt,0.1)]%")
		stat("Offense","[round(offpcnt,0.1)]%")
		stat("Defense","[round(defpcnt,0.1)]%")
	if(techrate) stat("Class","[techrate] [Race]")
	stat("Gravity","[planetgrav+gravmult] ([round(GravMastered)] Mastered)")
	stat("Location","( [x] )( [y] )( [z] )")
	if(Admin) stat("Processor","[world.cpu]%")
	for(var/obj/Contact/A in contents)
		statpanel("Contacts")
		stat(A)
	for(var/obj/Creatables/A in contents)
		statpanel("Create")
		stat(A)
	for(var/obj/blastchoice/A in contents)
		statpanel("Blast Choice")
		stat(A)
	for(var/obj/beamchoice/A in contents)
		statpanel("Blast Choice")
		stat(A)
	for(var/obj/chargechoice/A in contents)
		statpanel("Charge Choice")
		stat(A)
	for(var/obj/Zenni/A in contents)
		statpanel("Items")
		stat(A)
	for(var/obj/items/O in contents)
		statpanel("Items")
		stat(O)
	for(var/obj/KiAttacks/K in contents)
		statpanel("Ki")
		stat(K)
	if(buildon&&buildable)
		for(var/obj/buildables/A in contents)
			statpanel("Build")
			stat(A)
	for(var/obj/Faction/F in contents)
		statpanel("Factions")
		stat(F)
	//Zenni update
	for(var/obj/Zenni/A in contents) A.suffix="[num2text(zenni,20)]"
mob/verb/CharacterInfo()
	set category="Other"
	usr<<"<font color=#00FFFF>[RaceDescription]"
	usr<<"*Extra Character Info*"
	usr<<"History: [History]"
	usr<<"Personality: [Personality]"
	usr<<"Physical Age: [round(Age)]"
	usr<<"True Age: [round(SAge)]"
	usr<<"You can lift [round((Str+End)*5)] pounds maximum (Give out this info OOCly and you will be punished)"
	usr<<"Tech skill: [techskill] ([round(techxp)] / [round((10*(techskill**2))/techmod)])"
	usr<<"It is month [round((Year-round(Year))*12)] of year [round(Year)]"
mob/var
	statstab=1
	immortal=0
	AgeStatus="Young"
	Age=1
	SAge=1
	InclineAge=25
	DeclineAge=50
	Body=1
	hair
	ssjhair
	ssjfphair
	ussjhair
	ssj2hair
	ssj3hair
	AuraColor="Red"
	HairR=0
	HairG=0
	HairB=0
	Race="None"
	Class="None"
	Emotion="Calm"
	Height="None"
	PL=100
	MaxPL=100
	BasePL=100
	RecordPL=100
	HP=100
	Ki=0.1
	MaxKi=0.1
	Pow=0.1
	Str=0.1
	Spd=0.1
	End=0.1 //Resistance to physical attacks
	Res=0.1 //Resistance to spiritual attacks, not yet implemented
	Offense=0.1
	Defense=0.1
	GravMastered=1
	PLpcnt=100
	MaxPLpcnt=110
	Anger=100
	MaxAnger=120
/*---------------------------------------------------------------------*/
	PLMod=1
	KiMod=1
	PowMod=1
	StrMod=1
	SpdMod=1
	EndMod=1
	ResMod=1
	OffenseMod=1
	DefenseMod=1
	HPRegen=1
	KiRegen=1
	GravMod=1
	ZenkaiMod=1
	Zenkai=500 //The going multiplication rate for Zenkai.
	MedMod=1
	TrainMod=1
	SparMod=2
/*---------------------------------------------------------------------*/
	displaykey //The key that will be displayed in OOC and Who
	Oozarou=0
	gain=0
	zenni=0
	player=0
	monster=0
	attackable=0
	pgender="None"
	oicon
	Admin=0
	blastR=0
	blastG=0
	blastB=0
	Tail=1
var/gainget=0.000000001
var/GG=0.000002
var/worldtime=1 //This is the amount of time the world has been running
mob/var/timemult=1
proc/Save_Gain()
	var/savefile/S=new("GAIN")
	S["GAIN"]<<GG
	S["STATS"]<<showstats
	S["Time"]<<worldtime
proc/Load_Gain()
	if(fexists("GAIN"))
		var/savefile/S=new("GAIN")
		S["GAIN"]>>GG
		S["STATS"]>>showstats
		S["Time"]>>worldtime
mob/var/StatRank=1
mob/var/BPRank=1
mob/proc/StatRank()
	//Stat Ranks
	var/StrongerStats=1
	for(var/mob/A) if(A.client)
		var/TheirStats=(A.Str)+(A.End)+(A.Spd)+(A.Res)+(A.Pow)+(A.Offense)+(A.Defense)
		var/YourStats=(Str)+(End)+(Spd)+(Res)+(Pow)+(Offense)+(Defense)
		if(TheirStats>YourStats) StrongerStats+=1
	StatRank=StrongerStats
	//BP Ranks
	var/StrongerBPs=1
	for(var/mob/A) if(A.client) if(A.RecordPL>RecordPL) StrongerBPs+=1
	BPRank=StrongerBPs
mob/var/PowerRanks={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
Name: ( BP Rank ) ( Stat Rank )
</body><html>"}
mob/Admin2/verb/PowerRanks()
	set category="Admin"
	for(var/mob/M) if(M.client) PowerRanks+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
<br>[M.name]: ( [M.BPRank] ) ( [M.StatRank] )
</body><html>"}
	usr<<browse(PowerRanks,"window=...;size=400x400")
	PowerRanks={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
Name: ( BP Rank ) ( Stat Rank )
</body><html>"}
