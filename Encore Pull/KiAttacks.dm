//Changing of blasts...
mob/verb/ChangeCharge()
	set category="Other"
	var/currentcharge
	for(var/obj/A in contents) if (istype(A,/obj/chargechoice)) currentcharge=1
	var/howmany=0
	if(!currentcharge) while(howmany<9)
		sleep(1)
		howmany+=1
		var/obj/A=new/obj/chargechoice
		if(howmany==1)
			A.icon='BlastCharges.dmi'
			A.icon_state="1"
		if(howmany==2)
			A.icon='BlastCharges.dmi'
			A.icon_state="2"
		if(howmany==3)
			A.icon='BlastCharges.dmi'
			A.icon_state="3"
		if(howmany==4)
			A.icon='BlastCharges.dmi'
			A.icon_state="4"
		if(howmany==5)
			A.icon='BlastCharges.dmi'
			A.icon_state="5"
		if(howmany==6)
			A.icon='BlastCharges.dmi'
			A.icon_state="6"
		if(howmany==7)
			A.icon='BlastCharges.dmi'
			A.icon_state="7"
		if(howmany==8)
			A.icon='BlastCharges.dmi'
			A.icon_state="8"
		if(howmany==9)
			A.icon='BlastCharges.dmi'
			A.icon_state="9"
		A.icon_state="[howmany]"
		contents+=A
mob/verb/ChangeBlasts()
	set category="Other"
	var/currentlyusing
	for(var/obj/A in contents) if(istype(A,/obj/blastchoice)) currentlyusing=1
	var/howmany=0
	if(!currentlyusing) while(howmany<46)
		sleep(1)
		howmany+=1
		var/obj/A=new/obj/blastchoice
		if(howmany==1) A.icon='1.dmi'
		if(howmany==2) A.icon='2.dmi'
		if(howmany==3) A.icon='3.dmi'
		if(howmany==4) A.icon='4.dmi'
		if(howmany==5) A.icon='5.dmi'
		if(howmany==6) A.icon='6.dmi'
		if(howmany==7) A.icon='7.dmi'
		if(howmany==8) A.icon='8.dmi'
		if(howmany==9) A.icon='9.dmi'
		if(howmany==10) A.icon='10.dmi'
		if(howmany==11) A.icon='11.dmi'
		if(howmany==12) A.icon='12.dmi'
		if(howmany==13) A.icon='13.dmi'
		if(howmany==14) A.icon='14.dmi'
		if(howmany==15) A.icon='15.dmi'
		if(howmany==16) A.icon='16.dmi'
		if(howmany==17) A.icon='17.dmi'
		if(howmany==18) A.icon='18.dmi'
		if(howmany==19) A.icon='19.dmi'
		if(howmany==20) A.icon='20.dmi'
		if(howmany==21) A.icon='21.dmi'
		if(howmany==22) A.icon='22.dmi'
		if(howmany==23) A.icon='23.dmi'
		if(howmany==24) A.icon='24.dmi'
		if(howmany==25) A.icon='25.dmi'
		if(howmany==26) A.icon='26.dmi'
		if(howmany==27) A.icon='27.dmi'
		if(howmany==28) A.icon='28.dmi'
		if(howmany==29) A.icon='29.dmi'
		if(howmany==30) A.icon='30.dmi'
		if(howmany==31) A.icon='31.dmi'
		if(howmany==32) A.icon='32.dmi'
		if(howmany==33) A.icon='33.dmi'
		if(howmany==34) A.icon='34.dmi'
		if(howmany==35) A.icon='35.dmi'
		if(howmany==36) A.icon='36.dmi'
		if(howmany==37) A.icon='37.dmi'
		if(howmany==38)	A.icon='38.dmi'
		if(howmany==39) A.icon='39.dmi'
		if(howmany==40) A.icon='40.dmi'
		if(howmany==41) A.icon='41.dmi'
		if(howmany==42)	A.icon='42.dmi'
		if(howmany==43) A.icon='43.dmi'
		if(howmany==44) A.icon='44.dmi'
		if(howmany==45) A.icon='45.dmi'
		if(howmany==46) A.icon='46.dmi'
		A.icon_state="[howmany]"
		contents+=A
mob/var/tmp/chargechoice=0
obj/chargechoice/Click()
	if(!usr.chargechoice)
		usr.chargechoice+=1
		usr<<"Choose the charge state you want."
		usr.ChargeState=icon_state
		usr.chargechoice=0
		for(var/obj/A in usr.contents) if(istype(A,/obj/chargechoice)) if(A!=src) del(A)
		del(src)
mob/var/tmp/Blastchoice=0
obj/blastchoice/Click()
	if(!usr.Blastchoice)
		usr.Blastchoice+=1
		usr<<"First blast type chosen, choose a secondary."
		usr.BLASTICON=icon
		usr.BLASTSTATE=icon_state
	else
		usr.Blastchoice=0
		usr<<"Second blast type chosen. Done."
		usr.CBLASTICON=icon
		usr.CBLASTSTATE=icon_state
		for(var/obj/A in usr.contents) if(istype(A,/obj/blastchoice)) if(A!=src) del(A)
		spawn usr.ChangeBeams()
		spawn(20) del(src)
obj/beamchoice
	New()
		..()
		icon_state="head"
	Click()
		usr.WaveIcon=icon
		for(var/obj/beamchoice/A in usr.contents) if(A!=src) del(A)
		del(src)
mob/proc/ChangeBeams()
	var/howmany=0
	while(howmany<14)
		sleep(1)
		howmany+=1
		var/obj/A=new/obj/beamchoice
		if(howmany==1) A.icon='Beam1.dmi'
		if(howmany==2) A.icon='Beam2.dmi'
		if(howmany==3) A.icon='Beam3.dmi'
		if(howmany==4) A.icon='Beam4.dmi'
		if(howmany==5) A.icon='Beam5.dmi'
		if(howmany==6) A.icon='Beam6.dmi'
		if(howmany==7) A.icon='Beam7.dmi'
		if(howmany==8) A.icon='Beam8.dmi'
		if(howmany==9) A.icon='Beam9.dmi'
		if(howmany==10) A.icon='Beam10.dmi'
		if(howmany==11) A.icon='Beam11.dmi'
		if(howmany==12) A.icon='Beam12.dmi'
		if(howmany==13) A.icon='Beam13.dmi'
		if(howmany==14) A.icon='Beam14.dmi'
		contents+=A
//---------------------
mob/var/tmp
	blasting=0
	charging=0
	firable=0
mob/var
	CBLASTICON='1.dmi'
	kimanip=1 //governs all ki attacks.
	kimanipmod=1
	hasblast1
	hasblast2
	hasblast3
	hasblast4
	hasblast5
	hasblast6
	hasblast7
	hasblast8
	hasblast9
	hasblast10
	hasblast11
	kinxt=10
	kinxtadd=1
obj/proc/Burnout() spawn(300) if(src) del(src)
mob/proc/Learn_Attack() //Lets a player learn a new energy attack randomly per level
	//10% chance per level to learn a new one.
	var/chance=rand(1,10) //Last time I tested this I got all attacks by the time the total level
	//was 140 across all attacks.
	if(chance==10)
		var/whichone=rand(1,11)
		if(whichone==1&&!usr.hasblast1)
			usr.hasblast1=1
			usr<<"You have learned a new attack."
			usr.contents+=new/obj/KiAttacks/Blast
		else if(whichone==2&&!usr.hasblast2&&!usr.legendary)
			if(usr.Race=="Ancient Namek"|usr.Race=="Spirit Doll"|usr.Race=="Kanassa-Jin"|usr.Race=="Human"|usr.Class=="Earth-Halfie"|usr.Race=="Changeling"|usr.Race=="Arconian"|usr.Race=="Cyborg"|usr.Class=="Legendary"|usr.Race=="Bio-Android")
				if(usr.Class!="Bebi")
					usr.hasblast2=1
					usr<<"You have learned a new attack."
					usr.contents+=new/obj/KiAttacks/Shield
		else if(whichone==3&&!usr.hasblast3&&!usr.legendary) //Legendary cannot learn Guidebomb
			usr.hasblast3=1
			usr<<"You have learned a new attack."
			usr.contents+=new/obj/KiAttacks/Guide_Bomb
		else if(whichone==4&&!usr.hasblast4)
			if(usr.Race=="Bebi"|usr.Race=="Spirit Doll"|usr.Race=="Human"|usr.Race=="Namekian"|usr.Class=="Yardrat"|usr.Race=="Arconian"|usr.Race=="Changeling"|usr.Race=="Majin"|usr.Race=="Bio-Android"|usr.Race=="Demon"|usr.Race=="Android")
				usr.hasblast4=1
				usr<<"You have learned a new attack."
				usr.contents+=new/obj/KiAttacks/Piercer_Ray
		else if(whichone==5&&!usr.hasblast5)
			usr.hasblast5=1
			usr<<"You have learned a new attack."
			usr.contents+=new/obj/KiAttacks/Barrage
		else if(whichone==6&&!usr.hasblast6)
			if(usr.Race=="Legendary")
				usr.hasblast6=1
				var/obj/KiAttacks/BusterBarrage/A=new/obj/KiAttacks/BusterBarrage
				A.REFIRE/=2
				usr.contents+=A
		else if(whichone==7&&!usr.hasblast7)
			usr.hasblast7=1
			usr<<"You have learned a new attack."
			usr.contents+=new/obj/KiAttacks/Energy_Wave
		else if(whichone==8&&!usr.hasmegaburst)
			if(Race=="Ancient Namek"|Race=="Kanassa-Jin"|Race=="Human"|Race=="Namekian"|Race=="Arconian"|Race=="Majin"|Race=="Makyojin"|Race=="Spirit Doll")
				if(Class!="Bebi")
					hasmegaburst=1
					contents+=new/obj/KiAttacks/MegaBurst
					usr<<"You have learned a new attack."
		else if(whichone==9&&!usr.hashomingfinisher)
			if(Class=="Kanassa-Jin"|usr.Race=="Spirit Doll"|Race=="Human"|Race=="Namekian"|Race=="Arconian")
				if(Class!="Bebi")
					hashomingfinisher=1
					contents+=new/obj/KiAttacks/HomingFinisher
					usr<<"You have learned a new attack."

mob/var/Frozen
obj/Skills/TimeFreeze/verb/Freeze()
	set category="Skills"
	usr.overlays+='Ki Time Freeze.dmi'
	spawn(10) usr.overlays-='Ki Time Freeze.dmi'
	for(var/mob/A in oview(usr)) if(!A.Frozen&&A.client)
		sleep(10)
		usr.Ki*=0.75
		A.Frozen=1
		missile('Ki Time Freeze.dmi',usr,A)
		A.overlays+='Ki Time Freeze.dmi'
mob/var
	tmp/usingexplosion
	explosionon
obj/KiAttacks
	suffix="Level 0 (0/0)"
	Explosion
		var/setting=1
		verb/Settings()
			set category=null
			usr<<"This is used to set the explosion radius, by default it is the max level. Set the level of destructions between 1 and the max level. (current is [setting])"
			setting=input("") as num
			if(setting<1) setting=1
			if(setting>kilevel) setting=kilevel
		verb/Description()
			set category=null
			usr<<"This attack causes an explosion on the ground, the high the level the bigger the explosion"
		Click()
			if(!usr.explosionon)
				usr<<"Explosion activated, click the ground to trigger."
				usr.explosionon=1
			else
				usr<<"Explosion deactivated."
				usr.explosionon=0
