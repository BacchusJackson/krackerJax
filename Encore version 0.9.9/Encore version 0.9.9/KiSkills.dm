obj/Skills/Planet_Destroy/verb/Planet_Destroy()
	set category="Skills"
	for(var/turf/T in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,usr.z))) if(T.type==/turf)
		usr<<"You cannot planet destroy this because it isnt a planet."
		return
	if(usr.Ki>=1000)
		usr.Ki-=1000
		switch(input("Destroy this planet?","",text) in list("No","Yes"))
			if("Yes")
				var/zz=usr.z
				view(usr)<<"<font color=yellow>*[usr] begins focusing their energy on destroying the planet!*"
				var/obj/attack/blast/A=new/obj/attack/blast
				A.icon='15.dmi'
				A.icon_state="15"
				A.density=1
				A.loc=locate(usr.x,usr.y+1,usr.z)
				sleep(300)
				flick('Zanzoken.dmi',usr)
				if(A)
					A.icon='16.dmi'
					A.icon_state="16"
					sleep(10)
					walk(A,SOUTH,3)
					spawn(30) if(A)
						var/obj/B=new/obj
						B.icon='Giant Hole.dmi'
						B.loc=A.loc
						del(A)
				spawn(600) for(var/mob/M) if(M.z==zz) M.Quake()
				spawn(1200) for(var/turf/T in block(locate(1,1,zz),locate(world.maxx,world.maxy,zz)))
					if(prob(1)) sleep(1)
					if(prob(0.5)) new/obj/BigCrater(T)
					else if(prob(0.5))
						new/obj/Lightning(T)
						new/obj/Lightning(locate(T.x,T.y+1,zz))
						new/obj/Lightning(locate(T.x,T.y-1,zz))
					else if(prob(0.5))
						new/obj/Tornado(T)
						new/obj/Tornado(locate(T.x,T.y+1,zz))
						new/obj/Tornado(locate(T.x,T.y-1,zz))
					else if(prob(0.5)) new/obj/Explosion(T)
				spawn(1800) while(prob(90)) for(var/turf/T in block(locate(1,1,zz),locate(world.maxx,world.maxy,zz)))
					if(!istype(T,/turf/Special/Teleporter))
						if(prob(1)) sleep(1)
						if(prob(50)) new/turf/Water7(T)
						else if(prob(50)) new/turf/Ground8(T)
				spawn(2400) while(prob(90)) for(var/turf/T in block(locate(1,1,zz),locate(world.maxx,world.maxy,zz)))
					if(prob(1)) sleep(1)
					if(prob(70)) new/turf/Other/Stars(T)
				for(var/turf/T in block(locate(1,1,usr.z),locate(world.maxx,world.maxy,zz))) if(istype(T,/turf/Water7)) new/turf/Ground8(T)
				spawn(3600) for(var/turf/Other/Stars/T) if(T.z==zz) new/turf/Ground8(T)
	else usr<<"You do not have enough energy."


mob/var/hasshunkan=0
mob/var
	haszanzo=0
	zanzoskill=1
	zanzomod=1
