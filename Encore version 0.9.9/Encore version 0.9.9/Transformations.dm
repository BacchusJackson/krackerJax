mob/var
	formgain=0
	hasbigform=0
	telepathy=1
mob/proc/Auto_Gain()
	if(Race=="Namekian")
		if(RecordPL>=500&MaxKi>=1000&!hasbigform&&cangivepower) //gives Giant Namekian
			hasbigform=1
			usr<<"You surge with power and your size begins to grow."
			GNamek()
			usr<<"((You can turn this form on or off by clicking yourself))"
	if(Race=="Ancient Namek")
		if(RecordPL>=250&&MaxKi>=1200&!hasbigform&&cangivepower) //gives Giant Namekian
			hasbigform=1
			usr<<"You surge with power and your size begins to grow."
			GNamek()
			usr<<"((You can turn this form on or off by clicking yourself))"
	if(Class=="Black Baseniojin")
		if(RecordPL>=1&!hasbigform&&cangivepower)
			hasbigform=1
			usr<<"You surge with power and your size begins to grow."
			GNamek()
			usr<<"((You can turn this form on or off by clicking yourself))"
	if(Class=="Kanassa-Jin"|Class=="Konatsu"|Class=="Style1"|Class=="Style2"|Class=="Style3"|Class=="Burter"|Class=="Jeice"|Class=="Baseniojin"|Class=="Immecka"|Class=="Yukenojin"|Class=="Yardrat")
		if(RecordPL>=1&!hasbigform&&cangivepower&&prob(0.05))
			hasbigform=1
			usr<<"You surge with power and your size begins to grow."
			GNamek()
			usr<<"((You can turn this form on or off by clicking yourself))"
	if(Class=="Konatsu") if(!formgain&&RecordPL>=250000)
		formgain=1
		PLMod*=18//brings it to 180
	if(Race=="Quarter-Saiyan")if (!formgain&&RecordPL>=100000)
		formgain=1
		PLMod*=10//brings it to 150
	if(Race=="Demi-God"&&RecordPL>100000&&!formgain)
		formgain=1
		PLMod*=10//brings it to 150
	if(Race=="Spirit Doll"&&!formgain&&RecordPL>125000)
		PLMod*=100//Brings it to 150
		formgain=1
		MaxKi*=2
		KiMod*=2
	if(BasePL>=ascat)
		if(Race=="Human"&&!formgain)
			if(kimanip>=100&&MaxPLpcnt>=500)
				formgain=1
				asc=1
				PLMod=200 //brings to 200
				RecordPL*=1.1
				MaxKi*=2
				KiMod*=2
				usr<<"Your not sure how, but something is different about you now..."
	if(RecordPL>=1000000)
		if(Class=="Earth Halfie"&&!formgain)
			PLMod*=15 //brings mod to 150
			formgain=1
		if(Class=="Vegeta Halfie"&&!formgain)
			PLMod*=7.5
			formgain=1
	if(RecordPL>=500000)
		if(Class=="Low-Class"&&!formgain)
			PLMod*=32
			formgain=1
		if(Class=="Elite"&&!formgain)
			PLMod*=11
			formgain=1
		if(Class=="Normal"&&!formgain)
			PLMod*=16
			formgain=1
	if(RecordPL>=1000000&&!formgain)
		if(Race=="Namekian")
			PLMod*=2.5 //brings to 187.5
			formgain=1
	if(RecordPL>=200000&&!formgain)
		if(Race=="Changeling")
			formgain=1
			PLMod*=30 //brings mod to 165
	if(RecordPL>=200000&&!formgain)
		if(Race=="Makyojin")
			formgain=1
			PLMod*=35 //brings mod to 140
	if(RecordPL>=200000&&!formgain)
		if(Race=="Ancient Namek")
			PLMod*=8 //brings to 160
			formgain=1
		if(Race=="Demon")
			PLMod*=15 //brings mod to 150
			formgain=1
		if(Race=="Arconian")
			PLMod*=30//Brings mod to 30-300
			formgain=1
		if(Class=="Konatsu")
			PLMod=150
		if(Race=="Tsufurujin")
			PLMod*=100 //Brings mod to 125
			formgain=1
		if(Race=="Android")
			PLMod*=5 //brings to 125
			formgain=1
		if(Race=="Bio-Android")
			PLMod*=2 //brings to 100
			formgain=1
		if(Race=="Kai")
			PLMod*=30
			formgain=1
	if(RecordPL>=1000000&&!formgain)
		if(Race=="Hybrid")
			PLMod=150
			formgain=1
mob/var
	bigform
	list/bigformoverlays=new/list
mob/proc/GNamek() // Giant Namekian
	if(weapon)
		usr<<"You cannot do this with a weapon on."
	else
		if(!transing)
			transing=1
			move=0
			usr<<"You begin to focus and your body begins to bulge..."
			bigform=1
			Str*=2 //Giant Namek increases str and end and PL temporarily
			End*=2
			absorbadd+=RecordPL*1.5
			Spd/=1.5
			Defense/=1.5
			Offense/=1.5
			usr.overlays=null
			var/scale=64
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/disposition=48
			for(var/obj/O in bigformoverlays)
				var/icon/I=new(O.icon)
				I.Scale(scale,scale)
				while(ytiles>0)
					sleep(1)
					overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
					xtiles-=1
					if(!xtiles)
						ytiles-=1
						xtiles=(scale*0.03125)
			scale=64
			xtiles=(scale*0.03125)
			ytiles=xtiles
			disposition=48
			var/icon/I=new(icon)
			I.Scale(scale,scale)
			while(ytiles>0)
				sleep(1)
				overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
			oicon=icon
			icon=I
		usr<<"You finish focusing your energy and have increased in size."
		move=1
		transing=0
mob/var
	asc=0
	ascat
	//---------------
	snj=0
	snjat=1000000
	snjmult=25
	//----------------
	legendary=0
	hasssj=0
	ssj=0
	ssjat=2000000
	ssjadd=10000000
	ssjmult=1.25
	ssjdrain=150
	ssjmod=1
	firsttime=0

	hasssj2=0
	ssj2=0
	ssj2at=100000000
	ssj2add=50000000
	ssj2mult=2
	ssj2drain=150
	ssj2permdrain=200
	ssj2mod=1

	ssj3able=0
	ssj3hitreq=4000
	ssj3=0
	ssj3at=400000000
	ssj3mult=1.65
	ssj3drain=100
	ssj3permdrain=100
	ssj3mod=1
	//---------------
	//Based on Frieza...
	f2=0
	f2at=1
	f2mult=1486667

	f3=0
	f3at=4
	f3mult=2486667

	f4=0
	f4at=95
	f4mult=3936667
	//----------------
	cell2at=10000000
	cell2=0
	cell2mult=3

	cell3at=40000000
	cell3=0
	cell3mult=2

	cell4=0
	cell4mult=3 //this is the only temp form, others are perm.
	cell4drain=200