obj/var/mega
obj/Bump(turf/M)
	if(mega) if(istype(M,/turf)) M.Destroy()
obj/KiAttacks/MegaBurst
	var/MainIcon='Ki MegaBurst.dmi'
	verb/Description()
		set category=null
		usr<<"This attack packs huge single hit power, but takes a while to charge and is easy to dodge, it is very big though and very draining."
	verb/Teach(mob/M in view(1,usr))
		set category=null
		if(usr.kimanip>=12)
			if(M.kimanip>=6&&M.Ki<200)
				var/hasit
				for(var/obj/KiAttacks/MegaBurst/A in M.contents) hasit=1
				if(!hasit)
					view(12,usr)<<"[usr] teaches [M] the Mega Burst technique attack."
					M.contents+=new/obj/KiAttacks/MegaBurst
				else usr<<"They already have this."
			else usr<<"Their ki manipulation isnt high enough to learn this, or their energy isn't high enough to use the attack."
		else usr<<"Your ki manipulation isnt high enough to teach this."
	Click()
		if(usr.Ki<200)
			usr<<"You do not have enough energy (200 energy is needed.)"
			return
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=200&&!usr.blasting)
			kixp+=30
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			while(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.02*usr.kimanipmod)
			usr.blasting=1
			usr.move=0
			var/bicon=usr.bursticon
			bicon+=usr.AuraColor
			var/image/I=image(icon=bicon,icon_state=usr.burststate)
			usr.overlays+=I
			var/MasterIcon=MainIcon
			MasterIcon+=rgb(usr.blastR,usr.blastG,usr.blastB)
			sleep(usr.refire*5)
			var/amount=50
			var/distance=10
			while(amount)
				var/obj/A=new/obj
				A.KiSetting=usr.KiSet
				A.layer=MOB_LAYER+1
				A.icon=MasterIcon
				A.icon_state="center"
				//positioning / appearance
				A.loc=locate(usr.x,usr.y,usr.z)
				if(amount<=40&&amount>30)
					A.icon_state="outer1" //Middle Right
					if(usr.dir==NORTH) A.x+=1
					if(usr.dir==SOUTH) A.x-=1
					if(usr.dir==EAST) A.y-=1
					if(usr.dir==WEST) A.y+=1
					if(amount==40) A.icon_state="outer1head"
					else if(amount==31)
						A.icon=turn(A.icon,180)
						A.icon_state="outer1origin"
				else if(amount<=30&&amount>20)
					A.icon_state="outer2" //Outer Right
					if(usr.dir==NORTH) A.x+=2
					if(usr.dir==SOUTH) A.x-=2
					if(usr.dir==EAST) A.y-=2
					if(usr.dir==WEST) A.y+=2
					if(amount==30) A.icon_state="outer2head"
					else if(amount==21)
						A.icon=turn(A.icon,180)
						A.icon_state="outer2origin"
				else if(amount<=20&&amount>10)
					A.icon_state="outer1" //Middle Left
					if(usr.dir==NORTH) A.x-=1
					if(usr.dir==SOUTH) A.x+=1
					if(usr.dir==EAST) A.y+=1
					if(usr.dir==WEST) A.y-=1
					if(amount==20) A.icon_state="outer3head"
					else if(amount==11)
						A.icon=turn(A.icon,180)
						A.icon_state="outer3origin"
				else if(amount<=10)
					A.icon_state="outer2" //Outer Left
					if(usr.dir==NORTH) A.x-=2
					if(usr.dir==SOUTH) A.x+=2
					if(usr.dir==EAST) A.y+=2
					if(usr.dir==WEST) A.y-=2
					if(amount==10) A.icon_state="outer4head"
					else if(amount==1)
						A.icon=turn(A.icon,180)
						A.icon_state="outer4origin"
				//---
				A.density=0
				spawn(50) if(A) del(A)
				var/distance2=distance-1
				while(distance)
					step(A,usr.dir)
					if(amount==50) A.icon_state="centerorigin"
					else if(amount==41)
						A.icon=turn(A.icon,180)
						A.icon_state="centerorigin"
					distance-=1
				distance=distance2
				if(!distance) distance=10
				amount-=1
				if(usr.PL>=50000000) for(var/turf/T in view(1,A)) if(!T.Water) T.Destroy()
				for(var/mob/M in view(0,A)) if(M!=usr)
					var/dmg1=(usr.Pow*10)/M.Res
					var/dmg2=((usr.PL)/(M.PL))*10
					M.HP-=dmg1+dmg2
			usr.overlays-=I
			spawn(50) usr.move=1
			usr.blasting=0
			usr.Ki-=200
mob/var/bursticon='Burst.dmi'
mob/var/burststate=""
obj/var/mob/target
obj/KiAttacks/HomingFinisher
	var/maxdistance=30
	verb/Description()
		set category=null
		usr<<"This sends out many small energy balls surrounding your opponent, then sends them all flying at them at once. If all of them hit it is an extremely powerful attack, the higher the level the more balls are fired"
	verb/Teach(mob/M in view(1,usr))
		set category=null
		if(usr.kimanip>=12)
			if(M.kimanip>=6&&M.Ki<200)
				var/hasit
				for(var/obj/KiAttacks/HomingFinisher/A in M.contents) hasit=1
				if(!hasit)
					view(12,usr)<<"[usr] teaches [M] the Homing Finisher technique attack."
					M.contents+=new/obj/KiAttacks/HomingFinisher
				else usr<<"They already have this."
			else usr<<"Their ki manipulation isnt high enough to learn this, or their energy isn't high enough to use the attack."
		else usr<<"Your ki manipulation isnt high enough to teach this."
	Click()
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=200&&!usr.blasting)
			usr.blasting=1
			var/mob/M=input("Who?") as null|mob in view(usr)
			kixp+=30
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			while(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.01*usr.kimanipmod)
			var/bcolor='28.dmi'
			bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)
			var/balls=round(usr.kimanip+(kilevel/10))
			if(balls<1) balls=1
			while(balls)
				balls-=1
				var/obj/A=new/obj/attack/blast/
				A.target=M
				A.loc=locate(usr.x,usr.y,usr.z)
				var/random2=rand(1,16)
				if(random2==1) step(A,NORTH)
				if(random2==2) step(A,SOUTH)
				if(random2==3) step(A,EAST)
				if(random2==4) step(A,WEST)
				if(random2==5) step(A,NORTHWEST)
				if(random2==6) step(A,NORTHEAST)
				if(random2==7) step(A,SOUTHWEST)
				if(random2==8) step(A,SOUTHEAST)
				spawn flick("Attack",usr)
				A.icon='28.dmi'
				A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
				A.icon_state="28"
				A.Pow=usr.Pow*2
				A.PL=usr.PL*2
				A.KiSetting=usr.KiSet
				A.owner=usr.name
				A.ownkey=usr.displaykey
				spawn(600) if(A) del(A)
				var/distance=rand(1,maxdistance)
				var/randomdirection=rand(1,8)
				while(distance)
					distance-=1
					if(A)
						if(prob(5)) sleep(1)
						if(randomdirection==1) step(A,NORTH)
						if(randomdirection==2) step(A,SOUTH)
						if(randomdirection==3) step(A,EAST)
						if(randomdirection==4) step(A,WEST)
						if(randomdirection==5) step(A,NORTHWEST)
						if(randomdirection==6) step(A,NORTHEAST)
						if(randomdirection==7) step(A,SOUTHWEST)
						if(randomdirection==8) step(A,SOUTHEAST)
			usr.Ki-=200
			var/sleeptime=usr.refire*10/(kilevel/10)/usr.kimanip
			if(sleeptime>300) sleeptime=300
			if(sleeptime<usr.refire*5) sleeptime=usr.refire*5
			sleep(sleeptime)
			for(var/obj/attack/blast/C) if(C.z==usr.z&&C.owner==usr.name)
				C.density=1
				if(C.target) spawn walk_towards(C,C.target,1)
			usr.blasting=0
		else usr<<"This requires atleast 200 energy to use."