turf/Click(turf/T)
	if(!usr.observingnow&&!usr.BebiAbsorber)
		if(T) if(T.icon)
			if(!usr.explosionon)
				for(var/turf/A in view(0,usr)) if(A==src) return
				if(!istype(T,/turf/buildables/SecurityWall)&&!istype(T,/turf/buildables/SecurityDoor)&&!T.density)
					if(usr.move&&!usr.Oozarou&&!usr.KB&&!usr.blasting&&usr.haszanzo&&!usr.KO&&!usr.med&&!usr.train&&usr.Ki>=(5/usr.zanzoskill))
						flick('Zanzoken.dmi',usr)
						var/formerdir=usr.dir
						usr.Move(src)
						usr.dir=formerdir
						usr.Ki-=(5/usr.zanzoskill)
						usr.zanzoskill+=(0.1*usr.zanzomod)
						if(usr.Ki<0) usr.Ki=0
					else if(usr.blasting&&usr.ITskill>=10&&!usr.KO&&!usr.med&&!usr.train&&usr.Ki>=usr.MaxKi*0.2)
						flick('Zanzoken.dmi',usr)
						usr.invisibility+=1
						sleep(10)
						usr.Ki-=usr.MaxKi*0.2
						var/formerdir=usr.dir
						usr.Move(src)
						usr.dir=formerdir
						usr.dir=turn(usr.dir,180)
						usr.invisibility-=1
						flick('Zanzoken.dmi',usr)
			else if(usr.Ki>=5)
				if(T.type!=/turf/buildables/SecurityDoor&&T.type!=/turf/buildables/SecurityWall&&T.type!=/turf/Special/Teleporter)
					if(!usr.usingexplosion)
						usr.Ki-=5
						usr.usingexplosion=1
						T.overlays+='Ki Explosion.dmi'
						spawn(5) T.overlays-='Ki Explosion.dmi'
						for(var/mob/M in view(0,T)) if(!M.flight)
							var/dmg1=((usr.PL+1)/(M.PL+1))
							var/dmg2=(usr.Pow/M.End)
							var/dmg=(dmg1*dmg2)
							dmg*=rand(10,20)
							M.HP-=dmg
							M<<"You are hit by [usr]'s Explosion!"
							var/kbdist=dmg
							if(kbdist>50) kbdist=50
							if(M) M.dir=turn(M.dir,180)
							spawn while(kbdist>=1)
								if(M) step(M,M.dir)
								sleep(1)
								kbdist-=1
							if(M.HP<=0)
								if(usr.KiSet) M.Death()
								else M.KO()
						//Radius
						var/LEVEL
						for(var/obj/KiAttacks/Explosion/A in usr.contents) LEVEL=round(A.setting-1)
						for(var/turf/A in orange(round(LEVEL*0.1),T))
							if(prob(3)) sleep(1)
							if(A.type!=/turf/buildables/SecurityDoor&&A.type!=/turf/buildables/SecurityWall&&A.type!=/turf/Special/Teleporter)
								A.density=0
								A.overlays+='Ki Explosion.dmi'
								spawn(5) A.overlays-='Ki Explosion.dmi'
								for(var/obj/buildables/Y in view(0,A)) del(Y)
								spawn(5) new/turf/Ground8(locate(A.x,A.y,A.z))
								for(var/mob/M in view(0,A)) if(!M.flight)
									var/dmg1=((usr.PL+1)/(M.PL+1))
									var/dmg2=(usr.Pow/M.End)
									var/dmg=(dmg1*dmg2)
									dmg*=rand(10,20)
									M.HP-=dmg
									M<<"You are hit by [usr]'s Explosion!"
									var/kbdist=dmg
									if(kbdist>50) kbdist=50
									M.dir=turn(M.dir,180)
									spawn while(kbdist>=1)
										if(M) step(M,M.dir)
										sleep(1)
										kbdist-=1
									if(M.HP<=0)
										if(usr.KiSet) M.Death()
										else M.KO()
						for(var/obj/KiAttacks/Explosion/A in usr.contents)
							A.kixp+=13.5
							if(!A.firstfire)
								A.firstfire=1
								A.kinxt=usr.kinxt
							while(A.kixp>=A.kinxt)
								A.kixp-=A.kinxt
								if(A.setting==A.kilevel) A.setting+=1
								A.kilevel+=1
								A.kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<font color=yellow>Explosion level +1"
							A.suffix="Level [A.kilevel-2] ([round(A.kixp)]/[round(A.kinxt)])"
						sleep(usr.refire*3)
						if(usr) usr.usingexplosion=0
			else usr<<"You do not have enough energy."
mob/var/flight=0
mob/var
	flightskill=1
	flightmod=1