//-----------------------------------------------------------------------
mob/proc/Revert()
	if(Race=="Ancient Namek"|Race=="Arconian"|Race=="Namekian"&&bigform)
		move=0
		Str/=2
		End/=2
		Spd*=1.5
		Defense*=1.5
		Offense*=1.5
		absorbadd=0
		bigform=0
		overlays.Remove(overlays)
		overlays.Add(bigformoverlays)
		icon=oicon
		move=1
		usr<<"You revert back to normal size"
	if(Race=="Bio-Android")
		if(ssj)
			ssj=0
			icon='Bio Android 3.dmi'
			MaxPL/=cell4mult
			usr<<"You regress to your original form."
	if(Race=="Changeling")
		if(Class=="King Kold Type")
			if(f2)
				icon=oicon
				f2=0
				absorbadd=0
		else
			if(f2)
				icon=oicon
				f2=0
				absorbadd-=f2mult
			if(f3)
				icon=oicon
				icon='Changeling Form 2.dmi'
				f3=0
				f2=1
				absorbadd-=f3mult
			if(f4)
				icon=oicon
				icon='Changeling Form 3.dmi'
				if(Class=="Koola Type") icon='Cooler Form 4.dmi'
				f4=0
				f3=1
				absorbadd-=f4mult


	else if(ssj>0)
		if(ssj==1)
			RecordPL/=ssjmult
		else if(ssj==2)
			RecordPL/=ssjmult
			RecordPL/=ssj2mult
		else if(ssj==3)
			RecordPL/=ssjmult
			RecordPL/=ssj2mult
			RecordPL/=ssj3mult
		if(ssj==4)
			KiRegen*=5
			Spd/=1.5 //SSj4 increases running speed but decreases offense and defense.
			Offense*=1.5
			Defense*=1.5
		absorbadd=0
		ssj=0
		overlays-='SSj Aura.dmi'
		overlays-='Elec.dmi'
		overlays-='Electric_Blue.dmi'
		overlays-=ssjhair
		overlays-=ussjhair
		overlays-=ssjfphair
		overlays-=ssj2hair
		overlays-=ssj3hair
		overlays-=ssj4hair
		overlays-='Electric_Yellow.dmi'
		overlays-='SSj Aura.dmi'
		overlays-='Elec.dmi'
		overlays-='Electric_Blue.dmi'
		overlays-='ssj4 body attempt.dmi'
		overlays-='Modified Tail ssj4.dmi'
		overlays-=ssjhair
		overlays-=ussjhair
		overlays-=ssjfphair
		overlays-=ssj2hair
		overlays-=ssj3hair
		overlays-=ssj4hair
		overlays-=hair
		overlays-=hair
		overlays-=hair
		overlays-=hair
		overlays-=hair
		overlays-=hair
		overlays-=hair
		overlays-=hair
		overlays+=hair
		spawn(50) overlays-=ssjhair
mob/proc/Cell4()
	if(!ssj&&Race=="Bio-Android"&&cell3==1)
		ssj=1
		overlays+='SNj Elec.dmi'
		icon='Bio Android 4.dmi'
		MaxPL*=cell4mult
mob/proc/Super_Saiyan_Stats()
	firsttime+=1
	var/amount=2
	while(amount)
		amount-=1
		var/chance=rand(1,7)
		if(chance==1) Str+=500*StrMod
		if(chance==2) End+=500*EndMod
		if(chance==3) Pow+=500*PowMod
		if(chance==4) Res+=500*ResMod
		if(chance==5) Spd+=500*SpdMod
		if(chance==6) Offense+=500*OffenseMod
		if(chance==7) Defense+=500*DefenseMod
		BLASTSTATE="[rand(1,36)]"
		CBLASTSTATE="[rand(1,36)]"
mob/proc/Quake()
	var/duration=30
	if(client) while(duration)
		duration-=1
		for(var/mob/M in view(src))
			if(M.client)
				M.client.pixel_x=rand(-8,8)
				M.client.pixel_y=rand(-8,8)
			if(!duration) if(M.client)
				M.client.pixel_x=0
				M.client.pixel_y=0
		sleep(1)