obj/KiAttacks/Spirit_Bomb
	var/SizeSetting=0
	verb/Description()
		set category=null
		usr<<"This is probably -the- strongest single hit attack in the game. This attack has the highest chance to take out Majins, Bios, Immortals, and other such beings, since a strong 1 hit attack is needed to finish them for good. It takes a while to build up and drains ALL of your ki, and travels slowly, but if you can make it hit its absolutely devastating, it is also unblockable. Its size grows with its power at certain points."
	verb/Settings()
		set category=null
		SizeSetting=input("Enter the size from stages 0 to 2, the bigger it is the longer it takes to charge, but stage 2 is 50% stronger than stage 1, and stage 3 is 125% stronger than stage 1, that is if they are direct hits. The outside parts of the center are always a stage below the core.") as num
		if(SizeSetting<0) SizeSetting=1
		if(SizeSetting>2) SizeSetting=2
		SizeSetting=round(SizeSetting)
	Click()
		if(!usr.KO&&!usr.med&&!usr.train&&!usr.blasting)
			if(usr.Ki>=(usr.MaxKi*0.9))
				usr.blasting=1
				usr.icon_state="Planet Destroyer"
				spawn(50) usr.icon_state=""
				kixp+=30
				if(!firstfire)
					firstfire=1
					kinxt=usr.kinxt
				while(kixp>=kinxt)
					kixp-=kinxt
					kilevel+=1
					kinxt+=usr.kinxtadd
					usr.Learn_Attack()
					usr<<"<font color=yellow>[src] level +1"
				suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
				usr.kimanip+=(0.02*usr.kimanipmod)
				usr.Ki-=(usr.MaxKi*0.9)
				usr.Pow+=(0.015*usr.PowMod)
				usr.move=0
				usr.MaxKi+=(0.015*usr.KiMod)
				var/icon/bcolor=new('SBomb.dmi')
				bcolor.Blend(rgb(0,0,0,200),ICON_ADD)
				var/obj/A=new/obj/attack/blast
				A.KiSetting=1
				A.density=1
				A.loc=locate(usr.x,(usr.y+1),usr.z)
				A.icon=bcolor
				usr<<"You feel the life force of the planet flood into the Spirit Bomb!"
				flick("Forming",A)
				A.icon_state="Formed"
				sleep(60)
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				A.deflectable=0
				A.shockwave=1
				A.kilevel=kilevel
				A.Pow=((usr.Pow*65)+(kilevel*6))
				A.PL=usr.PL
				for(var/mob/M) if(M.client&&M.med&&SizeSetting&&M.z==usr.z)
					M.overlays+='SBombGivePower.dmi'
					A.PL+=(M.PL/10)
					M.Ki*=0.9
					M<<"You feel a tenth of your energy slip away (A Spirit Bomb was charged just now on this planet)."
					spawn(30) M.overlays-='SBombGivePower.dmi'
					spawn while(prob(60))
						var/obj/Z=new/obj
						Z.icon='Spirit.dmi'
						Z.loc=locate(M.x,M.y,M.z)
						step_rand(Z)
						walk(Z,NORTH)
						spawn(50) if(Z) del(Z)
						sleep(1)
				A.KiSetting=usr.KiSet
				A.owner=usr
				A.ownkey=usr.displaykey
				A.mega=1
				if(SizeSetting)
					A.icon=null
					var/scale=64
					var/xtiles=(scale*0.03125)
					var/ytiles=xtiles
					var/disposition=48
					if(SizeSetting==1)
						var/amount=2
						while(amount)
							amount-=1
							var/obj/B=new/obj/attack/blast
							B.density=1
							B.deflectable=0
							B.shockwave=1
							B.kilevel=kilevel
							B.Pow=A.Pow
							B.PL=A.PL*1
							B.KiSetting=A.KiSetting
							B.owner=A.owner
							B.ownkey=A.ownkey
							B.mega=1
							if(amount==2)
								if(usr.dir==NORTH|usr.dir==SOUTH) B.loc=locate(usr.x-1,usr.y+1,usr.z)
								else B.loc=locate(usr.x,usr.y+2,usr.z)
							else
								if(usr.dir==NORTH|usr.dir==SOUTH) B.loc=locate(usr.x+1,usr.y+1,usr.z)
								else B.loc=locate(usr.x,usr.y,usr.z)
							B.y-=1
							walk(B,usr.dir,(usr.refire/4))
						A.PL*=1.5
						var/icon/I=new(bcolor)
						I.Scale(scale,scale)
						while(ytiles>0)
							sleep(1)
							A.overlays+=image(icon=I,icon_state="Formed [xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition,layer=MOB_LAYER+1)
							xtiles-=1
							if(!xtiles)
								ytiles-=1
								xtiles=(scale*0.03125)
						sleep(20)
					else
						var/amount=4
						while(amount)
							amount-=1
							var/obj/B=new/obj/attack/blast
							B.density=1
							B.deflectable=0
							B.shockwave=1
							B.kilevel=kilevel
							B.Pow=A.Pow
							B.PL=A.PL*1.5
							B.KiSetting=A.KiSetting
							B.owner=A.owner
							B.ownkey=A.ownkey
							B.mega=1
							if(amount==4)
								if(usr.dir==NORTH|usr.dir==SOUTH) B.loc=locate(usr.x+2,usr.y+1,usr.z)
								else B.loc=locate(usr.x,usr.y-1,usr.z)
							if(amount==3)
								if(usr.dir==NORTH|usr.dir==SOUTH) B.loc=locate(usr.x-2,usr.y+1,usr.z)
								else B.loc=locate(usr.x,usr.y+3,usr.z)
							if(amount==2)
								if(usr.dir==NORTH|usr.dir==SOUTH) B.loc=locate(usr.x-1,usr.y+1,usr.z)
								else B.loc=locate(usr.x,usr.y+2,usr.z)
							else
								if(usr.dir==NORTH|usr.dir==SOUTH) B.loc=locate(usr.x+1,usr.y+1,usr.z)
								else B.loc=locate(usr.x,usr.y,usr.z)
							B.y-=1
							walk(B,usr.dir,(usr.refire/4))
						scale=128
						disposition=80
						xtiles=(scale*0.03125)
						ytiles=xtiles
						A.PL*=2.5
						var/icon/I=new(bcolor)
						I.Scale(scale,scale)
						while(ytiles>0)
							sleep(1)
							A.overlays+=image(icon=I,icon_state="Formed [xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition,layer=MOB_LAYER+1)
							xtiles-=1
							if(!xtiles)
								ytiles-=1
								xtiles=(scale*0.03125)
					sleep(20)
				A.y-=1
				walk(A,usr.dir,(usr.refire/4))
				spawn while(A)
					if(A.mega) for(var/turf/T in view(1,A)) if(prob(30)) T.Destroy()
					sleep(usr.refire/2)
				sleep(60)
				usr.blasting=0
				usr.move=1
				if(A)
					new /obj/BigCrater(locate(A.x,A.y,A.z))
					del(A)
			else usr<<"You need 90% Energy to do this."
mob/var/tmp/Guiding //Using a guided ability or not...
obj/KiAttacks/Guide_Bomb
	verb/Description()
		set category=null
		usr<<"You can move this bomb around once its fired by pressing the directional keys, if you can make it hit then it is a very powerful attack that will also send your opponent flying."
	Click()
		if(!usr.KO&&!usr.med&&!usr.train&&!usr.blasting&&!usr.Guiding)
			if(usr.Ki>=5)
				usr.blasting=1
				usr.Guiding=1
				kixp+=20
				usr.icon_state="Planet Destroyer"
				spawn(50) usr.icon_state=""
				if(!firstfire)
					firstfire=1
					kinxt=usr.kinxt
				while(kixp>=kinxt)
					kixp-=kinxt
					kilevel+=1
					kinxt+=usr.kinxtadd
					usr.Learn_Attack()
					usr<<"<font color=yellow>[src] level +1"
				suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
				usr.kimanip+=(0.02*usr.kimanipmod)
				usr.Ki-=5
				usr.Pow+=(0.0005*usr.PowMod)
				usr.move=0
				usr.MaxKi+=(0.0005*usr.KiMod)
				var/bcolor='30.dmi'
				bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)
				var/obj/A=new/obj/attack/blast/
				A.loc=locate(usr.x,(usr.y+1),usr.z)
				A.icon=bcolor
				A.icon_state="30"
				sleep(20)
				if(A)
					A.density=1
					A.kilevel=kilevel
					A.Pow=(((usr.Pow*3)+(kilevel/2)))*4
					A.PL=usr.PL
					A.KiSetting=usr.KiSet
					A.shockwave=1
					A.owner=usr
					A.ownkey=usr.displaykey
				usr.move=1
				usr.blasting=0
				usr.Blast_Gain()
				usr.Blast_Gain()
				sleep(usr.refire/8)
				if(A)
					A.density=0
					step(A,usr.dir)
					if(A) A.density=1
				while(A)
					sleep(usr.refire/10)
					step(A,usr.dir)
				usr.Guiding=0
				if(A) del(A)
			else usr<<"You dont have enough energy."
obj/KiAttacks/Barrage
	verb/Description()
		set category=null
		usr<<"At first this may just appear to be the basic ki attack, but the higher the level is the more blasts it fires at once beside each other."
	Click()
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=3&&!usr.blasting)
			usr.blasting=1
			usr.Ki-=3
			usr.Blast_Gain()
			kixp+=1
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			while(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.002*usr.kimanipmod)
			var/bicon=usr.BLASTICON
			bicon+=rgb(usr.blastR,usr.blastG,usr.blastB)
			var/amount=7
			while(amount)
				var/obj/A=new/obj/attack/blast
				if(prob(((kilevel-2)*(kilevel-2))/50))
					A.icon=bicon
					A.Burnout()
					A.Pow=((usr.Pow*2)+(kilevel/10))
					A.PL=usr.PL
					A.icon_state=usr.BLASTSTATE
					A.owner=usr
					A.ownkey=usr.displaykey
					A.loc=locate(usr.x,usr.y,usr.z)
					A.dir=usr.dir
					A.KiSetting=usr.KiSet
					A.density=0
					if(amount==5)
						step(A,turn(usr.dir,45))
						if(A) A.dir=usr.dir
					if(amount==4)
						step(A,turn(usr.dir,-45))
						if(A) A.dir=usr.dir
					if(amount==3) step(A,usr.dir)
					if(amount==2) step(A,turn(usr.dir,45))
					if(amount==1) step(A,turn(usr.dir,-45))
					if(amount==6&&usr&&A)
						step(A,usr.dir)
						if(A) step(A,turn(usr.dir,45))
						if(A) step(A,A.dir)
					if(amount==7&&usr&&A)
						step(A,usr.dir)
						if(A) step(A,turn(usr.dir,-45))
						if(A) if(A.dir) step(A,A.dir)
				else if(A)
					A.icon=bicon
					A.Burnout()
					A.Pow=((usr.Pow*2)+(kilevel/10))
					A.PL=usr.PL
					A.icon_state=usr.BLASTSTATE
					A.owner=usr
					A.ownkey=usr.displaykey
					A.loc=locate(usr.x,usr.y,usr.z)
					A.dir=usr.dir
					A.KiSetting=usr.KiSet
					A.density=0
					step(A,usr.dir)
				if(A) A.density=1
				if(A) walk(A,A.dir,2)
				amount-=1
			sleep(usr.refire*0.2)
			usr.blasting=0
mob/var
	AURAICON='Aura Normal.dmi'
	AURASTATE="Normal"
mob/var
	BLASTICON='12.dmi'
	BLASTSTATE="12"
obj/KiAttacks/Basic
	verb/Description()
		set category=null
		usr<<"The most basic of all energy attacks, it is a single low powered, low drain, straight blast that at first fires very slowly, but once it is levelled up enough it becomes the fastest ki attack in the game."
	Click()
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=0.25&&!usr.blasting)
			usr.blasting=1
			kixp+=1
			if(prob(50)) usr.Blast_Gain()
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			if(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.002*usr.kimanipmod)
			usr.Ki-=0.25
			var/bcolor=usr.BLASTICON
			bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)
			var/obj/A=new/obj/attack/blast
			A.loc=locate(usr.x,usr.y,usr.z)
			A.icon=bcolor
			A.icon_state=usr.BLASTSTATE
			A.density=1
			A.Pow=usr.Pow
			A.PL=usr.PL
			A.KiSetting=usr.KiSet
			A.owner=usr
			A.ownkey=usr.displaykey
			A.dir=usr.dir
			A.Burnout()
			walk(A,usr.dir)
			var/reload=round((usr.refire/(kilevel-1))*5)
			if(reload<2) reload=2
			reload=round(reload)
			spawn(reload) usr.blasting=0
mob/var
	CBLASTSTATE
	Cblastpower=1
obj
	KiAttacks
		Blast
			verb/Description()
				set category=null
				usr<<"A simple charged basic attack, it drains more and moves slightly slower but its power is drastically higher."
			Click()
				set hidden=1
				set category="Skills"
				if(usr.med==0 && usr.train==0)
					if(usr.KO==0&& usr.Ki>=4 && usr.blasting==0)
						usr.blasting=1
						usr.charging=1

						kixp+=16*usr.Cblastpower
						if(!firstfire)
							firstfire=1
							kinxt=usr.kinxt
						while(kixp>=kinxt)
							kixp-=kinxt
							kilevel+=1
							kinxt+=usr.kinxtadd
							usr.Learn_Attack()
							usr<<"<font color=yellow>[src] level +1"
						suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						usr.kimanip+=(0.032*usr.kimanipmod)
						usr.Ki-=4+usr.Cblastpower

						var/bicon=usr.bursticon
						bicon+=usr.AuraColor
						var/image/I=image(icon=bicon,icon_state=usr.burststate)
						usr.overlays+=I
						spawn(50) usr.overlays-=I
						spawn(50) usr.overlays-=I
						spawn(50) usr.overlays-=I
						sleep(usr.refire*usr.Cblastpower)

						var/bcolor=usr.CBLASTICON
						bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)

						var/obj/A=new/obj/attack/blast/
						A.Burnout()
						A.icon=bcolor
						A.icon_state=usr.CBLASTSTATE
						A.loc=locate(usr.x,usr.y,usr.z)
						A.density=1
						A.Pow=(usr.Pow+(kilevel/10))*8*usr.Cblastpower
						A.PL=usr.PL
						A.dir=usr.dir
						A.KiSetting=usr.KiSet
						A.owner=usr
						A.ownkey=usr.displaykey
						A.dir=usr.dir
						step(A,usr.dir)
						walk(A,usr.dir,2)

						usr.Blast_Gain()
						usr.Blast_Gain()
						usr.Blast_Gain()
						usr.Blast_Gain()
						usr.blasting=0
						usr.charging=0
mob/proc/deflectmessage() view(9)<<"[src] deflects the blast!"
mob/proc/reflectmessage() view(9)<<"<font color=red>[src] reflects the blast!"
obj/var/ownkey
mob/proc/Nova()
	for(var/turf/A in view(1,src)) if(prob(70))
		A.overlays.Add('Ki Explosion.dmi')
		spawn(5) A.overlays.Remove('Ki Explosion.dmi')