obj/Skills/Fly
	verb/Fly()
		set category="Skills"
		if(usr.flightskill>=1) if(!usr.KO&&!usr.med&&!usr.train)
			if(!usr.flight)
				if(usr.Ki>=((usr.MaxKi/10)/usr.flightskill))
					usr.flight=1
					step(usr,NORTH)
					usr<<"You start to hover."
					if(usr.Savable) usr.icon_state="Flight"
				else usr<<"You are too tired to fly."
			else
				step(usr,SOUTH)
				usr.density=1
				usr.flight=0
				if(usr.Savable) usr.icon_state=""
				usr<<"You land back on the ground."
mob/proc/Flight_Gain()
	var/gravincrease
	if(planetgrav*gravmult<GravMastered) gravincrease=(GravMastered/10)+1
	else gravincrease=(planetgrav*gravmult/10)+1
	RecordPL+=1.5*BPRank*GG*gain*PLMod*gravincrease*HBTCMod*disciplemod*weight*StatRank
	MaxKi+=0.003*KiMod*timemult
	kimanip+=0.001*kimanipmod
	if(prob(10))
		gain+=gainget*timemult*StatRank/4
/*
Namekian fusion gives 50% more than unlock potential but its all in BP.
It can be done 2 times maximum.
*/
mob/var/Nfuse=0
mob/var
	fusee1
	fusee2
obj/Skills/Namekian_Fusion/verb/Namekian_Fusion()
	set category="Skills"
	var/mob/M=input("Who?") as null|mob in oview(1)
	if(!M) return
	if(M.Race!=usr.Race) return
	if(M==usr) return
	if(M.Nfuse>=2) usr<<"They have already fused too many times."
	switch(input(M,"[usr] wishes to do a namekian fusion with you, you will receive the offerer's power. You can only fuse with someone 2 times.", "", text) in list ("No", "Yes",))
		if("Yes")
			if(usr.fusee1!=M&&usr.fusee2!=M)
				view(9)<<"<font color=yellow>[usr] fuses with [M]!"
				M.RecordPL=(usr.RecordPL+M.RecordPL)/1.3
				M.Nfuse+=1
				if(!usr.fusee1) usr.fusee1=M
				else if(!usr.fusee2) usr.fusee2=M
				usr.Death()
			else usr<<"You cannot fuse with the same person twice."
obj/Skills/Kaio_Revive/verb/Kaio_Revive(mob/M in world)
	set category="Skills"
	if(!usr.dead)
		if(M==usr) usr<<"You cannot revive yourself."
		else if(M.dead)
			switch(input(usr,"This will revive one dead person and bring them back to your location,","",text) in list ("No","Yes",))
				if("Yes")
					usr<<"You revive [M] and bring them to your location!"
					M.dead=0
					M.overlays-='Obj Halo.dmi'
					M<<"[usr] has brought you back to the living world!"
					M.loc=locate(usr.x,usr.y,usr.z)
		else usr<<"They are not dead."
	else usr<<"You must be alive to revive someone."
mob/var/tmp
	IT=0
mob/var
	ITskill=1
	ITMod=1
obj/Skills/Shunkan_Ido
	verb
		Shunkan_Ido(mob/V in world)
			set category="Skills"
			var/approved
			for(var/obj/Contact/A in usr.contents) if(A.name=="[V.name] ([V.displaykey])") approved=1
			if(Supreme_Kaio!=usr.key&&North_Kaio!=usr.key&&South_Kaio!=usr.key&&East_Kaio!=usr.key&&West_Kaio!=usr.key)
				if(usr.z==15|usr.z==16|usr.z==19|usr.z==17|usr.z==18|usr.z==21|usr.z==22)
					usr<<"This ability wont work here."
					return
			if(!usr.KO)
				if(V.z==15|V.z==16|V.z==17|V.z==18|V.z==19|V.z==21|V.z==22) usr<<"You cannot reach them wherever they are..."
				else if(approved)
					if(!usr.IT&&usr.Ki>=(usr.MaxKi/usr.ITskill))
						usr.IT=1
						usr<<"You try to locate [V]'s energy signature... This might take a minute."
						oview(usr)<<"[usr] puts their fingers to his forehead as they try to concentrate..."
						usr.move=0
						sleep(500/usr.ITskill)
						usr.Ki-=(usr.MaxKi/usr.ITskill)
						usr.ITskill+=(0.1*usr.ITMod)
						if(!usr.KO&&!usr.med&&!usr.train) usr.move=0
						else usr.move=1
						if(V.PL<30000000/usr.ITskill&&V.z!=usr.z) usr<<"They are too weak for you to sense from here, they must be on another planet..."
						else
							usr<<"You found them..."
							oview(usr)<<"[usr] disappears in a flash!"
							for(var/mob/M in oview(1)) if(M.player)
								M.loc=V.loc
								M.x-=2
								M<<"[usr] brings you with them using Shunkan Ido..."
							usr.loc=V.loc
							usr.x-=1
							view(usr)<<"[usr] appears in an instant!"
						usr.IT=0
