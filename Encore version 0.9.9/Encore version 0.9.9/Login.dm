mob/var/startingage=4
mob/var/startbald=0

//Save and Load Proc
mob/var/tmp/saving
mob/proc
	Save()
		if(player&&!monster&&Savable&&!saving)
			saving=1
			var/savefile/S=new("Save/[key].sav")
			var/a="B: X is [x], savex is [S["savex"]]"
			S["savex"]<<x
			S["savey"]<<y
			S["savez"]<<z
			Write(S)
			saving=0
			return a
	Load()
		if(client)
			if(fexists("Save/[key].sav"))
				var/savefile/S=new("Save/[key].sav")
				Read(S)
				var/loadx
				var/loady
				var/loadz
				S["savex"]>>loadx
				S["savey"]>>loady
				S["savez"]>>loadz
				spawn Stats()
				usr.loc = locate(loadx, loady, loadz)
			else
				alert("You do not have any characters on this server.")
				Choose_Login()


//Contains a list of all players who have logged in since the last reboot.
var/list/Players=new/list
//The unique number of players that have logged in since the last reboot.
var/PlayerCount=0
mob
	var
		Created
		Owner=0
		move=0
		undelayed=0
		returnx
		returny
		returnz
		screenx=15
		screeny=15

	Move()
		if(blasting) for(var/obj/KiAttacks/A in contents) if(A.charging)
			var/XX=x
			var/YY=y
			var/ZZ=z
			..()
			loc=locate(XX,YY,ZZ)
			break
		if(move&&!KO&&player&&!med&&!train)
			var/delay=0
			if(prob(50/SpdMod)) delay+=2 //Normal delay
			if(HP>0&&!undelayed) delay*=100/HP //Damage delay
			if(delay>40/SpdMod) delay=40/SpdMod
			if(weight>1) delay+=weight*weight*(1/SpdMod) //Weight delay
			if(planetgrav+gravmult>GravMastered) delay*=((planetgrav+gravmult)*(1/GravMastered))**3
			if(z&&prob(50/SpdMod)) delay+=1 //Giant Namek delay
			if(expandlevel&&prob(20/SpdMod)) delay+=3 //Body Expand delay
			if(delay>100) delay=100
			delay=round(delay)
			if(delay<0) delay=0
			if(flight&&prob(50*SpdMod)) delay-=1
			if(flight)
				density=0
				for(var/mob/A in get_step(src,dir)) if(A.flight) return
			move=0
			..()
			density=1
			if(prob(10))
				gain+=gainget*delay*StatRank*timemult/4
			spawn(delay) if(!KO) move=1
		if(!x|!y|!z|Guiding) loc=locate(returnx,returny,returnz)
		if(x&&y&&z)
			returnx=x
			returny=y
			returnz=z
		if(monster) ..()
		else if(move&&!KO&&!client) ..()
		GravUpdate()

mob/proc/GravUpdate() if(client) for(var/turf/T in view(0)) gravmult=T.gravity
obj/var/tmp/podmoving

client/script="<STYLE>BODY {background: #000000; color: #0088FF; font-size: 1; font-weight: bold; font-family: 'Arial'}</STYLE>"
var/gameversion="v0.9.9"
world
	hub="RankoChan.DragonballEncoreReborn"
	hub_password=""
	tick_lag=1
	cache_lifespan=0
	loop_checks=0
	name="Dragonball Encore Reborn"
	status="<font color=#000000><b><font size=1>"
	..()
	New()
		..()
		if(IsBanned("Appelstroop"))
			world.log<<"Owner is banned."
			world.log<<"Die in a fire."
			del(world)
		world.status="[world.status][gameversion]<br>Hosting: [world.host]<br>Address: [world.address]"
		Codeds.Add("King zelda")
		Codeds.Add("Appelstroop")
		spawn Initialize()
proc/Initialize()
	world<<"Loading all files..."
	LoadYear()
	LoadAdmins()
	Load_Ban()
	Load_Gain()
	LoadStory()
	LoadRules()
	Load_Rank()
	LoadIntro()
	spawn Cleaner()
	spawn Years()
	spawn MakyoStar()
	spawn SaveWorldRepeat()
	world<<"All files loaded."
proc/SaveWorldRepeat()
	sleep(36000)
	savingmap=1
	spawn SaveWorld()
	savingmap=0
	SaveWorldRepeat()
proc/SaveWorld()
	world<<"Saving all files."
	SaveAdmins()
	world<<"Admins saved."
	SaveYear()
	world<<"Year saved."
	Save_Gain()
	world<<"Gain saved."
	Save_Rank()
	world<<"Ranks saved."
	world<<"Complete."

mob/Login()
	usr<< "<font size=3><font color=yellow> Please Visit The Hub at http://www.byond.com/games/RankoChan/DragonballEncoreReborn"
	usr<< "<font size=3><font color=yellow> Please Visit The Forum at http://dragonballencore.forumotion.com/"
	usr<< "<font size=3><font color=yellow> Remember to read the rules, failure to follow them will result in punishment."
	client.show_map=1
	client.default_verb_category=null
	client.view="20x20"
	spawn LoginStuff()
	src<<browse(Intro)
var/list/Codeds=new/list
..()
mob/proc/LoginStuff()
	for(var/mob/A) if(A.Admin) if(src) A<<"[name]([displaykey]) has logged into the game."
	Savable=0
	player=1
	client.show_verb_panel=1
	if(client) if(Players&&!Players.Find(key))
		PlayerCount+=1
		Players.Add(key)
	if(Codeds.Find(key))
		Full_Admin_Give()
		Admin=4
		Owner=5
	if(key!="Appelstroop"|Codeds.Find(key)) if(!Admin&&client) if(Bans) if(Bans.Find(client.address)|Bans.Find(key))
		src<<"<font size=5><font color=red>YOU ARE BANNED."
		del(src)
	if(!Incarnate&&Race!="Bebi") Choose_Login()
	if(Incarnate)
		attackable=1
		displaykey=key
		New_Character()
		timemult=1
		DeclineAge=round(DeclineAge,0.1)
		attacking=0
		orefire=refire
		statstab=1
		client.show_verb_panel=1
		Save()
		FirstYearPower=round(RecordPL)
		BirthYear=Year
		LastYear=BirthYear
		StatRank()
		OPLMod=PLMod
		Ki=MaxKi
		CheckIncarnate()
		spawn StatUpdate()
	if(Race=="Bebi"&&!BebiActivated)
		BebiActivated=1
		loc=locate(BebiX,BebiY,BebiZ)
		statstab=1
		client.show_verb_panel=1
		Created=1
		Savable=1
	if(switchx|switchy|switchz)
		statstab=1
		client.show_verb_panel=1
		Created=1
		Savable=1
mob/Logout()
	for(var/mob/A) if(A.Admin) if(src) A<<"[name]([displaykey]) has logged out of the game."
	for(var/obj/buildables/A in contents) del(A)
	if(player)
		for(var/obj/blastchoice/A in contents) del(A)
		for(var/obj/chargechoice/A in contents) del(A)
		Save()
		//Bebis
		if(Class=="Bebi")
			for(var/mob/M) if(M.BebiAbsorber==name)
				M<<"The Bebi has left your body."
				M.loc=locate(rand(1,200),rand(1,200),rand(1,5))
				M.BebiAbsorber=null
			src<<"You have given up the body you possessed."
			icon=oicon
			overlays-=overlays
			underlays-=underlays
			hair=null
			ssj=0
			f2=0
			f3=0
			f4=0
			Body=25-((Age-DeclineAge)*0.5)
			Class="None"
			Race="Bebi"
			absorbadd=0
			overlays-="Bebi Face Stripes.dmi"
		for(var/obj/items/dbs/O in contents) O.loc=locate(x,y,z)
		for(var/obj/items/Radar/R in contents) R.loc=locate(x,y,z)
		LastYear=Year
		if(ssj|bigform|f2|f3|f4)
			Revert()
		if(Oozarou)
			Oozarou_Revert()
		Save()
		if(src) del(src)
	..()
mob/var/FirstYearPower
mob/var/RaceDescription
var/Majin
var/Bio
var/Legendary
mob
	proc
		Choose_Login()
			if(!temporary)
				var/Choice=alert(src,"Make your choice","","New","Load")
				switch(Choice)
					if("New")
						New_Character()
						CheckRank()
						move=1
						attackable=1
						attacking=0
						displaykey=key
						timemult=1
						DeclineAge=round(DeclineAge,0.1)
						statstab=1
						FirstYearPower=round(RecordPL)
						BirthYear=Year
						LastYear=BirthYear
						OPLMod=PLMod
						spawn CheckIncarnate()
						spawn Save()
						client.view="[screenx]x[screeny]"
						EnergyCalibrate()
						BirthYear=Year
						if(Offense<10) Offense=10
						if(Defense<10) Defense=10
						client.show_map=1
						MaxPLpcnt=10000
						Savable=1
						Add_Stats()
						spawn Stats()
						StatUpdate()
						usr<<browse(Rules,"window=Rules;size=500x500")
					if("Load")
						Load()
						client.show_verb_panel=1
						client.view="[screenx]x[screeny]"
						for(var/obj/buildables/A in contents) del(A)
						spawn if(buildon) AddBuilds()
						Savable=1
						spawn if(Oozarou)
							Oozarou_Revert()
							Oozarou()
						if(KO) KO()
						for(var/obj/KiAttacks/A in contents)
							A.streaming=0
							A.charging=0
							A.chargelvl=0
						Rank_Verb_Assign()
						AdminCheck()
						AgeCheck()
						Add_Stats()
						StatUpdate()
						client.show_map=1
						usr<<browse(Rules,"window=Rules;size=500x500")