obj/attack/blast
	New()
		..()
		spawn if(src) if(WaveAttack) KHH()
	proc/KHH()
		//Beams
		while(src)
			sleep(2)
			//making the end of the trail look a certain way...
			if(icon_state!="struggle") //new
				var/confirmback
				var/confirmfront
				for(var/obj/attack/M in oview(1,src))
					if(M!=src) if(M.owner==owner)
						if(dir==NORTH)
							if(M.y==y-1) confirmback=1
							if(M.y==y+1) confirmfront=1
						if(dir==SOUTH)
							if(M.y==y-1) confirmfront=1
							if(M.y==y+1) confirmback=1
						if(dir==EAST)
							if(M.x==x-1) confirmback=1
							if(M.x==x+1) confirmfront=1
						if(dir==WEST)
							if(M.x==x-1) confirmfront=1
							if(M.x==x+1) confirmback=1
				if(!confirmback&&confirmfront)
					layer=MOB_LAYER+1
					icon_state="end"
				else if(!confirmfront)
					var/confirm
					for(var/obj/attack/A in view(0,src))
						if(A.owner==owner) if(A!=src) if(A.icon_state!="head") confirm=1
					for(var/obj/attack/A in view(0,src))
						if(A.owner==owner) if(A!=src) if(A.icon_state=="head") confirm=0
					if(confirm)
						layer=MOB_LAYER+2
						icon_state="head"
					else if(confirm==0)
						layer=MOB_LAYER+1
						icon_state="tail"
				else
					layer=MOB_LAYER+1
					icon_state="tail"
			//---------------------------------
			for(var/obj/buildables/M in view(1,src)) del(M)
			for(var/mob/M in view(0,src))
				icon_state="struggle"
				layer=MOB_LAYER+2
				density=1
				if(dir==NORTH) y-=1
				if(dir==SOUTH) y+=1
				if(dir==EAST) x-=1
				if(dir==WEST) x+=1
				if(!M.attackable) del(src)
				else
					var/dmg1=(Pow/M.Res)
					var/dmg2=((PL+1)/(M.PL+1))
					M.HP-=dmg1*dmg2*5 //times 5 because the regular damage was a bit low
					//The beam knocks the person farther and farther away...
					if(M.client&&prob((PL*100)/((M.PL*M.ResMod)+1)))
						M.dir=turn(dir,180)
						M.icon_state="KB"
						step(M,dir)
					//---------------------------------
					if(M.HP<=0)
						if(M.player)
							if(M.Race=="Majin") if(PL>(M.RecordPL*1250)) M.buudead=1
							if(M.Race=="Bio-Android"|M.Race=="Bebi") if(PL>(M.RecordPL*500)) M.buudead=1
							if(M.immortal) if(PL>(M.RecordPL*750)) M.buudead=1
							if(KiSetting&&owner!=M)
								if(!M.immortal|M.buudead)
									if(piercer) M.buudead=0
									for(var/mob/Q) if(owner==Q) for(var/obj/Contact/A in Q.contents) if(A.name=="[M.name] ([M.displaykey])")
										if(A.relation=="Good"|A.relation=="Very Good"|A.relation=="Rival/Good")
											Q<<"[A.name] contact deleted. Obviously if your killing your friends they must not actually be your friends."
											del(A)
									M.Death()
							else if(!M.KO) M.KO()
						if(M.monster) del(M)
					walk(src,0)
					spawn(1) del(src)
			for(var/obj/attack/M in view(0,src))
				if(M.dir!=dir)
					if(!M.WaveAttack) del(M)
					else if(M)
						if(M!=src)
							if(M.owner!=owner)
								walk(src,0)
								walk(src,dir,5)
								if(M.WaveAttack) M.icon_state="struggle"
								var/ABP=(Pow*PL)*rand(1,100)
								var/BBP=(M.Pow*M.PL)*rand(1,100)
								if(ABP>BBP)	del(M)
			for(var/obj/M in view(0,src)) //OBJ STRUGGLING...
				if(M.density)
					icon_state="struggle"
					spawn(1) del(src)
			for(var/turf/M in view(0,src)) if(M.density&&!M.Water)
				if(PL>50000000&&prob(1)&&M.name!="Dirt") M.Destroy()
				else
					icon_state="struggle"
					spawn(1) del(src)
	Bump(mob/M)
		if(!WindmillShuriken)
			if(istype(M,/obj/buildables)) del(M)
			if(istype(M,/mob))
				for(var/obj/attack/blast/Z in view(1,src)) if(icon=='Ki Death Ball.dmi'&&Z.icon=='Ki Death Ball.dmi') if(Z!=src) del(Z)
				if(M.attackable)
					var/dmg1=(Pow/M.Res)
					var/dmg2=(PL+1)/(M.PL+1)*0.1
					var/deflectchance=20*((M.Defense*M.PL)/((Pow+1)*(PL+1)))
					if(!deflectable) deflectchance*=0.1
					if(M.shielding&&!mega) deflectchance=100
					if(M.KO) deflectchance=0
					if(prob(deflectchance)&&M.Ki>=5&&M.DRenabled)
						if(M.Race=="Android"&&owner!=M)
							view(M)<<"[M] absorbs the blast!"
							M.Ki+=100
							del(src)
						else if(prob(20))
							M.Ki-=5
							view(M)<<"[M] reflects the blast!"
							density=0
							var/obj/A=new/obj/attack/blast
							A.icon=icon
							A.KiSetting=0
							A.icon_state=icon_state
							A.loc=locate(M.x,M.y,M.z)
							A.density=1
							A.Pow=Pow
							A.PL=PL
							A.dir=M.dir
							walk(A,M.dir)
							if(M.zanzoskill>=100&&owner) for(var/mob/Z in view(M))
								if(Z.name==owner)
									spawn flick('Zanzoken.dmi',M)
									if(Z.dir==NORTH|Z.dir==NORTHEAST) M.loc=locate(Z.x,Z.y-1,Z.z)
									if(Z.dir==SOUTH|Z.dir==NORTHWEST) M.loc=locate(Z.x,Z.y+1,Z.z)
									if(Z.dir==EAST|Z.dir==SOUTHEAST) M.loc=locate(Z.x-1,Z.y,Z.z)
									if(Z.dir==WEST|Z.dir==SOUTHWEST) M.loc=locate(Z.x+1,Z.y,Z.z)
									M.dir=Z.dir
							del(src)
						else
							M.Ki-=5
							view(M)<<"[M] deflects the blast!"
							density=0
							var/obj/A=new/obj/attack/blast
							A.icon=icon
							A.KiSetting=0
							A.icon_state=icon_state
							A.loc=locate(M.x,M.y,M.z)
							A.density=1
							A.Pow=Pow
							A.PL=PL
							A.dir=M.dir
							walk(A,pick(NORTH,SOUTH,EAST,WEST,NORTHWEST,SOUTHWEST,NORTHEAST,NORTHWEST))
							if(M.zanzoskill>=100&&owner) for(var/mob/Z in view(M))
								if(Z.name==owner)
									spawn flick('Zanzoken.dmi',M)
									if(Z.dir==NORTH|Z.dir==NORTHEAST) M.loc=locate(Z.x,Z.y-1,Z.z)
									if(Z.dir==SOUTH|Z.dir==NORTHWEST) M.loc=locate(Z.x,Z.y+1,Z.z)
									if(Z.dir==EAST|Z.dir==SOUTHEAST) M.loc=locate(Z.x-1,Z.y,Z.z)
									if(Z.dir==WEST|Z.dir==SOUTHWEST) M.loc=locate(Z.x+1,Z.y,Z.z)
									M.dir=Z.dir
							del(src)
					else //new
						M.HP-=dmg1+dmg2*100/37/4*2
						if(piercer)
							density=0
							spawn(1) density=1
						if(M.dir==dir&&M.Oozarou)
							view(M)<<"[owner] blasts [M]'s tail off!"
							M<<"[owner] blasts your tail off!"
							M.Tail=0
							M.Oozarou_Revert()
							M.overlays-='Modified Tail.dmi'
							M.underlays-='Modified Tail.dmi'
							M.Str/=1.1
							M.StrMod/=1.1
							M.End/=1.1
							M.EndMod/=1.1
							M.Spd*=1.1
							M.SpdMod*=1.1
						if(mega) new/obj/BigCrater(locate(x,y,z))
						if(M.HP<=0)
							if(M.player)
								if(!M.KO) M<<"You have been defeated by [owner]'s blast!"
								if(M.Race=="Majin") if(PL>(M.RecordPL*1250)) M.buudead=1
								if(M.Race=="Bio-Android"|M.Race=="Bebi") if(PL>(M.RecordPL*500)) M.buudead=1
								if(M.immortal) if(PL>(M.RecordPL*750)) M.buudead=1
								if(PL>=500000) new /obj/destroyed(locate(M.x,M.y,M.z))
								if(KiSetting|piercer)
									if(!M.immortal|M.buudead)
										if(owner!=usr)
											view(M)<<"[M] was killed by [owner]([ownkey])!"
											if(piercer) M.buudead=0
											for(var/mob/Q) if(owner==Q) for(var/obj/Contact/A in Q.contents) if(A.name=="[M.name] ([M.displaykey])")
												if(A.relation=="Good"|A.relation=="Very Good"|A.relation=="Rival/Good")
													Q<<"[A.name] contact deleted. Obviously if your killing your friends they must not actually be your friends."
													del(A)
											M.Death()
										else M.KO()
								else M.KO()
							if(M.monster)
								view(M)<<"[M] was killed by [owner]([ownkey])!"
								if(PL>=500) new/obj/destroyed(locate(M.x,M.y,M.z))
								del(M)
								if(!piercer) del(src)
						if(shockwave)
							var/kbdist=round(5+(kilevel/5))
							if(kbdist>20) kbdist=20
							M.dir=turn(dir,180)
							while(kbdist)
								if(PL>50000000&&M) for(var/turf/Z in get_step(M,M.dir)) Z.Destroy()
								if(PL>50000000) for(var/turf/T in view(1,M)) T.Destroy()
								step_away(M,src)
								sleep(1)
								kbdist-=1
						if(!piercer) del(src)
				else if(!piercer) del(src)
			if(istype(M,/obj/attack))
				if(M.dir!=dir|M.owner!=owner) //New line...
					if(PL<100000 && PL>10000) new/obj/destroyed(locate(M.x,M.y,M.z))
					if(PL>=100000) new/obj/BigCrater(locate(M.x,M.y,M.z))
					del(M)
					del(src)
			if(istype(M,/turf))
				if(M.density&&PL>10000)
					var/amount=0
					for(var/turf/T in view(0,M))
						T.opacity=0
						T.density=0
					for(var/obj/buildables/A in view(0,M))
						amount+=1
						if(amount>3) del(A)
					var/turf/Q=M
					Q.Destroy()
				if(!piercer) del(src)
			if(istype(M,/obj/Clone_Machine))
				var/obj/Clone_Machine/A=M
				A.Health-=Pow*0.00001
				if(A.Health<=0)
					A.icon_state="Crushed Healing Tank"
					A.density=0
			else if(!piercer) del(src)
			if(!piercer) del(src)
		//Windmill Shurikens...
		else
			if(istype(M,/mob))
				if(M.attackable)
					var/dmg1=(Pow/M.Res)
					var/dmg2=(((PL+1)/(M.PL+1))/10)
					var/dmg3=(dmg1+dmg2)
					var/dmg4=(((dmg3)*100)/37) //3%
					var/dmg=dmg4
					M.HP-=dmg
					if(M.HP<=0)
						if(M.player) M.KO()
						else
							view(M)<<"[M] was killed by [owner]([ownkey])!"
							del(M)
			var/sdir=rand(1,8)
			if(sdir==1) walk(src,NORTH)
			if(sdir==2) walk(src,SOUTH)
			if(sdir==3) walk(src,EAST)
			if(sdir==4) walk(src,WEST)
			if(sdir==5) walk(src,NORTHEAST)
			if(sdir==6) walk(src,NORTHWEST)
			if(sdir==7) walk(src,SOUTHEAST)
			if(sdir==8) walk(src,SOUTHWEST)