obj/Skills/Observe/verb/Observe(mob/M in world) //Makes it so an non-admin can observe players/NPC without interferring
	set category="Skills"
	usr.observingnow=1
	usr.client.perspective=EYE_PERSPECTIVE
	usr.client.eye=M
obj/Skills/Teleport/verb/Kaio_Teleport()
	set category="Skills"
	if(Supreme_Kaio!=usr.key&&North_Kaio!=usr.key&&South_Kaio!=usr.key&&East_Kaio!=usr.key&&West_Kaio!=usr.key)
		if(usr.z==17)
			usr<<"This ability wont work here."
			return
	if(!usr.KO&&usr.Ki>=usr.MaxKi)
		usr.Ki=0
		view(6)<<"[usr] seems to be concentrating, they suddenly disappear!"
		var/xx
		var/yy
		var/zz
		switch(input("Choose Destination", "", text) in list ("Android Ship","Earth","Namek","Vegeta","Changeling Planet","Arconia","Checkpoint","Heaven","Space Station","Jungle Planet","Desert Planet","Sky World","Nevermind",))
			if("Android Ship")
				xx=63
				yy=308
				zz=8
			if("Earth")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=1
			if("Namek")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=3
			if("Vegeta")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=4
			if("Arconia")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=5
			if("Changeling Planet")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=6
			if("Checkpoint")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=15
			if("Heaven")
				xx=rand(50,60)
				yy=310
				zz=16
			if("Space Station")
				xx=170
				yy=215
				zz=9
			if("Jungle Planet")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=10
			if("Desert Planet")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=12
			if("Sky World")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=11
			if("Nevermind") return
		for(var/mob/V in oview(1))
			if(V.player)
				V.loc=locate(xx,yy,zz)
				V.x-=1
				V<<"[usr] brings you with them using teleportation."
		usr.x=xx
		usr.y=yy
		usr.z=zz
		view(6)<<"[usr] appears in an instant using teleport."
	else usr<<"You need full ki to use this."
obj/Skills/DTeleport/verb/Daemon_Teleport()
	set category="Skills"
	if(!usr.KO&&usr.Ki>=usr.MaxKi)
		usr.Ki=0
		view(6)<<"[usr] seems to be concentrating, they suddenly disappear!"
		var/xx
		var/yy
		var/zz
		switch(input("Choose Destination", "", text) in list ("Android Ship","Earth","Namek","Vegeta","Changeling Planet","Arconia","Checkpoint","Hell","Space Station","Jungle Planet","Desert Planet","Sky World","Nevermind",))
			if("Android Ship")
				xx=63
				yy=308
				zz=8
			if("Earth")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=1
			if("Namek")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=3
			if("Vegeta")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=4
			if("Arconia")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=5
			if("Changeling Planet")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=6
			if("Checkpoint")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=15
			if("Hell")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=17
			if("Space Station")
				xx=170
				yy=215
				zz=9
			if("Jungle Planet")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=10
			if("Desert Planet")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=12
			if("Sky World")
				xx=rand(1,300)
				yy=rand(1,300)
				zz=11
			if("Nevermind") return
		for(var/mob/V in oview(1))
			if(V.player)
				V.loc=locate(xx,yy,zz)
				V.x-=1
				V<<"[usr] brings you with them using teleportation."
		usr.x=xx
		usr.y=yy
		usr.z=zz
		view(6)<<"[usr] appears in an instant using teleport."
	else usr<<"You need full ki to use this."