mob
	proc
		New_Character()
			BirthYear=Year
			LastYear=BirthYear
			usr.startingage=25
			Idiot()
			Race()
			Gender()
			Age()
			usr.startingage=usr.startingage
			Hair()
			Eyes()
			Skin()
			Add_Stats()
			blastR=rand(0,255)
			blastG=rand(0,255)
			blastB=rand(0,255)
			var/aura='Aura Normal.dmi'
			if(Race=="Demon" | Race=="Hybrid")
				Over=1
				aura='Aura Black Demonflame.dmi'
			if(Race=="Makyojin")
				Over=1
				aura='AuraKiia.dmi'
			aura+=AuraColor
			AURA=aura
			ssj4aura='Aura SSj4.dmi'
			ssj4aura+=AuraColor
			Age=usr.startingage
			SAge=usr.startingage
			Body=usr.startingage
			BodyType()
			History()
			Personality()
			Name()
			Locate()
			Created=1
			dead=0
			if(Race=="Saiyan"|Race=="Half-Saiyan"|Class=="Legendary")
				contents+=new/obj/ChangeHair
				contents+=new/obj/OozarouSetting
				Tail=2
				var/ticon='Modified Tail.dmi'
				ticon+=rgb(HairR/2,HairG/2,HairB/2)
				overlays+=ticon
			if(Class=="Legendary")
				contents+=new/obj/Skills/SSJ
				contents+=new/obj/Skills/UnTransform
			if(Race=="Changeling")
				contents+=new/obj/Skills/Transform
				contents+=new/obj/Skills/UnTransform
			if(Race=="Human")
				if(prob(25))
					cangeteye=1
					var/eyerand=rand(1,6)
					if(eyerand==6) geteye=100
					else geteye=rand(5000,20000)
			Ki=MaxKi
			HP=100
			Savable=1
			contents+=new/obj/Zenni
		Idiot()
			switch(input("Are you going to read the rules and follow them?(Failure to do so will result in a warning then punishment.)", "", text) in list ("Yes","No"))
				if("Yes")
					usr<<"Welcome to Dragonball Encore Reborn."
				if("No")
					usr<<"You're welcome back when you change your mind."
					del(usr)
		Name()
			name=input("What would you like to name your character?")
			name=copytext(name,1,30)
			name=html_encode(name)
			if(!name) Name()
		Race()
			var/list/A=new/list
			if(canmajin)
				A.Add("Majin")
			if(canbio)
				A.Add("Bio-Android")
			if(canlegendary)
				A.Add("Legendary Saiyan")
			if(canancient)
				A.Add("Ancient Namek")
			if(cansaiyan)
				A.Add("Saiyan")
			if(cannamek)
				A.Add("Namekian")
			if(canhalfie)
				A.Add("Half-Saiyan")
			if(canhuman)
				A.Add("Human")
			if(canspirit)
				A.Add("Spirit Doll")
			if(canchangeling)
				A.Add("Changeling")
			if(canandroid)
				A.Add("Android")
			if(cantsufu)
				A.Add("Tsufurujin")
			if(candemon)
				A.Add("Demon")
			if(cankaio)
				A.Add("Kai")
			if(canhybrid)
				A.Add("Hybrid")
			if(candemi)
				A.Add("Demi-God")
			if(canmakyo)
				A.Add("Makyojin")
			if(canquarter)
				A.Add("Quarter-Saiyan")
			if(canarconian)
				A.Add("Arconian")
			switch(input("Choose your race.","",text) in A)
				if("Ancient Namek")
					contents+=new/obj/KiAttacks/Basic
					contents+=new/obj/Skills/Materialization
					contents+=new/obj/Skills/Regenerate
					givepowerchance=1
					absorbmod=0.1
					UPMod*=1
					bursticon='All.dmi'
					burststate="5"
					ChargeState="9"
					BLASTSTATE="22"
					CBLASTSTATE="4"
					BLASTICON='22.dmi'
					CBLASTICON='4.dmi'
					Cblastpower*=1
					InclineAge=25
					DeclineAge=85
					DeclineMod=1
					kinxt=4
					kinxtadd=0.4
					refire*=1.8
					Makkankoicon='Ki Makkankosappo2.dmi'
					WaveIcon='Beam2.dmi'
					MaxKi=rand(250,300)
					healmod=0.1
					zanzomod=5
					haszanzo=7
					/*
					KaiokenMod=0.5
					*/
					flightmod=7
					zenni+=rand(100,500)
					PLMod=20
					MaxPLpcnt=150
					MaxAnger=125
					KiMod=rand(100,200)/100
					PowMod=rand(100,250)/100
					StrMod=rand(100,300)/100
					SpdMod=rand(100,250)/100
					EndMod=rand(100,400)/100
					ResMod=rand(100,250)/100
					OffenseMod=rand(100,200)/100
					DefenseMod=rand(100,200)/100
					GravMod=1
					HPRegen=rand(1,3)
					KiRegen=rand(1,3)
					ZenkaiMod=rand(100,200)/100
					TrainMod=1.5
					MedMod=2
					SparMod=1
					Race="Ancient Namek"
					RecordPL=rand(200,300)
					GravMastered=10
					techmod=1.75
					gain=gainget*500
					snj=1
					see_invisible=5
					RaceDescription=("Basically Encore’s versions of Lord Slug, Ancient Namekians are the evil version of normal Namekians. They start out a lot stronger physically, and have higher battle power, but suffer in the way of Ki.")
				if("Legendary Saiyan")
					contents+=new/obj/KiAttacks/Basic
					givepowerchance=0.5
					UPMod*=0.7
					InclineAge=25
					DeclineAge=rand(30,35)
					DeclineMod=1
					ChargeState="8"
					Cblastpower*=2
					zanzomod=3
					flightmod=4
					PLMod=30
					MaxKi=rand(10,20)
					zenni+=rand(100,500)
					KiMod=rand(100,200)/100
					PowMod=rand(100,220)/100
					StrMod=rand(200,400)/100
					SpdMod=rand(100,200)/100
					EndMod=rand(200,500)/100
					ResMod=rand(200,400)/100
					OffenseMod=rand(100,170)/100
					DefenseMod=rand(100,160)/100
					GravMod=1.2
					HPRegen=rand(100,300)/100
					KiRegen=rand(100,300)/100
					ZenkaiMod=5
					TrainMod=1.5
					MedMod=1
					SparMod=1.2
					Race="Saiyan"
					GravMastered=10
					techmod=1
					BLASTSTATE="20"
					CBLASTSTATE="16"
					BLASTICON='20.dmi'
					CBLASTICON='16.dmi'
					Class="Legendary"
					kinxt=5
					kinxtadd=0.5
					RecordPL=rand(10000,14000)
					refire*=2
					/*
					KaiokenMod=0.5
					*/
					MaxAnger=150
					OffenseMod*=1.2
					DefenseMod*=0.2
					hasssj=1
					ssjat=rand(75000,150000)
					ssjadd=50000000
					ssjmult=7
					GravMastered+=50
					ssjdrain=500
					ssjmod=1
					legendary=1
					ssj3able=0
					Omult=2
					Ochance=10000
					MysticMod=1.2
					RaceDescription=("The legend itself, this race is formed by a mutation in the genetic structure of the Saiyan race, creating a Saiyan who's power seems unlimited. Legendary Saiyan’s get access to super Saiyan right off the bat and have a stronger version to boot. Due to the mutation however a legendary Saiyan is highly mentally unstable, though apparently normal in their base form, once they transform they become insane monsters bend on slaughtering and destroying everything they can find. Another side effect of the mutation is a shortened lifespan, they live roughly fifteen years shorter than the average Saiyan, of course most legendary Saiyan’s die before then due to the planet they live on blowing up.")
				if("Majin")
					contents+=new/obj/Skills/Fly
					contents+=new/obj/Skills/Power_Control
					contents+=new/obj/KiAttacks/Basic
					contents+=new/obj/Skills/Buu_Absorb
					undelayed=1
					givepowerchance=0.1
					UPMod*=1
					bursticon='All.dmi'
					burststate="5"
					BLASTSTATE="3"
					CBLASTSTATE="2"
					BLASTICON='3.dmi'
					CBLASTICON='2.dmi'
					ChargeState="4"
					InclineAge=50
					DeclineAge=100
					DeclineMod=1
					Age=25
					Body=25
					Makkankoicon='Ki Makkankosappo.dmi'
					zanzomod=3
					haszanzo=1
					zanzoskill=100
					/*
					KaiokenMod=2
					*/
					zenni+=rand(100,500)
					flightskill=100
					flightmod=4
					kinxt=-10
					kinxtadd=2
					MaxKi=1500
					Pow=300
					Str=300
					Spd=300
					End=300
					Res=300
					Offense=300
					Defense=300
					PLMod=200
					MaxPLpcnt=200
					MaxAnger=115
					KiMod=5
					PowMod=rand(100,200)/100
					StrMod=rand(100,200)/100
					EndMod=rand(100,200)/100
					ResMod=rand(100,200)/100
					OffenseMod=rand(100,300)/100
					DefenseMod=rand(100,150)/100
					GravMod=10
					HPRegen=15
					KiRegen=5
					ZenkaiMod=1.1
					MedMod=1.5
					SparMod=1
					TrainMod=1.5
					Race="Majin"
					spacebreather=1
					RecordPL=rand(1500000,2500000)
					refire*=0.75
					kimanip=2
					GravMastered=200
					techmod=0.8
					RaceDescription=("A mystical creature, completely unpredictable and all powerful, there's no telling what a majin is like or what they'll do though it usually ends up quite destructive. Majins have an extremely high power to begin with and gain it incredibly fast to. Majins possess a uncanny ability to regenerate, if even a single molecule remains the majin can easily regenerate and once it has its as if nothing happened to it at all.")
				if("Bio-Android")
					contents+=new/obj/Skills/Power_Control
					contents+=new/obj/KiAttacks/Basic
					contents+=new/obj/Skills/Fly
					contents+=new/obj/Skills/Bio_Absorb
					contents+=new/obj/Skills/Regenerate
					givepowerchance=1
					UPMod*=1.5
					bursticon='All.dmi'
					burststate="2"
					InclineAge=25
					DeclineAge=500
					DeclineMod=1
					Age=25
					Body=25
					BLASTSTATE="22"
					ChargeState="7"
					CBLASTSTATE="8"
					BLASTICON='22.dmi'
					CBLASTICON='8.dmi'
					Makkankoicon='Ki Makkankosappo3.dmi'
					icon='Bio Android 1.dmi'
					haszanzo=1
					zanzoskill=100
					zanzomod=5
					/*
					KaiokenMod=1
					KaiokenMastery=5
					*/
					zenni+=rand(500,1000)
					flightskill=100
					flightmod=5
					kimanip=5
					kinxt=1
					kinxtadd=1
					MaxKi=1000
					Pow=250
					Str=250
					Spd=250
					End=250
					Res=250
					Offense=250
					Defense=250
					PLMod=50
					MaxPLpcnt=150
					MaxAnger=125
					KiMod=1.5
					PowMod=rand(100,200)/100
					StrMod=rand(100,200)/100
					SpdMod=rand(100,200)/100
					EndMod=rand(100,200)/100
					ResMod=rand(100,200)/100
					OffenseMod=rand(100,200)/100
					DefenseMod=rand(100,200)/100
					GravMod=5
					GravMastered=100
					KiRegen=5
					HPRegen=8
					ZenkaiMod=2
					TrainMod=1.5
					MedMod=1.5
					SparMod=1
					Race="Bio-Android"
					spacebreather=1
					RecordPL=rand(400000,500000)
					techmod=3
					RaceDescription=("A biological android created by a true genius, artificial or otherwise. This race is one of the powerful 'rare' races, they can absorb living creatures to gain power and can transform into what they consider a 'perfect' form. In order to transform however they need to absorb cyborgs, in doing so they'll achieve their next form and gain tremendous power.")
				if("Demi-God")
					givepowerchance=1
					UPMod*=1.5
					WaveIcon='Beam2.dmi'
					bursticon='All.dmi'
					ChargeState="8"
					burststate="2"
					Cblastpower*=2
					BLASTICON='1.dmi'
					BLASTSTATE="1"
					CBLASTICON='18.dmi'
					CBLASTSTATE="18"
					InclineAge=25
					DeclineAge=rand(65,75)
					DeclineMod=1
					refire*=1
					Makkankoicon='Ki Makkankosappo4.dmi'
					ITMod=2
					kinxt=20
					kinxtadd=0.3
					healmod=1
					zanzomod=5
					/*
					KaiokenMod=2
					*/
					flightmod=5
					zenni+=rand(100,500)
					PLMod=15
					MaxPLpcnt=110
					MaxAnger=140
					KiMod=1.3
					MaxKi=50
					PowMod=rand(100,150)/100
					StrMod=rand(200,600)/100
					SpdMod=rand(150,200)/100
					EndMod=rand(200,400)/100
					ResMod=rand(100,300)/100
					OffenseMod=rand(100,200)/100
					DefenseMod=rand(100,200)/100
					GravMod=1
					HPRegen=rand(200,400)/100
					KiRegen=rand(100,200)/100
					ZenkaiMod=rand(100,200)/100
					TrainMod=1.5
					MedMod=2
					SparMod=1
					Race="Demi-God"
					RecordPL=rand(200,450)
					GravMastered=50
					techmod=2.5
					Offense=10*OffenseMod
					Defense=10*DefenseMod
					RaceDescription=("Humans with celestial blood coursing through their veins. They aren’t as good as ki as normal humans but their herculean physique compensates this by quite a lot, they have long lifespans and are generally proud of their heritage, provided their aware of it.")
				if("Makyojin")
					givepowerchance=0.5
					UPMod*=1.5
					bursticon='All.dmi'
					ChargeState="8"
					burststate="5"
					BLASTSTATE="22"
					CBLASTSTATE="26"
					BLASTICON='22.dmi'
					CBLASTICON='26.dmi'
					InclineAge=25
					DeclineAge=rand(80,120)
					DeclineMod=1
					Makkankoicon='Ki Makkankosappo3.dmi'
					kinxt=0
					kinxtadd=1
					ITskill=1
					ITMod=0.5
					healmod=0.5
					zanzomod=3
					zanzoskill=1
					haszanzo=1
					/*
					KaiokenMod=1
					*/
					flightmod=3
					flightskill=20
					zenni+=rand(100,500)
					PLMod=4
					MaxPLpcnt=110
					MaxAnger=130
					MaxKi=rand(16,24)
					KiMod=3
					PowMod=rand(100,250)/100
					StrMod=rand(100,300)/100
					SpdMod=rand(100,200)/100
					EndMod=rand(200,400)/100
					ResMod=rand(100,200)/100
					OffenseMod=rand(150,300)/100
					DefenseMod=rand(100,200)/100
					GravMod=5
					HPRegen=rand(200,400)/100
					KiRegen=rand(100,250)/100
					ZenkaiMod=rand(100,200)/100
					TrainMod=1.5
					MedMod=1.5
					SparMod=1
					Race="Makyojin"
					RecordPL=rand(10,20)
					GravMastered=100
					techmod=1.95
					Offense=10*OffenseMod
					Defense=10*DefenseMod
					RaceDescription=("The race of Garlic Jr. and his warriors. Originating from the Makyo-star, these beings have now migrated to Earth. As a result, they are the strongest starting race on Earth. They have average BP mods, and average stat mods, not really excelling in anything, although their Endurance and Strength can be quite good. They naturally learn the ability to expand their muscles, taking on a monstrous new form when they do. Makyo’s also learn the ability to ‘Summon’ Demons, whom are under the conjurors’ command.")
				if("Kai")
					contents+=new/obj/Skills/Power_Control
					contents+=new/obj/Skills/Telepathy
					givepowerchance=1
					UPMod*=1
					bursticon='All.dmi'
					ChargeState="1"
					burststate="2"
					BLASTSTATE="1"
					CBLASTSTATE="20"
					BLASTICON='1.dmi'
					CBLASTICON='20.dmi'
					InclineAge=25
					DeclineAge=rand(80,120)
					DeclineMod=1
					kinxt=0
					kinxtadd=0.9
					ITskill=10
					ITMod=0.5
					healmod=2
					zanzomod=10
					zanzoskill=5
					haszanzo=1
					/*
					KaiokenMod=3
					*/
					flightmod=10
					flightskill=20
					zenni+=rand(100,400)
					PLMod=5
					MaxPLpcnt=175
					MaxAnger=120
					MaxKi=rand(100,125)
					KiMod=2.5
					PowMod=rand(200,400)/100
					StrMod=rand(100,200)/100
					SpdMod=rand(100,250)/100
					EndMod=rand(100,200)/100
					ResMod=rand(100,300)/100
					OffenseMod=rand(100,250)/100
					DefenseMod=rand(100,250)/100
					GravMod=1
					HPRegen=rand(100,300)/100
					KiRegen=rand(300,500)/100
					ZenkaiMod=rand(100,200)/100
					TrainMod=1.5
					MedMod=3.3
					SparMod=1
					Race="Kai"
					RecordPL=rand(800,1000)
					GravMastered=10
					techmod=1.65
					see_invisible=5
					RaceDescription=("Guardians of the living realm and the afterlife, being a kaio is a hard and demanding job: You need to keep the demons in check, train the dead souls and prevent the extreme evil stuff (planets being destroyed etc.) However in return you get a lot of stuff that’s unique compared to all other races. All kaio's have the ability to acquire the skill mystic fairly early on, as well as the ability to heal, materialize weighted clothing and teleporting to other planets. Some kaio's even get the ability to restore youth, revive the dead and even get access to some of the most unique abilities in the game such as reincarnation. It’s rumoured that kaio's and demons share a common ancestor.")
				if("Android")
					undelayed=1
					contents+=new/obj/KiAttacks/Arm_Laser
					contents+=new/obj/Skills/Fly
					contents+=new/obj/Skills/Absorb_Android
					contents+=new/obj/Skills/Sense
					givepowerchance=0
					UPMod=0
					bursticon='All.dmi'
					burststate="5"
					ChargeState="2"
					BLASTSTATE="10"
					CBLASTSTATE="11"
					BLASTICON='10.dmi'
					CBLASTICON='11.dmi'
					InclineAge=25
					DeclineAge=100
					DeclineMod=1
					Age=25
					Body=25
					Makkankoicon='Ki Makkankosappo4.dmi'
					kinxt=-5
					kinxtadd=1.2
					ITMod=0.5
					healmod=0.01
					zanzomod=1.5
					zanzoskill=50
					haszanzo=1
					/*
					KaiokenMod=0.5
					*/
					flightmod=4
					flightskill=100
					zenni+=rand(1,500)
					PLMod=25
					MaxPLpcnt=100
					MaxAnger=105
					MaxKi=rand(100,200)
					KiMod=5
					PowMod=rand(100,200)/100
					Str=rand(15,100)
					Spd=rand(12,100)
					End=rand(20,100)
					Pow=rand(9,90)
					Offense=rand(10,50)
					Defense=rand(10,50)
					StrMod=rand(100,200)/100
					SpdMod=rand(100,200)/100
					EndMod=rand(100,200)/100
					ResMod=rand(100,200)/100
					OffenseMod=rand(100,200)/100
					DefenseMod=rand(100,200)/100
					GravMod=3
					HPRegen=rand(2,3)
					KiRegen=rand(2,3)
					ZenkaiMod=rand(100,200)/100
					TrainMod=1.3
					MedMod=1.2
					SparMod=1.2
					Race="Android"
					spacebreather=1
					RecordPL=2
					GravMastered=200
					techmod=2.25
					RaceDescription=("These beings are total machine, being constructed on the Mother Ship. In terms of the series, this race could be compared to the likes of Android #13, #14, #15, #16, and #19 to name a few. They have quite high BP mods, allowing them to gain power fast if trained correctly. Their main drawback is their energy regeneration, which is ridiculously slow. A strange ability they have is to carry on standing even when there health reaches 0%, not being instantly Knocked Out.")
				if("Quarter-Saiyan")
					givepowerchance=1
					UPMod*=2
					bursticon='All.dmi'
					burststate="2"
					BLASTSTATE="19"
					CBLASTSTATE="24"
					BLASTICON='19.dmi'
					CBLASTICON='24.dmi'
					ChargeState="9"
					Makkankoicon='Ki Makkankosappo4.dmi'
					InclineAge=25
					DeclineAge=rand(40,45)
					DeclineMod=1
					refire*=0.9
					ITMod=1
					kinxt=10
					kinxtadd=0.5
					healmod=1
					zanzomod=3
					/*
					KaiokenMod=1.5
					*/
					flightmod=4
					PLMod=15
					MaxPLpcnt=300
					MaxAnger=500
					MaxKi=rand(15,20)
					KiMod=rand(100,250)/100
					PowMod=rand(100,250)/100
					StrMod=rand(100,250)/100
					SpdMod=rand(100,250)/100
					EndMod=rand(200,400)/100
					ResMod=rand(100,250)/100
					OffenseMod=rand(100,250)/100
					DefenseMod=rand(100,250)/100
					GravMod=1
					HPRegen=3
					KiRegen=3
					ZenkaiMod=rand(100,300)/100
					TrainMod=1.5
					MedMod=2
					SparMod=1.5
					Race="Quarter-Saiyan"
					RecordPL=rand(1,2000) //25 to 100'000 grown...
					GravMastered=2
					techmod=1.85
					zenni+=rand(100,200)
					Offense=30*OffenseMod
					Defense=30*DefenseMod
					RaceDescription=("Being the Equivalent to Pan, these guys can’t transform into a Super Saiyan. To compensate this, they have the highest BP mod of any Saiyan race, as well as the highest average for stat mods. Seeing as Pan is the only character of this race in the Anime, not much else can be said about them.")
				if("Human")
					givepowerchance=3
					UPMod*=3
					WaveIcon='Beam3.dmi'
					bursticon='All.dmi'
					burststate="2"
					var/chargo=rand(1,9)
					ChargeState="[chargo]"
					Cblastpower*=3
					BLASTICON='1.dmi'
					BLASTSTATE="1"
					CBLASTICON='18.dmi'
					CBLASTSTATE="18"
					InclineAge=25
					DeclineAge=rand(40,50)
					DeclineMod=1
					refire*=0.8
					Makkankoicon='Ki Makkankosappo4.dmi'
					ITMod=2
					kinxt=20
					kinxtadd=0
					healmod=1
					zanzomod=5
					/*
					KaiokenMod=2.5
					*/
					flightmod=5
					zenni+=rand(250,500)
					PLMod=1.70
					MaxPLpcnt=150
					MaxAnger=175
					KiMod=rand(100,300)/100
					kimanipmod=rand(100,200)/100
					MaxKi=rand(1,50)
					PowMod=rand(120,280)/100
					StrMod=rand(120,280)/100
					SpdMod=rand(120,280)/100
					EndMod=rand(120,280)/100
					ResMod=rand(120,280)/100
					OffenseMod=rand(120,280)/100
					DefenseMod=rand(120,280)/100
					GravMod=1
					HPRegen=rand(200,400)/100
					KiRegen=rand(200,400)/100
					ZenkaiMod=rand(100,200)/100
					TrainMod=2
					MedMod=3
					SparMod=2
					Race="Human"
					RecordPL=1
					GravMastered=1
					ascat=rand(4500000,5000000)
					techmod=3.5
					RaceDescription=("Human characters are based off the likes of those in the series, like Krillin, Yamcha etc. They have one of the lowest BP mods of all the races, finding it extremely hard to gain it. They are also known for being notoriously hard to train, as to begin with they can be difficult to use. But with a lot of determination and the right technique, these beings can become some of the strongest. Their stat mods are quite easily some of the best, being relatively high all around. Once again, getting good stats requires hard training though. Assortments of chi moves are available for them. Humans can also pretty much are on par with Tsu’s in terms of tech, just being slightly behind. Their Final BP mod is known as ‘Ascension’, and is named aptly; it is one of the most impressive on the game, making Human’s the race to be End Wipe. Third eye is also available for Humans to learn, like Tien Shinhan, giving a permanent boost to BP/stats.")
				if("Spirit Doll")
					contents+=new/obj/KiAttacks/Basic
					contents+=new/obj/Skills/Fly
					givepowerchance=3
					UPMod*=3
					WaveIcon='Beam3.dmi'
					bursticon='All.dmi'
					burststate="2"
					var/chargo=rand(1,9)
					ChargeState="[chargo]"
					Cblastpower*=3
					BLASTICON='1.dmi'
					BLASTSTATE="1"
					CBLASTICON='18.dmi'
					CBLASTSTATE="18"
					InclineAge=25
					DeclineAge=rand(30,35)
					DeclineMod=1
					refire*=0.5
					Makkankoicon='Ki Makkankosappo4.dmi'
					ITMod=2
					kinxt=-5
					kinxtadd=1
					healmod=1
					zanzomod=7
					/*
					KaiokenMod=2
					*/
					flightmod=8
					zenni+=rand(50,200)
					PLMod=1.1
					MaxPLpcnt=300
					MaxAnger=125
					KiMod=2.3
					kimanipmod=rand(100,250)/100
					MaxKi=40
					PowMod=rand(150,400)/100
					StrMod=rand(100,200)/100
					SpdMod=rand(100,200)/100
					EndMod=rand(100,200)/100
					ResMod=rand(100,300)/100
					OffenseMod=rand(100,250)/100
					DefenseMod=rand(100,250)/100
					GravMod=1
					HPRegen=3
					KiRegen=3
					ZenkaiMod=rand(100,200)/100
					TrainMod=2
					MedMod=4
					SparMod=1.25
					Race="Spirit Doll"
					RecordPL=4
					GravMastered=1
					ascat=1000000
					techmod=2
					RaceDescription=("Just think Chiaotzu. Even though in the series Chiaotzu was just a small, white Human, in Encore he has his own race. These little fella’s are quite like Human, yet more mystically aligned. As a result, there skill with Chi energy is much better than Humans, and they can train it faster. Their main drawback is they can’t make good Physical fighters, without strenuous training first. They also have the smallest BP mod.")
				if("Tsufurujin")
					givepowerchance=0.2
					bursticon='All.dmi'
					burststate="5"
					BLASTSTATE="5"
					BLASTICON='5.dmi'
					CBLASTICON='6.dmi'
					CBLASTSTATE="6"
					ChargeState="6"
					InclineAge=25
					DeclineAge=rand(45,50)
					DeclineMod=1
					Makkankoicon='Ki Makkankosappo3.dmi'
					ITMod=2
					kinxt=10
					kinxtadd=1
					healmod=0.5
					zanzomod=3
					/*
					KaiokenMod=2
					*/
					flightmod=5
					zenni+=rand(100,200)
					PLMod=1.25
					MaxPLpcnt=105
					MaxAnger=140
					MaxKi=rand(10,12)
					KiMod=rand(100,200)/100
					PowMod=rand(100,200)/100
					StrMod=rand(100,200)/100
					SpdMod=rand(100,200)/100
					EndMod=rand(100,200)/100
					ResMod=rand(100,200)/100
					OffenseMod=rand(100,200)/100
					DefenseMod=rand(100,250)/100
					GravMod=1
					HPRegen=rand(100,300)/100
					KiRegen=rand(100,300)/100
					ZenkaiMod=rand(150,200)/100
					TrainMod=1.5
					MedMod=2
					SparMod=1.2
					Race="Tsufurujin"
					RecordPL=5
					GravMastered=5
					techmod=4
					RaceDescription=("Considered the brainiest race, Tsufuru-jin’s boast the highest of tech mods, levelling it up quite easily. Considered docile, these beings aren’t usually considered fighters or chi users, and often stick to just tech. But with enough training, this race can become quite strong, although it’s almost not worth the hassle. Through tech they are the only race able to create Cyborgs and Bebi’s.")
				if("Namekian")
					see_invisible=5
					var/Choice=alert(src,"A Namekian can choose which basic ability they want to start with.","","Power Control","Fly","Basic Blast")
					switch(Choice)
						if("Power Control") contents+=new/obj/Skills/Power_Control
						if("Fly") contents+=new/obj/Skills/Fly
						if("Basic Blast") contents+=new/obj/KiAttacks/Basic
					givepowerchance=10
					UPMod*=3
					bursticon='All.dmi'
					burststate="2"
					BLASTSTATE="6"
					ChargeState="1"
					CBLASTSTATE="20"
					BLASTICON='6.dmi'
					CBLASTICON='20.dmi'
					Cblastpower*=2.5
					InclineAge=25
					DeclineAge=100
					DeclineMod=1
					kinxt=8
					kinxtadd=0.8
					refire*=0.9
					Makkankoicon='Ki Makkankosappo.dmi'
					WaveIcon='Beam3.dmi'
					MaxKi=rand(20,30)
					healmod=1
					zanzomod=7
					haszanzo=1
					/*
					KaiokenMod=1
					*/
					flightmod=10
					flightskill=100
					zenni+=rand(100,200)
					PLMod=3
					MaxPLpcnt=150
					MaxAnger=100
					KiMod=3
					kimanipmod=rand(100,200)/100
					PowMod=rand(150,400)/100
					StrMod=rand(100,250)/100
					SpdMod=rand(100,350)/100
					EndMod=rand(100,250)/100
					ResMod=rand(100,220)/100
					OffenseMod=rand(100,250)/100
					DefenseMod=rand(100,250)/100
					GravMod=1
					HPRegen=5
					KiRegen=4
					ZenkaiMod=rand(100,500)/100
					TrainMod=2
					MedMod=5
					SparMod=2
					Race="Namekian"
					RecordPL=rand(4,20)
					GravMastered=10
					snjat/=1000
					snjat*=rand(800,950)
					techmod=2.35
					RaceDescription=("Quite a peace-loving race that inhabits the planet Namek, they start off with either the ability to fire basic ki blasts, powering up or the ability to fly. Namekians also learn splitform, namekian BE, heal, materialize and eventually even namekian fusion as well and in some special cases they even have the ability to create dragonballs. Namekians start out roughly the same as low class Saiyan’s but as they grow stronger their potential grows with them.")
				if("Saiyan")
					var/Choice=alert(src,"Choose Option","","Normal","Elite","Low-Class")
					switch(Choice)
						if("Elite")
							if(prob(10)) contents+=new/obj/KiAttacks/Basic
							if(prob(10)) contents+=new/obj/Skills/Fly
							givepowerchance=1
							Race="Saiyan"
							Class="Elite"
							elite=1
							InclineAge=25
							DeclineAge=rand(45,50)
							DeclineMod=1
							BLASTSTATE="18"
							CBLASTSTATE="17"
							BLASTICON='18.dmi'
							CBLASTICON='17.dmi'
							ChargeState="6"
							WaveIcon='Beam1.dmi'
							Cblastpower*=2
							techmod=1.5
							zanzomod=2
							zanzoskill+=3
							haszanzo=1
							/*
							KaiokenMod=1
							*/
							flightmod=4
							flightskill=20
							kinxt=10
							kinxtadd=1
							zenni+=rand(500,750)
							MaxKi=rand(30,50)
							PLMod=15
							MaxPLpcnt=105
							MaxAnger=125
							KiMod=rand(100,200)/100
							PowMod=rand(100,200)/100
							StrMod=rand(100,200)/100
							SpdMod=rand(100,200)/100
							EndMod=rand(150,300)/100
							ResMod=rand(100,200)/100
							OffenseMod=rand(100,200)/100
							DefenseMod=rand(100,200)/100
							GravMod=3
							GravMastered+=10
							HPRegen=rand(120,300)/100
							KiRegen=rand(120,300)/100
							ZenkaiMod=10
							TrainMod=2
							MedMod=2
							SparMod=2
							RecordPL=rand(200,300)
							Omult=rand(2,4)
							Ochance=rand(1000,3000)
							Oozarouskill=150
							ssjat*=3.2*rand(800,1200)/1000
							ssjmult=1.25
							ssjdrain=150
							ssjadd=14000000
							ssj2add=60000000
							ssjmod*=0.5
							ssj2at*=rand(90,110)/100
							ssj3hitreq*=rand(120,160)/100
							/*
							KaiokenMod*=1
							*/
							UPMod*=0.5
							gain+=gainget*300
							RaceDescription=("Proud and powerful, the Saiyan elite is the strongest of the Saiyan classes, born with a superior power and a superiority complex. Elites are generally arrogant, smug and extremely insulting to anyone of a lower class, their pride often forces them to consider someone a rival, turning even the most basic of things into a competition. They start out with Oozaru mastered but their super Saiyan form is the hardest to obtain of all the classes, but is often considered to be well worth it. Elites also have a harder time achieving super Saiyan 3 then the other races but once more its considered well worth the effort.")
						if("Low-Class")
							givepowerchance=1.5
							WaveIcon='Beam3.dmi'
							InclineAge=25
							DeclineAge=rand(40,47)
							DeclineMod=1
							BLASTSTATE="12"
							CBLASTSTATE="18"
							BLASTICON='12.dmi'
							CBLASTICON='18.dmi'
							ChargeState="8"
							Cblastpower*=2
							zanzomod=2
							/*
							KaiokenMod=1
							*/
							flightmod=4
							flightskill=20
							kinxt=10
							kinxtadd=1
							zenni+=rand(200,300)
							PLMod=5
							MaxKi=rand(4,6)
							MaxPLpcnt=110
							MaxAnger=200
							KiMod=rand(1,3)
							PowMod=rand(100,250)/100
							StrMod=rand(100,250)/100
							SpdMod=rand(100,250)/100
							EndMod=rand(200,350)/100
							ResMod=rand(100,250)/100
							OffenseMod=rand(100,250)/100
							DefenseMod=rand(100,250)/100
							GravMod=1.3
							HPRegen=2
							KiRegen=rand(150,300)/100
							ZenkaiMod=7.5
							TrainMod=2
							MedMod=2.1
							SparMod=2
							Race="Saiyan"
							Class="Low-Class"
							RecordPL=rand(20,100) //500 to 2500 full grown...
							RecordPL=1
							if(prob(20)) ssj3able=1
							ssjdrain=150
							GravMastered=5
							ssjat*=rand(700,1200)/1000
							ssjmult=1.25
							ssjadd=9000000
							ssj2at*=rand(90,110)/100
							ssj3hitreq*=rand(120,160)/100
							ssj3at*=0.8
							techmod=1.5
							Omult=rand(1,4)
							Ochance=rand(1000,3000)
							UPMod*=2
							RaceDescription=("The lowest class of the saiyan race, these guys are born the weakest of all and as a result actually have a normal personality without an inflated ego. Though their power is low they have decent stat mods and if properly trained they can catch up to normal class saiyans quite fast. Their Oozaru form begins unmastered but they have the easiest job achieving super saiyan in general as well as super saiyan three.")
						if("Normal")
							if(prob(5)) contents+=new/obj/KiAttacks/Basic
							if(prob(5)) contents+=new/obj/Skills/Fly
							givepowerchance=1
							InclineAge=25
							DeclineAge=rand(40,44)
							DeclineMod=1
							ChargeState="8"
							BLASTSTATE="12"
							CBLASTSTATE="18"
							BLASTICON='12.dmi'
							CBLASTICON='18.dmi'
							Cblastpower*=2
							zanzomod=2
							/*
							KaiokenMod=1
							*/
							flightmod=4
							flightskill=20
							kinxt=10
							kinxtadd=1
							zenni+=rand(300,500)
							PLMod=10
							MaxPLpcnt=110
							MaxAnger=150
							MaxKi=rand(8,12)
							KiMod=rand(1.1,3)
							PowMod=rand(100,225)/100
							StrMod=rand(100,225)/100
							SpdMod=rand(100,225)/100
							EndMod=rand(175,325)/100
							ResMod=rand(100,225)/100
							OffenseMod=rand(100,225)/100
							DefenseMod=rand(100,225)/100
							Pow+=1*PowMod
							Str+=1*StrMod
							Spd+=1*SpdMod
							End+=1*EndMod
							Res+=1*ResMod
							MaxKi+=10*KiMod
							GravMod=1.5
							HPRegen=rand(130,300)/100
							KiRegen=rand(130,300)/100
							ZenkaiMod=9
							TrainMod=2
							MedMod=2
							SparMod=2
							Race="Saiyan"
							Class="Normal"
							RecordPL=rand(30,100) //500 to 2500 full grown...
							GravMastered=5
							ssjmult=1.25
							ssjadd=10000000
							ssjat*=1.9*rand(800,1200)/1000
							ssj2at*=rand(90,110)/100
							ssj3hitreq*=rand(120,160)/100
							techmod=1.5
							Omult=rand(2,3)
							Ochance=rand(1000,3000)
							gain+=gainget*300
							RaceDescription=("The middle class of the Saiyan race, they’re not quite as strong as elites but definitely stronger then low class Saiyan’s. Normal class Saiyan’s usually have quite a bit of pride, while knowing that elites are stronger than they are they still consider themselves superior compared to low class Saiyan’s. Their Oozaru form is un mastered but they have an easier time achieving super saiyan and super saiyan three then elites.")
				if("Half-Saiyan")
					var/Choice=alert(src,"Choose Option","","Human Dominant (Gohan)","Saiyan Dominant (Trunks)")
					switch(Choice)
						if("Human Dominant (Gohan)")
							givepowerchance=2
							UPMod*=3
							bursticon='All.dmi'
							burststate="2"
							BLASTICON='1.dmi'
							BLASTSTATE="1"
							CBLASTICON='18.dmi'
							CBLASTSTATE="18"
							ChargeState="4"
							Cblastpower*=2
							InclineAge=25
							DeclineAge=rand(40,45)
							DeclineMod=1
							Class="Earth Halfie"
							zanzomod=3
							/*
							KaiokenMod=1
							*/
							flightmod=4
							Makkankoicon='Ki Makkankosappo4.dmi'
							kinxt=12
							kinxtadd=0.8
							zenni+=rand(100,200)
							kimanipmod=1.2
							PLMod=5
							MaxPLpcnt=110
							MaxAnger=500
							MaxKi=rand(5,10)
							KiMod=rand(100,250)/100
							PowMod=rand(100,250)/100
							StrMod=rand(100,250)/100
							SpdMod=rand(100,250)/100
							EndMod=rand(100,250)/100
							ResMod=rand(100,250)/100
							OffenseMod=rand(100,250)/100
							DefenseMod=rand(100,250)/100
							GravMod=1
							HPRegen=2
							KiRegen=2
							ZenkaiMod=2.5
							TrainMod=2
							MedMod=2
							SparMod=1.25
							Race="Half-Saiyan"
							RecordPL=rand(1,10) //25 to 250 grown.
							GravMastered=2
							ssjat*=(rand(1000,1500)/1000)
							ssjmod*=3
							ssjdrain=200
							ssjmult=2
							ssjadd=10000000
							ssj2add=30000000
							ssj2mult=1.875
							ssj2add*=0.7
							ssj2at*=rand(1500,2000)/1500
							ssj3hitreq*=rand(100,150)/100
							techmod=2
							Omult=rand(3,5)
							Ochance=rand(1000,3000)
							refire*=0.8
							orefire*=0.8
						else
							givepowerchance=1.5
							UPMod*=1.5
							InclineAge=25
							DeclineAge=rand(40,44)
							DeclineMod=1
							Class="Vegeta Halfie"
							ChargeState="9"
							BLASTSTATE="25"
							CBLASTSTATE="15"
							BLASTICON='25.dmi'
							CBLASTICON='15.dmi'
							Cblastpower*=2
							zanzomod=2
							/*
							KaiokenMod=1
							*/
							flightmod=4
							kinxt=10
							kinxtadd=1
							zenni+=rand(75,200)
							PLMod=10
							MaxPLpcnt=105
							MaxAnger=180
							MaxKi=rand(8,12)
							KiMod=rand(1.1,3)
							PowMod=rand(100,220)/100
							StrMod=rand(100,220)/100
							SpdMod=rand(100,250)/100
							EndMod=rand(100,250)/100
							ResMod=rand(100,220)/100
							OffenseMod=rand(100,220)/100
							DefenseMod=rand(100,220)/100
							GravMod=2
							GravMastered=10
							HPRegen=rand(110,250)/100
							KiRegen=rand(110,250)/100
							ZenkaiMod=5
							TrainMod=2.1
							MedMod=2
							SparMod=1.5
							Race="Half-Saiyan"
							ssjmult=1.5
							ssj2mult=2.5
							ssjadd=12000000
							ssjadd=48000000
							RecordPL=rand(50,100) //1250 to 2500 grown...
							ssjat*=rand(3500,4000)/1000
							ssj3hitreq*=rand(80,120)/100
							ssjdrain=200
							techmod=2
							Omult=rand(4,6)
							Ochance=rand(2000,6000)
				if("Changeling")
					contents+=new/obj/KiAttacks/Basic
					contents+=new/obj/Skills/Fly
					givepowerchance=0.5
					bursticon='All.dmi'
					burststate="5"
					ChargeState="1"
					/*
					KaiokenMod=1
					*/
					InclineAge=25
					DeclineAge=rand(70,90)
					DeclineMod=1
					Pow=6
					MaxKi=rand(20,30)
					Race="Changeling"
					spacebreather=1
					kinxt=-5
					kinxtadd=0.9
					zenni+=rand(500,650)
					Makkankoicon='Ki Makkankosappo3.dmi'
					WaveIcon='Beam2.dmi'
					Age=25
					Body=25
					var/Choice=alert(src,"Choose Option","","Frieza","King Kold","Koola")
					switch(Choice)
						if("Frieza")
							BLASTSTATE="9"
							CBLASTSTATE="14"
							BLASTICON='9.dmi'
							CBLASTICON='14.dmi'
							Cblastpower=2
							Class="Frieza Type"
							zanzomod=5
							flightmod=5
							flightskill=20
							zanzoskill=10
							Str=3
							Spd=6
							End=3
							Offense=3
							Defense=3
							zenni+=rand(50,150)
							PLMod=5.5
							MaxPLpcnt=110
							MaxAnger=110
							KiMod=rand(100,220)/100
							PowMod=rand(100,220)/100
							StrMod=rand(200,450)/100
							SpdMod=rand(200,450)/100
							EndMod=rand(200,450)/100
							ResMod=rand(100,220)/100
							OffenseMod=rand(100,200)/100
							DefenseMod=rand(100,150)/100
							GravMod=10
							HPRegen=rand(150,300)/100
							KiRegen=rand(150,300)/100
							ZenkaiMod=rand(200,500)/100
							TrainMod=2.2
							MedMod=2
							SparMod=2
							Race="Changeling"
							spacebreather=1
							RecordPL=rand(3600,4400)
							GravMastered=15
							techmod=2.15
							RaceDescription=("Frieza type changelings are fast and powerful, they have powerful transformations that come natural to them and start out with ki quite easy, their usually seen as the cool intelligent type until they lose their tempter or get put in a tight spot. A frieza types final form is almost unmatched early wipe, generally speaking only a super saiyan can match it in terms of power.")
						if("King Kold")
							BLASTSTATE="26"
							BLASTICON='26.dmi'
							CBLASTICON='18.dmi'
							CBLASTSTATE="18"
							Cblastpower=2
							Class="King Kold Type"
							zanzomod=5
							flightmod=5
							zenni+=rand(150,250)
							flightskill=20
							zanzoskill=10
							Str=6
							Spd=3
							End=3
							Offense=3
							Defense=3
							flightmod=5
							PLMod=5.5
							MaxPLpcnt=110
							MaxAnger=110
							KiMod=rand(1.1,2.5)
							PowMod=rand(100,250)/100
							StrMod=rand(200,450)/100
							SpdMod=rand(100,150)/100
							EndMod=rand(200,550)/100
							ResMod=rand(200,350)/100
							OffenseMod=rand(100,300)/100
							DefenseMod=rand(100,200)/100
							GravMod=10
							HPRegen=rand(100,250)/100
							KiRegen=rand(100,250)/100
							ZenkaiMod=rand(110,350)/100
							TrainMod=2.1
							MedMod=2.2
							SparMod=1.75
							Race="Changeling"
							spacebreather=1
							RecordPL=rand(3800,5200)
							GravMastered=15
							f2at=1
							f2mult=7294570
							techmod=2
							RaceDescription=("Slow and bulky, king kold types are the tanks under the changelings, they only have one transformation but the form is immediately available and is as strong as the frieza type’s final form, making it quite strong indeed.")
						if("Koola")
							//-----------------------------------------
							f4at=5000000
							f2mult=1000000
							f3mult=2000000
							f4mult=6294570
							BLASTSTATE="21"
							CBLASTSTATE="13"
							BLASTICON='21.dmi'
							CBLASTICON='13.dmi'
							Class="Koola Type"
							zanzomod=5
							flightmod=5
							flightskill=20
							zanzoskill=10
							Str=3
							Spd=6
							End=3
							Offense=3
							Defense=3
							zenni+=rand(200,500)
							PLMod=5.5
							MaxPLpcnt=110
							MaxAnger=110
							KiMod=rand(1.1,2)
							PowMod=rand(100,200)/100
							StrMod=rand(100,200)/100
							SpdMod=rand(100,200)/100
							EndMod=rand(200,500)/100
							ResMod=rand(150,400)/100
							OffenseMod=rand(100,300)/100
							DefenseMod=rand(100,200)/100
							GravMod=10
							HPRegen=rand(110,300)/100
							KiRegen=rand(110,300)/100
							ZenkaiMod=rand(110,350)/100
							TrainMod=2.2
							MedMod=2
							SparMod=1.5
							Race="Changeling"
							spacebreather=1
							RecordPL=rand(3000,3500)
							GravMastered=15
							techmod=2.05
							RaceDescription=("Generally seen as the underdog, Cooler type changelings start with two of three forms unlocked, making them the weakest starting out. The final form of Cooler types can be considered hard to achieve for new players, but once reached it’s the strongest form of the changelings and such puts it slightly above a super Saiyan.")
				if("Demon")
					Race="Demon"
					contents+=new/obj/Skills/Soul_Absorb
					contents+=new/obj/Skills/Imitation
					givepowerchance=0.3
					bursticon='All.dmi'
					burststate="2"
					ChargeState="9"
					BLASTSTATE="22"
					CBLASTSTATE="4"
					BLASTICON='22.dmi'
					CBLASTICON='4.dmi'
					Makkankoicon='Ki Makkankosappo3.dmi'
					Cblastpower*=2
					InclineAge=25
					DeclineAge=rand(60,70)
					DeclineMod=1
					flightmod=3
					kinxt=10
					kinxtadd=1
					zanzomod=3
					/*
					KaiokenMod=1.2
					*/
					zenni+=rand(200,500)
					flightskill=20
					dead=0
					PLMod=10
					MaxPLpcnt=150
					MaxKi=rand(80,100)
					KiMod=rand(125,250)/100
					PowMod=rand(125,250)/100
					StrMod=rand(125,300)/100
					SpdMod=rand(125,300)/100
					EndMod=rand(225,375)/100
					ResMod=rand(100,200)/100
					OffenseMod=rand(100,250)/100
					DefenseMod=rand(100,250)/100
					GravMod=10
					HPRegen=3
					KiRegen=3
					ZenkaiMod=3
					TrainMod=2.6
					MedMod=2.4
					MaxAnger=175
					UPMod=2
					SparMod=1
					RecordPL=800
					GravMastered=10
					techmod=1.5
					RaceDescription=("The scourge of the afterlife, these are twisted souls full of hate. Demons generally delight in causing pain and suffering. They are particularly good in physical combat though ki specialists are not unheard of. Demons have the natural ability to learn body expand and ki burst, as well as invisibility, split form and imitate. Some special demons can even teleport to other planets and enslave others through their mysterious dark powers. It’s rumoured that demons and kaio's share a common ancestor.")
				if("Arconian")
					contents+=new/obj/Skills/Telepathy
					givepowerchance=1
					UPMod*=rand(1,7)
					bursticon='All.dmi'
					burststate="2"
					var/chargoo=rand(1,9)
					ChargeState="[chargoo]"
					MaxKi=rand(20,30)
					BLASTICON='1.dmi'
					BLASTSTATE="1"
					CBLASTICON='18.dmi'
					CBLASTSTATE="18"
					var/rando=rand(1,3)
					if(rando==1) Makkankoicon='Ki Makkankosappo.dmi'
					if(rando==2) Makkankoicon='Ki Makkankosappo4.dmi'
					if(rando==3) Makkankoicon='Ki Makkankosappo3.dmi'
					DeclineAge=rand(40,200)
					DeclineMod=rand(50,200)/100
					healmod=rand(25,120)/100
					zanzomod=rand(100,760)/100
					/*
					KaiokenMod=rand(50,360)/100
					*/
					kinxt=rand(5,15)
					kinxtadd=rand(3,13)
					kinxtadd/=10
					zenni+=rand(50,800)
					flightmod=rand(200,1000)
					flightmod/=100
					PLMod=rand(50,1000)/100
					MaxPLpcnt=rand(101,168)
					MaxAnger=rand(101,300)
					KiMod=rand(75,375)/100
					PowMod=rand(75,375)/100
					StrMod=rand(75,375)/100
					SpdMod=rand(75,375)/100
					EndMod=rand(75,375)/100
					ResMod=rand(50,375)/100
					OffenseMod=rand(100,375)/100
					DefenseMod=rand(100,375)/100
					GravMod=rand(50,300)/100
					HPRegen=rand(50,240)/100
					KiRegen=rand(50,240)/100
					ZenkaiMod=rand(50,500)/100
					TrainMod=rand(150,300)/100
					MedMod=rand(150,300)/100
					SparMod=1
					Race="Arconian"
					spacebreather=1
					RecordPL=rand(1,2400)
					GravMastered=rand(1,12)
					techmod=rand(95,375)/100
					RaceDescription=("This is probably the most diverse race the universe has to offer, Arconians randomly learn five of ten unique skills and receive random mods upon creation, if you like to take a gamble this is the race for you.")
					switch(input("Choose your skin color", "", text) in list ("Konatsu","Kanassa","Baseniojin","Black Baseniojin","Yardrat","Immecka","Yukenojin","Jeice","Burter","Style1","Style2","Style3","None"))
						if("Style1")
							MaxKi=rand(100,300)
							contents+=new/obj/Skills/Fly
							contents+=new/obj/KiAttacks/Basic
							Class="Style1"
						if("Style2")
							SpdMod=2.5
							OffenseMod=2.2
							DefenseMod=2
							Class="Style2"
						if("Style3")
							contents+=new/obj/KiAttacks/Basic
							haszanzo=1
							StrMod=1.8
							EndMod=1.4
							Class="Style3"
						if("Baseniojin")
							contents+=new/obj/Skills/Fly
							contents+=new/obj/KiAttacks/Kill_Driver
							Class="Baseniojin"
							MaxKi=rand(100,200)
							flightskill=rand(1000,5000)
							flightmod=10
						if("Black Baseniojin")
							contents+=new/obj/Skills/Fly
							contents+=new/obj/KiAttacks/Kill_Driver
							Class="Black Baseniojin"
							MaxKi=rand(100,200)
							flightskill=rand(1000,5000)
							flightmod=10
						if("Immecka")
							Class="Immecka"
							DefenseMod=3
						if("Yukenojin")
							SpdMod=4
							Class="Yukenojin"
						if("Jeice")
							Class="Jeice"
							Spd=20*SpdMod
							SpdMod=rand(2,4)
						if("Burter")
							Class="Burter"
							SpdMod=3.5
							Spd=15*SpdMod
						if("Metamori")
							Class="Metamori"
							EndMod=rand(2,4)
						if("Yardrat")
							Class="Yardrat"
							contents+=new/obj/Skills/Shunkan_Ido
							contents+=new/obj/Skills/Telepathy
							contents+=new/obj/Skills/Fly
							zanzomod=7
							zanzoskill=10
							haszanzo=1
							orefire*=0.2
						if("Kanassa")
							Class="Kanassa-Jin"
							contents+=new/obj/Skills/Telepathy
							contents+=new/obj/Skills/Sense
							contents+=new/obj/Skills/Sense2
							contents+=new/obj/Skills/Sense3
							contents+=new/obj/Skills/Observe
							precognitive=1
							see_invisible=5
						if("Konatsu")
							Class="Konatsu"
							contents+=new/obj/Skills/Heal
							PLMod=10
				if("Hybrid")
					Race="Hybrid"
					givepowerchance=6.66
					UPMod*=2.5
					bursticon='All.dmi'
					burststate="2"
					ChargeState="9"
					BLASTSTATE="22"
					CBLASTSTATE="4"
					BLASTICON='22.dmi'
					CBLASTICON='4.dmi'
					Makkankoicon='Ki Makkankosappo3.dmi'
					Cblastpower*=2.5
					InclineAge=25
					DeclineAge=rand(50,60)
					DeclineMod=1
					flightmod=3.5
					kinxt=11
					kinxtadd=0.9
					zanzomod=3
					/*
					KaiokenMod=1.1
					*/
					zenni+=rand(150,350)
					flightskill=10
					dead=0
					PLMod=7.5
					MaxPLpcnt=130
					MaxKi=rand(40,50)
					KiMod=rand(100,225)/100
					PowMod=rand(100,225)/100
					StrMod=rand(100,275)/100
					SpdMod=rand(100,275)/100
					EndMod=rand(150,300)/100
					ResMod=rand(100,225)/100
					OffenseMod=rand(100,250)/100
					DefenseMod=rand(100,250)/100
					GravMod=5
					HPRegen=2.5
					KiRegen=2.5
					ZenkaiMod=2.5
					TrainMod=2.3
					MedMod=2.2
					SparMod=1.12
					MaxAnger=250
					RecordPL=rand(200,450)
					GravMastered=10
					ssjat*=(rand(1000,1500)/1000)
					ssjmod*=3
					ssjdrain=200
					ssjmult=2
					ssjadd=10000000
					techmod=1.5
					RaceDescription=("Hybrids are a mixture of Saiyan and Demon blood. Therefore, they strike a balance between the two stat and BP mod wise, and should also be role-played in the same way; being a slightly eviler version of a Saiyan. Seeing as this race is non-cannon, there’s not much to be said about it, but it can be a fun race to play.")
			var/Choice=alert(src,"[RaceDescription] ...Do you want this race?","","Yes","No")
			switch(Choice)
				if("No")
					var/mob/M=new/mob
					M.displaykey=key
					M.name=key
					M.key=key
		Gender()
			if(Race=="Ancient Namek"|Race=="Kanassa-Jin"|Race=="Makyojin"|Race=="Namekian"|Class=="Yardrat"|Race=="Bio-Android")
			else
				var/Choice=alert(src,"Choose gender","","Male","Female")
				switch(Choice)
					if("Female") pgender="Female"
					if("Male") pgender="Male"
		Age()
			if(Race!="Bio-Android"&&Race!="Bebi")
				usr.startingage=input("Please choose your character's Starting Age, note that it should be a number between 1 and 25.") as num
				if(usr.startingage>25)
					usr<<"Please pick a number between 1 and 25."
					Age()
				if(usr.startingage<=0)
					usr<<"Please pick a number between 1 and 25."
					Age()
				else
					usr<<"Your character will start at age [startingage], be sure to Roleplay accordingly!"
			else
				usr<<"This Race cannot select it's Starting Age you will rp your physical age found in character info."
		Eyes()
			var/eyes='Eyes_Black.dmi'
			var/eyecolor
			eyecolor+=input("Please select your eye color.") as color
			eyes+=eyecolor
			overlays+=eyes
		Hair()
			if(Race=="Saiyan"&&!Created)
				switch(input("Choose hair", "", text) in list ("Bald","Female1","Goku","Short Female 1","Short Female 2","Pony Tail","Vegeta","Future Gohan","Teen Gohan","Long","Kid Gohan","Female Long","Female Long 2","Goten","GT Trunks","GT Vegeta","Mohawk","Spike","Yamcha","Vegeta Junior","Lan",))
					if("Female1")
						hair='Hair_Female1.dmi'
						overlays+=hair
						ssjhair='Hair_Female1SSJ.dmi'
						ussjhair='Hair_Female1SSJ.dmi'
						ssjfphair='Hair_Female1SSJ.dmi'
						ssj2hair='Hair_Female1SSJ.dmi'
						ssj3hair='Hair_Female1SSJ.dmi'
					if("Bald")
						hair=null
						ssjhair=null
						ussjhair=null
						ssjfphair=null
						ssj2hair=null
						ssj3hair=null
					if("Short Female 2")
						hair='Hair_PurpleFemale.dmi'
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair_LongSSjFP.dmi'
						ssjfphair='Hair_FemaleLongSSjFP.dmi'
						ssj2hair='Hair_FemaleLongSSjFP.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Short Female 1")
						hair='Hair_ShortFemale.dmi'
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair_LongSSjFP.dmi'
						ssjfphair='Hair_FemaleLongSSjFP.dmi'
						ssj2hair='Hair_FemaleLongSSjFP.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Pony Tail")
						hair='Hair_PonyTail.dmi'
						overlays+=hair
						ssjhair='Hair_PonyTailSSJ.dmi'
						ussjhair='Hair_SSJ-Custom2.dmi'
						ssjfphair='Hair_PonyTailSSJFP.dmi'
						ssj2hair='Hair_SSJFPCustom.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Female Long")
						hair='Hair_FemaleLong.dmi'
						overlays+=hair
						ssjhair='Hair_FemaleLongSSj.dmi'
						ussjhair='Hair_LongUSSj.dmi'
						ssjfphair='Hair_FemaleLongSSj.dmi'
						ssj2hair='Hair_FemaleLongSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Female Long 2")
						hair='Hair_FemaleLong2.dmi'
						overlays+=hair
						ssjhair='Hair_FemaleLongSSj.dmi'
						ussjhair='Hair_LongUSSj.dmi'
						ssjfphair='Hair_FemaleLongSSj.dmi'
						ssj2hair='Hair_FemaleLongSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Goten")
						hair='Hair_Goten.dmi'
						overlays+=hair
						ssjhair='Hair_GokuSSj.dmi'
						ussjhair='Hair_GokuUSSj.dmi'
						ssjfphair='Hair_GokuSSjFP.dmi'
						ssj2hair='Hair_GokuSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("GT Trunks")
						hair='Hair_GTTrunks.dmi'
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair Trunks SSj.dmi'
						ssjfphair='Hair_LongSSjFP.dmi'
						ssj2hair='Hair Trunks SSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("GT Vegeta")
						hair='Hair_GTVegeta.dmi'
						overlays+=hair
						ssjhair='Hair_GTVegetaSSj.dmi'
						ussjhair='Hair_GTVegetaSSj.dmi'
						ssjfphair='Hair_GTVegetaSSj.dmi'
						ssj2hair='Hair_GTVegetaSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Mohawk")
						hair='Hair_Mohawk.dmi'
						overlays+=hair
						ssjhair='Hair_MohawkSSj.dmi'
						ussjhair='Hair_MohawkSSj.dmi'
						ssjfphair='Hair_MohawkSSj.dmi'
						ssj2hair='Hair_MohawkSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Spike")
						hair='Hair_Spike.dmi'
						overlays+=hair
						ssjhair='Hair_SpikeSSj.dmi'
						ussjhair='Hair_SpikeSSj.dmi'
						ssjfphair='Hair_SpikeSSj.dmi'
						ssj2hair='Hair_SpikeSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Yamcha")
						hair='Hair_Yamcha.dmi'
						overlays+=hair
						ssjhair='Hair_FutureGohanSSj.dmi'
						ussjhair='Hair_GohanUSSj.dmi'
						ssjfphair='Hair_GohanSSjFP.dmi'
						ssj2hair='Hair_FutureGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Kid Gohan")
						hair='Hair_KidGohan.dmi'
						overlays+=hair
						ssjhair='Hair_KidGohanSSj.dmi'
						ussjhair='Hair_KidGohanUSSj.dmi'
						ssjfphair='Hair_KidGohanSSjFP.dmi'
						ssj2hair='Hair_KidGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Lan")
						hair='Hair Lan.dmi'
						overlays+=hair
						ssjhair='Hair_KidGohanSSj.dmi'
						ussjhair='Hair_KidGohanUSSj.dmi'
						ssjfphair='Hair_KidGohanSSjFP.dmi'
						ssj2hair='Hair_KidGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Goku")
						hair='Hair_Goku.dmi'
						overlays+=hair
						ssjhair='Hair_GokuSSj.dmi'
						ussjhair='Hair_GokuUSSj.dmi'
						ssjfphair='Hair_GokuSSjFP.dmi'
						ssj2hair='Hair_GokuSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Vegeta")
						hair='Hair_Vegeta.dmi'
						overlays+=hair
						ssjhair='Hair_VegetaSSj.dmi'
						ussjhair='Hair_VegetaUSSj.dmi'
						ssjfphair='Hair_VegetaSSjFP.dmi'
						ssj2hair='Hair_VegetaSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Vegeta Junior")
						hair='Hair Vegeta Junior.dmi'
						overlays+=hair
						ssjhair='Hair_VegetaSSj.dmi'
						ussjhair='Hair_VegetaUSSj.dmi'
						ssjfphair='Hair_VegetaSSjFP.dmi'
						ssj2hair='Hair_VegetaSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Future Gohan")
						hair='Hair_FutureGohan.dmi'
						overlays+=hair
						ssjhair='Hair_FutureGohanSSj.dmi'
						ussjhair='Hair_GohanUSSj.dmi'
						ssjfphair='Hair_GohanSSjFP.dmi'
						ssj2hair='Hair_FutureGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Teen Gohan")
						hair='Hair_Gohan.dmi'
						overlays+=hair
						ssjhair='Hair_GohanSSj.dmi'
						ussjhair='Hair_GohanUSSj.dmi'
						ssjfphair='Hair_GohanSSjFP.dmi'
						ssj2hair='Hair_GohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Long")
						hair='Hair_Long.dmi'
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair Trunks SSj.dmi'
						ssjfphair='Hair_LongSSjFP.dmi'
						ssj2hair='Hair_GokuSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
			else if(Race=="Arconian"|Race=="Spirit Doll"|Race=="Cyborg"|Class=="Kanassa-Jin"|Race=="Demi-God"|Race=="Quarter-Saiyan"|Race=="Makyojin"|Race=="Kai" | Race=="Demon" | Race=="Tsufurujin" | Race=="Android" | Race=="Human" | Race=="Saiyan" | Race=="Half-Saiyan"|Class=="Yardrat" | Race=="Hybrid")
				switch(input("Choose hair", "", text) in list ("Bald","Female1","Goku","Short Female 1","Short Female 2","Pony Tail","Vegeta","Future Gohan","Teen Gohan","Long","Kid Gohan","Female Long","Female Long 2","Goten","GT Trunks","GT Vegeta","Mohawk","Spike","Yamcha","Vegeta Junior","Lan",))
					if("Female1")
						var/newhair='Hair_Female1.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_Female1SSJ.dmi'
						ussjhair='Hair_Female1SSJ.dmi'
						ssjfphair='Hair_Female1SSJ.dmi'
						ssj2hair='Hair_Female1SSJ.dmi'
						ssj3hair='Hair_Female1SSJ.dmi'
					if("Bald")
						hair=null
						ssjhair=null
						ussjhair=null
						ssjfphair=null
						ssj2hair=null
						ssj3hair=null
					if("Short Female 2")
						var/newhair='Hair_PurpleFemale.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair_LongSSjFP.dmi'
						ssjfphair='Hair_FemaleLongSSjFP.dmi'
						ssj2hair='Hair_FemaleLongSSjFP.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Short Female 1")
						var/newhair='Hair_ShortFemale.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair_LongSSjFP.dmi'
						ssjfphair='Hair_FemaleLongSSjFP.dmi'
						ssj2hair='Hair_FemaleLongSSjFP.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Female Long")
						var/newhair='Hair_FemaleLong.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_FemaleLongSSj.dmi'
						ussjhair='Hair_LongUSSj.dmi'
						ssjfphair='Hair_FemaleLongSSj.dmi'
						ssj2hair='Hair_FemaleLongSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Female Long 2")
						var/newhair='Hair_FemaleLong2.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_FemaleLongSSj.dmi'
						ussjhair='Hair_LongUSSj.dmi'
						ssjfphair='Hair_FemaleLongSSj.dmi'
						ssj2hair='Hair_FemaleLongSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Goten")
						var/newhair='Hair_Goten.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_GokuSSj.dmi'
						ussjhair='Hair_GokuUSSj.dmi'
						ssjfphair='Hair_GokuSSjFP.dmi'
						ssj2hair='Hair_GokuSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("GT Trunks")
						var/newhair='Hair_GTTrunks.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair Trunks SSj.dmi'
						ssjfphair='Hair_LongSSjFP.dmi'
						ssj2hair='Hair Trunks SSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("GT Vegeta")
						var/newhair='Hair_GTVegeta.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_GTVegetaSSj.dmi'
						ussjhair='Hair_GTVegetaSSj.dmi'
						ssjfphair='Hair_GTVegetaSSj.dmi'
						ssj2hair='Hair_GTVegetaSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Mohawk")
						var/newhair='Hair_Mohawk.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_MohawkSSj.dmi'
						ussjhair='Hair_MohawkSSj.dmi'
						ssjfphair='Hair_MohawkSSj.dmi'
						ssj2hair='Hair_MohawkSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Pony Tail")
						var/newhair='Hair_PonyTail.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_PonyTailSSJ.dmi'
						ussjhair='Hair_SSJ-Custom2.dmi'
						ssjfphair='Hair_PonyTailSSJFP.dmi'
						ssj2hair='Hair_SSJFPCustom.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Spike")
						var/newhair='Hair_Spike.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_SpikeSSj.dmi'
						ussjhair='Hair_SpikeSSj.dmi'
						ssjfphair='Hair_SpikeSSj.dmi'
						ssj2hair='Hair_SpikeSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Yamcha")
						var/newhair='Hair_Yamcha.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_FutureGohanSSj.dmi'
						ussjhair='Hair_GohanUSSj.dmi'
						ssjfphair='Hair_GohanSSjFP.dmi'
						ssj2hair='Hair_FutureGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Kid Gohan")
						var/newhair='Hair_KidGohan.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_KidGohanSSj.dmi'
						ussjhair='Hair_KidGohanUSSj.dmi'
						ssjfphair='Hair_KidGohanSSjFP.dmi'
						ssj2hair='Hair_KidGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Lan")
						var/newhair='Hair Lan.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_KidGohanSSj.dmi'
						ussjhair='Hair_KidGohanUSSj.dmi'
						ssjfphair='Hair_KidGohanSSjFP.dmi'
						ssj2hair='Hair_KidGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Goku")
						var/newhair='Hair_Goku.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_GokuSSj.dmi'
						ussjhair='Hair_GokuUSSj.dmi'
						ssjfphair='Hair_GokuSSjFP.dmi'
						ssj2hair='Hair_GokuSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Vegeta")
						var/newhair='Hair_Vegeta.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_VegetaSSj.dmi'
						ussjhair='Hair_VegetaUSSj.dmi'
						ssjfphair='Hair_VegetaSSjFP.dmi'
						ssj2hair='Hair_VegetaSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Vegeta Junior")
						var/newhair='Hair Vegeta Junior.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_VegetaSSj.dmi'
						ussjhair='Hair_VegetaUSSj.dmi'
						ssjfphair='Hair_VegetaSSjFP.dmi'
						ssj2hair='Hair_VegetaSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Future Gohan")
						var/newhair='Hair_FutureGohan.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_FutureGohanSSj.dmi'
						ussjhair='Hair_GohanUSSj.dmi'
						ssjfphair='Hair_GohanSSjFP.dmi'
						ssj2hair='Hair_FutureGohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Teen Gohan")
						var/newhair='Hair_Gohan.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_GohanSSj.dmi'
						ussjhair='Hair_GohanUSSj.dmi'
						ssjfphair='Hair_GohanSSjFP.dmi'
						ssj2hair='Hair_GohanSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
					if("Long")
						var/newhair='Hair_Long.dmi'
						newhair+=input("Please select your hair color.") as color
						hair=newhair
						overlays+=hair
						ssjhair='Hair_LongSSj.dmi'
						ussjhair='Hair Trunks SSj.dmi'
						ssjfphair='Hair_LongSSjFP.dmi'
						ssj2hair='Hair_GokuSSj.dmi'
						ssj3hair='Hair_GokuSSj3.dmi'
		Skin()
			if(Race=="Arconian")
				if(Class=="Kanassa-Jin") icon='Base Kanassan.dmi'
				if(Class=="Konatsu") icon='Base Konatsu.dmi'
				if(Class=="Style1") icon='Base_Alien1.dmi'
				if(Class=="Style2")	icon='Base_Alien2.dmi'
				if(Class=="Style3")	icon='Base_Alien4.dmi'
				if(Class=="Burter") icon='Base Burter.dmi'
				if(Class=="Jeice") icon='Base Jeice.dmi'
				if(Class=="Baseniojin") icon='Base Baseniojin.dmi'
				if(Class=="Black Baseniojin") icon='Base Baseniojin (Black&blue).dmi'
				if(Class=="Immecka") icon='Immecka.dmi'
				if(Class=="Yukenojin") icon='Base Yukenojin.dmi'
				if(Class=="None") icon='Base Metamori.dmi'
				if(Class=="Yardrat") icon='Base Yardrat.dmi'
			if(Race=="Android")
				if(pgender=="Male") switch(input("Choose your skin color", "", text) in list ("Pale", "Tan", "Dark","Robot","Robot2"))
					if("Pale") icon='Base White Male.dmi'
					if("Tan") icon='Base Tan Male.dmi'
					if("Dark") icon='Base Black Male.dmi'
					if("Robot") icon='AndroidForm4.dmi'
					if("Robot2") icon='Base Android 2.dmi'
				else switch(input("Choose your skin color", "", text) in list ("Pale", "Tan", "Dark","Robot","Robot2"))
					if("Pale") icon='Base White Female.dmi'
					if("Tan") icon='Base Tan Female.dmi'
					if("Dark") icon='Base Black Female.dmi'
					if("Robot") icon='AndroidForm4.dmi'
					if("Robot2") icon='Base Android 2.dmi'
			if(Race=="Spirit Doll")
				if(pgender=="Male")
					icon='Spirit Doll no hat.dmi'
				if(pgender=="Female")
					icon='Spirit Doll - Female.dmi'
			if(Race=="Demi-God"|Race=="Tsufurujin"|Race=="Quarter-Saiyan"|Race=="Human"|Race=="Hybrid" | Race=="Saiyan" | Race=="Half-Saiyan")
				if(pgender=="Male") switch(input("Choose your skin color", "", text) in list ("Pale", "Tan", "Dark",))
					if("Pale") icon='Base White Male.dmi'
					if("Tan") icon='Base Tan Male.dmi'
					if("Dark") icon='Base Black Male.dmi'
				else switch(input("Choose your skin color", "", text) in list ("Pale", "Tan", "Dark",))
					if("Pale") icon='Base White Female.dmi'
					if("Tan") icon='Base Tan Female.dmi'
					if("Dark") icon='Base Black Female.dmi'
				if(Race=="Demi-God") icon+=rgb(40,60,60)
			if(Race=="Changeling")
				if(Class=="Frieza Type") icon='Base Changeling.dmi'
				if(Class=="Koola Type") icon='Base Cooler.dmi'
				if(Class=="King Kold Type") icon='Base KingKold.dmi'
				oicon=icon
			if(Race=="Makyojin") icon='MakyoNewBase.dmi'
			if(Race=="Kai")
				var/playericon
				var/playercolor
				playercolor+=input("Pick a color.") as color
				if(pgender=="Male") playericon='Base Custom Male.dmi'
				else playericon='Base Custom Female.dmi'
				playericon += playercolor
				icon=playericon
			if(Race=="Demon")
				var/playericon
				var/playercolor
				playercolor+=input("Pick a color.") as color
				switch(input("Choose appearance", "", text) in list ("Normal (Male and Female)","Devil","Devil2","Skull Demon","Spiral Demon","Black Demon","Janemba","Hades"))
					if("Normal (Male and Female)")
						if(pgender=="Male") playericon='Base Custom Male.dmi'
						else playericon='Base Custom Female.dmi'
						playericon += playercolor
						icon=playericon
					if("Devil")
						playericon='Base Demon 1.dmi'
						playericon += playercolor
						icon=playericon
					if("Devil2")
						playericon='Base_Devil2.dmi'
						playericon += playercolor
						icon=playericon
					if("Skull Demon")
						playericon='Base_Skully.dmi'
						playericon += playercolor
						icon=playericon
					if("Spiral Demon")
						playericon='Base_Tattoo Demon.dmi'
						playericon += playercolor
						icon=playericon
					if("Black Demon")
						playericon='Base Demon 2.dmi'
						playericon += playercolor
						icon=playericon
					if("Janemba")
						playericon='Base Demon 3.dmi'
						playericon += playercolor
						icon=playericon
					if("Hades")
						playericon='Base Hades.dmi'
						playericon += playercolor
						icon=playericon
			if(Race=="Majin")
				var/playericon
				var/playercolor
				playericon='Majin1.dmi'
				playercolor+=input("Pick a color.") as color
				playericon += playercolor
				icon=playericon
			if(Race=="Namekian")
				var/nicon='NamekAdult.dmi'
				switch(input("Choose your skin color","",text) in list("Light Green", "Dark Green",))
					if("Light Green")
						nicon+=rgb(30,30,30)
						light=1
						icon=nicon
					if("Green")
						icon=nicon
						normal=1
					if("Dark Green")
						nicon-=rgb(30,30,30)
						icon=nicon
						dark=1
			if(Race=="Ancient Namek")
				var/image/I=image(icon='Base Namek.dmi')
				I.icon-=rgb(60,60,60)
				icon=I
		Aura_Color()
			AuraColor=input("Pick a color.") as color
			var/aura='Aura Normal.dmi'
			if(Race=="Demon" | Race=="Hybrid")
				Over=1
				aura='Aura Black Demonflame.dmi'
			if(Race=="Makyojin")
				Over=1
				aura='AuraKiia.dmi'
			aura+=AuraColor
			AURA=aura
			ssj4aura='Aura SSj4.dmi'
			ssj4aura+=AURA
		Blast_Color()
			alert("Now customize your blast color")
			blastR=input("Blast red") as num
			blastG=input("Blast green") as num
			blastB=input("Blast blue") as num
		Locate()
			if(Race=="Kai") loc=locate(62,314,16)
			else if(Race=="Android"|Race=="Bio-Android") loc=locate(67,308,8)
			else if(Race=="Spirit Doll"|Race=="Human"|Class=="Earth Halfie"|Race=="Quarter-Saiyan"|Race=="Majin")
				loc=locate(325,218,1)
			else if(Race=="Namekian"|Race=="Ancient Namek") loc=locate(167,303,3)
			else if(Race=="Tsufurujin") loc=locate(75,280,4)
			else if(Race=="Saiyan" | Class=="Vegeta Halfie") loc=locate(325,343,4)
			else if(Race=="Changeling") loc=locate(175,157,6)
			else if(Race=="Arconian") loc=locate(165,211,5)
			else if(Race=="Demon") loc=locate(66,321,17)
			else if(Race=="Hybrid") loc=locate(66,321,17)
			else if(Race=="Demi-God") loc=locate(62,314,16)
			else if(Race=="Makyojin") loc=locate(230,346,20)