obj/var/shockwave
obj/destroyed
	icon='Craters.dmi'
	icon_state="small crater"
obj/BigCrater
	icon='Craters.dmi'
	icon_state="Center"
	New()
		..()
		var/image/A=image(icon='Craters.dmi',icon_state="N",pixel_y=32)
		var/image/B=image(icon='Craters.dmi',icon_state="S",pixel_y=-32)
		var/image/C=image(icon='Craters.dmi',icon_state="E",pixel_x=32)
		var/image/D=image(icon='Craters.dmi',icon_state="W",pixel_x=-32)
		var/image/E=image(icon='Craters.dmi',icon_state="NE",pixel_y=32,pixel_x=32)
		var/image/F=image(icon='Craters.dmi',icon_state="NW",pixel_y=32,pixel_x=-32)
		var/image/G=image(icon='Craters.dmi',icon_state="SE",pixel_y=-32,pixel_x=32)
		var/image/H=image(icon='Craters.dmi',icon_state="SW",pixel_y=-32,pixel_x=-32)
		overlays.Add(A,B,C,D,E,F,G,H)
obj/var
	Pow
	PL
	kinxt
	firstfire
	KiSetting=1 //kill
	owner
	kixp=0
	kilevel=2
	piercer
	paralysis
mob/var/tmp/owner
obj/Move()
	..()
	if(istype(src,/obj/attack/blast))
		for(var/turf/T in view(1,src)) if(!T.opacity) if(prob(Pow/100)&&PL>50000000) T.Destroy()
obj/KiAttacks/BusterBarrage
	var/POWER=3
	var/REFIRE=0.5 //Half that for legendaries.
	var/DEFAULTUNDERLAY='Brolly1.dmi'
	var/USEDUNDERLAY
	verb/Description()
		set category=null
		usr<<"You can just click this and balls of ki will start flying randomly in all directions, its got average power and average drain"
	Click()
		set category="Skills"
		if(!usr.med&&!usr.train)
			if(!usr.KO&&usr.Ki>=1)
				if(!usr.blasting)
					usr.blasting=1
					USEDUNDERLAY=DEFAULTUNDERLAY
					USEDUNDERLAY+=rgb(usr.blastR,usr.blastG,usr.blastB)
					usr.overlays+=USEDUNDERLAY
					spawn while(usr.blasting)
						if(usr.Ki>=1&&!usr.KO&&!usr.med&&!usr.train)
							usr.Ki-=1
							sleep(usr.refire/2*REFIRE)
							var/obj/A=new/obj/attack/blast/
							A.icon='28.dmi'
							A.icon_state="28"
							A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
							A.Pow=((usr.Pow*POWER)+(kilevel/8))
							A.PL=usr.PL*0.1
							A.owner=usr
							A.ownkey=usr.displaykey
							A.loc=locate(usr.x,usr.y,usr.z)
							spawn(3) if(A)
								A.x+=rand(-1,1)
								A.y+=rand(-1,1)
							A.KiSetting=usr.KiSet
							var/dir=rand(1,8)
							if(dir==1) A.dir=NORTH
							if(dir==2) A.dir=SOUTH
							if(dir==3) A.dir=EAST
							if(dir==4) A.dir=WEST
							if(dir==5) A.dir=NORTHWEST
							if(dir==6) A.dir=NORTHEAST
							if(dir==7) A.dir=SOUTHWEST
							if(dir==8) A.dir=SOUTHEAST
							walk(A,A.dir,rand(1,2))
							spawn(3) if(A) A.density=1
							spawn(usr.Pow+(kilevel/10)) if(A) del(A)
							var/obj/B=new/obj/attack/blast/
							B.icon='28.dmi'
							B.icon_state="28"
							B.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
							B.Pow=((usr.Pow*POWER)+(kilevel/5))
							B.PL=usr.PL
							B.owner=usr
							B.ownkey=usr.displaykey
							dir=rand(1,8)
							if(dir==1) B.dir=NORTH
							if(dir==2) B.dir=SOUTH
							if(dir==3) B.dir=EAST
							if(dir==4) B.dir=WEST
							if(dir==5) B.dir=NORTHWEST
							if(dir==6) B.dir=NORTHEAST
							if(dir==7) B.dir=SOUTHWEST
							if(dir==8) B.dir=SOUTHEAST
							B.loc=locate(usr.x,usr.y,usr.z)
							spawn(3) if(B)
								B.x+=rand(-1,1)
								B.y+=rand(-1,1)
							B.KiSetting=usr.KiSet
							B.dir=rand(1,8)
							walk(B,B.dir,rand(1,2))
							spawn(3) if(B) B.density=1
							spawn(usr.Pow+(kilevel/10)) if(B) del(B)
							usr.Blast_Gain()
							usr.kimanip+=(0.005*usr.kimanipmod)
							kixp+=5
							if(!firstfire)
								usr<<"<font size=1>Press it again to stop firing."
								firstfire=1
								kinxt=usr.kinxt
							while(kixp>=kinxt)
								kixp-=kinxt
								kilevel+=1
								kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<b><font size=1><font color=yellow>[src] level +1"
							suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						else
							usr.overlays-=USEDUNDERLAY
							usr.blasting=0
				else
					usr.overlays-=USEDUNDERLAY
					usr.blasting=0
obj/KiAttacks/Arm_Laser
	verb/Description()
		set category=null
		usr<<"A somewhat stronger version than the basic blast. Androids only."
	Click()
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=0.25&&!usr.blasting)
			usr.blasting=1
			kixp+=1
			if(prob(50)) usr.Blast_Gain()
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			if(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.002*usr.kimanipmod)
			usr.Ki-=0.25
			var/bcolor=usr.BLASTICON
			bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)
			var/obj/A=new/obj/attack/blast
			A.loc=locate(usr.x,usr.y,usr.z)
			A.icon='29.dmi'
			A.icon_state="29"
			A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
			A.density=1
			A.Pow=usr.Pow
			A.PL=usr.PL
			A.KiSetting=usr.KiSet
			A.owner=usr
			A.ownkey=usr.displaykey
			A.dir=usr.dir
			A.Burnout()
			walk(A,usr.dir)
			var/reload=round((usr.refire/(kilevel-1))*5)
			if(reload<2) reload=2
			reload=round(reload)
			spawn(reload) usr.blasting=0
//Buster Shell
mob/var/hasbustershell
obj/KiAttacks/BusterShell
	verb/Description()
		set category=null
		usr<<"A fairly strong attack."
	Click()
		set category=null
		if(!usr.med&&!usr.train)
			if(!usr.KO&&usr.Ki>=4&&!usr.blasting)
				usr.blasting=1
				kixp+=16*usr.Cblastpower
				if(!firstfire)
					firstfire=1
					kinxt=usr.kinxt
				while(kixp>=kinxt)
					kixp-=kinxt
					kilevel+=1
					kinxt+=usr.kinxtadd
					usr.Learn_Attack()
					usr<<"<font color=yellow>[src] level +1"
				suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
				usr.kimanip+=(0.032*usr.kimanipmod)
				usr.Ki-=4+usr.Cblastpower
				var/bicon=usr.bursticon
				var/AuraColor=usr.AuraColor
				bicon+=AuraColor
				var/image/I=image(icon=bicon,icon_state=usr.burststate)
				usr.overlays+=I
				spawn(50) usr.overlays-=I
				spawn(50) usr.overlays-=I
				spawn(50) usr.overlays-=I
				sleep((usr.refire*usr.Cblastpower)*2)
				var/balls=0
				while(balls<4)
					balls+=1
					var/obj/A=new/obj/attack/blast/
					spawn(usr.Pow+(kilevel/10)) if(A) del(A)
					A.icon='Ki Death Ball.dmi'
					A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
					A.icon_state="[balls]"
					A.dir=usr.dir
					A.mega=1
					if(balls==1) A.loc=locate(usr.x,usr.y,usr.z)
					if(balls==2) A.loc=locate(usr.x+1,usr.y,usr.z)
					if(balls==3) A.loc=locate(usr.x,usr.y-1,usr.z)
					if(balls==4) A.loc=locate(usr.x+1,usr.y-1,usr.z)
					step(A,A.dir)
					A.density=1
					A.Pow=(usr.Pow+(kilevel/10))*17*usr.Cblastpower
					A.PL=usr.PL
					A.KiSetting=usr.KiSet
					A.owner=usr
					A.ownkey=usr.displaykey
					spawn A.BusterShell()
					A.density=0
					spawn walk(A,usr.dir,2)
					A.density=1
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.blasting=0
obj/proc/BusterShell()
	while(src)
		if(dir==NORTH|dir==SOUTH)
			x+=1
			sleep(1)
			x-=1
		else
			y+=1
			sleep(1)
			y-=1
		sleep(1)

//Death Ball
obj/KiAttacks/DeathBall
	verb/Description()
		set category=null
		usr<<"KEKEKEKEKEKE"
	Click()
		set category=null
		if(!usr.med&&!usr.train)
			if(!usr.KO&&usr.Ki>=4&&!usr.blasting)
				usr.blasting=1
				kixp+=16*usr.Cblastpower
				if(!firstfire)
					firstfire=1
					kinxt=usr.kinxt
				while(kixp>=kinxt)
					kixp-=kinxt
					kilevel+=1
					kinxt+=usr.kinxtadd
					usr.Learn_Attack()
					usr<<"<font color=yellow>[src] level +1"
				suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
				usr.kimanip+=(0.032*usr.kimanipmod)
				usr.Ki-=4+usr.Cblastpower
				var/bicon=usr.bursticon
				bicon+=usr.AuraColor
				var/image/I=image(icon=bicon,icon_state=usr.burststate)
				usr.overlays+=I
				spawn(50) usr.overlays-=I
				spawn(50) usr.overlays-=I
				spawn(50) usr.overlays-=I
				sleep((usr.refire*usr.Cblastpower)*2)
				var/balls=0
				while(balls<4)
					balls+=1
					var/obj/A=new/obj/attack/blast/
					spawn(usr.Pow+(kilevel/10)) if(A) del(A)
					A.icon='Ki Death Ball.dmi'
					A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
					A.icon_state="[balls]"
					if(balls==1) A.loc=locate(usr.x,usr.y,usr.z)
					if(balls==2) A.loc=locate(usr.x+1,usr.y,usr.z)
					if(balls==3) A.loc=locate(usr.x,usr.y-1,usr.z)
					if(balls==4) A.loc=locate(usr.x+1,usr.y-1,usr.z)
					step(A,usr.dir)
					A.density=1
					A.Pow=(usr.Pow+(kilevel/10))*20*usr.Cblastpower
					A.PL=usr.PL
					A.dir=usr.dir
					A.KiSetting=usr.KiSet
					A.owner=usr
					A.ownkey=usr.displaykey
					walk(A,usr.dir,2)
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.blasting=0
obj/Skills/Self_Destruct
	var/tmp/using
	verb/Self_Destruct()
		set category="Skills"
		switch(input("Are you sure you want to do this?", "", text) in list ("No", "Yes",))
			if("Yes")
				using=1
				usr.move=0
				view(20)<<"[usr] begins gathering all the energy around him into his body!"
				sleep(30)
				view(20)<<"The ground begins to shake fiercely around [usr]!"
				sleep(30)
				view(12)<<"A huge explosion eminates from [usr] and surrounds the area!"
				for(var/turf/T in view(18))
					if(prob(10)) sleep(1)
					T.overlays+='Lightning flash.dmi'
					T.layer=MOB_LAYER+1
					spawn(rand(50,100)) new/turf/Ground8(locate(T.x,T.y,T.z))
				for(var/mob/M in view(18)) if(M!=usr)
					M.HP-=((usr.PL+usr.MaxPL)/(M.PL+M.MaxPL))*1000
					if(M.HP<=0)
						if(M.Race=="Majin"|M.Race=="Bio-Android")
							if(usr.MaxPL/M.RecordPL*25000>=300) M.buudead=1
							else M.buudead=0
						spawn M.Death()
						view(M)<<"[M] was killed by [usr]!"
				if(prob(99)) spawn usr.Death()
				usr.Ki=0
				usr.move=1
				using=0
			if("No")
				return