mob/var/tmp/nokill
mob/var/hassplitform
mob/Splitform
	var/function
	New()
		..()
		spawn while(src)
			sleep(10)
			if(HP<=0)
				view(src)<<"[src] has been defeated."
				del(src)
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Follow")
			Choices.Add("Stop")
			Choices.Add("Attack Target")
			Choices.Add("Attack Nearest")
			Choices.Add("Destroy Splitforms")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Attack Nearest")
					function=4
					spawn while(function==4)
						sleep(refire)
						for(var/mob/M in oview(12))
							break
				if("Destroy Splitforms") for(var/mob/Splitform/A) if(A.displaykey==usr.key) del(A)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stop") function=2
				if("Attack Target")
					function=3
					var/mob/list/Targets=new/list
					for(var/mob/M in view(12)) Targets.Add(M)
					var/mob/Choice=input("Attack who?") in Targets
					for(var/mob/M in oview(12)) if(Choice==M)
						spawn while(function==3)
							sleep(refire)
							if(prob(20))
								var/bcolor=BLASTICON
								bcolor+=rgb(blastR,blastG,blastB)
								var/obj/A=new/obj/attack/blast
								A.loc=locate(x,y,z)
								A.Burnout()
								A.icon=bcolor
								A.icon_state=BLASTSTATE
								A.density=1
								A.shockwave=1
								A.Pow=(Pow*5)
								A.PL=PL
								A.KiSetting=KiSet
								A.owner=src
								walk(A,dir)
							else if(prob(10)) step_rand(src)
							else step_towards(src,M)
obj/SplitForm
	var/splitformskill=1
	verb/SplitForm()
		set category="Skills"
		var/splitforms=0
		for(var/mob/Splitform/Z) if(Z.displaykey==usr.key) splitforms+=1
		if(splitforms<splitformskill)
			if(prob(10/splitformskill/splitformskill/splitformskill))
				usr<<"Your split form skill has increased.."
				splitformskill+=1
			usr.Ki-=usr.MaxKi*(0.5/splitformskill)
			var/mob/A=new/mob/Splitform
			A.temporary=1
			A.displaykey=usr.key
			A.TextSize=usr.TextSize
			A.player=0
			A.Race=usr.Race
			A.Class="None"
			A.attackable=1
			A.SayFont=usr.SayFont
			A.bursticon=usr.bursticon
			A.burststate=usr.burststate
			A.CBLASTICON=usr.CBLASTICON
			A.CBLASTSTATE=usr.CBLASTSTATE
			A.formgain=usr.formgain
			A.icon=usr.icon
			A.oicon=usr.oicon
			A.BLASTICON=usr.BLASTICON
			A.BLASTSTATE=usr.BLASTSTATE
			A.Cblastpower=usr.Cblastpower
			A.InclineAge=25
			A.DeclineAge=rand(90,110)
			A.refire=usr.refire
			A.orefire=usr.orefire
			A.kinxt=usr.kinxt
			A.kinxtadd=usr.kinxtadd
			A.Makkankoicon=usr.Makkankoicon
			A.WaveIcon=usr.WaveIcon
			A.ITMod=usr.ITMod
			A.healmod=usr.healmod
			A.zanzomod=usr.zanzomod
			A.zanzoskill=usr.zanzoskill
			/*
			A.KaiokenMod=usr.KaiokenMod
			*/
			A.flightmod=usr.flightmod
			A.flightskill=usr.flightskill
			A.PLMod=usr.PLMod
			A.MaxPLpcnt=usr.MaxPLpcnt
			A.MaxAnger=usr.MaxAnger
			A.KiMod=usr.KiMod
			A.PowMod=usr.PowMod
			A.StrMod=usr.StrMod
			A.SpdMod=usr.SpdMod
			A.EndMod=usr.EndMod
			A.BirthYear=usr.BirthYear
			A.OffenseMod=usr.OffenseMod
			A.DefenseMod=usr.DefenseMod
			A.MaxKi=usr.MaxKi
			A.Pow=usr.Pow
			A.Str=usr.Str
			A.Spd=usr.Spd
			A.End=usr.End*1.2
			A.Res=usr.Res
			A.Offense=usr.Offense
			A.Defense=usr.Defense
			A.kimanip=usr.kimanip
			A.GravMod=usr.GravMod
			A.HPRegen=usr.HPRegen*0.1
			A.KiRegen=usr.KiRegen*0.1
			A.ZenkaiMod=usr.ZenkaiMod
			A.TrainMod=usr.TrainMod
			A.MedMod=usr.MedMod
			A.SparMod=usr.SparMod
			A.RecordPL=usr.RecordPL+400
			A.PL=usr.PL
			A.Body=25
			A.Age=usr.Age
			A.SAge=usr.SAge
			A.GravMastered=usr.GravMastered
			A.GravMod=usr.GravMod
			A.techskill=usr.techskill
			A.techmod=usr.techmod
			A.haszanzo=1
			A.Savable=0
			A.loc=locate(usr.x+rand(-1,1),usr.y+rand(-1,1),usr.z)
			A.name="[usr.name] Copy"
			A.displaykey=usr.key
			A.icon=usr.icon
			A.overlays.Add(usr.overlays)
			A.HP=usr.HP
			A.Ki=usr.Ki
			A.nokill=1
			A.move=1
			if(usr.Race=="Bio-Android")
				A.overlays.Remove(A.overlays)
				A.icon='NPC Cell Jr.dmi'
				var/icon/I=new(A.icon)
				I.Scale(16,16)
				A.icon=I
			if(usr.Race=="Majin")
				A.overlays.Remove(A.overlays)
				var/icon/I=new(A.icon)
				I.Scale(16,16)
				A.icon=I
			if(usr.Race=="Tsufurujin"|usr.Class=="Tsufurujin") A.icon='AndroidForm4.dmi'
		else usr<<"You do not have the skill to create this many splitforms."