mob/var/tmp/transing
mob/proc/SSj()
	if(!transing)
		transing=1
		if(ssjdrain<750)
			move=0
			dir=SOUTH
			if(!firsttime) Super_Saiyan_Stats()
			BLASTICON='BlastsAscended.dmi'
			blastR=200
			blastG=200
			blastB=50
			spawn if(src)
				overlays-=hair
				overlays+=ssjhair
				sleep(rand(3,10))
				overlays-=ssjhair
				overlays+=hair
				sleep(rand(3,10))
				overlays-=hair
				overlays+=ssjhair
				sleep(rand(3,10))
				overlays-=ssjhair
				overlays+=hair
			if(elite)
				for(var/turf/T in view(src))
					if(prob(5)) spawn(rand(10,150)) T.overlays+='Electric_Blue.dmi'
					if(prob(5)) spawn(rand(10,150)) T.overlays+='DelayedElectricBlue.dmi'
					else if(prob(15)) spawn(rand(10,150)) T.overlays+='Rising Rocks.dmi'
					spawn(rand(100,200)) T.overlays-='Electric_Blue.dmi'
					spawn(rand(100,200)) T.overlays-='DelayedElectricBlue.dmi'
					spawn(rand(100,200)) T.overlays-='Rising Rocks.dmi'
				spawn EliteGroundGrind()
				var/kiamount=8
				while(kiamount)
					sleep(1)
					var/obj/attack/A=new/obj/attack/blast
					A.icon='36.dmi'
					A.icon_state="36"
					A.icon+=rgb(50,200,200)
					A.loc=locate(x,y,z)
					A.dir=kiamount
					A.PL=PL
					A.Pow=Pow
					spawn(rand(10,50)) if(A) new/obj/BigCrater(locate(A.x,A.y,A.z))
					spawn(200) if(A) del(A)
					spawn walk(A,A.dir,2)
					if(prob(80)&&!kiamount) kiamount=8
					kiamount-=1
			else
				for(var/turf/T in view(src))
					if(prob(5)) spawn(rand(10,150)) T.overlays+='Electric_Yellow.dmi'
					else if(prob(5)) spawn(rand(10,150)) T.overlays+='SSj Lightning.dmi'
					else if(prob(15)) spawn(rand(10,150)) T.overlays+='Rising Rocks.dmi'
					spawn(rand(100,200)) T.overlays-='Electric_Yellow.dmi'
					spawn(rand(100,200)) T.overlays-='SSj Lightning.dmi'
					spawn(rand(100,200)) T.overlays-='Rising Rocks.dmi'
			spawn for(var/turf/T in view(10))
				var/image/W=image(icon='Lightning flash.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
				spawn(2) T.overlays-=W
			var/amount=8
			sleep(50)
			var/image/I=image(icon='Aurabigtop.dmi')
			I.pixel_y+=32
			overlays+=I
			overlays+='Aurabigbottom.dmi'
			sleep(100)
			Quake()
			spawn Quake()
			while(amount)
				var/obj/A=new/obj
				A.loc=locate(x,y,z)
				A.icon='Electricgroundbeam.dmi'
				if(amount==8) spawn walk(A,NORTH,2)
				if(amount==7) spawn walk(A,SOUTH,2)
				if(amount==6) spawn walk(A,EAST,2)
				if(amount==5) spawn walk(A,WEST,2)
				if(amount==4) spawn walk(A,NORTHWEST,2)
				if(amount==3) spawn walk(A,NORTHEAST,2)
				if(amount==2) spawn walk(A,SOUTHWEST,2)
				if(amount==1) spawn walk(A,SOUTHEAST,2)
				spawn(50) del(A)
				amount-=1
			spawn for(var/turf/T in view(10))
				var/image/W=image(icon='Lightning flash.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
				spawn(2) T.overlays-=W
			spawn(20) new/obj/BigCrater(locate(x,y,z))
			move=1
			spawn(30) overlays-=I
			spawn(30) overlays-='Aurabigbottom.dmi'
			var/image/Y=image(icon='Craters.dmi',icon_state="small crater")
			spawn for(var/turf/T in view(src)) if(prob(5))
				spawn(rand(1,50)) T.overlays+=Y
				spawn(rand(100,150)) T.overlays-=Y
			ssj=1
			hasssj=1
			overlays-='SSj Aura.dmi'
			overlays+='SSj Aura.dmi'
			view(src)<<"<font color=yellow>*A great wave of power emanates from [src] as a yellow aura bursts around them!*"
			if(ssjdrain<200) Quake()
			spawn if(ssjdrain<250) Quake()
			sleep((300/ssjdrain)*10)
			view(src)<<"<font color=yellow>*[src]'s hair stands on end and turns yellow!*"
			overlays-=hair
			overlays-=hair
			if(legendary) overlays+=ussjhair
			else if(ssjdrain>=300) overlays+=ssjfphair
			else overlays+=ssjhair
			RecordPL*=ssjmult
			absorbadd+=ssjadd
		transing=0
mob/proc/SSj2GroundGrind()
	for(var/turf/T in view(2,src))
		if(prob(20)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
	for(var/turf/T in view(4,src))
		if(prob(20)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
	for(var/turf/T in view(6,src))
		if(prob(20)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
	for(var/turf/T in view(8,src))
		if(prob(20)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
mob/proc/EliteGroundGrind()
	for(var/turf/T in view(2,src))
		if(prob(10)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
	for(var/turf/T in view(4,src))
		if(prob(10)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
	for(var/turf/T in view(6,src))
		if(prob(10)) sleep(1)
		var/image/I=image(icon='Turf Dirt.dmi',dir=rand(1,8))
		I.pixel_x+=rand(-16,16)
		I.pixel_y+=rand(-16,16)
		if(prob(50)) T.overlays+=I
		spawn(600) if(I)
			T.overlays-=I
			del(I)
mob/proc/SSj2()
	if(!transing)
		transing=1
		if(ssj2drain<200)
			move=0
			dir=SOUTH
			if(firsttime==1) Super_Saiyan_Stats()
			BLASTICON='BlastsAscended.dmi'
			blastR=200
			blastG=200
			blastB=50
			for(var/turf/T in view(src))
				if(prob(10)) spawn(rand(10,150)) T.overlays+='Electric_Blue.dmi'
				else if(prob(10)) spawn(rand(10,150)) T.overlays+='SSj Lightning.dmi'
				else if(prob(30)) spawn(rand(10,150)) T.overlays+='Rising Rocks.dmi'
				spawn(rand(200,400)) T.overlays-='Electric_Blue.dmi'
				spawn(rand(200,400)) T.overlays-='SSj Lightning.dmi'
				spawn(rand(200,400)) T.overlays-='Rising Rocks.dmi'
			spawn(rand(40,60)) for(var/turf/T in view(10))
				var/image/W=image(icon='Lightning flash.dmi',layer=MOB_LAYER+1)
				T.overlays+=W
				spawn(2) T.overlays-=W
			var/amount=16
			sleep(50)
			var/image/I=image(icon='Aurabigtop.dmi')
			I.pixel_y+=32
			overlays+=I
			overlays+='Aurabigbottom.dmi'
			sleep(100)
			Quake()
			Quake()
			Quake()
			spawn Quake()
			spawn SSj2GroundGrind()
			while(amount)
				var/obj/A=new/obj
				A.loc=locate(x,y,z)
				A.icon='Electricgroundbeam2.dmi'
				if(amount==8) spawn(rand(1,50)) walk(A,NORTH,2)
				if(amount==7) spawn(rand(1,50)) walk(A,SOUTH,2)
				if(amount==6) spawn(rand(1,50)) walk(A,EAST,2)
				if(amount==5) spawn(rand(1,50)) walk(A,WEST,2)
				if(amount==4) spawn(rand(1,50)) walk(A,NORTHWEST,2)
				if(amount==3) spawn(rand(1,50)) walk(A,NORTHEAST,2)
				if(amount==2) spawn(rand(1,50)) walk(A,SOUTHWEST,2)
				if(amount==1) spawn(rand(1,50)) walk(A,SOUTHEAST,2)
				spawn(50) del(A)
				amount-=1
			spawn(20) new/obj/BigCrater(locate(x,y,z))
			move=1
			spawn(30) overlays-=I
			spawn(30) overlays-='Aurabigbottom.dmi'
			spawn for(var/turf/T in view(src)) spawn(rand(1,50)) if(prob(1)) new/obj/BigCrater(locate(T.x,T.y,T.z))
		if(!legendary&&ssj==1)
			ssj=2
			if(!hasssj2) ssj2at/=2
			hasssj2=1
			overlays-='Elec.dmi'
			overlays+='Elec.dmi'
			view(6)<<"<font color=yellow>*A great wave of power emanates from [usr] as a yellow aura bursts around them!*"
			spawn if(ssj2drain<250) Quake()
			sleep((300/ssj2drain)*10)
			view(6)<<"<font color=yellow>*Blue sparks begin to burst around [usr]!*"
			overlays-=hair
			overlays-=hair
			overlays-=ssjhair
			overlays-=ussjhair
			overlays-=ssjfphair
			overlays+=ssj2hair
			RecordPL*=ssj2mult
			absorbadd+=ssj2add
		transing=0
mob/proc/SSj3()
	if(!transing)
		transing=1
		if(ssj==2)
			//Flashy stuff
			for(var/turf/T in view(24,src))
				if(prob(20))
					spawn(rand(10,150)) T.overlays+='Rising Rocks.dmi'
					spawn(rand(600,3000)) T.overlays-='Rising Rocks.dmi'
				if(prob(1))
					spawn(rand(10,150)) T.overlays+='Electric_Blue.dmi'
					spawn(rand(600,3000)) T.overlays-='Electric_Blue.dmi'
				if(prob(1))
					spawn(rand(10,150)) T.overlays+='DelayedElectricBlue.dmi'
					spawn(rand(600,3000)) T.overlays-='DelayedElectricBlue.dmi'
			var/image/I=image(icon='Aurabigtop.dmi')
			I.pixel_y+=32
			overlays+=I
			overlays+='Aurabigbottom.dmi'
			spawn(100) overlays-=I
			spawn(100) overlays-='Aurabigbottom.dmi'
			//---
			ssj=3
			overlays-='Elec.dmi'
			overlays-='Electric_Blue.dmi'
			overlays+='Electric_Blue.dmi'
			view(6)<<"<font color=yellow>*A great wave of power emanates from [usr] as a yellow aura bursts around them!*"
			Quake()
			spawn Quake()
			sleep(((300/ssj3drain)+1)*10)
			view(6)<<"<font color=yellow>*[usr]'s aura spikes upward as their hair grows longer!*"
			overlays-=hair
			overlays-=hair
			overlays-=ssjhair
			overlays-=ussjhair
			overlays-=ssjfphair
			overlays-=ssj2hair
			overlays+=ssj3hair
			RecordPL*=ssj3mult
		transing=0
mob/var
	hasssj4
	ssj4hair
	ssj4mult=7 //SSj2 mult is 6, SSj3 mult is 9.9
	ssj4add=200000000
mob/proc/SSj4()
	if(!transing)
		transing=1
		if(hitcountermain>=20000)
			var/thehair='Hair_SSj4.dmi'
			thehair+=rgb(HairR,HairG,HairB)
			ssj4hair=thehair
			if(!ssj)
				if(firsttime==2)
					move=0
					dir=SOUTH
					Super_Saiyan_Stats()
					BLASTICON='BlastsAscended.dmi'
					blastR=200
					blastG=200
					blastB=50
					for(var/turf/T in view(src))
						if(prob(10)) spawn(rand(10,150)) T.overlays+='Electric_Blue.dmi'
						else if(prob(10)) spawn(rand(10,150)) T.overlays+='SSj Lightning.dmi'
						else if(prob(30)) spawn(rand(10,150)) T.overlays+='Rising Rocks.dmi'
						spawn(rand(200,400)) T.overlays-='Electric_Blue.dmi'
						spawn(rand(200,400)) T.overlays-='SSj Lightning.dmi'
						spawn(rand(200,400)) T.overlays-='Rising Rocks.dmi'
					var/amount=32
					sleep(50)
					var/image/I=image(icon='Aurabigtop.dmi')
					I.pixel_y+=32
					overlays+=I
					overlays+='Aurabigbottom.dmi'
					sleep(100)
					while(amount)
						var/obj/A=new/obj
						A.loc=locate(x,y,z)
						A.icon='Electricgroundbeam2.dmi'
						if(amount==8) spawn(rand(1,100)) walk(A,NORTH,2)
						if(amount==7) spawn(rand(1,100)) walk(A,SOUTH,2)
						if(amount==6) spawn(rand(1,100)) walk(A,EAST,2)
						if(amount==5) spawn(rand(1,100)) walk(A,WEST,2)
						if(amount==4) spawn(rand(1,100)) walk(A,NORTHWEST,2)
						if(amount==3) spawn(rand(1,100)) walk(A,NORTHEAST,2)
						if(amount==2) spawn(rand(1,100)) walk(A,SOUTHWEST,2)
						if(amount==1) spawn(rand(1,100)) walk(A,SOUTHEAST,2)
						spawn(100) del(A)
						amount-=1
					move=1
					spawn(30) overlays-=I
					spawn(30) overlays-='Aurabigbottom.dmi'
				ssj=4
				hasssj4=1
				KiRegen/=5
				overlays-='Elec.dmi'
				overlays-='Electric_Blue.dmi'
				overlays-=hair
				overlays-=ssjhair
				overlays-=ussjhair
				overlays-=ssjfphair
				overlays-=ssj2hair
				overlays-=ssj3hair
				overlays+=ssj4hair
				overlays+='ssj4 body attempt.dmi'
				overlays+='Modified Tail ssj4.dmi'
				overlays+='Electric_Yellow.dmi'

				Spd*=1.5 //SSj4 increases running speed but decreases offense and defense.
				Offense/=1.5
				Defense/=1.5
				absorbadd+=ssj4add*ssj4mult
		transing=0
mob/proc/SNj()
	if(!snj&&usr.Age>=25)
		snj=1
		RecordPL+=200000
		PLMod*=snjmult
		MaxKi+=1000*KiMod
		kimanip+=10
		flightskill+=100
		usr<<"You feel your powers leap incredibly."

mob/proc/Changeling_Forms()
	if(Race=="Changeling")
		if(Class=="Frieza Type")
			if(!f2&&f3&&!f4&&PL>=f4at)
				f2=0
				f3=0
				f4=0
				f4=1
				absorbadd+=f4mult
				icon='Changeling Form 4.dmi'
				overlays-=overlays
			if(f2&&!f3&&!f4&&PL>=f3at)
				f2=0
				f3=0
				f4=0
				f3=1
				absorbadd+=f3mult
				icon='Changeling Form 3.dmi'
				overlays-=overlays
			if(!f2&&!f3&&!f4&&PL>=f2at)
				f2=0
				f3=0
				f4=0
				f2=1
				absorbadd+=f2mult
				icon='Changeling Form 2.dmi'
				overlays-=overlays
		if(Class=="Koola Type")
			if(!f2&&f3&&!f4&&PL>=f4at)
				f2=0
				f3=0
				f4=0
				f4=1
				absorbadd+=f4mult
				icon='Koola Final Form.dmi'
				overlays-=overlays
			if(f2&&!f3&&!f4&&PL>=f3at)
				f2=0
				f3=0
				f4=0
				f3=1
				absorbadd+=(f3mult*2)
				icon='Cooler Form 4.dmi'
				overlays-=overlays
			if(!f2&&!f3&&!f4&&PL>=f2at)
				f2=0
				f3=0
				f4=0
				f2=1
				absorbadd+=(f2mult*4)
				icon='Changeling Form 2.dmi'
				overlays-=overlays
		if(Class=="King Kold Type"&&!f2&&!f3&&!f4&&PL>=f2at)
			f2=0
			f3=0
			f4=0
			f2=1
			absorbadd+=f2mult+f4mult
			icon='Changeling Form 2.dmi'
			overlays-=overlays
mob/var
	geteye //when you actually get the ability
	thirdeye
mob/proc/ThirdEye()
	if(!thirdeye)
		thirdeye=1
		usr.Pow+=250*usr.PowMod
		usr.MaxKi+=250*usr.KiMod
		usr.kimanip+=35*usr.kimanipmod
		usr.see_invisible=5
		usr.PLMod*=1.5
		usr.overlays+='Third Eye-Blue.dmi'
	else
		return
mob/var
	expandlevel=0
	expandicon
	var/list/BEoverlays=new/list
	immersion=0
	immersed
	drunk
	drunken
mob/Rank/verb/Drunken_Boxing()
	set category="Skills"
	if(!usr.drunk)
		usr.drunk=1
		if(!usr.drunken)
			usr.absorbadd+=usr.MaxPL*1.5
			usr.End*=1.6
			usr.Str/=1.2
			usr.Offense/=1.2
			usr.Defense*=1.6
			usr<<"You down some booze and allow the true nature of Drunken Boxing to take form."
			usr.drunken=1
		else
			usr.absorbadd=0
			usr.Str*=1.2
			usr.End/=1.6
			usr.Offense*=1.2
			usr.Defense/=1.6
			usr<<"You sober up."
			usr.drunken=0
		sleep(10)
		usr.drunk=0
obj/Skills/Energy_Immersion/verb/Energy_Immersion()
	set category="Skills"
	if(!usr.immersion)
		usr.immersion=1
		if(!usr.immersed)
			usr.absorbadd+=usr.MaxPL*1.5
			usr.Spd*=1.5
			usr.Offense*=1.5
			usr.Str/=1.5
			usr<<"You immerse your body with energy causing you to move faster than normal."
			usr.immersed=1
		else
			usr.absorbadd=0
			usr.Spd/=1.5
			usr.Str*=1.5
			usr.Offense/=1.5
			usr<<"You allow the collected energy in your body to disperse, returning you to normal."
			usr.immersed=0
		sleep(10)
		usr.immersion=0
obj/Skills/Body_Expand/verb/Body_Expand()
	set category="Skills"
	switch(input("", "",text) in list ("One", "Two", "Three", "Four", "Five", "Revert", "Cancel"))
		if("One")
			if(usr.Ki<500)
				usr<<"You don't have enough energy to push this ability to that level."
				return
			else if(usr.expandlevel==0)
				usr.expandicon=usr.icon
				usr.expandlevel=1
				usr<<"You expand your muscles."
				usr.absorbadd+=usr.MaxPL*1.25
				usr.Str*=1.1
				usr.End*=1.1
				usr.Spd/=1.2
				usr.orefire*=1.3
				if(usr.expandlevel==1)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						flick('MakyoMorph.dmi',usr)
						usr.icon='Big Garlic.dmi'
					if(usr.icon=='Changeling Form 4.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Full Power.dmi'
		if("Two")
			if(usr.Ki<1000)
				usr<<"You don't have enough energy to push this ability to that level."
				return
			else if(usr.expandlevel==0)
				usr.expandlevel=2
				usr<<"You expand your muscles to twice their normal size."
				usr.absorbadd+=usr.MaxPL*2.50
				usr.Str*=2.2
				usr.End*=2.2
				usr.Spd/=2.4
				usr.orefire*=1.5
				if(usr.expandlevel==2)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						flick('MakyoMorph.dmi',usr)
						usr.icon='Big Garlic.dmi'
					if(usr.icon=='Changeling Form 4.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Full Power.dmi'
		if("Three")
			if(usr.Ki<1500)
				usr<<"You don't have enough energy to push this ability to that level."
				return
			else if(usr.expandlevel==0)
				usr.expandlevel=3
				usr<<"You expand your muscles to three times their normal size."
				usr.absorbadd+=usr.MaxPL*3.75
				usr.Str*=3.3
				usr.End*=3.3
				usr.Spd/=3.6
				usr.orefire*=1.7
				if(usr.expandlevel==3)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						flick('MakyoMorph.dmi',usr)
						usr.icon='Big Garlic.dmi'
					if(usr.icon=='Changeling Form 4.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Full Power.dmi'
		if("Four")
			if(usr.Ki<2000)
				usr<<"You don't have enough energy to push this ability to that level."
				return
			else if(usr.expandlevel==0)
				usr.expandlevel=4
				usr<<"You expand your muscles to four times their normal size."
				usr.absorbadd+=usr.MaxPL*5
				usr.Str*=4.4
				usr.End*=4.4
				usr.Spd/=4.8
				usr.orefire*=1.8
				if(usr.expandlevel==4)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						flick('MakyoMorph.dmi',usr)
						usr.icon='Big Garlic.dmi'
					if(usr.icon=='Changeling Form 4.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Full Power.dmi'
		if("Five")
			if(usr.Ki<2500)
				usr<<"You don't have enough energy to push this ability to that level."
				return
			else if(usr.expandlevel==0)
				usr.expandlevel=5
				usr<<"You expand your muscles to five times their normal size."
				usr.absorbadd+=usr.MaxPL*6.25
				usr.Str*=5.5
				usr.End*=5.5
				usr.Spd/=6
				usr.orefire*=1.9
				if(usr.expandlevel==5)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						flick('MakyoMorph.dmi',usr)
						usr.icon='Big Garlic.dmi'
					if(usr.icon=='Changeling Form 4.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Full Power.dmi'
		if("Cancel")
			return
		if("Revert")
			if(usr.expandlevel==0)
				return
			if(usr.expandlevel==1)
				usr.expandlevel=0
				usr.absorbadd-=usr.MaxPL*1.25
				usr.Str/=1.1
				usr.End/=1.1
				usr.Spd*=1.2
				usr.orefire/=1.3
				usr<<"Your muscles have returned to their normal size."
				if(usr.expandlevel==0)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='MakyoNewBase.dmi'
					if(usr.icon=='Changeling Full Power.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Form 4.dmi'
			if(usr.expandlevel==2)
				usr.expandlevel=0
				usr.absorbadd-=usr.MaxPL*2.50
				usr.Str/=2.2
				usr.End/=2.2
				usr.Spd*=2.4
				usr.orefire/=1.5
				usr<<"Your muscles have returned to their normal size."
				usr.expandlevel=0
				if(usr.expandlevel==0)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='MakyoNewBase.dmi'
					if(usr.icon=='Changeling Full Power.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Form 4.dmi'
			if(usr.expandlevel==3)
				usr.absorbadd-=usr.MaxPL*3.75
				usr.Str/=3.3
				usr.End/=3.3
				usr.Spd*=3.6
				usr.orefire/=1.7
				usr<<"Your muscles have returned to their normal size."
				usr.expandlevel=0
				if(usr.expandlevel==0)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='MakyoNewBase.dmi'
					if(usr.icon=='Changeling Full Power.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Form 4.dmi'
			if(usr.expandlevel==4)
				usr.absorbadd-=usr.MaxPL*5
				usr.Str/=4.4
				usr.End/=4.4
				usr.Spd*=4.8
				usr.orefire/=1.8
				usr<<"Your muscles have returned to their normal size."
				usr.expandlevel=0
				if(usr.expandlevel==0)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='MakyoNewBase.dmi'
					if(usr.icon=='Changeling Full Power.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Form 4.dmi'
			if(usr.expandlevel==5)
				usr.absorbadd-=usr.MaxPL*6.25
				usr.Str/=5.5
				usr.End/=5.5
				usr.Spd*=6
				usr.orefire/=1.9
				usr<<"Your muscles have returned to their normal size."
				usr.expandlevel=0
				if(usr.expandlevel==0)
					if(usr.Race=="Makyojin")
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='MakyoNewBase.dmi'
					if(usr.icon=='Changeling Full Power.dmi')
						usr.BEoverlays=new/list
						usr.BEoverlays.Add(usr.overlays)
						usr.overlays=new/list
						usr.icon='Changeling Form 4.dmi'

mob/var
	cangivepower
	givepowerchance=1
	gavepower
mob/Click()
	if(cangivepower)
		switch(input("Are you sure you want to do this?", "", text) in list ("No", "Yes",))
			if("Yes")
				if(usr!=src&&usr.cangivepower&&!usr.KO&&!gavepower) for(var/mob/M in oview(1,usr)) if(M==src&&M.client)
					view(usr,12)<<"[usr] transfers all their energy to [src]!!"
					usr.gavepower=1
					if(usr.Race==Race)
						Ki+=usr.Ki/2
						HP+=usr.HP/2
						Senzu+=2
					else
						Ki+=usr.Ki*0.5
						HP+=usr.HP*0.5
						Senzu+=1
					spawn usr.KO()
				if(Race=="Saiyan") if(usr==src&&!goingssj4)
					goingssj4=1
					if(hasssj4&&!ssj&&!Oozarou) SSj4()
					spawn(10) goingssj4=0
				if(usr==src&&!goingssj4&&hasssj)
					goingssj4=1
				if(Race=="Namekian"|Race=="Arconian"|Race=="Ancient Namek"&&bigform==0)
					GNamek()
				else
					Revert()
				spawn(10) goingssj4=0
mob/var/bursting
mob/var/burst
obj/Skills/Ki_Burst/verb/Ki_Burst()
	set category="Skills"
	if(!usr.bursting)
		usr.bursting=1
		if(!usr.burst)
			usr.Pow*=3
			usr.kimanip+=50
			usr.absorbadd+=usr.PL*1.25
			usr<<"You focus on the energy surrounding you and bring it into your body, increasing your ki power significantly."
			usr.burst=1
		else
			usr.Pow/=3
			usr.absorbadd=0
			usr.kimanip-=50
			usr<<"You stop using Ki Burst."
			usr.burst=0
		sleep(10)
		usr.bursting=0
mob/var/kanassaburst
mob/var/
	haskanassaburst
obj/Skills/Burst/verb/Burst()
	set category="Skills"
	if(!usr.kanassaburst)
		var/bicon=usr.bursticon
		bicon+=usr.AuraColor
		var/image/I=image(icon=bicon,icon_state=usr.burststate)
		usr.overlays+=I
		usr.orefire*=0.25
		usr.Pow*=2
		usr.absorbadd+=usr.PL*2
		usr.PL*=2
		usr.KiRegen*=2
		usr.HPRegen*=2
		usr.kanassaburst=1
mob/var/precognitive //for the blast avoidance...

mob/var
	KaiokenMastery=1
/*
	KaiokenMod=1
	KaiokenBP=0
*/


mob/var
	KaiokenLevel=0
obj/Skills/Kaioken/verb/Kaioken()
	set category="Skills"
	switch(input("", "",text) in list ("One", "Two", "Three", "Four", "Five", "Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen","Twenty", "Revert", "Cancel"))
		if("One")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>0)
				usr.absorbadd+=usr.PL*1.5
				usr.Spd*=1.5
				usr.Defense/=1.1
				usr.KaiokenLevel=1
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Two")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>10)
				usr.Spd*=1.1
				usr.Defense/=1.2
				usr.KaiokenLevel=2
				usr.absorbadd+=usr.PL*1.75
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Three")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>20)
				usr.Spd*=1.2
				usr.Defense/=1.3
				usr.KaiokenLevel=3
				usr.absorbadd+=usr.PL*2
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Four")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>30)
				usr.Spd*=1.3
				usr.Defense/=1.4
				usr.KaiokenLevel=4
				usr.absorbadd+=usr.PL*2.25
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
		if("Five")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>40)
				usr.KaiokenLevel=5
				usr.absorbadd+=usr.PL*2.5
				usr.Spd*=1.4
				usr.Defense/=1.5
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Six")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>50)
				usr.KaiokenLevel=6
				usr.absorbadd+=usr.PL*2.75
				usr.Spd*=1.5
				usr.Defense/=1.6
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Seven")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>60)
				usr.KaiokenLevel=7
				usr.absorbadd+=usr.PL*3
				usr.Spd*=1.6
				usr.Defense/=1.7
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Eight")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>70)
				usr.KaiokenLevel=8
				usr.absorbadd+=usr.PL*3.25
				usr.Spd*=1.7
				usr.Defense/=1.8
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Nine")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>80)
				usr.KaiokenLevel=9
				usr.absorbadd+=usr.PL*3.5
				usr.Spd*=1.8
				usr.Defense/=1.9
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Ten")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>90)
				usr.KaiokenLevel=10
				usr.absorbadd+=usr.PL*3.75
				usr.Spd*=1.9
				usr.Defense/=2
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Eleven")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>100)
				usr.KaiokenLevel=11
				usr.absorbadd+=usr.PL*4
				usr.Spd*=2
				usr.Defense/=2.1
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Twelve")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>110)
				usr.KaiokenLevel=12
				usr.absorbadd+=usr.PL*4.25
				usr.Spd*=2.1
				usr.Defense/=2.2
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Thirteen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>120)
				usr.KaiokenLevel=13
				usr.absorbadd+=usr.PL*4.5
				usr.Spd*=2.2
				usr.Defense/=2.3
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Fourteen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>130)
				usr.KaiokenLevel=14
				usr.absorbadd+=usr.PL*4.75
				usr.Spd*=2.3
				usr.Defense/=2.4
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Fifteen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>140)
				usr.KaiokenLevel=15
				usr.absorbadd+=usr.PL*5
				usr.Spd*=2.4
				usr.Defense/=2.5
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Sixteen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>150)
				usr.KaiokenLevel=16
				usr.absorbadd+=usr.PL*5.5
				usr.Spd*=2.5
				usr.Defense/=2.6
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Seventeen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>160)
				usr.KaiokenLevel=17
				usr.absorbadd+=usr.PL*5.75
				usr.Spd*=2.6
				usr.Defense/=2.7
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Eighteen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>170)
				usr.KaiokenLevel=18
				usr.absorbadd+=usr.PL*6
				usr.Spd*=2.7
				usr.Defense/=2.8
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Nineteen")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>180)
				usr.KaiokenLevel=19
				usr.absorbadd+=usr.PL*6.5
				usr.Spd*=2.8
				usr.Defense/=2.9
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
			else
				usr<<"You cannot do that at this time."
		if("Twenty")
			if(usr.KaiokenLevel==0&&usr.KaiokenMastery>200)
				usr.KaiokenLevel=20
				usr.absorbadd+=usr.PL*7
				usr.Spd*=3
				usr.Defense/=3
				usr.overlays+='Aura Kaioken.dmi'
				view(usr)<<"A bright red aura bursts all around [usr]."
		if("Revert")
			usr.overlays-='Aura Kaioken.dmi'
			if(usr.KaiokenLevel==0)
				return
			if(usr.KaiokenLevel==1)
				usr.absorbadd=0
				usr.Spd/=1.5
				usr.Defense*=1.1
				usr.KaiokenLevel=0
			if(usr.KaiokenLevel==2)
				usr.Spd/=1.1
				usr.Defense*=1.2
				usr.KaiokenLevel=0
				usr.absorbadd=0
			if(usr.KaiokenLevel==3)
				usr.absorbadd=0
				usr.Spd/=1.2
				usr.Defense*=1.3
				usr.KaiokenLevel=0
			if(usr.KaiokenLevel==4)
				usr.absorbadd=0
				usr.Spd/=1.3
				usr.Defense*=1.4
				usr.KaiokenLevel=0
			if(usr.KaiokenLevel==5)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=1.4
				usr.Defense*=1.5
			if(usr.KaiokenLevel==6)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=1.5
				usr.Defense*=1.6
			if(usr.KaiokenLevel==7)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=1.6
				usr.Defense*=1.7
			if(usr.KaiokenLevel==8)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=1.7
				usr.Defense*=1.8
			if(usr.KaiokenLevel==9)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=1.8
				usr.Defense*=1.9
			if(usr.KaiokenLevel==10)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=1.9
				usr.Defense*=2
			if(usr.KaiokenLevel==11)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2
				usr.Defense*=2.1
			if(usr.KaiokenLevel==12)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.1
				usr.Defense*=2.2
			if(usr.KaiokenLevel==13)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.2
				usr.Defense*=2.3
			if(usr.KaiokenLevel==14)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.3
				usr.Defense*=2.4
			if(usr.KaiokenLevel==15)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.4
				usr.Defense*=2.5
			if(usr.KaiokenLevel==16)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.5
				usr.Defense*=2.6
			if(usr.KaiokenLevel==17)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.6
				usr.Defense*=2.7
			if(usr.KaiokenLevel==18)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.7
				usr.Defense*=2.8
			if(usr.KaiokenLevel==19)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=2.8
				usr.Defense*=2.9
			if(usr.KaiokenLevel==20)
				usr.absorbadd=0
				usr.KaiokenLevel=0
				usr.Spd/=3
				usr.Defense*=3
		if("Cancel")
			return
mob/var
	MysticMod=1.3
	hasmystic
	mystified=0
	mysticing
	ismystic
obj/Skills/Mystic/verb/Mystic()
	set category="Skills"
	if(!usr.mysticing)
		usr.mysticing=1
		if(usr.ssj==3)
			usr<<"<font color=teal>This cannot be used with Super Saiyan 3."
			usr.ismystic=0
		else if(!usr.ismystic)
			usr.ismystic=1
			usr.Spd*=usr.MysticMod
			usr.Pow*=usr.MysticMod
			usr.absorbadd+=usr.MaxPL*usr.MysticMod
			usr.HPRegen*=usr.MysticMod
			usr.KiRegen*=usr.MysticMod
			usr.kimanip+=3
			usr.overlays+='Electric_Mystic.dmi'
			usr.overlays+=usr.hair
		else
			usr<<"You stop using your Mystic power."
			usr.overlays-='Electric_Mystic.dmi'
			usr.ismystic=0
			usr.Spd/=usr.MysticMod
			usr.Pow/=usr.MysticMod
			usr.absorbadd=0
			usr.HPRegen/=usr.MysticMod
			usr.KiRegen/=usr.MysticMod
			usr.kimanip-=3
			usr.Revert()
		sleep(20)
		usr.mysticing=0
obj/ChangeHair/verb/ChangeHair()
	set category="Other"
	switch(input("Which type of Saiyan are you?", "", text) in list ("Halfie", "Saiyan"))
		if("Saiyan")
			switch(input("Which form of SSJ would you like to change your hair for?","",text) in list ("SSJ", "SSJ2"))
				if("SSJ")
					switch(input("Which hair style would you like for your SSJ1 transformation?", "", text) in list ("Female1","Pony Tail","Trunks","FemaleLong","Gohan","Goku","Vegeta","Long","Mohawk","Spike"))
						if("Female1")
							usr.ssjhair='Hair_Female1SSJ.dmi'
						if("Pony Tail")
							usr.ssjhair='Hair_PonyTailSSJ.dmi'
						if("Trunks")
							usr.ssjhair='Hair Trunks SSj.dmi'
						if("FemaleLong")
							switch(input("Regular or FP?","", text) in list ("Regular", "FP"))
								if("Regular")
									usr.ssjhair='Hair_FemaleLongSSj.dmi'
								if("FP")
									usr.ssjhair='Hair_FemaleLongSSjFP.dmi'
						if("Gohan")
							switch(input("Future, Teen, Child?","",text) in list ("Future", "Teen", "Child"))
								if("Future")
									usr.ssjhair='Hair_FutureGohanSSj.dmi'
								if("Teen")
									usr.ssjhair='Hair_GohanSSj.dmi'
								if("Child")
									usr.ssjhair='Hair_KidGohanSSj.dmi'
						if("Goku")
							usr.ssjhair='Hair_GokuSSj.dmi'
						if("Vegeta")
							switch(input("GT or Regular?","",text) in list ("GT","Regular"))
								if("GT")
									usr.ssjhair='Hair_GTVegetaSSj.dmi'
								if("Regular")
									usr.ssjhair='Hair_VegetaSSj.dmi'
						if("Long")
							usr.ssjhair='Hair_LongSSj.dmi'
						if("Mohawk")
							usr.ssjhair='Hair_MohawkSSj.dmi'
						if("Spike")
							usr.ssjhair='Hair_SpikeSSj.dmi'
				if("SSJ2")
					switch(input("Which hair style would you like for your SSJ2 transformation?", "", text) in list ("Gohan","Goku","Vegeta","Long","Pony Tail"))
						if("Gohan")
							switch(input("Teen or Child?","",text) in list ("Teen", "Child"))
								if("Teen")
									usr.ssj2hair='Hair_GohanSSjFP.dmi'
								if("Child")
									usr.ssj2hair='Hair_KidGohanSSjFP.dmi'
						if("Goku")
							switch(input("SSJ2 hair or USSJ?","",text) in list ("SSJ2", "USSJ"))
								if("SSJ2")
									usr.ssj2hair='Hair_GokuSSjFP.dmi'
								if("USSJ")
									usr.ssj2hair='Hair_GokuUSSj.dmi'
						if("Vegeta")
							switch(input("SSJ2 hair or USSJ?","",text) in list ("SSJ2", "USSJ"))
								if("SSJ2")
									usr.ssj2hair='Hair_VegetaSSjFP.dmi'
								if("USSJ")
									usr.ssj2hair='Hair_VegetaUSSj.dmi'
						if("Long")
							switch(input("SSJ2 hair or USSJ?","",text) in list ("SSJ2", "USSJ"))
								if("SSJ2")
									usr.ssj2hair='Hair_LongSSjFP.dmi'
								if("USSJ")
									usr.ssj2hair='Hair_LongUSSj.dmi'
						if("Pony Tail")
							usr.ssj2hair='Hair_PonyTailSSJFP.dmi'

		if("Halfie")
			switch(input("Which form of SSJ would you like to change your hair for?","",text) in list ("SSJ", "SSJ2"))
				if("SSJ")
					switch(input("Which hair style would you like for your SSJ1 transformation?", "", text) in list ("Female1","Pony Tail","Trunks","FemaleLong","Gohan","Goku","Vegeta","Long","Mohawk","Spike"))
						if("Female1")
							usr.ssjfphair='Hair_Female1SSJ.dmi'
						if("Pony Tail")
							usr.ssjfphair='Hair_SSJFPCustom.dmi'
						if("Trunks")
							usr.ssjfphair='Hair Trunks SSj.dmi'
						if("FemaleLong")
							switch(input("Regular or FP?","", text) in list ("Regular", "FP"))
								if("Regular")
									usr.ssjfphair='Hair_FemaleLongSSj.dmi'
								if("FP")
									usr.ssjfphair='Hair_FemaleLongSSjFP.dmi'
						if("Gohan")
							switch(input("Future, Teen, Child?","",text) in list ("Future", "Teen", "Child"))
								if("Future")
									usr.ssjfphair='Hair_FutureGohanSSj.dmi'
								if("Teen")
									usr.ssjfphair='Hair_GohanSSj.dmi'
								if("Child")
									usr.ssjfphair='Hair_KidGohanSSj.dmi'
						if("Goku")
							usr.ssjfphair='Hair_GokuSSj.dmi'
						if("Vegeta")
							switch(input("GT or Regular?","",text) in list ("GT","Regular"))
								if("GT")
									usr.ssjfphair='Hair_GTVegetaSSj.dmi'
								if("Regular")
									usr.ssjfphair='Hair_VegetaSSj.dmi'
						if("Long")
							usr.ssjfphair='Hair_LongSSj.dmi'
						if("Mohawk")
							usr.ssjfphair='Hair_MohawkSSj.dmi'
						if("Spike")
							usr.ssjfphair='Hair_SpikeSSj.dmi'
				if("SSJ2")
					switch(input("Which hair style would you like for your SSJ2 transformation?", "", text) in list ("Gohan","Goku","Vegeta","Long","Pony Tail"))
						if("Pony Tail")
							usr.ssj2hair='Hair_SSJFPCustom.dmi'
						if("Gohan")
							switch(input("Teen or Child?","",text) in list ("Teen", "Child"))
								if("Teen")
									usr.ssj2hair='Hair_GohanSSjFP.dmi'
								if("Child")
									usr.ssj2hair='Hair_KidGohanSSjFP.dmi'
						if("Goku")
							switch(input("SSJ2 hair or USSJ?","",text) in list ("SSJ2", "USSJ"))
								if("SSJ2")
									usr.ssj2hair='Hair_GokuSSjFP.dmi'
								if("USSJ")
									usr.ssj2hair='Hair_GokuUSSj.dmi'
						if("Vegeta")
							switch(input("SSJ2 hair or USSJ?","",text) in list ("SSJ2", "USSJ"))
								if("SSJ2")
									usr.ssj2hair='Hair_VegetaSSjFP.dmi'
								if("USSJ")
									usr.ssj2hair='Hair_VegetaUSSj.dmi'
						if("Long")
							switch(input("SSJ2 hair or USSJ?","",text) in list ("SSJ2", "USSJ"))
								if("SSJ2")
									usr.ssj2hair='Hair_LongSSjFP.dmi'
								if("USSJ")
									usr.ssj2hair='Hair_LongUSSj.dmi'
obj/OozarouSetting/verb/OozarouSetting()
	set category="Other"
	if(!usr.Osetting)
		usr.Osetting=1
		usr<<"You decide that if the moon is out, you will look at it."
	else
		usr.Osetting=0
		usr<<"You decide that if the moon is out, you will -not- look at it."
mob
	var
		list/oozarouoverlays=new/list
		storedicon
		list/storedoverlays=new/list
		list/storedunderlays=new/list
		Omult=10
		Ochance=2000
		Osetting=0 //1 for enabled, 0 else
		Oozarouskill=0 //once this reaches 10 you can talk in Oozarou.
		golden
	proc
		GoldenOozarou()
			if(Race=="Saiyan"&&hasssj)
				if(!Oozarou&&Tail&&!KO)
					if(ssj) Revert()
					src<<"You look at the moon and turn into a giant monkey!"
					Oozarou=1
					storedicon=icon
					storedoverlays.Remove(overlays)
					storedunderlays.Remove(underlays)
					storedoverlays.Add(overlays)
					storedunderlays.Add(underlays)
					overlays.Remove(overlays)
					underlays.Remove(underlays)
					icon='Oozarou Gold.dmi'
					var/scale=64
					var/xtiles=(scale*0.03125)
					var/ytiles=xtiles
					var/disposition=48
					for(var/obj/O in oozarouoverlays)
						var/icon/I=new(O.icon)
						I.Scale(scale,scale)
						while(ytiles>0)
							sleep(1)
							overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
							xtiles-=1
							if(!xtiles)
								ytiles-=1
								xtiles=(scale*0.03125)
					scale=64
					xtiles=(scale*0.03125)
					ytiles=xtiles
					disposition=48
					var/icon/I=new(icon)
					I.Scale(scale,scale)
					while(ytiles>0)
						sleep(1)
						overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
						xtiles-=1
						if(!xtiles)
							ytiles-=1
							xtiles=(scale*0.03125)
					icon=I
					absorbadd+=Omult*PL
					Str*=10
					refire*=2
					Spd*=0.25
					train=0
					med=0
					move=1
					golden=1
					Mob_AI()
					spawn(1800)
					Oozarou_Revert()
		Oozarou()
			if(Race=="Saiyan"|Race=="Half-Saiyan")
				if(!Oozarou&&Tail&&!KO)
					if(!ssj)
						src<<"You look at the moon and turn into a giant monkey!"
						Oozarou=1
						storedicon=icon
						storedoverlays.Remove(overlays)
						storedunderlays.Remove(underlays)
						storedoverlays.Add(overlays)
						storedunderlays.Add(underlays)
						overlays.Remove(overlays)
						underlays.Remove(underlays)
						icon='Oozarou Reg.dmi'
						var/scale=64
						var/xtiles=(scale*0.03125)
						var/ytiles=xtiles
						var/disposition=48
						for(var/obj/O in oozarouoverlays)
							var/icon/I=new(O.icon)
							I.Scale(scale,scale)
							while(ytiles>0)
								sleep(1)
								overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
								xtiles-=1
								if(!xtiles)
									ytiles-=1
									xtiles=(scale*0.03125)
						scale=64
						xtiles=(scale*0.03125)
						ytiles=xtiles
						disposition=48
						var/icon/I=new(icon)
						I.Scale(scale,scale)
						while(ytiles>0)
							sleep(1)
							overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
							xtiles-=1
							if(!xtiles)
								ytiles-=1
								xtiles=(scale*0.03125)
						icon=I
						absorbadd+=Omult*PL
						Str*=8
						refire*=2
						Spd*=0.25
						train=0
						med=0
						move=1
						Mob_AI()
						spawn(1800)
						Oozarou_Revert()
					else src<<"The moon comes out, it doesnt seem to have any affect on you as a Super Saiyan..."
		Oozarou_Revert()
			if(Oozarou)
				src<<"<font color=yellow>You come to your senses and return to your normal form."
				Oozarou=0
				icon=storedicon
				overlays.Remove(overlays)
				overlays.Add(storedoverlays)
				storedoverlays.Remove(storedoverlays)
				storedunderlays.Remove(storedunderlays)
				absorbadd=0
				Str/=8
				refire/=2
				Spd*=4
				hair=hair
				overlays-=hair
				overlays+=hair
				golden=0
				if(elite) Oozarouskill+=1
				if(Tail) Tail_Grow()
				else
					overlays-='Modified Tail.dmi'
					underlays-='Modified Tail.dmi'