mob/var/Makkankoicon='Ki Makkankosappo.dmi'
obj/KiAttacks/Piercer_Ray
	Wave=1
	var/KiReq=2
	var/WaveMult=5
	var/ChargeRate=5
	var/MaxDistance=60
	var/MoveDelay=4
	var/Piercer=1
	var/Sleeper=2
	verb/Description()
		set category=null
		usr<<"This 'beam' is extremely powerful like the Kamehameha, and moves extremely fast. The disadvantages for this are that it has extremely high drain and charges extremely slow. It also has pretty good range, maybe the best range of all beams. Also, if it does hit, it kills, even if you have your ki set to knock-out, its always lethal."
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO&&!usr.shielding)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon=usr.Makkankoicon
				A.animate_movement=0
				A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
				A.density=0
				A.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
				A.PL=(usr.PL*chargelvl)*0.1
				A.layer=MOB_LAYER+2
				A.KiSetting=usr.KiSet
				A.owner=usr.name
				A.ownkey=usr.displaykey
				A.WaveAttack=1
				A.piercer=Piercer
				if(!charging&&!usr.blasting)
					charging=1
					usr.blasting=1
					usr.move=0
					spawn(10) while(charging|streaming|usr.blasting)
						sleep(1)
						if(prob(10))
							kixp+=1
							if(!firstfire)
								firstfire=1
								kinxt=usr.kinxt
							if(kixp>=kinxt)
								kixp-=kinxt
								kilevel+=1
								kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<font color=yellow>[src] level +1"
							suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						if(usr.KO|usr.Ki<KiReq)
						 charging=0
						 streaming=0
						 usr.blasting=0
						 chargelvl=0
						 spawn(10) if(!usr.KO) usr.move=1
						 usr<<"You lose the energy you were charging."
					spawn while(charging&&!streaming)
						if(chargelvl>=1) if(A) A.PL=((usr.PL*chargelvl)*4)
						chargelvl+=1
						usr.Ki-=1
						if(prob(10)) for(var/mob/M in oview(usr)) if(M.equipped&&A.PL<10000000) M<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(prob(10)&&usr.equipped&&A.PL<10000000) usr<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(chargelvl) usr<<"<font color=[usr.SayFont]>[src] x[chargelvl]"
						sleep((usr.refire*15*ChargeRate*Sleeper)/usr.kimanip)
				else if(!streaming&&charging&&usr.blasting)
					usr.move=0
					charging=0
					A.loc=locate(usr.x,usr.y,usr.z)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					var/distance=1
					if(A) distance=((A.Pow*kilevel-2)/50)
					if(distance>MaxDistance) distance=MaxDistance
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon=usr.Makkankoicon
						B.animate_movement=0
						B.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
						B.layer=MOB_LAYER+3
						B.icon_state="origin"
						B.density=0
						B.WaveAttack=1
						B.piercer=Piercer
						B.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
						distance=((B.Pow*kilevel-2)/50)
						if(distance>MaxDistance) distance=MaxDistance
						spawn(distance) del(B)
						B.PL=(usr.PL*chargelvl)*0.1*WaveMult*ChargeRate
						B.KiSetting=usr.KiSet
						spawn(MoveDelay) if(B) B.layer=MOB_LAYER+1
						B.owner=usr.name
						B.ownkey=usr.displaykey
						B.loc=locate(usr.x,usr.y,usr.z)
						step(B,usr.dir)
						spawn walk(B,usr.dir,MoveDelay)
						usr.Ki-=KiReq
						usr.move=0
				else
					charging=0
					streaming=0
					usr.blasting=0
					chargelvl=0
					spawn(10) if(!usr.KO) usr.move=1
mob/var/ChargeState="1"
mob/proc/AddChargeOverlay()
	var/obj/I=new/obj
	I.layer=MOB_LAYER+99
	I.icon='BlastCharges.dmi'
	I.icon_state=ChargeState
	I.icon+=rgb(blastR,blastG,blastB)
	overlays+=I
	sleep(10)
	while(blasting) sleep(1)
	overlays-=I
	if(I) del(I)
mob/var/Kamehamehaicon
obj/KiAttacks/Kamehameha
	Wave=1
	var/KiReq=1
	var/WaveMult=5
	var/ChargeRate=2
	var/MaxDistance=120
	var/MoveDelay=9
	var/Piercer=0
	var/Sleeper=2
	verb/Description()
		set category=null
		usr<<"An attack far superior to the standard energy wave in power, but it moves a lot slower, and charges a lot slower, and drains a lot more energy"
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO&&!usr.shielding)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon=usr.Kamehamehaicon
				A.animate_movement=0
				A.density=0
				A.Pow=(usr.Pow+(kilevel/10))+(8*usr.PowMod)
				A.PL=(usr.PL*chargelvl)*0.5
				A.layer=MOB_LAYER+2
				A.KiSetting=usr.KiSet
				A.owner=usr.name
				A.ownkey=usr.displaykey
				A.WaveAttack=1
				A.piercer=Piercer
				if(!charging&&!usr.blasting)
					charging=1
					usr.blasting=1
					usr.move=0
					spawn(10) while(charging|streaming|usr.blasting)
						sleep(1)
						if(prob(10))
							kixp+=1
							if(!firstfire)
								firstfire=1
								kinxt=usr.kinxt
							if(kixp>=kinxt)
								kixp-=kinxt
								kilevel+=1
								kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<font color=yellow>[src] level +1"
							suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						if(usr.KO|usr.Ki<KiReq)
						 charging=0
						 streaming=0
						 usr.blasting=0
						 chargelvl=0
						 spawn(10) if(!usr.KO) usr.move=1
						 usr<<"You lose the energy you were charging."
					spawn while(charging&&!streaming)
						if(chargelvl>=1) if(A) A.PL=((usr.PL*chargelvl)*4)
						chargelvl+=1
						usr.Ki-=1
						if(prob(10)) for(var/mob/M in oview(usr)) if(M.equipped&&A.PL<10000000) M<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(prob(10)&&usr.equipped&&A.PL<10000000) usr<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(chargelvl) usr<<"<font color=[usr.SayFont]>[src] x[chargelvl]"
						sleep((usr.refire*15*ChargeRate*Sleeper)/usr.kimanip)
				else if(!streaming&&charging&&usr.blasting)
					usr.move=0
					charging=0
					var/distance=((A.Pow*kilevel-2)/50)
					if(distance>MaxDistance) distance=MaxDistance
					A.loc=locate(usr.x,usr.y,usr.z)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(usr.PLpcnt>130) sleep(Sleeper*2)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon=usr.Kamehamehaicon
						B.animate_movement=0
						B.layer=MOB_LAYER+3
						B.icon_state="origin"
						B.density=0
						B.WaveAttack=1
						B.piercer=Piercer
						B.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
						distance=((B.Pow*kilevel-2)/50)
						if(distance>MaxDistance) distance=MaxDistance
						spawn(distance) del(B)
						B.PL=(usr.PL*chargelvl)*0.1*WaveMult*ChargeRate
						B.KiSetting=usr.KiSet
						spawn(MoveDelay) if(B) B.layer=MOB_LAYER+1
						B.owner=usr.name
						B.ownkey=usr.displaykey
						B.loc=locate(usr.x,usr.y,usr.z)
						step(B,usr.dir)
						spawn walk(B,usr.dir,MoveDelay)
						usr.Ki-=KiReq
						usr.move=0
				else
					charging=0
					streaming=0
					usr.blasting=0
					chargelvl=0
					spawn(10) if(!usr.KO) usr.move=1
obj/KiAttacks/Energy_Wave
	Wave=1
	var/KiReq=0.2
	var/WaveMult=1
	var/ChargeRate=1
	var/MaxDistance=80
	var/MoveDelay=6
	var/Piercer=0
	var/Sleeper=2
	verb/Description()
		set category=null
		usr<<"A standard beam of energy, as far as other beams go this moves at an average speed, charges at an average rate, has average power, and not much energy drain, and average range"
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl&&!usr.shielding) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO&&!usr.shielding)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon=usr.WaveIcon
				A.animate_movement=0
				A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
				A.density=0
				A.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
				A.PL=(usr.PL*chargelvl)*0.1
				A.layer=MOB_LAYER+2
				A.KiSetting=usr.KiSet
				if(usr) A.owner=usr.name
				A.ownkey=usr.displaykey
				A.WaveAttack=1
				A.piercer=Piercer
				if(!charging&&!usr.blasting)
					charging=1
					usr.blasting=1
					usr.move=0
					spawn(10) while(charging|streaming|usr.blasting)
						sleep(1)
						if(prob(10))
							kixp+=1
							if(!firstfire)
								firstfire=1
								kinxt=usr.kinxt
							if(kixp>=kinxt)
								kixp-=kinxt
								kilevel+=1
								kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<font color=yellow>[src] level +1"
							suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						if(usr.KO|usr.Ki<KiReq)
						 charging=0
						 streaming=0
						 usr.blasting=0
						 chargelvl=0
						 spawn(10) if(!usr.KO) usr.move=1
						 usr<<"You lose the energy you were charging."
					spawn while(charging&&!streaming)
						if(chargelvl>=1) if(A) A.PL=((usr.PL*chargelvl)*4)
						chargelvl+=1
						usr.Ki-=1
						if(prob(10)) for(var/mob/M in oview(usr)) if(M.equipped&&A.PL<10000000) M<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(prob(10)&&usr.equipped&&A.PL<10000000) usr<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(chargelvl) usr<<"<font color=[usr.SayFont]><font size=[usr.TextSize]>[src] x[chargelvl]"
						sleep((usr.refire*15*ChargeRate*Sleeper)/usr.kimanip)
				else if(!streaming&&charging&&usr.blasting)
					usr.move=0
					charging=0
					A.loc=locate(usr.x,usr.y,usr.z)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					var/distance=1
					if(A) distance=((A.Pow*kilevel-2)/50)
					if(distance>MaxDistance) distance=MaxDistance
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(usr.PLpcnt>150) sleep(Sleeper*2)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon=usr.WaveIcon
						B.animate_movement=0
						B.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
						B.layer=MOB_LAYER+3
						B.icon_state="origin"
						B.density=0
						B.WaveAttack=1
						B.piercer=Piercer
						B.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
						distance=((B.Pow*kilevel-2)/50)
						if(distance>MaxDistance) distance=MaxDistance
						spawn(distance) del(B)
						B.PL=(usr.PL*chargelvl)*0.1*WaveMult*ChargeRate
						B.KiSetting=usr.KiSet
						spawn(MoveDelay) if(B) B.layer=MOB_LAYER+1
						if(usr) B.owner=usr.name
						B.ownkey=usr.displaykey
						B.loc=locate(usr.x,usr.y,usr.z)
						step(B,usr.dir)
						spawn walk(B,usr.dir,MoveDelay)
						usr.Ki-=KiReq
						usr.move=0
				else
					charging=0
					streaming=0
					usr.blasting=0
					chargelvl=0
					spawn(10) if(!usr.KO) usr.move=1