mob/var
	UP=0
	UPMod=1
mob/Rank/verb/Unlock_Potential()
	set category="Skills"
	var/mob/M=input("Who?","") as null|mob in view(1)
	if(M) switch(input(M,"[usr] wants to unlock your hidden powers. Do you want to do this?", "",text) in list("No","Yes"))
		if("Yes")
			if(!M.UP|!M.Race=="Android")
				usr<<"You use Unlock Potential on [M]."
				M.UP=1
				var/boost=M.gain*5000*M.PLMod*M.UPMod*M.StatRank
				if(boost>M.RecordPL*4) boost=M.RecordPL*4
				M.RecordPL+=boost
				M.RecordPL+=500*M.UPMod
				M.Pow+=(500*M.PowMod)
				M.MaxKi+=200*M.KiMod
				M.kimanip+=10
				M.flightskill+=(20*M.flightmod)
				M.haszanzo=1
				M.zanzoskill+=(20*M.zanzomod)
				M.MaxPLpcnt+=(50*M.KiRegen)
				M.GravMastered+=50*M.GravMod
				M.DeclineAge+=5
				M.gain*=2
			else usr<<"[M]'s potential is already unlocked, or they are an Android."
			return
		if("No") usr<<"[M] declined your offer."
mob/Rank/verb/Mystify(mob/M in view(1))
	set category="Rank"
	for(var/obj/Skills/Mystic/A in M.contents)
		usr<<"They already have this."
		return
	if(usr.mystified<2)
		usr.mystified+=1
		usr<<"You have turned [usr.mystified] people into Mystics, you can use this a max of <font color=red>2 times."
		M.hasbeenenslaved=0
		for(var/obj/Skills/Seal/O in M.contents) del(O)
		M.hasmystic=1
		M.contents+=new/obj/Skills/Mystic
	else usr<<"You cannot turn more than 2 people into Mystics."