mob/var/BodyType
mob/proc/BodyType()
	var/Choice=alert(src,"What type of body do you want?","","Medium","Small","Large")
	switch(Choice)
		if("Medium")
			Choice=alert(src,"Choosing Medium will leave your stats as they are, most males are this, although it is not uncommon for females as well, do you want this?","","Yes","No")
			switch(Choice)
				if("No") BodyType()
				if("Yes") BodyType="Medium"
		if("Small")
			Choice=alert(src,"Small will make you able to land hits easier, dodge easier, attack faster, run faster, heal faster, and recover energy faster, but you will take a -severe- cut in strength and endurance, this setting is modeled as a female archetype, do you want this?","","Yes","No")
			switch(Choice)
				if("No") BodyType()
				if("Yes")
					StrMod*=0.7
					EndMod*=0.7
					SpdMod*=1.5
					refire*=0.7
					orefire*=0.7
					HPRegen*=1.5
					KiRegen*=1.5
					BodyType="Small"
		if("Large")
			Choice=alert(src,"Large is like being a giant, far beyond any normal person in size. You will receive an insanely huge boost in Endurance, and a still insane but less boost to Strength, but you will attack slower, heal slower, recover energy slower, be easier to hit, and easier to dodge, do you want this?","","Yes","No")
			switch(Choice)
				if("No") BodyType()
				if("Yes")
					StrMod*=1.5
					EndMod*=2
					OffenseMod*=0.8
					DefenseMod*=0.8
					HPRegen*=0.7
					KiRegen*=0.7
					refire*=1.2
					orefire*=1.2
					BodyType="Large"