obj/KiAttacks/var
	Wave
	chargelvl=0
	charging=0
	streaming
obj/var/WaveAttack
mob/var/WaveIcon='Beam14.dmi'
obj/KiAttacks/Shield
	verb/Teach(mob/M in view(1,usr))
		set category=null
		if(usr.kimanip>=12)
			if(M.kimanip>=6)
				var/hasit
				for(var/obj/KiAttacks/Shield/A in M.contents) hasit=1
				if(!hasit)
					view(12,usr)<<"[usr] teaches [M] the shield technique."
					M.contents+=new/obj/KiAttacks/Shield
				else usr<<"They already have this."
			else usr<<"Their ki manipulation isnt high enough to learn this."
		else usr<<"Your ki manipulation isnt high enough to teach this."
	Click()
		set hidden=1
		if(!usr.blasting&&!usr.charging&&!usr.shielding&&usr.Ki>=((usr.MaxKi/2)/usr.shieldskill))
			usr.shielding=1
			usr.blasting=1
			usr.overlays+=usr.shieldcolor
		else
			usr.shielding=0
			usr.blasting=0
			usr.overlays-=usr.shieldcolor
mob/var/shielding
mob/var/shieldskill=1
mob/var/shieldcolor='Shield Big.dmi'
obj/KiAttacks/Enkumei
	Wave=1
	var/KiReq=1
	var/WaveMult=10
	var/ChargeRate=0.2
	var/MaxDistance=120
	var/MoveDelay=5
	var/Piercer=0
	var/Sleeper=2
	verb/Description()
		set category=null
		usr<<"Probably one of the most forceful beams in the game, it also has average speed, good charge rate, good max range, and average everything else"
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO&&!usr.shielding)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon='Ki Enkumei.dmi'
				A.animate_movement=0
				A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
				A.density=0
				A.Pow=(usr.Pow+(kilevel/20))+(6*usr.PowMod)
				A.PL=(usr.PL*chargelvl)*0.5
				A.layer=MOB_LAYER+2
				A.KiSetting=usr.KiSet
				A.owner=usr.name
				A.ownkey=usr.displaykey
				A.WaveAttack=1
				A.piercer=Piercer
				if(!charging&&!usr.blasting)
					charging=1
					usr.blasting=1
					usr.move=0
					spawn(10) while(charging|streaming|usr.blasting)
						sleep(1)
						if(prob(10))
							kixp+=1
							if(!firstfire)
								firstfire=1
								kinxt=usr.kinxt
							if(kixp>=kinxt)
								kixp-=kinxt
								kilevel+=1
								kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<font color=yellow>[src] level +1"
							suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						if(usr.KO|usr.Ki<KiReq)
						 charging=0
						 streaming=0
						 usr.blasting=0
						 chargelvl=0
						 spawn(10) if(!usr.KO) usr.move=1
						 usr<<"You lose the energy you were charging."
					spawn while(charging&&!streaming)
						if(chargelvl>=1) if(A) A.PL=((usr.PL*chargelvl)*4)
						chargelvl+=1
						usr.Ki-=1
						if(prob(10)) for(var/mob/M in oview(usr)) if(M.equipped&&A.PL<10000000) M<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(prob(10)&&usr.equipped&&A.PL<10000000) usr<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(chargelvl) usr<<"<font color=[usr.SayFont]>[src] x[chargelvl]"
						sleep((usr.refire*15*ChargeRate*Sleeper)/usr.kimanip)
				else if(!streaming&&charging&&usr.blasting)
					usr.move=0
					charging=0
					A.loc=locate(usr.x,usr.y,usr.z)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					var/distance=((A.Pow*kilevel-2)/50)
					if(distance>MaxDistance) distance=MaxDistance
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(usr.PLpcnt>150) sleep(Sleeper*2)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon='Ki Enkumei.dmi'
						B.animate_movement=0
						B.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
						B.layer=MOB_LAYER+3
						B.icon_state="origin"
						B.density=0
						B.WaveAttack=1
						B.piercer=Piercer
						B.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
						distance=((B.Pow*kilevel-2)/50)
						if(distance>MaxDistance) distance=MaxDistance
						spawn(distance) del(B)
						B.PL=(usr.PL*chargelvl)*0.1*WaveMult*ChargeRate
						B.KiSetting=usr.KiSet
						spawn(MoveDelay) if(B) B.layer=MOB_LAYER+1
						B.owner=usr.name
						B.ownkey=usr.displaykey
						B.loc=locate(usr.x,usr.y,usr.z)
						step(B,usr.dir)
						spawn walk(B,usr.dir,MoveDelay)
						usr.Ki-=KiReq
						usr.move=0
				else
					charging=0
					streaming=0
					usr.blasting=0
					chargelvl=0
					spawn(10) if(!usr.KO) usr.move=1
/*
Unblockable
Has a chance to decrease the opponents ki as well because of limb damage.
Drains a static amount of the usr's ki plus an additional 10%
Moves in a zig-zag pattern to confuse targets and make it harder to dodge
*/
obj/var/deflectable=1
obj/KiAttacks/Kienzan
	verb/Description()
		set category=null
		usr<<"This attack is very powerful and is unblockable, it drains a large chunk of your energy AND a percentage of your energy, which makes it more powerful but it will always have significant drain because of that. It moves in a zig-zag pattern to confuse the opponent so they dont know which way to move in order to dodge."
	verb/Teach(mob/M in view(1,usr))
		set category=null
		if(M.Race!="Namekian"&&M.Race!="Ancient Namek"&&M.Race!="Kai"&&M.Race!="Kanassa-Jin")
			if(usr.kimanip>=12)
				if(M.kimanip>=6)
					var/hasit
					for(var/obj/KiAttacks/Kienzan/A in M.contents) hasit=1
					if(!hasit)
						view(12,usr)<<"[usr] teaches [M] the Kienzan disc."
						M.contents+=new/obj/KiAttacks/Kienzan
					else usr<<"They already have this."
				else usr<<"Their ki manipulation isnt high enough to learn this."
			else usr<<"Your ki manipulation isnt high enough to teach this."
		else usr<<"[M.Race]'s cannot learn this.."
	Click()
		if(usr.Ki<100+(usr.MaxKi*0.1)) usr<<"You do not have enough energy for this powerful attack."
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=100+(usr.MaxKi*0.1)&&!usr.blasting)
			usr.blasting=1
			usr.move=0
			kixp+=16
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			while(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.032*usr.kimanipmod)
			usr.Ki-=100+(usr.MaxKi*0.1)
			var/bicon=usr.bursticon
			bicon+=usr.AuraColor
			var/image/I=image(icon='Ki Kienzan.dmi')
			I.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
			I.pixel_y+=18
			usr.overlays+=I
			sleep(usr.refire)
			usr.overlays-=I
			var/bcolor='Ki Kienzan.dmi'
			bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)
			var/obj/A=new/obj/attack/blast
			spawn if(A) A.Burnout()
			spawn if(A) A.ZigZag()
			A.icon=bcolor
			A.loc=locate(usr.x,usr.y,usr.z)
			A.density=1
			A.Pow=(usr.Pow+(kilevel/10))*35
			A.PL=usr.PL*2
			A.dir=usr.dir
			A.KiSetting=usr.KiSet
			A.owner=usr
			A.ownkey=usr.displaykey
			A.deflectable=0
			A.dir=usr.dir
			step(A,usr.dir)
			walk(A,usr.dir,2)
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.blasting=0
			usr.move=1
obj/proc/ZigZag()
	spawn while(src)
		if(dir==NORTH|dir==SOUTH)
			if(src) pixel_x+=16
			sleep(1)
			if(src) pixel_x-=16
			sleep(1)
			if(src) pixel_x-=16
			sleep(1)
			if(src) pixel_x+=16
		else if(dir==EAST|dir==WEST)
			if(src) pixel_y+=16
			sleep(1)
			if(src) pixel_y-=16
			sleep(1)
			if(src) pixel_y-=16
			sleep(1)
			if(src) pixel_y+=16
		else sleep(1)
obj/KiAttacks/Kikoho
	verb/Description()
		set category=null
		usr<<"This attack, like Kienzan, drains a percentage of Energy, but -also- a percentage of Health. Because of this it is a very powerful attack, its single hit power is only exceeded by perhaps the spirit bomb or maybe megaburst, each hit to the opponent knocks them very far away, each one is unblockable. It can be fired pretty rapidly but if you drain all of your health using it then it will knock you out, and has a chance to KILL you if that happens. It is probably the strongest attack in the game, in the sense that by repeating it over and over you can deal huge amounts of damage in a short period of time."
	verb/Teach(mob/M in view(1,usr))
		set category=null
		if(usr.kimanip>=12)
			if(M.kimanip>=6)
				var/hasit
				for(var/obj/KiAttacks/Kikoho/A in M.contents) hasit=1
				if(!hasit)
					view(12,usr)<<"[usr] teaches [M] the Kikoho attack."
					M.contents+=new/obj/KiAttacks/Kikoho
				else usr<<"They already have this."
			else usr<<"Their ki manipulation isnt high enough to learn this."
		else usr<<"Your ki manipulation isnt high enough to teach this."
	Click()
		if(!usr.med&&!usr.train&&!usr.KO&&usr.Ki>=usr.MaxKi*0.1&&usr.HP>=10&&!usr.blasting)
			usr.blasting=1
			usr.Ki-=usr.MaxKi*0.1
			usr.HP-=20
			spawn(10) if(usr.HP<=0)
				spawn usr.KO()
				if(prob(10)) usr.Death()
			usr.Blast_Gain()
			usr.Blast_Gain()
			usr.Blast_Gain()
			kixp+=10
			if(!firstfire)
				firstfire=1
				kinxt=usr.kinxt
			while(kixp>=kinxt)
				kixp-=kinxt
				kilevel+=1
				kinxt+=usr.kinxtadd
				usr.Learn_Attack()
				usr<<"<font color=yellow>[src] level +1"
			suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
			usr.kimanip+=(0.02*usr.kimanipmod)
			var/obj/A=new/obj/attack/blast
			var/scale=64
			var/xtiles
			var/ytiles
			var/disposition
			disposition=48
			xtiles=(scale*0.03125)
			ytiles=xtiles
			A.icon='Ki Kikoho.dmi'
			A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
			var/icon/I=new(A.icon)
			if(I) I.Scale(scale,scale)
			while(ytiles>0)
				if(prob(20)) sleep(1)
				A.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
			A.icon=null
			A.Burnout()
			A.Pow=((usr.Pow)+(kilevel/10))*40
			A.PL=usr.PL*5
			A.owner=usr
			A.ownkey=usr.displaykey
			A.loc=locate(usr.x,usr.y,usr.z)
			A.dir=usr.dir
			A.KiSetting=usr.KiSet
			A.density=1
			A.shockwave=1
			step(A,usr.dir)
			A.deflectable=0
			var/obj/B=new/obj/attack/blast
			B.Burnout()
			B.Pow=((usr.Pow)+(kilevel/10))*33
			B.PL=usr.PL*5
			B.owner=usr
			B.ownkey=usr.displaykey
			B.loc=locate(usr.x,usr.y,usr.z)
			step(B,turn(usr.dir,90))
			B.dir=usr.dir
			B.KiSetting=usr.KiSet
			B.deflectable=0
			B.density=1
			B.shockwave=1
			step(B,usr.dir)

			var/obj/C=new/obj/attack/blast
			C.Burnout()
			C.Pow=((usr.Pow)+(kilevel/10))*33
			C.PL=usr.PL*5
			C.owner=usr
			C.ownkey=usr.displaykey
			C.loc=locate(usr.x,usr.y,usr.z)
			step(C,turn(usr.dir,-90))
			C.dir=usr.dir
			C.KiSetting=usr.KiSet
			C.density=1
			C.deflectable=0
			C.shockwave=1
			step(C,usr.dir)

			if(A) walk(A,A.dir,2)
			if(B) walk(B,B.dir,2)
			if(C) walk(C,C.dir,2)
			sleep(usr.refire*3)
			usr.blasting=0
obj/KiAttacks/Final_Flash
	Wave=1
	var/KiReq=10
	var/WaveMult=50
	var/ChargeRate=10
	var/MaxDistance=240
	var/MoveDelay=12
	var/Piercer=0
	var/Sleeper=12
	var/Size=64
	verb/Description()
		set category=null
		usr<<"Probably the -most- powerful beam in the game, and the largest. But it sacrifices a lot to get its high power. It drains a lot of energy, moves extremely slow, and charges extremely slow"
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO&&!usr.shielding)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon='Ki Final Flash.dmi'
				A.animate_movement=0
				A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
				A.density=0
				A.Pow=(usr.Pow+(kilevel/10))+(9*usr.PowMod)
				A.PL=(usr.PL*chargelvl)*0.85
				A.layer=MOB_LAYER+2
				A.KiSetting=usr.KiSet
				A.owner=usr.name
				A.ownkey=usr.displaykey
				A.WaveAttack=1
				A.piercer=Piercer
				if(!charging&&!usr.blasting)
					charging=1
					usr.blasting=1
					usr.move=0
					spawn(10) while(charging|streaming|usr.blasting)
						sleep(1)
						if(prob(10))
							kixp+=1
							if(!firstfire)
								firstfire=1
								kinxt=usr.kinxt
							if(kixp>=kinxt)
								kixp-=kinxt
								kilevel+=1
								kinxt+=usr.kinxtadd
								usr.Learn_Attack()
								usr<<"<font color=yellow>[src] level +1"
							suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
						if(usr.KO|usr.Ki<KiReq)
						 charging=0
						 streaming=0
						 usr.blasting=0
						 chargelvl=0
						 spawn(10) if(!usr.KO) usr.move=1
						 usr<<"You lose the energy you were charging."
					spawn while(charging&&!streaming)
						if(chargelvl>=1) if(A) A.PL=((usr.PL*chargelvl)*4)
						chargelvl+=1
						usr.Ki-=1
						if(prob(10)) for(var/mob/M in oview(usr)) if(M.equipped&&A.PL<10000000) M<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(prob(10)&&usr.equipped&&A.PL<10000000) usr<<"<font color=green>SCOUTER: [usr]'s energy level has risen to [A.PL/5]"
						if(chargelvl) usr<<"<font color=[usr.SayFont]>[src] x[chargelvl]"
						sleep((usr.refire*15*ChargeRate*Sleeper)/usr.kimanip)
				else if(!streaming&&charging&&usr.blasting)
					usr.move=0
					charging=0

					var/scale=Size
					var/xtiles
					var/ytiles
					var/disposition
					if(scale==32) disposition=32
					if(scale==64) disposition=48
					if(scale==128) disposition=80
					if(scale==256) disposition=144
					if(scale==512) disposition=272
					if(Size>32)
						scale=Size
						xtiles=(scale*0.03125)
						ytiles=xtiles
						var/icon/I=new(A.icon)
						I.Scale(scale,scale)
						while(ytiles>0)
							if(prob(20)) sleep(1)
							A.overlays+=image(icon=I,icon_state="[A.icon_state] [xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
							xtiles-=1
							if(!xtiles)
								ytiles-=1
								xtiles=(scale*0.03125)
						A.icon=null

					A.loc=locate(usr.x,usr.y,usr.z)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					var/distance=((A.Pow*kilevel-2)/50)
					if(distance>MaxDistance) distance=MaxDistance
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon='Ki Final Flash.dmi'
						B.animate_movement=0
						B.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
						B.layer=MOB_LAYER+3
						B.icon_state="origin"
						B.density=0
						B.WaveAttack=1
						B.piercer=Piercer
						B.Pow=(usr.Pow+(kilevel/10))+(5*usr.PowMod)
						distance=((B.Pow*kilevel-2)/50)
						if(distance>MaxDistance) distance=MaxDistance
						spawn(distance) del(B)
						B.PL=(usr.PL*chargelvl)*0.1*WaveMult*ChargeRate
						B.KiSetting=usr.KiSet
						spawn(MoveDelay) if(B) B.layer=MOB_LAYER+1
						B.owner=usr.name
						B.ownkey=usr.displaykey

						if(Size>32)
							xtiles=(scale*0.03125)
							ytiles=xtiles
							var/icon/Z=new(B.icon)
							Z.Scale(scale,scale)
							while(ytiles>0)
								if(prob(20)) sleep(1)
								B.overlays+=image(icon=Z,icon_state="[B.icon_state] [xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
								xtiles-=1
								if(!xtiles)
									ytiles-=1
									xtiles=(scale*0.03125)
							B.icon=null

						B.loc=locate(usr.x,usr.y,usr.z)
						step(B,usr.dir)
						spawn walk(B,usr.dir,MoveDelay)
						usr.Ki-=KiReq
						usr.move=0
				else
					charging=0
					streaming=0
					usr.blasting=0
					chargelvl=0
					spawn(10) if(!usr.KO) usr.move=1
mob/var/tmp/goingssj4
mob/var
	powerup=0
	powerdown=0
	AURA='Aura Normal.dmi'
	ssj4aura
	Over
obj/Skills/Power_Control
	verb/Power_Control()
		set category="Skills"
		var/powerupprcnt = input ("How much do you wish to modify this by?") as num
		if(powerupprcnt>usr.MaxPLpcnt)
			powerupprcnt=999
		else
			usr.PLpcnt=powerupprcnt
			if(usr.snj)
				usr.overlays+='SNj Elec.dmi'
			else
				usr.overlays+=usr.AURA
				sleep(100)
				usr.overlays-=usr.AURA
			if(usr.ssj)
				if(usr.ssj==4) usr.underlays+=usr.ssj4aura
				if(usr.ssj==3)
					usr.underlays+='Aura SSj3.dmi'
					sleep(15)
					usr.underlays-='Aura SSj3.dmi'
				if(usr.ssj==2)
					usr.overlays+='SSj Aura.dmi'
					sleep(15)
					usr.underlays-='SSj Aura.dmi'
				else if(usr.ssj==1)
					if(usr.ssjdrain>=300&&!usr.expandlevel)
						if(!usr.Over) usr.underlays+=usr.AURA
						else usr.overlays+=usr.AURA
					else usr.overlays+='SSj Aura.dmi'

obj/Skills/Cell
	verb/Cell()
		set category="Skills"
		usr.Cell4()
obj/Skills/SSJ
	verb/SSJ()
		set category="Skills"
		if(!usr.ssj&&usr.PL>=usr.ssjat) if(usr.hasssj&&usr.PL>=usr.ssjat) usr.SSj()
obj/Skills/SSJ2
	verb/SSJ2()
		set category="Skills"
		if(usr.hasssj2&&usr.PL>=usr.ssj2at) usr.SSj2()
obj/Skills/SSJ3
	verb/SSJ3()
		set category="Skills"
		if(usr.ssj==2&&usr.PL>=usr.ssj3at) if(usr.ssj3able|usr.hitcountermain>=usr.ssj3hitreq) usr.SSj3()
obj/Skills/SSJ4
	verb/SSJ4()
		set category="Skills"
		if(!usr.ssj&&usr.PL>=usr.ssj3at) if(usr.hasssj4&&usr.PL>=usr.ssj3at) usr.SSj4()
obj/Skills/Transform
	verb/Transform()
		set category="Skills"
		usr.Changeling_Forms()
		sleep(2000)
obj/Skills/UnTransform
	verb/UnTransform()
		set category="Skills"
		spawn usr.Revert()
		sleep(2000)
mob/proc
	powerdownforkbattack()
		if(powerup)
			powerup=0
			if(!Over) underlays-=AURA
			else overlays-=AURA
			overlays-='SNj Elec.dmi'
			overlays-='SSj Aura.dmi'
			overlays-='SSj Aura.dmi'
			overlays-='SSj Aura.dmi'
			underlays-='Aura SSj3.dmi'
			underlays-=ssj4aura
			underlays-='Mutant Aura.dmi'
			src<<"You stop powering up."
	Increase_Powerup() if(PLpcnt>110) MaxKi+=0.001*KiMod*timemult
obj/KiAttacks/Kill_Driver
	verb/Description()
		set category=null
		usr<<"The Baseniojin racial ability, it is just a ring of energy that when making contact with an opponent will cause them a bit of damage but also stun the opponent, it is far superior to the typical paralysis attack that some other races have. Also t cannot be deflected and will send whoever it hits flying."
	Click()
		if(usr.Ki<50)
			usr<<"You do not yet have enough energy."
			return
		if(!usr.med&&!usr.train)
			if(!usr.KO&&usr.Ki>=50&&!usr.blasting)
				usr.blasting=1
				kixp+=16
				if(!firstfire)
					firstfire=1
					kinxt=usr.kinxt
				while(kixp>=kinxt)
					kixp-=kinxt
					kilevel+=1
					kinxt+=usr.kinxtadd
					usr.Learn_Attack()
					usr<<"<font color=yellow>[src] level +1"
				suffix="Level [kilevel-2] ([round(kixp)]/[round(kinxt)])"
				usr.kimanip+=(0.05*usr.kimanipmod)
				usr.Ki-=50
				var/bicon=usr.bursticon
				bicon+=usr.AuraColor
				var/image/I=image(icon=bicon,icon_state=usr.burststate)
				usr.overlays+=I
				spawn(50) usr.overlays-=I
				spawn(50) usr.overlays-=I
				spawn(50) usr.overlays-=I
				sleep(usr.refire)
				var/bcolor=usr.CBLASTICON
				bcolor+=rgb(usr.blastR,usr.blastG,usr.blastB)
				var/obj/A=new/obj/attack/blast
				A.Burnout()
				A.paralysis=1
				A.deflectable=0
				A.shockwave=1
				A.icon='BasenioBlast.dmi'
				A.loc=locate(usr.x,usr.y,usr.z)
				A.density=1
				A.Pow=(usr.Pow+(kilevel/10))*8
				A.PL=usr.PL
				A.dir=usr.dir
				A.KiSetting=usr.KiSet
				A.owner=usr
				A.ownkey=usr.displaykey
				A.dir=usr.dir
				step(A,usr.dir)
				walk(A,usr.dir,2)
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.Blast_Gain()
				usr.blasting=0