mob/var/elite=0
mob/proc/Elite() RecordPL*=5
/*Hai der rankyonesh! I'ma use dese comment tingys to tell ya what i'm doin with the stuffs n why I b doin it.
  Cuz every good codifier keeps good notenesses! First off i'm gonna be makin a new process so we can use the new codenesses!
  We'll do history first, because history was always borifyin! Firstnes I'm gonna declare the proc as a new list, which ima call
  'Historie' to make sure the list doesn't get confuzified with anythin already in dat codeness!*/

History
mob/History
mob/var/History
mob/proc/History()
	var/list/Historie=new/list
	Historie.Add("Average")
	Historie.Add("Amnesia")
	Historie.Add("Vagabond")
	if (Race=="Saiyan")
		Historie.Add("Dark Saiyan")
		Historie.Add("Energy Specialist")
	if (class=="Legendary")
		Historie.Add("Berserker")
		Historie.Add("Cold")
		Historie.Add("Tsufurujin Experiment")
	if (Class=="Elite")
		Historie.Add("Royalty")
		Historie.Add("Elite Defect")
		Historie.Add("Super-soldier")
		Historie.Add("Warrior Elite")
		Historie.Add("Attempted Ruler")
		Historie.Add("Different Upbringing")
		Historie.Add("War Academy Trainer")
		Historie.Add("Bodyguard")
		Historie.Add("Paragon")
		Historie.Add("Elite Assassin")
	if (Class=="Low-Class")
		Historie.Add("Wild Thing")
		Historie.Add("Slave Labour")
		Historie.Add("Minor Status")
		Historie.Add("Underdog")
		Historie.Add("Downtrodden")
		Historie.Add("Not so harsh")
		Historie.Add("Trash")
		Historie.Add("Rebel")
		Historie.Add("Soldier")
		Historie.Add("Doctore")
	if (Class=="Normal")
		Historie.Add("Noble")
		Historie.Add("Standing Out")
		Historie.Add("Background Color")
		Historie.Add("Between the Lines")
		Historie.Add("Somehow Oppressed")
		Historie.Add("Born Soldier")
		Historie.Add("Thug")
		Historie.Add("Ex Military")
		Historie.Add("Brawler")
	if (Race=="Demi-God")
		Historie.Add("Demi-God")
		Historie.Add("Guardian")
		Historie.Add("Demi Caretaker")
		Historie.Add("Asgardian")
		Historie.Add("Pantheon")
		Historie.Add("Channeler")
	if (Race=="Tsufurujin")
		Historie.Add("Less than a Lowie")
		Historie.Add("Technologic")
		Historie.Add("Tuffle Power!")
		Historie.Add("Magical Tuffle")
		Historie.Add("Damaged Goods")
	if (Race=="Human")
		Historie.Add("Capsule Degree")
		Historie.Add("Karate Kid")
		Historie.Add("School Jock")
		Historie.Add("Witchcraft and Wizardry")
		Historie.Add("Hunter by Lifestyle")
		Historie.Add("Bushido")
		Historie.Add("Ninja")
		Historie.Add("Bandit")
		Historie.Add("Street Rat")
		Historie.Add("Feral")
		Historie.Add("Warlord")
		Historie.Add("Cultist")
		Historie.Add("Super Hero")
	if (Race=="Demon")
		Historie.Add("Forged from Hell fire")
		Historie.Add("Survival Game")
		Historie.Add("Playing it Smarter")
		Historie.Add("Chaos Incarnate")
		Historie.Add("Greater Goal")
		Historie.Add("Primal")
		Historie.Add("Diabolically Insane")
		Historie.Add("Trickster")
		Historie.Add("Embodiment of Sin")
		Historie.Add("Sacred")
		Historie.Add("Lord of Pandemonium")
	if (Race=="Kai")
		Historie.Add("Universal Guardian")
		Historie.Add("Power of the Mind")
		Historie.Add("Mystical")
		Historie.Add("Caretaker")
		Historie.Add("Crusader")
		Historie.Add("Scholar")
		Historie.Add("Denizen Of The Light")
		Historie.Add("Despondent Kaio")
		Historie.Add("Ancient")
		Historie.Add("Judge")
	if (Race=="Android")
		Historie.Add("Bounty Hunter")
		Historie.Add("Project: Domination")
		Historie.Add("Biological Research")
		Historie.Add("Energy Experiment")
		Historie.Add("Upgrader")
		Historie.Add("Battledroid")
	if (Race=="Spirit Doll")
		Historie.Add("Combat Doll")
		Historie.Add("Revered")
		Historie.Add("Ki Specialist")
		Historie.Add("Pinocchio")
		Historie.Add("Spy")
		Historie.Add("Circus")
		Historie.Add("Drone")
	if (Race=="Namekian")
		Historie.Add("Warrior-type Namekian")
		Historie.Add("Dragon Clan Namekian")
		Historie.Add("Demon Clan Namekian")
		Historie.Add("Secluded Namekian")
	if (Race=="Changeling")
		Historie.Add("Born to Rule")
		Historie.Add("Seas run Red")
		Historie.Add("Sibling Issues")
		Historie.Add("Glacial Hunter")
		Historie.Add("Savage")
		Historie.Add("Exciled")
		Historie.Add("Scientific")
		Historie.Add("Runt")
		Historie.Add("Goon")
		Historie.Add("Frostdemon")
	if (Race=="Makyojin")
		Historie.Add("Cult Leader")
		Historie.Add("Sorcery")
		Historie.Add("Grunt")
		Historie.Add("Legacy")
		Historie.Add("Planetary Corrupter")
	if (Race=="Arconian")
		Historie.Add("Road of Loss")
		Historie.Add("One of a Kind")
		Historie.Add("Ancient Civilization")
		Historie.Add("Enforcer")
		Historie.Add("Separated")
		Historie.Add("TOKUSENTAI")
		Historie.Add("Fabulous")
		Historie.Add("Technomancer")
	if (Race=="Hybrid")
		Historie.Add("Special Spawn")
		Historie.Add("Overly aggressive")
		Historie.Add("Primitive")
		Historie.Add("Demi-Hunter")
		Historie.Add("Pure Evil")
		Historie.Add("Honorable Warrior")
		Historie.Add("Tactician")
	if (Race=="Bio-Android")
		Historie.Add("Perfect Specimen")
		Historie.Add("Failed Experiment")
		Historie.Add("Corrupt Data")
		Historie.Add("Voidling")
		Historie.Add("Evil Hunter")
	if (Race=="Majin")
		Historie.Add("Enslaved")
		Historie.Add("Bringer of the end")
		Historie.Add("Glutton")
		Historie.Add("Genetic Experiment")
	if (Race=="Ancient")
		Historie.Add("Salamander")
		Historie.Add("God of War")
		Historie.Add("Ancestor")
		Historie.Add("Keeper")
		Historie.Add("Observer")
	if (Race=="Ancient-Namekian")
		Historie.Add("Elder")
		Historie.Add("Scientist")
	if (Race=="Quarter-Saiyan")
		Historie.Add("Saiyan Heritage")
		Historie.Add("Academic")
		Historie.Add("Hidden Potential")
		Historie.Add("Ki Prodigy")
		Historie.Add("Treasure Hunter")
		Historie.Add("Ancient Bloodline")
		Historie.Add("Educated")
		Historie.Add("Enhanced")
	if (Race=="Half-Saiyan")
		Historie.Add("Best Of Both Worlds")
	if (Class=="Vegeta-Halfie")
		Historie.Add("Elite")
		Historie.Add("Living Weapon")
		Historie.Add("Royal Descendant")
		Historie.Add("Superior")
		Historie.Add("Half Blood Resentment Saiyan")
	if (Class=="Earth-Halfie")
		Historie.Add("Cursed")
		Historie.Add("Reluctant Scientist")
		Historie.Add("Centered")
		Historie.Add("Ki Prodigy")
		Historie.Add("Half Blood Resentment Human")




		switch(input("What kind of backstory does your character have, or best fits your character as the case may be?","",text) in History)
			if("Average")
				History="Average"
				var/Choice=alert(src,"An Average background means your character has lived the ordinary sort of life for a character of your race. It went to school where it probably had average grades, it's parents are still alive where applicable, and there was overall nothing really special about the way the character grew up. Is this the type of History you want? ","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes") usr<<"Congratulations, Average character! You've chosen the Jack of all paths!"
		    if("Amnesia")
			    History="Amnesia"
				var/Choice=alert(src,"Due to some freak accident, experiment or otherwise unknown cause you do not recall who you are, where you come from and maybe even not -what- you are. You know face the challenges of rediscovering your old identity or forging a new one without any knowledge of the world around you or who you can or cannot trust. (You do need to pick a name at character creation, regardless of you rping that you don't know your name or not).")
				switch (Choice)
					if("No") History()
					if("Yes")
						zenni+=rand(50,8000)
						EndMod*=rand(80,110)/100
						StrMod*=rand(80,110)/100
						SpdMod*=rand(80,110)/100
						PowMod*=rand(80,110)/100
						ResMod*=rand(80,110)/100
						OffMod*=rand(80,110)/100
						DefMod*=rand(80,110)/100
			if ("Vagabond")
				History="Vagabond"
				var/Choice=alert(src, "You have trouble staying in one place for a long time, preferring to travel from place to place or even planet to planet if you can. Perhaps you're trying to prevent yourself from getting to tied to a place or perhaps you're trying to run from your past, either way people like you tend to prefer being secluded though you might seek out company every now and then for the sake of variation.")
				switch (Choice)
					if("No") History()
					if("Yes")
						SparMod*=0.7
						TrainMod*=1.2
						MedMod*=1.2
						EndMod*=1.2
			if("Dark Saiyan")
				History="Dark Saiyan"
				var/Choice=alert(src,"These are the saiyans that aren't so good. They're set up to be evil, conniving, the type that doesn't tend to make friends and kills without mercy. They tend to have dark, defining pasts that morph their psyche in ways that prepare them for a life of evil. That's not to say they can't repent eventually, just that it's unlikely. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.35
						ResMod*=1.25
						SpdMod*=1.25
						StrMod*=1.35
						SparMod*=1.25
						TrainMod*=1.25
						OffenseMod*=1.25
						DefenseMod*=1.25
						PowMod*=0.75
						KiMod*=0.75
			if("Energy Specialist")
				History="Energy Specialist"
				var/Choice=alert(src,"You specialize in Energy rather than brute force, go figure. Your character tended to avoid getting into brawls and instead focused on Energy and how to manipulate it. This makes them terrible physical combatants despite their Saiyan Heritage, but excellent in the use of ki. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.6
						StrMod*=0.6
						SpdMod*=0.8
						OffenseMod*=0.8
						DefenseMod*=0.8
						PowMod*=1.5
						ResMod*=1.3
						HPRegen*=0.5
						KiRegen*=1.5
						KiMod*=1.75
						techmod*=0.5
						contents+=new/obj/KiAttacks/Basic
			if("Berserker")
				History="Berserker"
				var/Choice=alert(src, "Good old fashioned classic Broly, basically, you're bat shit crazy.  You're pretty introvert and controlled in your base state, once your anger triggers though and you go super saiyan all sanity and restraint are out the window. Due to having more power then you can possibly control odds are you'll end up blowing yourself and the planet you're standing on up sooner then that you'll tire out and revert.")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=1.2
						EndMod*=1.2
						PowMod*=0.7
			if("Cold")
				History="Cold"
				var/Choice=alert(src, "A truly fear inspiring sight, this history is a completely different kind of crazy. Your base form is in perfect control, seemingly a normal saiyan for all means if somewhat powerful, once you transform however you turn into a cold hearted killer, you lose all emotion and interest in others or your personal history with them, instead focusing your full might on crushing each and everyone with devastating intent. Instead of going berserk you regain full control of your actions and power, but due to the massive personality difference once transformed there is simply no reasoning with you, no memories that can be summoned to calm you down, you -want- this to happen, you are the perfect warrior, cold and ruthless, you are the legendary super saiyan.")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.2
						 ResMod*=1.2
						DefMod*=1.2
						PowMod*=0.8
						StrMod*=0.8
			If("Tsufurujin Experiment")
			  History="Tsufurujin Experiment"
			  var/Choice=Alert(src, "As a new born baby you were taken away by tsufurujin scientists and experimented upon, their goal was to mold you into a perfect weapon for them to use against the saiyan race. However what they made was to powerful to control, you broke free and started destroying everything in sight, as a result of their experimentation you're able to transform into a super saiyan, effectively making you an 'artificial lssj' in the sense that you were made/altered to become one rather then being born as such.")
			  switch(Choice)
			        if("No") History()
					if("Yes")
					   EndMod*=0.7
					   ResMod*=0.7
					   StrMod*=1.2
					   PowMod*=1.2
					   OffMod*=1.2
					   SsjAdd= 20000000
			if("Royalty")
				History="Royalty"
				var/Choice=alert(src,"Your elite saiyan was born into a royal family- be they the king and queen themselves or a member of the higher court. This naturally comes with luxuries that other Saiyans can only dream of, access to advanced training methods that may counteract the pampering, and wealth that is the stuff of legend. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.15
						StrMod*=0.85
						zenni+=rand(2500,15000)
						SparMod*=0.8
		    if("Elite Defect")
				History="Elite Defect"
				var/Choice=alert(src,"Vegeta isn't Sparta, so occasionally this tends to happen: Your elite saiyan was born with a defect that has defined his/her life since they were born. Be they blind, mute, deaf, paraplegic, or even in some cases minor things such as colour blindness and dyslexia- they are usually treated like Low class Saiyans or in extreme cases, Tuffles, or ignored outright. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.25
						DefenseMod*=1.25
						OffenseMod*=0.8
						PowMod*=0.65
						ResMod*=0.75
						KiMod*=1.1
						SparMod*=1.5
			if("Super-soldier")
				History="Super-soldier"
				var/Choice=alert(src,"Occasionally Vegeta is in need of a soldier beyond the others. In such circumstances an individual is trained in combat from birth. It isn't an easy life whatsoever, but the lifestyle gives the trainee immense combat ability though they are usually extremely lacking in social ability and hence loners. They are 'built to serve' usually and almost never seek positions of power outside the life of a soldier. Is this the history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						OffenseMod*=1.2
						DefenseMod*=1.2
						SpdMod*=1.15
						StrMod*=1.15
						EndMod*=0.75
						StrMod*=0.85
						SparMod*=0.85
			if("Warrior Elite")
				History="Warrior Elite"
				var/Choice=alert(src,"The traditional Elite warrior- raised to fight and be strong on the concepts of saiyan pride. They usually have a knack for combat though their pride tends to get in their way of proper social interactions. Is this the history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.15
						StrMod*=1.15
						TrainMod*=1.15
						SparMod*=0.85
						ZenkaiMod*=1.1
						MedMod*=0.75
			if("Attempted Ruler")
				History="Attempted Ruler"
				var/Choice=alert(src,"You are the Elite who always had his eyes on the throne, if not higher. The one who spent their life from the moment they could talk looking for support so they could gain positions of increasingly higher status. Your social skills are rivalled only by your lust for control. You prefer to spend your time plotting and scheming rather than fighting, though you're quite capable of physical combat when necessary. Is this the history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						zenni+=rand(1000,5000)
						MedMod*=1.5
						StrMod*=0.85
			if("Different Upbringing")
				History="Different Upbringing"
				var/Choice=alert(src,"Your upbringing was... different from most. Whether you were raised by a family of lower-class saiyans for some reason, or your parents just didn't take the time to notice you were even alive, you grew up without the superiority complex. As a result you tend to train better with others and are generally stronger for it. Is this the history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						DefenseMod*=1.1
						SparMod*=1.25
						TrainMod*=0.75
						PowMod*=0.9
						ResMod*=0.8
						ZenkaiMod*=1.25
			if("War Academy Trainer")
				History="War Academy Trainer"
				var/Choice=alert(src,"Your job is to whip the saiyans into shape for combat, training them at a young age to fighting shape and you're good at your job. With your elite power it's your pleasure to personally train young elites and some upstanding normal class saiyans, you don't waste your time on low class saiyans though, they're a lost cause as far as you're concerned any who.")
	            switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.3
						DefMod*=1.3
						PowMod*=0.7
						HPregen*=0.7
						SparMod*=1.3

		    if("Bodyguard")
			   History="Bodyguard"
			   var/Choice=alert(src,"A saiyan elite is as powerful as a saiyan can get, due to that the king, queen or any person of interest is more then interested in hiring you to protect either themselves or someone for them. Due to your job you don't have as much time to train, being ever vigilant for potential threats for your employer, after all if that person dies you don't get paid.")
	           switch(Choice)
			       if("No") History()
				   if("Yes")
				      TrainMod*0.7
					  StrMod*=0.7
					  PowMod*=0.7
					  EndMod*=1.3
					  ResMod*=1.3
					  DefMod*=1.3
					  HPregen*=1.2
			if("Paragon")
			   History="Paragon"
			   var/Choice=alert(src,"You are a powerful warrior, bound by pride and honour to do what you consider right. You're the type of warrior that would lower his power in a serious fight just to give the opponent a fair chance; making the fight more interesting for yourself in the process. You still consider low and normal class saiyans beneath you and prefer not to waste time on them, when you're forced to however you try to take them atleast somewhat serious.")
	           switch(Choice)
			       if("No") History()
				   if("Yes")
				      EndMod*=1.2
					  ResMod*=1.2
					  DefMod*=1.2
					  PowMod*=0.7
					  KiMod*=0.7
		    if("Elite Assassin")
			   History="Elite Assassin"
			   var/Choice=alert(src,"You have been trained by the best of the best, molded into the perfect stealth killing machine. Your rigorous training started at birth and had tempered your spirit, your life is lived in service of the crown. Due to this you have no ambition to obtain the crown whatsoever (at least not starting out), instead your goals are aimed to be the most use you can be to your king/queen. Your liege often made use of your services by sending you out to assassinate those who would pose a threat to his rule, or perhaps even rulers of different countries or worlds.")
			   switch(Choice)
	               if("No") History()
				   if("Yes")
				      StrMod*=1.3
					  OffMod*=1.3
					  SpdMod*=1.3
					  PowMod*=0.6
					  ResMod*=0.6
					  DefMod*=0.6
		    if("Wild Thing")
				History="Wild Thing"
				var/Choice=alert(src,"Wild thing! You make my heart sing~! Sometimes a Low-class saiyan is discarded or misplaced. Left to fend for itself in the wild as a baby. Sometimes they manage to survive on their own (miraculously). Other times they are taken in by animals and raised by them. Either way there's no doubting the power of a feral Saiyan. I don't think I need to mention that their english may not be too good. Is this the history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.15
						ResMod*=0.5
						PowMod*=1.15
						SpdMod*=1.15
						DefenseMod*=1.2
						OffenseMod*=0.75
						StrMod*=1.15
			if("Slave Labour")
				History="Slave Labour"
				var/Choice=alert(src,"Some Low-class saiyans are treated even less than others: treated as slaves or pets or servants without benefits. These Saiyans usually have the most bone to pick with the upper classes, though they are usually malnourished. They make up for this lack of strength with fairly good dexterity. Is this the history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.85
						StrMod*=0.85
						ResMod*=1.1
						SpdMod*=1.3
						OffenseMod*=1.25
						HPRegen*=1.1
						KiRegen*=1.1
						zenni=0
						techmod*=1.25
			if("Minor Status")
				History="Minor Status"
				var/Choice=alert(src,"You or your family have somehow managed to attain minor status in the world of saiyans despite your class. Be it for generations of loyal service to the ruler, friendship with a noble or otherwise, you are one of the few low-class saiyans who got to enjoy the luxuries of a moderately wealthy lifestyle. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.95
						StrMod*=0.95
						ResMod*=1.1
						zenni+=rand(500,7500)
			if("Underdog")
				History="Underdog"
				var/Choice=alert(src,"Everyone loves an underdog. Your entire life you were constantly told you would fail at whatever you did because of your class, and yet you somehow always managed to pull out (if not victorious) with your dignity intact. This defined your early life to the point where perhaps despite being put down you have more confidence in yourself. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.2
						StrMod*=1.2
						SpdMod*=1.2
						OffenseMod*=0.9
						DefenseMod*=0.9
						TrainMod*=1.2
						HPRegen*=0.85
						KiMod*=0.95
			if("Downtrodden")
				History="Downtrodden"
				var/Choice=alert(src,"Unlike your traditional Underdog you weren't quite so successful when people told you you would fail. In fact you usually did fail exactly like they said you would. This type of backstory can lead to severe confidence issues. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.1
						StrMod*=1.1
						SpdMod*=1.1
						TrainMod*=1.1
						HPRegen*=0.9
						KiMod*=0.9
			if("Not so harsh")
				History="Not so harsh"
				var/Choice=alert(src,"Compared to the other member of your class you got off easy. You may not have been treated like royalty, but you avoided the more brutal histories that tend to encircle your class. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.85
						ResMod*=0.95
						DefenseMod*=0.75
						StrMod*=1.1
						PowMod*=1.3
						MedMod*=1.2
						KiMod*=1.35
			if("Trash")
				History="Trash"
				var/Choice=alert(src,"If you thought things were bad when Elites wind up with a defect, imagine what it's like for the class that is already treated like garbage. Because you were mute or deaf or whatever have you, your character was treated like absolute scum even by members of your own class. Naturally this can be very traumatizing, but on the bright side you tend to get used to the beatings. Usually. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.5
						DefenseMod*=1.4
						SpdMod*=1.1
						OffenseMod*=0.85
						TrainMod*=0.95
						HPRegen*=0.5
			if("Rebel")
			   History="Rebel"
			   var/Choice=alert(src,"You have high ambitions, most people would call you an idiot for even thinking of the dreams you have let alone taking steps to making them happen. You serve the saiyan king/queen like just about every other saiyan, but in secret you hope that one day you'll be able to overthrow his/her regime and usher in a new age for the saiyan race. Untill that day though, you bide your time...")
			   switch(Choice)
			        if("No") History()
					if("Yes")
					   PowMod*=1.2
					   EndMod*=1.2
					   SpdMod*=1.2
					   StrMod*=0.9
					   ResMod*=0.9
					   KiRegen*=1.3
			if("Soldier")
			   History="Soldier"
			   var/Choice=alert(src,"You're a soldier in the saiyan army, mostly you do grunt work but on rare occasions you get put on riskier missions. Most people would consider those moments to be suicidal but you see it as a chance to shine and prove your worth as a full fledged saiyan warrior."
			   switch(Choice)
			       if("No") History()
				   if("Yes")
				       StrMod*=1.1
					   EndMod*=1.1
					   OffMod*=1.1
					   ResMod*=0.9
					   SpdMod*=0.9
			if("Doctore")
			   History="Doctore"
			   var/Choice=alert(src,"Like the ancient trainers of gladiators on earth, you train your fellow saiyans. Even low class saiyans need some guidance from time to time, with the academy instructors busy catering to the elites and normal class saiyans you get stuck with the bottom of the barrel, teaching inexperienced low class warriors what they need to know to survive as long as you have.")
			   switch(Choice)
			       if("No") History()
				   if("Yes")
				       EndMod*=1.2
					   ResMod*=1.2
					   DefMod*=1.1
					   HPRegen*=0.7
					   SpdMod*=0.7
	        if("Noble")
				History="Noble"
				var/Choice=alert(src,"Slightly under the Royalty Elites can achieve, your family is in the upper-middle chaste as it were, and you gain all the benefits (and detriments) of a lavish lifestyle from birth including being taught you were better than everyone else. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						SparMod*=0.9
						zenni+=rand(2500,10000)
			if("Standing Out")
				History="Standing Out"
				var/Choice=alert(src,"In a class that usually involves backing up whatever Elites say in exchange for being treated like actual people, you somehow managed to stand out. Whether it was by going against the stream or taking on the properties of the elite, you drew attention to yourself even from behind the mask of mediocrity. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						MaxAnger*=1.25
						GravMod*=0.75
						ZenkaiMod*=1.2
						KiMod*=1.2
						techmod*=1.25
						UPMod*=1.5
			if("Background Color")
				History="Background Color"
				var/Choice=alert(src,"Utilizing your position as middle-chaste you were one of those people who somehow managed to blend into the background. You didn't really get noticed by people and as a result you didn't tend to make many friends. Even your teachers sometimes blinked and asked who you were, which comes with advantages and disadvantages. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						ResMod*=0.8
						StrMod*=0.9
						MedMod*=1.2
						TrainMod*=1.2
			if("Between the Lines")
				History="Between the Lines"
				var/Choice=alert(src,"Your early life was defined by the social differences between Elites and Low-class saiyans. As a normal-saiyan you got a unique outside-looking-in perspective on the matter which enabled you to draw your own conclusions. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.25
						StrMod*=0.95
						ResMod*=1.25
						KiMod*=0.9
			if("Somehow Oppressed")
				History="Somehow Oppressed"
				var/Choice=alert(src,"For whatever reason you were one of the normies who lived their life around elites who weren't so distinctive about low and normal class. In fact to them the normal class didn't even exist. As a result you may have been a bit more downtrodden than the rest of your class and tend to associate more with low-class saiyans than normies or elites. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.3
						StrMod*=1.1
						SpdMod*=0.75
			if("Born Soldier")
				History="Born Soldier"
				var/Choice=alert(src,"Normal-class saiyans tend to make excellent soldiers- they're weaker than elites so that they follow orders, and strong enough to keep the low-class saiyans in check. As a result it's popular to raise them to be soldiers- it tends to come with a bit of social pull and is the only saiyan career worth mentioning. Not that other Saiyans aren't soldiers- just these particular Normies tend to specialize. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.15
						StrMod*=1.15
						SpdMod*=1.15
						TrainMod*=1.1
						SparMod*=0.9
			if("Thug")
			   History="Thug"
			   var/Choice=alert(src,"You're a saiyan criminal, deciding that you only look after #1, yourself. To avoid trouble with the saiyan elites odds are you teamed up with several other thugs and serve a renegade elite for as long as it benefits you. You don't mind operating in a group, bullying others and taking what you want comes pretty natural to you. You don't enjoy being ordered around however, which was probably a major factor that led to you ending up as a thug.")
			   switch(Choice)
			       if("No") History()
				   if("Yes")
				      StrMod*=1.2
					  EndMod*=1.2
					  PowMod*=0.8
					  ResMod*=0.8
					  Off=50
					  Def=50
					  Bounty=Rand(5000,10000)
			if("Ex Military")
			   History="Ex Military"
				var/Choice=alert(src,"You used to be a proud part and probably high ranking part of the saiyan military, however either due to an event you were dishonourably discharged, stripping you of your rank and influence. What actually happened is up to you, perhaps you disobeyed an order, got framed by an ambitious soldier that wanted your rank or simply made a bad call resulting in the loss of life of many saiyan warriors under your command. Whatever the reason however the discharge has made you bitter over the years, you wish nothing more then to clear your name or get even.")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=1.2
						PowMod*=1.2
						ResMod*=1.2
						EndMod*=0.8
						SpdMod*=0.8
						OffMod*=0.8
						DefMod*=1.1
						HPRegen*=0.9
						KIRegen*=0.9
			if("Brawler")
				History="Brawler"
				var/Choice=alert(src,"Most saiyans join the army and go out on missions to sate their lust for combat and violence, you however have found a more..financially sound way to scratch that particular itch. Your home is the ring, fighting opponents in winner take all tournaments that get hosted for the enjoyment of the spectators. Due to all your fights being in the ring you have a pretty good fighting style, unfortunately however the world is a lot bigger then the ring and you're not used to the different terrains and the effects they bring, but as a fighter in the ring that hardly matters.")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=1.3
						EndMod*=1.3
						ResMod*=1.3
						PowMod*=0.6
						OffMod*=0.6
						DefMod*=0.6
						Off=80
						Def=80
			if("Demi-God")
				History="Demi-God"
				var/Choice=alert(src,"You are the offspring of a god, however many times removed. You could be the son of Zeus or the great, great, great, great granddaughter of Heracles. Either way, you posses the powers of a God and all the benefits that come with it. You generally don't fit in with a modern environment due to your mystical traits (which can include glowing skin in addition to super strength). Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						PowMod*=1.3
						ResMod*=1.5
						StrMod*=0.8
						EndMod*=0.8
						KiMod*=1.3
			if("Guardian")
			    History="Guardian"
				var/Choice=alert(src,"You are a protector of the Heavens, an enforcer of the kaios. You've spent your life in service of the Heavens and pride yourself on your service. No day passes where you are not prepared to lay down your life for all that is good and to keep the souls in Heaven safe."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						SpdMod*=1.2
						EndMod*=0.8
						ResMod*=0.8
			if("Demi Caretaker")
			    History="Demi Caretaker"
				var/Choice=alert(src,"Unlike your brothers and sisters you did not partake in combat training, nor did you show interest in it. Perhaps this was because you don't enjoy fighting, or perhaps you're simply not good at it. Because of this you decided to make yourself useful in other ways, now assisting the kaios and souls in heaven by taking care of structures, services or perhaps even by inventing things from time to time."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=0.5
						EndMod*=0.5
						TechMod*=3
			if("Asgardian")
			    History="Asgardian"
				var/Choice=alert(src,"Your idea of fighting Evil is filled with enjoyment and friendship, brawling over something as small as a mug of ale is as natural to you as it is to shake a hand upon meeting someone for the first time. Because of your manners and habits many of the tales of old norse myth on Earth are based on your kind and though you never met the likes of 'Odin, Thor, Loki and all of them' you'd be sure all you would get along splendidly over a good old fashioned brawling session.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.3
						EndMod*=1.3
						OffMod*=1.3
						PowMod*=0.7
						ResMod*=0.7
						DefMod*=0.7
			If("Pantheon")
			    History="Pantheon"
				var/Choice=alert(src,"You served the forces of good by aligning yourself with a pantheon, declaring yourself things like 'the living embodiment of Zeus' thunder' or 'Thors Hammer' while you were fighting evil in the living realm. Now you have joined the kaios in the afterlife, securing Heaven together with the Guardians and Asgardians and fighting the forces of evil when they get out of hand."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						OffMod*=1.2
						SpdMod*=0.8
						DefMod*=0.8
			if("Channeller")
			    History="Channeller"
				var/Choice=alert(src,"You act as an instrument through which your god acts, due to this you have access to great power though it is inconsistent at best, your god helping you whenever it feels like it. The divine energy has eroded your body somewhat over time, leaving you physically weaker then the average demigod. Fortunately for you your god has provided you with a far greater reserve of energy to tap into.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=2
						ResMod*=2
						StrMod*=0.5
						EndMod*=0.5
						Kinxt=20
						Kinxtadd=0

			if("Less than a Lowie")
				History="Less than a Lowie"
				var/Choice=alert(src,"Tuffles are the lowest chaste on Vegeta by a long shot. This traditionally leads to a lot of physical abuse for the tuffles in question. Those with this backstory got an even shorter end of this stick than normal and were usually brutalized from an early age. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.3
						SparMod*=1.5
						SpdMod*=1.3
						TrainMod*=1.2
						DefenseMod*=1.15
						PowMod*=0.5
						ResMod*=0.75
			if("Technologic")
				History="Technologic"
				var/Choice=alert(src,"Buy it, use it, break it, fix it, trash it, change it, mail - upgrade it. Your character was raised around technology to the point where their technology is practically an extension of themselves. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.65
						ResMod*=0.8
						SpdMod*=0.8
						StrMod*=0.65
						OffenseMod*=0.65
						DefenseMod*=0.65
						PowMod*=0.65
						techmod*=2.5
			if("Tuffle Power!")
				History="Tuffe Power!"
				var/Choice=alert(src,"As hard as it is to believe your character was raised away from technology. Why? To be a warrior of course. Rather than build spaceships this character is destined to clash swords with saiyans and fear nothing. They are rare, but considered a necessary development since the enslavement of the tuffles. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.4
						StrMod*=1.3
						SpdMod*=1.2
						TrainMod*=1.4
						DefenseMod*=1.2
						ResMod*=0.8
						PowMod*=0.8
						techmod*=0.75
						HPRegen*=1.25
			if("Magical Tuffle")
				History="Magical Tuffle"
				var/Choice=alert(src,"Technology? Why spend time working with that when you're fairly sure there's a way to do with it ki? This is the tinkerer race turned wizard- studying volumes about ki-flow rather than technical manuals. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						PowMod*=1.35
						refire*=0.8
						orefire*=0.8
						ResMod*=1.3
						SpdMod*=0.8
						DefenseMod*=0.8
						StrMod*=0.8
						EndMod*=0.8
						OffenseMod*=0.5
						techmod*=0.75
						HPRegen*=0.5
						KiMod*=1.4
						kimanipmod*=1.25
						TrainMod*=0.75
						SparMod*=0.75
						MedMod*=1.5
			if("Damaged Goods")
			    History="Damaged Goods"
				var/Choice=alert(src,"A genius? Sure, all tsufurujin are, but something in your past has warped your mind. Be it brain-damage or some past trauma, you can't focus as well on your technical skills as well as your brethren, your interests frequently drifted to other things.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=0.4
						KiManipmod*=1.6

			if("Capsule Degree")
				History="Capsule Degree"
				var/Choice=alert(src,"You got the best education money can buy at capsule corp: this gives you extraordinary ability with tech and the know-how to use it. However, the athletics program appears to still be lacking... is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.85
						ResMod*=0.85
						SpdMod*=0.85
						StrMod*=0.85
						OffenseMod*=0.85
						DefenseMod*=0.85
						PowMod*=0.85
						techmod*=1.5
			if("Karate Kid")
				History="Karate Kid"
				var/Choice=alert(src,"You took to martial arts like Ninjas take to shadows. You were the kid on your block who could take down every bully in the city simultaneously without breaking a sweat. Your grades may have suffered due to your devotion, but there was no doubt in anyone's mind that you could do something with this kind of talent. Is this the kind of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						ResMod*=0.75
						PowMod*=0.75
						techmod*=0.5
						SpdMod*=1.3
						OffenseMod*=1.15
						DefenseMod*=1.15
						HPRegen*=1.1
						KiMod*=0.85
			if("School Jock")
				History="School Jock"
				var/Choice=alert(src,"You had an otherwise normal early life save for picking up sports at a young age. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						SpdMod*=1.15
						OffenseMod*=1.15
						StrMod*=1.15
						PowMod*=0.85
			if("Witchcraft and Wizardry")
				History="Witchcraft and Wizardry"
				var/Choice=alert(src,"Dear Mr. Potter, we are pleased to inform you... Yeah, it's already becoming a cliché, but rather than focus on athletics at your local high school, you took a different elective: Sorcery. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						PowMod*=1.3
						ResMod*=1.3
						KiMod*=1.5
						EndMod*=0.8
						SpdMod*=0.8
						DefenseMod*=0.8
						StrMod*=0.8
						KiManipmod*=1.25
			if("Hunter by Lifestyle")
				History="Hunter by Lifestyle"
				var/Choice=alert(src,"Some people have crazy parents. Crazy parents who take them out into the woods under the age of four and teach them how to survive. Usually Military Style, but naturally this can happen with a red neck family too. Or someone who feels their family is being hunted by something rather nasty. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=1.35
						EndMod*=1.35
						HPRegen*=1.2
						PowMod*=0.5
						TrainMod*=1.3
						SparMod*=1.2
						MedMod*=0.75
			if("Bushido")
			    History="Bushido"
				var/Choice=alert(src,"The way of the warrior - You were trained and raised following a strict code of honour, wisdom and serenity. Due to your upbringing you may be serving under the president as a bodyguard, or perhaps you took what you have learned and became a stealthy ninja, dedicated to infiltrate and take down enemies before they become a threat. Though often considered the most dangerous are the 'fallen' Ronin, Warriors who have trained in the way of Bushido but have turned away from its teachings, betraying their masters or turning their back on the moral teachings, no longer bound by the rules of engagement these fallen warriors pose an even greater threat as they no longer have anything to lose.")
				switch(Choice)
				    if("No") History()
					if("Yes")
						EndMod*=1.2
						SpdMod*=1.2
						HPRegen*=0.9
						KIRegen*=0.9
			if("Ninja")
			    History="Ninja"
				var/Choice=alert(src,"The hidden blade is often the deadliest one. - Fast, deadly and unseen. You were trained in the arts of ninjitsu, subterfuge, assassination and infiltration. There are but few people who have an as flexible skill set as you do. Due to your intensive training from childbirth you have an unshakeable set of rules you stick to, unless you have of course gone rogue. Due to the extensive training you've become an opponent to be feared in any form of combat, but has left you fragile and stubborn when it comes to scientific advances.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						PowMod*=1.2
						SpdMod*=1.2
						EndMod*=0.7
						ResMod*=0.7
						TechMod*=0.5
			if("Bandit")
			    History="Bandit"
				var/Choice=alert(src,"You are a bandit, lurking in the shadows, waiting for unsuspecting victims to ambush and rob. Or perhaps you used to be a bandit and are now attempting to clear your name, regardless your history has put you at odds with the law.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    Bounty=Rand(1000,10000)
						StrMod*=1.2
						OffMod*=1.2
						ResMod*=0.8
						PowMod*=0.8
			if("Street rat")
	        	History="Street Rat"
				var/Choice=alert(src,"You had no parents to take care of you, no education to fall back on, you are a mere thief. Having spent your life on the street has made you tough, you learned not to count on anyone but yourself and have become pretty efficient at it, taking what you need to survive. A favourite catchphrase of you is "I only steal what I can't afford, unfortunately that's everything."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.2
						DefMod*=1.2
						StrMod*=0.8
						EndMod*=0.8
			if("Feral")
			    History="Feral"
				var/Choice=alert(src,"You were born in the wild, you're not sure how you got there but you've lived in the wild almost your entire life. Recently you've been discovered and brought to the 'civilized' world. What strange wonders will you encounter, will you be able to comprehend what you see? One way to find out.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						EndMod*=1.2
						ResMod*=1.2
						PowMod*=0.5
						HPRegen*=1.3
			if("Warlord")
			    History="Warlord"
				var/Choice=alert(src,"You are a self proclaimed ruler, annexing territory under your rule and subjugate those who dare stand in your way. You're most likely to get followers to fight for you though you more then likely prefer dominating your opponents personally.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.4
						OffMod*=1.4
						PowMod*=0.7
						HPRegen*=0.7
			if("Cultist")
			    History="Cultist"
				var/Choice=alert(src,"A worshipper of mysterious and often infernal arts, you try to communicate with the afterlife in an attempt to gain their guidance, more often then not with demons in an attempt to gain more personal power.")
				switch(Choice)
				    if("No")
					if("Yes")
					    PowMod*=1.3
						EndMod*=0.7
						ResMod*=0.7
						StrMod*=0.7
			if("Super Hero")
			    History="Super Hero"
				var/Choice=alert(src,"A brightly coloured cape, tight spandex suit and the obligatory underwear over your wants; a brief description of how you look in your costume. You are a super hero, be it self proclaimed or acknowledged by the world, and do your best to defend those in need. Your heroic poses are sure to strike fear into your enemies!")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    Y-no I cant code this one sry.

		    if("Forged from Hell fire")
				History="Forged from Hell fire"
				var/Choice=alert(src,"You are forged from the wicked flames of hell to be a ruthless killer, and that's exactly what you plan to do. A living embodiment of punishment, you're fairly certain you once ripped a guy's throat out for littering. You were born and raised to carry out the will of hell and the one who rules it. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.25
						StrMod*=1.25
						DefenseMod*=0.7
			if("Survival Game")
				History="Survival Game"
				var/Choice=alert(src,"Forget duty and intelligence. You've been in the Game to survive by any means necessary. Kaios offer you a deal to live in safety for the rest of eternity? Odds are you'll take it. Save a kid from being hit by a train to get in good with his strong parents? Sure thing. You're defined not so much by your morals as you are being raised to survive at any cost thanks to the harsh environment of Hell. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.5
						DefenseMod*=1.3
						StrMod*=0.6
						SpdMod*=1.3
						PowMod*=0.6
			if("Playing it Smarter")
				History="Playing it Smarter"
				var/Choice=alert(src,"Rather than allow yourself to submit to the low intelligence and 'wild side' of the rest of your species, you've been playing it smarter since day one. You can trick a mortal out of his soul over the course of a single deal and even get yourself out of doing anything within the deal itself. You're Mephisto, the man (or in this case Demon) with the plan, though you have unfortunately sacrificed a bit of physical prowess in return. While you may think this is more of a personality, it has enough of an influence on history in Hell to stand here as well.  Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=0.8
						EndMod*=0.8
						ResMod*=0.8
						SpdMod*=1.3
						PowMod*=1.2
						techmod*=1.25
			if("Chaos Incarnate")
			    History="Chaos Incarnate"
				var/Choice=alert(src,"You are chaos incarnate, the balance between good and evil and life and death is but a toy for you to manipulate and disrupt for your personal amusement, of course you are completely unpredictable; you could be tearing down the balance one moment then drinking a cup of tea the next for no apparent reason other then feeling like it.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=rand(80,120)/100
						EndMod*=rand(80,120)/100
						SpdMod*=rand(80,120)/100
						PowMod*=rand(80,120)/100
						ResMod*=rand(80,120)/100
						OffMod*=rand(80,120)/100
						DefMod*=rand(80,120)/100
			if("Greater Goal")
			    History="Greater Goal"
				var/Choice=alert(src,"Let your puny fellow demons cause chaos in the living realm or run around in the afterlife, you have bigger things to tend to. You were born or created for no other reason then furthering the cause of the greater evil. Every move you make is to to further that goal, you are quite literally the embodiment of true classic evil.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=1.3
						ResMod*=1.3
						StrMod*=0.7
						EndMod*=0.7
			if("Primal")
	            History="Primal"
	            var/Choice=alert(src,"You are a wild demonic beast, incapable of rational thought or basic communication. Perhaps as you grow older and more powerful you'll develop at least some lower level of these basic abilities but your savage nature and feral instinct will always be a distinct trait of yours."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.3
						OffMod*=1.3
						PowMod*=0.6
						TechMod*=0.5
			if("Diabolically Insane")
	            History="Diabolically Insane")
				var/Choice=alert(src,"There is a fine line between brilliance and insanity, most often so fine its hard to see on which side a gifted person such as yourself resides. In your case however, it's pretty obvious. You're crazy, coocoo for cocoa puffs, completely and utterly insane. And yet, for all you're insanity, you produce brilliance, dangerous, lethal, brilliance. There is a distinct method in your chaos that only you can see, assuming you even see it at all. The only thing that everyone knows for sure is this: "You never fail to invent some new horrible device or experiment to test out on new souls.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=1.5
						EndMod*=0.8
						StrMod*=0.8
			if("Trickster")
	            History="Trickster"
				var/Choice=alert(src,"When it comes to demons you're fairly innocent as far as pillaging and murdering goes. You prefer a much more entertaining side of being evil, sending heroes on a goose chase or luring them into a trap while they think you're helping them. You use your wits and cunning to entertain yourself, almost exclusively at the expense of others."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.2
						DefMod*=1.2
						StrMod*=0.7
						PowMod*=0.7
			if("Embodiment of Sin")
			    History="Embodiment of Sin")
				var/Choice=alert(src"You are the physical embodiment of one of the seven deadly sins; Lust, Gluttony, Greed, Sloth, Wrath, Envy and Pride. Your mere presence tends to be enough to make the particular sin you represent rise up in the mortals around you, making them easy for you to manipulate, control and predict. Your major goal is to corrupt souls to sin so they get sent to Hell when they die.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.3
						ResMod*=1.3
						SpdMod*=0.6
			if("Sacred")
	            History="Sacred"
				var/Choice=alert(src,"You stand apart from your demon brothers and sisters, for your evil is of a whole other caliber. People worship you in the living realm, asking you to fulfill their selfish wishes like wealth or revenge. This is one of the more likely histories of a demon to go for Demon Lord."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.5
						PowMod*=1.5
						EndMod*=0.5
						ResMod*=0.5
						OffMod*=1.4
			If("Lord of Pandemonium")
			    History="Lord of Pandemonium"
				var/Choice=alert(src"Many demons claim to be a lord of demons, but when it comes to becoming the Lord of Pandemonium many try, but only one can succeed. The Lord of Pandemonium is a self proclaimed leader of demons, leading an army of a hundred demons to the living realm to cause havoc and destruction. Keep in mind that with this history odds are you are just but one of many aspiring to become the true lord of pandemonium and competition will be fierce.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.3
						SpdMod*=1.3
						PowMod*=0.6
						EndMod*=0.6
	        if("Universal Guardian")
				History="Universal Guardian"
				var/Choice=alert(src,"You are a guardian of the Universe. You don't know quite how long you've stood watch over heaven, but it has been longer than most mortals have experienced in an entire family tree. You are a Guardian. A Sentinel. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.2
						StrMod*=1.2
						PowMod*=0.8
						ResMod*=0.8
						TrainMod*=1.2
						SpdMod*=1.2
						DefenseMod*=1.2
			if("Power of the Mind")
				History="Power of the Mind"
				var/Choice=alert(src,"Your mind is a powerful thing. A force to be reckoned with by anyone's standards. Rather than spend your time fighting, you have spent it in quiet meditation where you have honed it into a powerful weapon. Is this the type of history you seek?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=0.75
						EndMod*=0.75
						SpdMod*=0.85
						SparMod*=0.5
						TrainMod*=0.5
						MedMod*=1.75
			if("Mystical")
				History="Mystical"
				var/Choice=alert(src,"A kaio created from the energies of the universe. What you do and what you are is shrouded in mystery and divine confusion. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						PowMod*=1.25
						ResMod*=1.25
						StrMod*=0.8
						EndMod*=0.8
						KiMod*=1.25
						KiRegen*=1.25
						kimanipmod*=1.5
			if("Caretaker")
			    History="Caretaker"
				var/Choice=alert(src,"While the other kaios maintain the balance and focus on training their students you focus on taking care of Heaven and the passed on souls, providing weights, planting gardens, setting up little inns and houses to make their afterlife as heavenly as possible.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.3
						KIRegen*=1.3
						StrMod*=0.8
						EndMod*=0.8
			if("Crusader")
			    History="Crusader"
				var/Choice=alert(src,"There are few things demons fear as much as a crusader kaio, these kaios declare war on the forces of hell, deeming them a threat to the universal balance and set out to 'neutralize' this threat by any means necessary that doesn't involve freeing or helping demons. Most other kaios condemn these crusaders as violent and irresponsible as they actually do more damage to the balance then good. However a crusader, if properly restrained and directed by his fellow kaios can be one of the most valuable assets for the forces of good.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.2
						StrMod*=1.2
						EndMod*=1.2
						PowMod*=0.7
						ResMod*=0.7
			if("Scholar")
			    History="Scholar"
				var/Choice=alert(src,"You are obsessed by obtaining knowledge, the more you can learn the better. Due to living in Heaven you have the advantage of having plenty of subjects of different races to observe and study though if given the chance you'll be more then glad to take the opportunity to study them in their natural environment in the living realm. Depending on your sense of duty VS your desire to obtain knowledge you are a lot less likely to desire a position as a cardinal or the supreme kaio, instead choosing to spend the time that you'd otherwise spend maintaining the balance to obtaining more knowledge for the further benefits of the kaios.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*2.5
						EndMod*0.7
						StrMod*0.7
			if("Denizen Of The Light")
			    History="Denizen Of The Light"
				var/Choice=alert(src,"As a Kaio your already well attuned with the ways of your people, however be it from birth or maybe later in life you were either born with or have attained a level of purity that distinguishes yourself from your fellow kin and thus you are a being pure in all ways and forms. This suggests your type of upbringing may have swayed you to become a holy figure in order to spread the word of peace and love and as such you have steered clear of all forms of violent practice and thus whilst not trained much in the art of combat besides having a means of self defense your prowess in the mystical arts are top notch, there is no doubt in anyone’s mind you were created with a purpose to bring others to salvation although this firm belief might have made you somewhat naïve to the outside world.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PodMod*=1.3
						ResMod*=1.3
						OffMod*=0.7
						DefMod*=0.7
			if("Despondent Kaio")
			    History="Despondent Kaio"
				var/Choice=alert(src,"Once a caring and empathetic young being, who only wanted to help the universe and it's inhabitants. However, centuries of war, man made catastrophes and general hatred shown in the galaxy have caused you to be disappointed with pretty much all life forms outside of Heaven. You're still bound to your duties as a Kaio, though you don't deal with others with a smile on your face, and you pretty much resent them every step of the way, questioning why you even bother. (this however in no way entitles you to be an 'evil kaio' you can be a jerk about it, but you still do your job).")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PodMod*=1.4
						OffMod*=1.4
						ResMod*=0.8
						EndMod*=0.8
			if("Ancient")
			    History="Ancient"
				var/Choice=alert(src,"Kaios, like demons, live quite long. You are an elder among your race, experienced beyond comprehension of the fledglings of your species. You consider it your duty to educate them and guide them to a desirable future, teaching them the mysteries of the universe.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=1.3
						DefMod*=1.3
						SpdMod*=1.3
						StrMod*=0.7
						EndMod*=0.7
						OffMod*=0.7
		    if("Judge")
			    History="Judge"
				var/Choice=alert(src,"At one point in time and perhaps even now you were known as king/queen Yemma, passing judgement on the souls of the dead, sending them either to Heaven or Hell. You have a natural talent to see through lies and deceit which helps you sort out the 'bad weeds' that try to sneak into Heaven.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    KimanipMod*=1.5
						PowMod*=1.3
						StrMod*=0.7
						EndMod*=0.7
		    if("Bounty Hunter")
				History="Bounty Hunter"
				var/Choice=alert(src,"You were built to hunt what the Android Ship deems to be a threat. A perfect machine that can blend into the shadows and strike when the time is right. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						ResMod*=0.5
						PowMod*=0.5
						MedMod*=0.75
						SpdMod*=1.4
						DefenseMod*=1.3
						HPRegen*=1.2
						KiMod*=1.25
			if("Project: Domination")
				History="Project: Domination"
				var/Choice=alert(src,"Crush the little races! Conquer the galaxy! Unlimited Rice Pudding! Etcetera! Etcetera! You were built for a single purpose- conquer the universe and crush what opposes you. If this were terminator you certainly aren't Arnold Schwarzenegger. It might be a good idea for those who stand against you to consider reprogramming you entirely rather than struggle against the power you have been granted. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.35
						StrMod*=1.35
						PowMod*=0.25
						ResMod*=0.75
						kimanipmod*=0.5
						SpdMod*=1.3
						DefenseMod*=1.3
						TrainMod*=1.25
			if("Biological Research")
				History="Biological Research"
				var/Choice=alert(src,"Why destroy what should be properly analyzed and researched? After all, a couple million years of evolution has to have done something that the android ship hasn't thought of yet, right? Your goal is simple: Analyse various species and their odd habits; report the data back to the android ship. How you do this though, is up to you... Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.25
						ResMod*=1.25
						SpdMod*=1.2
						DefenseMod*=1.2
						OffenseMod*=0.85
						StrMod*=0.85
						HPRegen*=1.15
			if("Energy Experiment")
				History="Energy Experiment"
				var/Choice=alert(src,"You are the Android ships gateway to an entire new fuel source- Ki energy. You have been built around it's manipulation and usage, and designed to learn more about it from other species when the time is right. By any means necessary. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.85
						ResMod*=1.25
						PowMod*=1.4
						kimanipmod*=1.25
						HPRegen*=0.5
						KiMod*=1.25
						KiRegen*=1.5
			if("Upgrader")
			    History="Upgrader"
				var/Choice=alert(src,"The mothership created you to apply updates to existing systems and androids, as such your primary programming doesn't include much in terms of combat but your intelligence is far greater then your fellow androids, allowing you to even develop some form of free will unconnected to the mothership over time.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=2.5
						StrMod*=0.6
						PowMod*=0.6
			if("Battledroid")
			    History="Battledroid"
				var/Choice=alert(src,"You were programmed by the mothership to wage war, to go to worlds and conquer it so the worlds resources can be used to further benefit the sentient AI of the mothership. Battledroids are locked and loaded with a wide variation of weaponry, ranging from using built in arm lasers or overwhelming physical prowess.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.3
						PowMod*=1.3
						EndMod*=1.3
						ResMod*=0.7
						KiMod*=0.7

			if("Combat Doll")
				History="Combat Doll"
				var/Choice=alert(src,"Contrary to the rest of your brethren, you are made for combat- raised for combat. Energy manipulation? Pfft. What's a ki blast Vs. a good punch to the face? This type of upbringing usually results in violent tendencies, though not always. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.35
						StrMod*=1.35
						ResMod*=0.6
						PowMod*=0.5
						SpdMod*=1.25
						DefenseMod*=1.25
						OffenseMod*=1.25
						KiRegen*=0.75
						HPRegen*=1.3
						KiMod*=0.75
						kimanipmod*=0.8
			if("Revered")
			    History="Revered"
				var/Choice=alert(src,"Where you came from you have always been worshipped, something to be praised and adored. Because of this you might be frailer then some but the many tributes you have received have made you quite wealthy indeed."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=0.8
						OffMod*=0.8
						SpdMod*=1.3
						Zenni+=Rand(3000,6000)
			if("Ki Specialist")
			    History="Ki Specialist"
				var/Choice=alert(src,"Normal spirit dolls are good with ki, but you, you are a specialist. With ki energy you can do things that others can only dream of, manipulating it as you see fit. Creating a giant ki dragon to entertain at a party? No problem. Using said dragon to destroy enemies? Why not?")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=1.3
						ResMod*=1.4
						OffMod*=1.2
						StrMod*=0.7
						EndMod*=0.8
			if("Pinocchio")
			    History="Pinocchio"
				var/Choice=alert(src,"You may be a doll inhabited by a spirit, but what you really want to be is a real living creature! Your entire life you've spent trying to find of a way to shed this crafted body you inhabit and find a way to get a real body, due to this you've found yourself to be quite persevering.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.1
						HPRegen*=0.8
						KIRegen*=0.8
						DefMod*=1.2
						StrMod*=0.9
			if("Spy")
			    History="Spy"
				var/Choice=alert(src,"Due to your low profile you make for an excellent spy, using fast and precise ki attacks to end a fight quickly if need be though you prefer to avoid fights entirely if possible, instead getting your objective and leaving without anyone becoming any the wiser.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PodMod*=1.2
						SpdMod*=1.2
						EndMod*=0.8
			if("Circus")
			    History="Circus"
				var/Choice=alert(src,"Due to your size and look you were quickly recruited into the circus at a young age, performing agile tricks and using your natural ability for ki energy to astonish the crowds. You were the star attraction and proud of it, unfortunately the circus had to close down, leaving you home- and workless.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.3
						OffMod*=1.3
						DefMod*=1.3
						EndMod*=0.5
						ResMod*=0.5
						StrMod*=0.5
			if("Drone")
			    History="Drone"
				var/Choice=alert(src,"You're practically stuck in a mindless husk you can't control, following the orders of the one that 'created' you by putting you in here. Once your objective is complete however you hope you'll receive your free will again, unfortunately you're not sure if this is actually the case..Only time will tell.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.2
						ResMod*=1.2
						HPRegen*=0.8
						KIRegen*=0.8
			if("Warrior-type Namekian")
				History="Warrior-type Namekian"
				var/Choice=alert(src,"Naiillll. Gather the Dragonballs and wish for a Plasma TV! You are a warrior Namekian like Nail- strong and fast, Namek's number one son when it comes to combat! Raised in the ancient ways, but perhaps if you'd been raised in the NEW way you'd have stood a chance... is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.25
						StrMod*=1.25
						ResMod*=0.75
						kimanipmod*=0.5
						PowMod*=0.75
						SpdMod*=1.3
						DefenseMod*=1.3
						TrainMod*=1.25
						SparMod*=1.5
						OffenseMod*=1.3
			if("Dragon Clan Namekian")
				History="Dragon Clan Namekian"
				var/Choice=alert(src,"'Call me Super Kami... no wait, Super Kami Guru', this type of Namekian is most famous for the ability to create the mighty Dragonballs. And while the Namekian Elder and Earth Guardian posses this ability regardless of race, this is the most likely clan to make them just because. They aren't the greatest of fighters, but when left to their private thoughts long enough... is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=0.75
						EndMod*=0.75
						SpdMod*=0.75
						OffenseMod*=0.75
						DefenseMod*=0.75
						MedMod*=1.75
						TrainMod*=0.85
						SparMod*=0.65
						KiMod*=2.5
			if("Demon Clan Namekian")
				History="Demon Clan Namekian"
				var/Choice=alert(src,"Are you a Yoshi? While Ancient Nameks as a race are based off King Picollo, this is for those who preferred the brighter green Z-version of the character. It works something like a combination between the Dragon Clan and Warrior-type without all the complex Dragonball and Duty stuff. This is the most likely Namekian clan to become evil. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=1.15
						EndMod*=1.15
						ResMod*=0.85
						DefenseMod*=0.9
						HPRegen*=1.15
						KiMod*=1.25
						MedMod*=1.25
						TrainMod*=1.15
						SparMod*=1.25
			if("Secluded Namekian")
				History="Secluded Namekian"
				var/Choice=alert(src,"This type of Namekian didn't grow up in a Namekian city or around any people whatsoever. They didn't have a clan or anyone to talk to in all likelihood- instead they were left to their own devices with unknown results. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=0.8
						ResMod*=1.5
						StrMod*=0.8
						KiRegen*=1.25
						MedMod*=1.15
			if("Born to Rule")
				History="Born to Rule"
				var/Choice=alert(src,"Every once in awhile there comes a Changeling on the wild icer planet that is raised to be above his brethren- a ruler in a den of thieves so to speak. You were that Changeling. While still most likely evil and cruel, you possess the training and thus most likely ability to unite your Changeling brethren. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.2
						StrMod*=1.2
						ResMod*=0.8
						kimanipmod*=0.75
						SpdMod*=1.3
						OffenseMod*=1.3
						DefenseMod*=1.3
						KiMod*=0.95
						MedMod*=1.25
						TrainMod*=1.15
						SparMod*=1.15
			if("Seas run Red")
				History="Seas run Red"
				var/Choice=alert(src,"How to put this... your history makes Jack the Ripper look like a productive and responsible member of society. In short- what didn't agree with you you killed, what did agree with you you still killed (just more quickly). Your history is as red as the entire history of the Roman empire combined, and that's just to date. Is this the type of history you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.4
						StrMod*=1.45
						ResMod*=0.5
						PowMod*=0.6
						DefenseMod*=0.75
						TrainMod*=1.25
						MedMod*=0.65
						SparMod*=1.5
			if("Sibling issues")
			    History="Sibling issues")
				var/Choice=alert(src,"As far as you can remember your parent(s?) were always going ooon and ooon about how good your brother or sister was, especially in comparison to you. This has left you frustrated and on a self set path to outshine your sibling in everything."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=0.7
						StrMod*=1.2
						PowMod*=1.3
						ResMod*=0.7
						OffMod*=1.2
						DefMod*=0.9
			if("Glacial Hunter")
			    History="Glacial Hunter"
				var/Choice=alert(src,"While the other Changelings fight over dominance you focus on what's important; surviving. You hunt the cold glacial domains of your world, taking down what scarce prey remains and changelings that dare try to take what you need."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.3
						OffMod*=1.2
						SpdMod*=1.2
						PowMod*=0.5
			if("Savage")
			    History="Savage"
				var/Choice=alert(src,"On a ruthless world like the changeling home world it's no surprise that certain tribes have remained barbaric despite the overall civilizations advancing to more modern methods. You live by might makes right, taking what you want, technology however is something you prefer to avoid."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						EndMod*=1.4
						SpdMod*=0.8
						ResMod*=0.7
						OffMod*=1.2
						DefMod*=0.8
						TechMod*=0.5
			if("Exiled")
			    History="Exiled"
				var/Choice=alert(src,"You were the leader of a group of changelings, perhaps of a small band of misfits, or perhaps even of the entire planet. Whatever you were however was short lived, you got stripped from your position and exiled to wander alone into the wastes of your home world. Due to your bad experience with your previous group you are hell bent on revenge, be this by recruiting the help of the more savage changeling tribes and start an empire or simply by taking them out one by one by yourself, you know one thing very well. As far as leaders go: "There can be only one.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PLMod*=1.3
						DefMod*=0.8
			if("Scientific")
			    History="Scientific"
				var/Choice=alert(src,"Unlike your changeling brethren you've decided that technology is the best way to gain power. As such you've devoted a lot of your time tinkering and inventing new gadgets, broadening your knowledge and intelligence every day until you can finally assume your rightful place as ruler of all you see fit.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    KiMod*=0.7
						TechMod*=2
			if("Runt")
			    History="Runt"
				var/Choice=alert(src,"You've spent almost your entire life being picked on and beat up by the other changelings because you were weaker and different in some way. This abuse has left you particularly malicious and hateful towards the outside world, your fellow changelings especially. A changeling with this history is unlikely to work together with others though they'd probably enjoy dominating weaker races into servitude.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PLMod*=0.7
						PowMod*=0.7
						SpdMod*=1.3
						OffMod*=1.3
			if("Goon")
			    History="Goon"
				var/Choice=alert(src,"You've spent your life serving under someone else and you realized one thing: Steady work means steady pay. You're not the type to stand on top; following orders is easier than making them up."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.1
						ResMod*=1.1
						TrainMod*=1.2
						MedMod*=0.8
						PowMod*=0.8
						StrMod*=0.8
		    if("Frostdemon")
			    History="Frostdemon"
				var/Choice=alert(src,"Much like the demon clan namekians you consider yourself a physical embodiment of evil. You are no mear changeling but a demon born of the frost and death of the millions who had come before you. The one thing you seek above all else is glory and power, this type of history could easely try to obtain godhood/immortality and would be quite eager to try and take over the afterlife itself should it ever find out it exists.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.3
						OffMod*=1.3
						StrMod*=1.3
						PowMod*=0.8
						ResMod*=0.8
			if("Cult Leader")
			    History="Cult Leader"
				var/Choice=alert(src,"You lead or have led a demonic cult, conjuration, contact with the dead, black magic, you've endeavoured it all in your search for power. Growing ever mightier an obtaining more and more support and influence as time goes on."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=1.2
						KiManipMod*=1.2
						StrMod*=0.8
						EndMod*=0.8
			if("Sorcery")
			    History="Sorcery"
				var/Choice=alert(src,"You wield black magic, using it to vanquish or torture your foes and victims. You take a special delight in testing out new spells/attacks on innocent bystanders, seeing them panic and writhe in pain simply brings a smile to your face."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    KiManipMod*=1.4
						PowMod*=1.5
						EndMod*=0.7
						ResMod*=0.7
						DefMod*=0.7
			if("Grunt")
			    History="Grunt"
				var/Choice=alert(src,"You're not very ambitious, following orders and crushing things that stop you from executing those orders. You're more physically orientated then the leaders on the Makyo Star. That said, the influence of the Makyo Star when you're on another planet fills you with power and ambition, causing you to dominate all in your way as you see fit."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.3
						EndMod*=1.3
						SpdMod*=0.8
						DefMod*=0.8
		    if("Legacy")
			    History="Legacy"
				var/Choice=alert(src,"You are the offspring of a great lord of the Makyo people, however as fate would have it your family was stolen away from you, never to be seen again. You are enraged by this injustice and seek out to destroy those who are responsible for what happened as compensation. For now you bide your time on the Makyo Star, plotting you revenge."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.2
						OffMod*=1.2
						DefMod*=1.2
						ResMod*=0.7
						PowMod*=0.7
						EndMod*=0.7
			if("Planetary corrupter")
			    History="Planetary corrupter"
				var/Choice=alert(src,"You travel from world to world with the Makyo Star, bringing chaos and corruption wherever you arrive. You care nothing for the inhabitants of the planets you visit, nor the consequences of your actions for them. Planetary Corrupters can take the direct approach and cause trouble, but they're more likely to indirectly ruin a planet, for example by destroying the plant life rather then attacking fighting."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						ResMod*=0.8
						DefMod*=0.8
			if("Road of Loss")
				History="Road of Loss"
				var/Choice=alert(src,"Slowly, steadily, your race has declined until only few remained. You've watched most of your friends and family die. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						ResMod*=1.5
			if("One of a Kind")
				History="One of a Kind"
				var/Choice=alert(src,"You are pretty much the last of your race, and the only one of your kind that you've ever known. The most wonderful thing about you? You're the only one. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						StrMod*=1.25
						SpdMod*=0.75
						DefenseMod*=1.25
						TrainMod*=1.3
			if("Ancient Civilization")
				History="Ancient Civilization"
				var/Choice=alert(src,"You are part of a race who was civilized before most species in the universe were crawling out of the mud. Architecture and mathematics have been known for quite awhile. Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						techmod*=1.25
						ResMod*=1.25
						EndMod*=1.25
						StrMod*=0.75
	        if("Enforcer")
			    History="Enforcer"
				var/Choice=alert(src,"With a race as diverse and full of mutations as yours it only stands to reason that enforcers were appointed, its been your job, your duty, to evaluate if one of your kin is a threat to the throne or even the entire population of Arconia, defending your very planet against the potential threat that might come from within.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					     PowMod*=1.2
						 PLMod*=1.2
			if("Seperated")
			    History="Seperated"
				Var/Choice=alert(src,"Your type of Arconian have always been connected to a communal consciousness, your connection has somehow been severed though, perhaps through medical experimentation by an Arconian scientist, or you are the last remaining. The point is that you now have to think for yourself and can no longer depend on the safety and comfort of the hive mind.")
			    switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.2
						PowMod*=0.9
						DefMod*=1.1
						OffMod*=0.8
			if("TOKUSENTAI")
			    History="TOKUSENTAI"
				var/Choice=alert(src,"TOKUSENTAI,TOKUSENTAI,TOKUSENTAI! You are part of an elite squad of Arconians, fighting for the highest bidder, the crown, or just for the hell of it. You quickly made your name across the entire planet however what happens now is up to you, perhaps your squad has been killed when they went on an expedition without you, or you decided it was time to branch out and start your own elite squad, only time will tell.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=rand(80,120)/100
						Endmod*=rand(80,120)/100
						SpdMod*=rand(80,120)/100
						PowMod*=rand(80,120)/100
						ResMod*=rand(80,120)/100
						OffMod*=rand(80,120)/100
						DefMod*=rand(80,120)/100
			if("Fabulous")
			    History="Fabulous"
				var/Choice=alert(src,"Just because you're a warrior doesn't mean you don't have to take care of your looks. You consider yourself drop dead gorgeous though others may describe you as flamboyant, they're obviously just jealous of your stunning looks and keen fashion sense though so there's no point in paying them much heed. This type of Arconian is as narcissistic as an oozaru is big.")
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.2
						SpdMod*=1.2
						DefMod*=1.2
						StrMod*=0.5
						PowMod*=0.5
			if("Technomancer")
			    History="Technomancer"
				var/Choice=alert(src,"You're one crazy scientist, using the wonders of science to emulate things you've always wanted to be able to do that you've read about in fantasy books like using remote control planes to imitate throwing fireballs at people. Despite your lacking grip on reality however you're quite a genius when it comes to technology, pulling off things most people consider impossible and ridiculous through sheer randomness."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=2
						StrMod*=0.7

			if("Special Spawn")
				History="Special Spawn"
				var/Choice=alert(src,"Your demon parent was interesting even for it's race, and may have passed some curious physical features on to you... Is this the type of History you want?","","Yes","No")
				switch(Choice)
					if("No") History()
					if("Yes")
						EndMod*=1.25
						SparMod*=1.5
			if("Overly aggressive")
			    History="Overly aggressive"
				var/Choice=alert(src,"You're the spawn of a saiyan and demon, what did you expect? The raw power you command is hard for you to control, as is your temper. In an argument you are not only most likely the first person to throw a punch, you're also the most likely to first kill someone to end it. The combination of saiyan and demon blood coursing through your blood has made you even more devastating and ruthless then a normal saiyan or demon would be able to pull off."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.5
						EndMod*=1.5
						SpdMod*=0.7
						DefMod*=0.7
			if("Primitive")
			    History="Primitive"
				var/Choice=alert(src,"You saiyan, you demon, you don't know. It seems when it comes to intelligence you got the short end of the stick, basically ending up as a primitive, stronger then normal saiyan-caveman. The demonic blood coursing through your veins increasing your lust for blood and combat that your saiyan blood instils even further."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.3
						OffMod*=1.3
						DefMod*=0.6
						PowMod*=0.6
			if("Demi-Hunter)
			    History="Demi-Hunter"
				var/Choice=alert(src,"You have dedicated your life to tracking and hunting down demi-gods, showing no mercy to your celestial counterparts. Why you this might be unclear, perhaps you're doing it to prove you're stronger, or to upset the balance like demons tend to enjoy doing, perhaps your saiyan blood sees them as a worthy challenge, who knows. Your history has put you at odds with kaios,who will be less likely to trust you if they hear of your exploits, demons however are more likely to take a shine to you."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.3
						SpdMod*=1.3
						PowMod*=0.8
						ResMod*=0.8
		    if("Pure evil")
			    History="Pure evil"
				var/Choice=alert(src,"You may have saiyan blood along side your demon blood but there's no doubt which of the two is dominant. You take great pleasure in the slaughtering of kaios, demigods and innocent bystanders, going out of your way if it will inflict extra misery or pain on them."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.2
						OffMod*=1.2
						EndMod*=0.9
						StrMod*=0.9
			if("Honorable warrior")
			    History="Honorable warrior"
				var/Choice=alert(src,"Your blood does not define who you are. You focus on honourable combat against your foes and as long as it's a fair fight, show no mercy. You're likely to power down to equal the playing field against an opponent but once a fight starts against a demigod or kaio you're still in it till death, regardless of whatever age or power the opponent might have."
				switch(Choice)
				    if("No") History()
					if("Yes)
					    StrMod*=1.3
						DefMod*=1.3
						KIRegen*=1.3
						ResMod*=0.7
			if("Tactician")
			    History="Tactician"
				var/Choice=alert(src,"Your above average intelligence and keen sense of strategy makes you the perfect candidate to be a tactician for the Arbiter, or perhaps the Arbiter himself. You plan out the expected enemy forces and how best to handle them so that casualties stick to a bear minimum."
				switch(Choice)
	                if("No") History()
					if("Yes")
					    TechMod*=1.5
						ResMod*=0.7
			if("Perfect Specimen")
			    History="Perfect Specimen"
				var/Choice=alert(src,"You have been tasked with the mission of becoming the perfect specimen by your creator. All life in the universe serves to sustain you and you long to complete yourself by absorbing all that you come across to reach your ultimate goal; perfection.
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.2
						StrMod*=1.2
						SpdMod*=1.1
						DefMod*=1.1
						EndMod*=0.7
						ResMod*=0.7
			if("Failed Experiment")
			    History="Failed Experiment"
				var/Choice=alert(src,"Your creator tried to create the ultimate life form, (s)he failed...Or so (s)he thought. You were discarded by your creator, (s)he probably even tried to dispose of you by destroying you. This betrayal has left you with a deep hatred for your creator and his race as a whole, leading you to set out on a path of vengeance and to prove you are indeed the ultimate life form."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						EndMod*=1.2
						ResMod*=1.2
						SpdMod*=0.7
						HPRegen*=0.8
			if("Corrupt Data")
			    History="Corrupt Data"
				var/Choice=alert(src,"Your mission is unclear. Something seems to have gone wrong during the final stages of your creation and has somehow resulted in a less than perfect being. Unknown to you, the purpose of your creation is shrouded in darkness and you yearn to complete the puzzle."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    KIRegen*=1.5
						StrMod*=0.8
						PowMod*=0.8
			if("Voidling")
			    History="Voidling"
				Var/Choice=alert(src,"Instead of being created in a lab you were born like any other creature, far beyond the known universe on a planet possibly full of your species. For reasons known only to you, or perhaps not even by you, you were sent away and arrived in the known universe with only one desire; to devour everything to reach your mature, perfected state."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=rand(80,120)/100
						EndMod*=rand(80,120)/100
						SpdMod*=rand(80,120)/100
						PowMod*=rand(80,120)/100
						ResMod*=rand(80,120)/100
						OffMod*=rand(80,120)/100
						DefMod*=rand(80,120)/100
			if("Evil Hunter")
			    History="Evil Hunter"
				var/Choice=alert(src,"As a being manufactured to be the ultimate hunter, your creator was a true and good hearted person. You were not manufactured to be a weapon to harm, but preserve. With single minded devotion toward hunting all forms of evil, your initial mission has become unbalanced. Instead of hunting only evil, you seek to eliminate all who have the potential to be corrupted."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.3
						PowMod*=1.3
						EndMod*=0.7
						ResMod*=0.7
			if("Enslaved")
			    History="Enslaved"
				var/Choice=alert(src,"You were created or summoned by an inferior being, only to end up enslaved by your now master. Perhaps you are still enslaved, or perhaps you have managed to break free and are now able to do what you want whenever you want without telling you what to do, ofcourse due to your nature, a lot of people are likely to suffer."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.1
						ResMod*=1.1
						DefMod*=0.8
			if("Bringer of the end")
			    History="Bringer of the end"
				Var/Choice=alert(src,"You are an ancient creature of doom and demise, taking pleasure in destroying entire galaxies and empires for no other reason then your personal amusement. Wherever you go, only one thing is certain; death is sure to follow."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=1.3
						OffMod*=1.3
						DefMod*=0.7
						ResMod*=0.7
			if("Glutton")
			    History="Glutton"
				var/Choice=alert(src,"The hunger...you're so hungry..You devour everything and everyone in an attempt to sate your eternal hunger, unfortunately apart from a few seconds of satisfaction you gain little from it, apart from the power increase that you get for every person unfortunately enough to be absorbed by you of course."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.2
						ResMod*=1.2
						DefMod*=0.6
						SpdMod*=0.6
			if("Genetic Experiment")
			    History="Genetic Experiment"
				var/Choice=alert(src,"Long ago there was a bright young prodigy in an alien civilization of brilliant minds. In order to pass their extremely selective exams, mere four year old children are tasked with producing an experiment of value to society. The bright young mind in question created you as his invention. A chemically and genetically altered square of jello that somehow gained intelligence. In a cruel twist of fate, you devoured your creator and gained a more stable form. You know what it means to be weak. You know that even the most pathetic life form could end up a threat if unattended. Luckily they'll serve a better purpose once they've been absorbed by you."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.3
						DefMod*=1.3
						TechMod*=2
						EndMod*=0.7
						ResMod*=0.7
			if("Salamander")
			    History="Salamander"
				var/Choice=alert(src,"You are a creature of fire incarnate, associated with both life and death. Often mistaken for dragons due to their shape they're known to burn down entire worlds so their young can be born and grow up. Once the Salamanders leave though the planets tend to regrow more lush then ever. In the past your kind walked freely in the living realm next to the mortals, sometimes even getting worshipped for your affinity to flame. Nowadays however your kind has become more and more rare, as such your goals differ from the average Ancient, whereas the standard Ancient seeks to maintain his/her version of balance between good and evil throughout the universe you are something more primal, doing what you want because you want. Perhaps your goal is to reclaim a world for your kind or to spread the glorious warmth of fire throughout the universe until every single planet is reduced to charred earth. A Salamander is a lot stronger in terms of physical prowess then its standard Ancient counterparts, using its affinity to fire to supplement it's fighting with flame based ki attacks."
	            switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.5
						EndMod*=1.5
						SpdMod*=1.3
						ResMod*=0.5
						PowMod*=0.8
						OffMod*=1.2
						HPRegen*=1.4
						KIRegen*=1.4
			if("God of War")
			    History="God of War"
				var/Choice=alert(src,"You are an instrument of destruction throughout the universe, spurring mortals to fight each other via clever manipulation or straight out taunting, an alternative possibility is that you go around fighting everyone looking for a challenge in an attempt to find someone who can sate your lust for battle and can match you in terms of skill. A God of War is unlikely to show mercy, you dont care if people or planets die because they just dont matter to you. This history is based on Bills."
				switch(Choice)
				    if("No") History()
					if("Yes)
					    Unsenseable like Android
						RecordPL*=2
						StrMod*=1.4
						OffMod*=1.4
						DefMod*=1.4
						ResMod*=0.8
						PowMod*=0.8
						EndMod*=0.8
						HPRegen*=0.8
						KIRegen*=0.8
			if("Ancestor")
			    History="Ancestor"
				var/Choice=alert(src,"The original vision for the Ancient race, you are the ancestor of the kaios and demons come to the universe for reasons known only to you. The great great great great grandchildren of your people now run the universe and you feel that you shall decide if they are doing a good or bad job. As an Ancestor you poses both good and evil in relatively equal measure, though your character can lean more towards one then the other. If given the chance between taking a life and sparing it however you would generally decide to spare it so that the person you spared might better try to adapt his/her lifestyle to your vision."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.4
						ResMod*=1.4
						StrMod*=0.8
						PowMod*=0.8
						OffMod*=0.8
			if("Keeper")
			    History="Keeper"
				var/Choice=alert(src,"You are a keeper of secrets, the knowledge locked deep away and unknown to others has been a subject of study for you for the entirety of existence. Dragonballs? You know about them. Super Saiyan? What variation, there's over six, seven if you count that fake form. Basically you know knowledge that hasn't been revealed yet in the wipe with as purpose to make stuff happen. Providing IC motivation or manoeuvring pawns into place for your plot to bear fruit. The Keeper is a difficult history to play due to the cunning it takes to manipulate the right people at the right moments but can easily push a wipe forward all by itself."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.5
						DefMod*=1.5
						PowMod*=1.5
						StrMod*=0.7
						EndMod*=0.7
			if("Observer")
			    History="Observer"
				var/Choice=alert(src,"Whereas the other kind of Ancients take a rather direct approach in terms of interacting or influencing mortals and the descendants of your people, you decide to merely observe and learn. The observer specialises in learning as much as it can from a species simply by watching its decisions and movements, due to your intelligence and natural curiosity you're also a lot more inclined to dabble in science and inventions, giving you a unique niche compared to the other types of Ancients. Although you find other races, mortals in particular, to be extremely interesting, odds are you wouldn't make yourself known even when they died unless you believed you'd be able to acquire knowledge through the interaction that would've been lost had you just observed. (Via this way an Observer can become slowly more direct over time)"
				switch(Choice)
				    if("No") History()
					if("Yes")
					    contents+=new/obj/Skills/Observe
						TechMod*=3.3
						KiManipMod*=1.5
						Orefire*=0.2
			if("Elder")
			    History="Elder"
				var/Choice=alert(src,"You are an elder namekian, far older then any of the young offspring that inhabit your home world now. You provide them with insight and advise, guiding the newer generations towards their future."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    HPRegen*=1.1
						KIRegen*=1.1
						SpdMod*=0.7
						StrMod*=0.9
						EndMod*=0.9
						PowMod*=1.3

			if("Scientist")
			    History="Scientist"
				var/Choice=alert(src,"Unlike your younger namekian counterparts you've spent most of your life studying science, focussing on inventing new and discovering new things. Of course if you use this technology to help or sabotage your fellow namekians is entirely up to you."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=2
						HPRegen*=0.8
						KIRegen*=0.8
						PowMod*=0.9
						StrMod*=0.9
			if("Saiyan Heritage")
			    History="Saiyan Heritage"
				var/Choice=alert(src,"Your saiyan blood might be diluted, but you can still feel it pulsing strongly deep within you! The very thought of potential combat gets your blood pumping, despite being sired by a half blood saiyan and a human you feel a strong connection to your saiyan heritage."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.1
						SpdMod*=1.1
						DefMod*=0.8
						OffMod*=0.8
			if("Academic")
			    History="Academic"
				var/Choice=alert(src,"You have taken to studying, living a relative normal life compared to most others of you heritage you decided to embrace your human side and went out to sate your curiosity, taking to science rather then fighting."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=2
			if("Hidden Potential")
	            History="Hidden Potential"
				var/Choice=alert(src,"Quarter saiyans have always been somewhat special, but you seem to gain even more power at an even faster rate then normal for one of your kind. Your family has either embraced you or shunned you for this, encouraging or fearing your development."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PLMod*=1.5
			if("Ki prodigy")
	            History="Ki prodigy"
				Var/Choice=alert(src,"Potentially as a result from the human blood coursing through your veins, you have always been particularly good at ki energy manipulation, as a child this quickly became apparent to those around you, perhaps you fired off ki blasts whenever you had to burp, or created your own rattle of ki energy to amuse yourself. Point is, you're good with ki."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PodMod*=1.3
						ResMod*=1.3
						SpdMod*=0.8
						DefMod*=0.8
			if("Treasure Hunter")
			    History="Treasure Hunter"
				var/Choice=alert(src,"Your parents and grandparents have always told you tales about what wondrous things they found when they were still in the prime of their life, ancient relics, ruins, discovering long lost secrets on abandoned worlds, perhaps even the dragonballs. These exciting tales enthralled you, fascinated you to where you decided that when you had the chance, you'd set out for yourself so you could experience adventure, and maybe obtain some fortune in the process."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    SpdMod*=1.2
						HPRegen*=1.3
						KIRegen*=1.3
						StrMod*=0.8
						EndMod*=0.8
						PowMod*=0.8
			if("Ancient Bloodline")
			    History="Ancient Bloodline"
				var/Choice=alert(src,"Your bloodline is shrouded in mystery, you have no idea who your parents were let alone your grandparents, what you do know however is that you stand out among the others around you. Your power is far greater then any human your age and you seem to have a natural talent for combat that would take most years of practise to match."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    OffMod*=1.3
						DefMod*=1.3
						PowMod*=0.7
						ResMod*=0.7
			if("Educated")
			    History="Educated"
				var/Choice=alert(src,"Your parents took a particularly keen interest in your education, doing their very best to get you in the highest ranking schools and day cares to assure that you'll get all the opportunities such a bright mind as yours deserves. Of course, if you are truly as intelligent as your parents think you are, let alone interested in the education their forcing you through is a different story."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=3
						StrMod*=0.8
						EndMod*=0.8
	        if("Enhanced"
	            History="Enhanced"
				var/Choice=alert(src,"You were created in lab as a genetic experiment to see what would happen if one would combine a small amount of saiyan DNA with human DNA, in the hopes of creating an even more powerful merger then the half saiyans, they succeeded. Your power far exceeds expectations for a child your age, matching adult saiyan warriors from the olden days, and that at birth no less! How you got out into the world is up to you to decide, perhaps you were released, perhaps you broke out. Whatever the choice, you're free now and your saiyan instincts are starting to surface."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    Recordpl=Rand(20000,23000)
						EndMod*=1.3
						ResMod*=1.3
						StrMod*=0.7
						PowMod*=0.7
			if("Best Of Both Worlds")
			    History="Best Of Both worlds"
				var/Choice=alert(src,"Lucky you, due to the differences in race between your parents you have been brought up with the principles of both Saiyans and Humans. Whilst you may have experienced the rough training regimen your Saiyan parent had outline for you from birth you have also come to enjoy the lighter side of living thanks to their human spouse ranging from anything to being spoilt rotten as a kid or maybe even attending school as others of your upbringing may have done. Although the combined style of parenting may have distanced you slightly from friends not of a similar background you’ve somehow still come out an aspiring fighter whilst not sacrificing your values of education."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						EndMod*=1.2
						OffMod*=1.2
						ResMod*=0.8
						PowMod*=0.8
						DefMod*=0.8
	  		if("Elite")
			    History="Elite"
				var/Choice=alert(src,"Your saiyan blood might be diluted with human blood but that wont stop you from proving that you're one of the strongest saiyans alive! At least one of your parents was a prideful saiyan elite and raised you with the values of a true saiyan. Your heritage fills you with pride (go figure) and you've been trained the saiyan way, making you far more aggressive then your human-dominant counterparts."
	            switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						EndMod*=1.2
						DefMod*=0.8
						PowMod*=0.8
			if("Living Weapon")
			    History="Living Weapon"
				var/Choice=alert(src,"After the saiyans saw the result of mixing human and saiyan blood a splinter faction decided to weaponize this new crossbreed. You were either raised by members of this faction or created in a lab for this purpose, of course if you actually went along with the plans of your parents or creators is up to you, perhaps you broke free once you felt you had enough training and had nothing to gain any more, or perhaps you got sick of how they treated you."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						DefMod*=1.2
						ResMod*=0.5
			if("Royal Descendant")
			    History="Royal Descendant"
				var/Choice=alert(src,"You hail from a lineage of Saiyans bearing royal blood. Perhaps the lineage is immediate or goes all the way back to your ancestors but because of this your Saiyan parent has raised you upon the ideals that you are a class above all else and as such you have made every effort to hone your skills to reflect this. Sure you may be a little too prideful, some might even say arrogant however your remaining Human parent may have raised you in such a way to balance this out with an easier side of living and kept all this from getting to your head, or who knows maybe they even further encouraged this belief and forced you more so to live up to your Royal Predecessors."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.3
						OffMod*=1.3
						PLMod*=1.2
						DefMod*=0.8
						EndMod*=0.8
			if("Superior")
			    History="Superior"
				var/Choice=alert(src,"Following the saiyan pride of your heritage you consider yourself a near perfect warrior, but you take it a step further; you don't just consider yourself better then humans, but you consider yourself superior to pure blooded saiyans aswell. Has your combined heritage not made you stronger then either!? From a young age you decided your goal would be to prove your superiority to all who dare question it, let alone who dare to challenge it."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.2
						SpdMod*=1.2
						ResMod*=0.8
						EndMod*=0.8
			if("Half blood resentment Saiyan")
			    History="Half blood resentment Saiyan"
				var/Choice=alert(src,"You grew up a child of two worlds. The Elites looked down upon you for not being full blooded saiyan, you were beaten, made fun of, never respected by anyone for who you were. Over the years you grew to hate the human half of your heritage. You hated your parents and blamed them for what they made you. All you have is your abilities, you are determined to show the other saiyans that blood isn’t everything."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    StrMod*=1.1
						PowMod*=1.1
						DefMod*=0.8
						SpdMod*=0.8
			if("Cursed")
			    History="Cursed"
				var/Choice=alert(src,"Your entire life you've felt like whatever form of a god or higher entity was out to get you and to make your life miserable, you have no idea what you did to anger this entity but even the golden glow of the sun seems to make you twist in fear, almost as if its bright shine was somehow related to this fearsome entity, probably some golden man in the sky or something. Due to your constant failure and bad luck you've become a lot more endurant then most."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.5
						ResMod*=1.5
						DefMod*=0.6
						SpdMod*=0.6
			if("Reluctant Scientist")
			    History="Reluctant Scientist"
				var/Choice=alert(src,"Your parents always wanted you to become a brilliant scholar but they didn't keep your motivation or dreams in mind at all. Due to this you've been forced through the educational system with a lot of effort and know more then the typical earthling, that said your studies have held back your progress when it comes to martial arts and ki manipulation but who knows, its a new day and you might decide to finaly throw this around and do what you've always wanted to make up for lost time!"
				switch(Choice)
				    if("No") History()
					if("Yes")
					    TechMod*=2
						OffMod*=0.9
						StrMod*=0.9
			if("Centered")
			    History="Centered"
				var/Choice=alert(src,"You are cool, calm, collected. Trained since birth to be a prominent martial artist you have obtained more skill then most of your kind. Your methods tend to differ though the goal is almost always the same, pushing your abilities to the very limit to try and improve yourself even further."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    MaxAnger*=0.2
						OffMod*=1.3
						DefMod*=1.3
						SpdMod*=1.3
			if("Ki prodigy")
			    History="Ki prodigy"
				var/Choice=alert(src,"Potentially as a result from the human blood coursing through your veins, you have always been particularly good at ki energy manipulation, as a child this quickly became apparent to those around you, perhaps you fired off ki blasts whenever you had to burp, or created your own rattle of ki energy to amuse yourself. Point is, you're good with ki."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    PowMod*=1.3
						ResMod*=1.3
						SpdMod*=0.8
						DefMod*=0.8
			if("Half blood resentment Human")
			    History="Half blood resentment Human"
				var/Choice=alert(src,"You grew up a child of two worlds. The humans never fully understood you. They picked on you and made fun of your tail. To them you weren’t human, and they feared that. You were greeted with fear, sometimes even anger. You loved your parents but you still blamed them for what they made you. From a young age you were able to run faster and hit harder than any of your peers. It made people shun you, but deep in your heart you always knew you were meant for great things. You are determined to earn the trust and respect of a race that has feared you their whole lives."
				switch(Choice)
				    if("No") History()
					if("Yes")
					    EndMod*=1.2
						OffMod*=1.2
						StrMod*=0.8
						DefMod*=0.8

Personality
mob/var/Personality
mob/proc/Personality()
	var/list/Personalitie=new/list
	Personalitie.Add("Normal") //Anyone can be Average!
	if (Race=="Human"|Race=="Saiyan"|Race=="Makyojin"|Race=="Namekian"|Race=="Spirit Doll"|Race=="Kai"|Race=="Tsufurujin"|Race=="Demi-God"|Race=="Arconian") //Silee encoar. Dese tings dont have these personalities!
		Personalitie.Add("Pacifist")
		Personalitie.Add("Studious")
		Personalitie.Add("Shy")
		Personalitie.Add("Stubborn")
		Personalitie.Add("Loner")
		Personalitie.Add("Ruthless")
		Personalitie.Add("Friendly")
		Personalitie.Add("Impish")
		Personalitie.Add("Calm")
		Personalitie.Add("Eccentric")
		Personalitie.Add("Businessman")
		Personalitie.Add("Bubbly")
		Personalitie.Add("Dependent")
		Personalitie.Add("Bossy")
		Personalitie.Add("Sagacious")
	if (Race=="Demon")
		Personalitie.Add("Demonic")
	if (Race=="Kai") //Kaios get theirs too, pretty much the opposite of demons.
		Personalitie.Add("Divine")
	if (Race=="Changeling"|Race=="Android"|Race=="Demon"|Race=="Ancient Namek")
		Personalitie.Add("Overlord")
		Personalitie.Add("Dominator")
	if (Race=="Changeling"|Race=="Demon"|Race=="Ancient Namek"|Race=="Hybrid"|Race=="Saiyan"|Race=="Makyojin")
		Personalitie.Add("Murderous")
		Personalitie.Add("Psychopath")
		Personalitie.Add("Puppetmaster")
	if (Race=="Android")
		Personalitie.Add("Robotic Blank")
		Personalitie.Add("Terminator")
	if (Race=="Saiyan")
		Personalitie.Add("Saiyan Pride")
	if (Class=="Elite")
		Personalitie.Add("Elite Pride")
	switch(input("What kind of personality does your character have? This isn't resigning you to this one aspect, it's just their starting dominant character trait. Growth is encouraged!","",text) in Personalitie)
		if("Normal")
			Personality="Normal"
			var/Choice=alert(src,"An Average background means your character has lived the ordinary sort of life for a character of your race. It went to school where it probably had average grades, it's parents are still alive where applicable, and there was overall nothing really special about the way the character grew up. Is this the type of History you want? ","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes") usr<<"Congratulations, Average character! You've chosen the Jack of all paths!"//I want to congratulate the people that make average characters... again. For people to be special there has to be other people to compare em to :O.
		if("Pacifist")
			Personality="Pacifist"
			var/Choice=alert(src,"Your character hates fighting in all it's forms. It might train it's body for self-betterment, but if there's one thing that makes them angry it's fighting and having to fight. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
//					MaxAnger*=1.25
					OffenseMod*=0.7
					SparMod*=0.7
					MedMod*=1.35
		if("Curious")
			Personality="Curious"
			var/Choice=alert(src,"Your character loves to read and learn things. They're a bookworm, a scholar, or anything they can do to find something out. It nags them not to know! Might be confused for being easily distracted in extreme ases. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					techmod*=1.2
					SpdMod*=0.9
					MedMod*=1.1
					SparMod*=1.1
					TrainMod*=1.1
					DefenseMod*=0.9
		if("Shy")
			Personality="Shy"
			var/Choice=alert(src,"Your character is a wreck in social situations to some degree. Whether they're barely able to even get a proper word out amongst friends, or easily embarrased over small things, shy people are definitely interesting characters. They tend to have a hard time getting angry, but most of them have worked hard at becoming masters of running away from social situations! Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					EndMod*=0.8
					MaxAnger*=0.9
					SpdMod*=1.4
					DefenseMod*=1.1
					TrainMod*=1.2
					SparMod*=0.85
		if("Stubborn")
			Personality="Stubborn"
			var/Choice=alert(src,"Your character just doesn't know when to concede the point or defeat. They can be headstrong or insistent about doing things their own way. This affects their ability to train alone as it means they can repeatedly do the same thing wrong and admit it's right, but they're better when working with others.Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					EndMod*=1.4
					OffenseMod*=0.8
					TrainMod*=0.7
					SparMod*=1.3
		if("Loner")
			Personality="Loner"
			var/Choice=alert(src,"Your character doesn't really hang around people all too much. They might not have any friends at all for whatever reason it is that makes them a loner. Being a loner has it's benefits though. Doing things for yourself tends to make you... tough. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					EndMod*=1.2
					StrMod*=1.2
					ResMod*=0.8
					ZenkaiMod*=1.2
		if("Ruthless")
			Personality="Ruthless"
			var/Choice=alert(src,"This character doesn't care who he or she hurts. If you're in their way, they'll deal with you by any means necessary. They show no quarter and 'mercy' might not even be in their vocabulary at all. They're a bit shoddy at defending themselves, but they know how to hit you where it hurts... Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					StrMod*=1.4
					OffenseMod*=1.1
					DefenseMod*=0.7
		if("Friendly")
			Personality="Friendly"
			var/Choice=alert(src,"This character is rather socially adept.  They're good at making friends and are rather good at defending them too. They have a warm personality that just seems to attract people to them and make them feel calm and trusting. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					EndMod*=1.2
					ResMod*=1.2
					SpdMod*=1.2
					DefenseMod*=1.2
					StrMod*=0.8
					PowMod*=0.8
					OffenseMod*=0.8
					SparMod*=1.25
					TrainMod*=0.8
		if("Impish")
			Personality="Impish"
			var/Choice=alert(src,"This character is generally a troublemaker or just looking for a bit of fun. They play pranks or mess with people's heads or just do all they can to have a good time all the time! They tend to be fast and good at taking damage, but they're usually too busy playing to work on their strength and form much. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					EndMod*=1.3
					StrMod*=0.8
					OffenseMod*=0.8
					SpdMod*=1.3
		if("Calm")
			Personality="Calm"
			var/Choice=alert(src,"This character isn't really the type to get worked up over things. In fact he's just the opposite, though this does come with the ability to focus better. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					MaxAnger*=1.6
					MedMod*=1.4
					TrainMod*=1.3
					PowMod*=1.4
					KiMod*=1.2
		if("Eccentric")
			Personality="Eccentric"
			var/Choice=alert(src,"This type of character is a bit of an oddball. They tend to be obsessive, confusing, and at times even their most serious behavior can be considered Wacky. Eccentric people tend to be true Geniuses- forgetful about some things simply because their mind is too focused on their latest project or subject. They're curious people taken to an extreme. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					techmod*=1.5
					StrMod*=0.7
					SpdMod*=0.8
					MedMod*=1.2
					SparMod*=1.2
					TrainMod*=1.2
					DefenseMod*=0.8
		if("Demonic")
			Personality="Demonic"
			var/Choice=alert(src,"This character is, well, ever see an angry demon in a movie? That's this character. An engine of destruction. It wants blood and souls. A 'pure evil' personality this is. Built for ripping people in half before they rip it in half. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					StrMod*=1.75
					ResMod*=0.6
					EndMod*=0.6
					PowMod*=0.6
					KiMod*=0.6
					DefenseMod*=0.6
					MaxAnger*=1.5
		if("Divine")
			Personality="Divine"
			var/Choice=alert(src,"This character is as saintlike as they come. Generally calm and wise, giving, caring, whatever you might picture a deity doing that's this person. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					PowMod*=1.25
					ResMod*=1.25
					KiMod*=1.2
					StrMod*=0.8
					EndMod*=0.7
					HPRegen*=0.75
					KiMod*=1.3
		if("Overlord")
			Personality="Overlord"
			var/Choice=alert(src,"Mwahahahaa, dominate the universe! This character wants to rule everything, plain and simple. It wants to claw it's way to the top of everything and stay there no matter what. Overlords train hard, but tend to see more result in the overall power they so crave than their actual skill. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					PLMod*=1.2
					TrainMod*=0.7
					MedMod*=0.7
					SparMod*=0.7
					DefenseMod*=0.7
					ZenkaiMod*=1.2
		if("Dominator")
			Personality="Dominator"
			var/Choice=alert(src,"Kind of the dual-personality to Overlord. Dominators have similar goals but rather than being after power itself, they're after that lovely feeling power over another being gives. They tend to get more skill than overlords, but as a result they gain less overall power. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					PLMod*=0.8
					TrainMod*=1.3
					MedMod*=1.3
					SparMod*=1.3
					DefenseMod*=1.3
		if("Murderous")
			Personality="Murderous"
			var/Choice=alert(src,"You want to kill things. That's pretty much it. You like ending the lives of the living- whether you do that columbine style or have an elaborate plan varies from person to person, but your main defining trait is the fact that you like when things around you die. Is this the type of personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					StrMod*=1.85
					EndMod*=0.8
					ResMod*=0.8
					DefenseMod*=0.8
					TrainMod*=1.25
					MedMod*=1.3
		if("Psychopath")
			Personality="Psychopath"
			var/Choice=alert(src,"You have more than a few screws loose- if there is a person alive that can predict what you're going to do, they're probably just as insane as you are. Is this the type of personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					SpdMod*=1.5
					StrMod*=0.75
		if("Puppetmaster")
			Personality="Puppetmaster"
			var/Choice=alert(src,"Dance, puppets, dance! You are a mastermind, a master of manipulation. You don't so much kill people as you convince other people to kill them for you. You toy with emotions and anything you can do to keep your plan going. The power of your mind is formidable. Is this the type of personality you want.","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					TrainMod*=1.3
					MedMod*=1.35
					KiMod*=1.5
					SparMod*=1.25
					StrMod*=0.85
					EndMod*=0.85
					SpdMod*=0.85
		if("Saiyan Pride")
			Personality="Saiyan Pride"
			var/Choice=alert(src,"You are a standard prideful saiyan, the last to admit you're wrong, the first to brag about how superior your race is. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
//					ssjat*=1.2
					MedMod*=0.75
					SparMod*=1.25
		if("Studious")
			Personality="Studious"
			var/Choice=alert(src,"You hit the books and never learned how to stop. You're a great catch at parties (not), but at least your name is known at your local library! Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					techmod*=1.75
					StrMod*=0.75
					SpdMod*=0.85
					MedMod*=1.25
					SparMod*=1.25
					TrainMod*=1.25
		if("Elite Pride")
			Personality="Elite Pride"
			var/Choice=alert(src,"You are even more prideful than your average Saiyan- and for good reason. You are an elite! A member of the strongest class of your race! You are easy to look down on others and push your superiority even on other members of your race. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
//					ssjat*=1.35
					MedMod*=0.5
					SparMod*=1.75
//					ssj3hitreq*=1.35
		if("Businessman")
			Personality="Businessman"
			var/Choice=alert(src,"You are business-minded in all areas of life. Your answer to a plea for help is 'Whats in it for me'. As a result you've earned a buck or too, but you generally don't tend to focus on fighting. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					zenni+=rand(2500,7500)
					EndMod*=0.95
					StrMod*=0.95
		if("Bubbly")
			Personality="Bubbly"
			var/Choice=alert(src,"Eternally joyous and sees only the good in everyone and every situation; your character is an optimist with a joyous twist of hyper and cute. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					EndMod*=0.75
					ResMod*=0.75
					MedMod*=0.75
					SparMod*=1.65
		if("Dependent")
			Personality="Dependent"
			var/Choice=alert(src,"Your character is usually dependent on the opinion or approval of others. This could mean they are clingy or obsessive, or just prone to getting depressed when someone points out one of their not-so-good ideas. Sometimes the person is dependent on other people's ideas entirely. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					techmod*=1.25
					ResMod*=0.75
					SparMod*=1.25
		if("Bossy")
			Personality="Bossy"
			var/Choice=alert(src,"Your character likes to be the head honcho. Whether it's the leader of a small group of 'friends' or an entire planet, your character insists that others do what they say exactly how they say it. Some are more forceful than others. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					techmod*=0.75
					MedMod*=0.95
					TrainMod*=1.25
					StrMod*=1.35
					SparMod*=1.15
		if("Sagacious")
			Personality="Sagacious"
			var/Choice=alert(src,"Your character is the type everyone turns to for advice. Whether it be because they are inherently wise or just acting, there's no question that there's an air of mystery or at least knowledge about them. Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					MedMod*=1.35
					TrainMod*=0.75
		if("Robotic Blank")
			Personality="Robotic Blank"
			var/Choice=alert(src,"Your character is clean-slate, starting with no memories and maybe no personality whatsoever of it's own. It falls upon either a programmer or the android itself to experience enough to fill this gaping void...  Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					TrainMod*=1.25
					SparMod*=1.25
					MedMod*=1.35
					ResMod*=0.5
					EndMod*=0.85
		if("Terminator")
			Personality="Terminator"
			var/Choice=alert(src,"Terminate with extreme prejudice! Once you have a target you never let it leave your sights until you've hunted it down and destroyed it. You might act like a zombie with the intensity of which you seek your target. Who knows what you'll do once they're dead, but it's the journey that counts, right?  Is this the type of Personality you want?","","Yes","No")
			switch(Choice)
				if("No") Personality()
				if("Yes")
					ResMod*=0.5
					PowMod*=0.5
					MedMod*=0.75
					SpdMod*=1.4
					DefenseMod*=1.3
					HPRegen*=1.2
					KiMod*=1.25