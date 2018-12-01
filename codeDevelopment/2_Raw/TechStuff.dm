mob/proc/Tech_Up()
	if(techxp>=(10*(techskill**2))/techmod)
		techxp-=(10*(techskill**2))/techmod
		techskill+=1
		for(var/obj/Creatables/A in contents) del(A)
		for(var/A in typesof(/obj/Creatables)) new A(src)
		for(var/obj/Creatables/A in contents) if(techskill<A.neededtech|name=="Creatables") del(A)
		if(techskill==25)
			usr<<"You have gained the ability to colorize and rename objects."
			contents+=new/obj/Skills/Colorfy
			contents+=new/obj/Skills/NameChange
		if(techskill==100)
			contents+=new/obj/Skills/Make_Android
		if(techskill==50)
			contents+=new/obj/Skills/Upgrade
		if(techskill==200)
			contents+=new/obj/Bebi
		usr<<"Your tech skill has increased."
mob/verb/Invent()
	set category="Skills"
	switch(input("Would you like to invent something new?", "", text) in list ("No","Yes"))
		if("Yes")
			var/amount=input("How much would you like to invest?") as num
			if(amount>usr.zenni) alert("You cannot put in more money than you have.")
			else if(amount<1) alert("You must invest at least 1 zenni.")
			else
				if(amount>usr.zenni) amount=usr.zenni
				alert("You have invested [amount] zenni towards your new invention.")
				usr.zenni-=amount
				usr.techxp+=round(amount*0.1)
				usr.Tech_Up()
obj/Skills/Make_Android/verb/Borgify(mob/M in view(1))
	set category="Skills"
	if(M.AndroidChoice) return
	if(M.Race=="Majin"|M.Race=="Bio-Android"|M.Race=="Bebi"|M.Class=="Bebi") usr<<"You cant turn [M.Race]s into Cyborgs."
	else if(M.Race=="Android"|M.Race=="Cyborg") usr<<"They are already an android or cyborg."
	else M.Android_Choice()
mob/var/BebiAbsorber
obj/Skills/Take_Body
	var/hasbody
	verb/Take_Body()
		set category="Skills"
		if(!hasbody)
			for(var/mob/P in oview(usr))
				for(var/mob/M in oview(1,usr))
					if(M.KO&&!hasbody)
						if(M.client)
							M.client.perspective=EYE_PERSPECTIVE
							M.client.eye=usr
							hasbody=1
							usr.absorbadd=M.RecordPL*M.Body
							usr.Body=M.Body
							usr.hasssj=M.hasssj
							usr.hasssj2=M.hasssj2
							usr.icon=M.icon
							usr.move=0
							usr.overlays=M.overlays
							usr.underlays=M.underlays
							usr.overlays-=M.hair
							usr.overlays+='Bebi Face Stripes.dmi'
							usr.hair=M.hair
							usr.hair+=rgb(100,100,100)
							usr.overlays+=usr.hair
							usr.ssjhair=M.ssjhair
							usr.ussjhair=M.ussjhair
							usr.ssj2hair=M.ssj2hair
							usr.Oozarouskill=M.Oozarouskill+5
							usr.ssjmult=1.1
							usr.ssj2mult=1.1
							usr.ssjat=1
							usr.ssj2at=1
							usr.Class=M.Race
							usr.Race="Bebi"
							view(usr)<<"[usr] steals [M]'s body!"
							var/ran1=rand(188,231)
							var/ran2=rand(226,251)
							M.loc=locate(ran1,ran2,13)
							M.BebiAbsorber=usr.name
							usr.Meditate()
						else usr<<"They must be knocked out."
		else
			hasbody=0
			usr<<"You give up the body you possessed."
			usr.icon=usr.oicon
			usr.overlays-=usr.overlays
			usr.underlays-=usr.underlays
			usr.hair=null
			usr.ssj=0
			usr.hasssj=0
			usr.hasssj2=0
			usr.f2=0
			usr.f3=0
			usr.f4=0
			usr.absorbadd=0
			usr.Body=25-(usr.Age-usr.DeclineAge)
			if(usr.Body>25) usr.Body=25
			usr.Class="None"
			usr.Race="Bebi"
			usr.absorbadd=0
			usr.overlays-='Bebi Face Stripes.dmi'
			for(var/mob/M) if(M.BebiAbsorber==usr.name)
				spawn M.KO()
				M.loc=locate(usr.x-1,usr.y,usr.z)
				M.BebiAbsorber=null
				M.client.eye=M
				M.client.perspective=MOB_PERSPECTIVE
mob/proc/BebiGain()
	RecordPL+=20*GG*gain*PLMod*HBTCMod*BPRank
	MaxKi+=0.004*KiMod
	Str+=0.002*StrMod
	Spd+=0.002*SpdMod
	End+=0.002*EndMod
	Offense+=0.002*OffenseMod
	Defense+=0.002*DefenseMod
	if(prob(10))
		gain+=gainget*timemult/4
mob/var
	GotBebi
	BebiX=0
	BebiY=0
	BebiZ=0
	BebiActivated
mob/var/techxp=0
mob/var/techskill=1 //each level adds +1 x mod.
mob/var/techmod=1
mob/var/techrate=0 //applies to androids, how much they are upgraded.
obj/Skills/NameChange/verb/ChangeName(obj/O in view())
	set category="Skills"
	O.name=input("") as text
obj/Skills/Colorfy/verb/Colorfy(obj/O in view())
	set category="Skills"
	switch(input("Add or Subtract color?", "", text) in list ("Add", "Subtract","Cancel",))
		if("Add")
			var/color
			color+=input("Please select the color, I suggest changing it to black first, and then picking the color you want.") as color
			O.icon=O.icon
			O.icon+=color
		if("Subtract")
			var/rred=input("How much red?") as num
			var/ggreen=input("How much green?") as num
			var/bblue=input("How much blue?") as num
			O.icon=O.icon
			O.icon-=rgb(rred,ggreen,bblue)
		if("Cancel")
			return
obj/Bebi
	var/choosing
	verb/Bebi()
		set category="Skills"
		if(!choosing)
			choosing=1
			alert("By doing this you will lose your current character and be playing as a new one who only inherits very few of your traits. Bebi's regenerate damage and lost energy both very fast. They can throw attacks one after the other at great speed. They start with very high skills already. They gain the same amount from both Meditation and Training, but unfortunately for them it is a very low amount, their sparring is normal though. Despite their training being almost useless, they make up for it because they gain power without training at all. They gain power faster than a Super Saiyan 2 but their anger is almost nonexistant. Their fighting style is highly offensive and has very low defense. Their upgrading skill will be above your own by a bit due to being able to cybernetically interface with machines, their potential to increase their skills are the same as yours though. Now as for their weaknesses, they do not progress any further in skills easily, not including energy attacks. They have low zenkai about equivalent to a Namekian. Their physical stats, strength, speed, endurance, are fairly below average, but they attack twice as fast as normal so they deal twice as much damage over time and they land hits easily due to high offense. They start with extremely high starting stats.")
			switch(input("Are you sure you want to do this?", "", text) in list ("No", "Yes",))
				if("Yes")
					usr.player=0
					usr.Savable=0
					var/mob/M=new/mob
					M.name=input("What do you want their name to be?") as text
					M.player=1
					M.Savable=1
					M.attackable=1
					M.Race="Bebi"
					M.spacebreather=1
					M.Class="None"
					M.bursticon='Black Hole.dmi'
					M.burststate="full2"
					M.CBLASTSTATE="27"
					M.formgain=1
					var/bicon='Base Bebi.dmi'
					var/redd=input("How much red do you want to SUBTRACT? 0 for all of them will leave you the default grey color. +50 and -50 are the limits.") as num
					var/greenn=input("How much green?") as num
					var/bluee=input("And blue...") as num
					if(redd>50) redd=50
					if(greenn>50) greenn=50
					if(bluee>50) bluee=50
					if(redd<-50) redd=-50
					if(greenn<-50) greenn=-50
					if(bluee<-50) bluee=-50
					bicon-=rgb(redd,greenn,bluee)
					M.icon=bicon
					M.oicon=M.icon
					M.BLASTSTATE="27"
					M.Cblastpower=3
					M.InclineAge=25
					M.DeclineAge=rand(90,110)
					M.refire/=2
					M.orefire/=2
					M.kinxt=-20
					M.kinxtadd=2 //Because of high refire.
					M.Makkankoicon='Ki Makkankosappo4.dmi'
					M.WaveIcon='Ki Energy Wave 1.dmi'
					M.ITMod=1
					M.healmod=1
					M.zanzomod=1
					M.zanzoskill=50
					/*
					M.KaiokenMod=0.1
					*/
					M.flightmod=1
					M.flightskill=100
					M.PLMod=5
					M.MaxPLpcnt=110
					M.MaxAnger=105
					M.KiMod=0.25
					M.PowMod=0.25
					M.StrMod=0.25
					M.SpdMod=0.25
					M.EndMod=0.25
					M.BirthYear=Year
					M.OffenseMod=2
					M.DefenseMod=0.5
					M.MaxKi=2000
					M.Pow=10
					M.Str=10
					M.Spd=10
					M.End=10
					M.Res=10
					M.Offense=10
					M.Defense=10
					M.kimanip=3
					M.GravMod=1
					M.HPRegen=1
					M.KiRegen=1
					M.ZenkaiMod=0.25
					M.TrainMod=0.01
					M.MedMod=0.01
					M.SparMod=0.01
					M.RecordPL=10000
					M.Body=5
					M.Age=10
					M.SAge=10
					M.GravMastered=5
					M.GravMod=0.01
					M.techskill=usr.techskill
					M.techmod=usr.techmod
					M.loc=usr.loc
					M.haszanzo=1
					M.contents+=new/obj/Skills/Take_Body
					M.contents+=new/obj/Zenni
					M.zenni=usr.zenni
					M.deposited_zenni=usr.deposited_zenni
					view(M)<<"The bebi kills its creator..."
					M.loc=locate(usr.x,usr.y,usr.z)
					view(M)<<"Bebi: AAAARRRRAAAAAGHHHHHHHHH..."
					flick('Zanzoken.dmi',M)
					M.x=usr.x+6
					M.BebiX=M.x
					M.BebiY=M.y
					M.BebiZ=M.z
					sleep(10)
					for(var/mob/A in oview(8,M))
						if(A==usr)
							var/obj/Z=new/obj
							Z.icon='12.dmi'
							Z.icon_state="12"
							missile(Z,M,A)
							//if(A.PL<M.PL) spawn(10)
							A.player=1
							A.Savable=1
							A.KO()
							sleep(5)
							M.loc=locate(usr.x,usr.y,usr.z)
							view(M)<<"Bebi: NO! DON'T SLEEP!  DIIIIIIIIIIIIEEEE!!!!!"
							flick('Zanzoken.dmi',M)
							M.y=usr.y+1
							M.BebiX=M.x
							M.BebiY=M.y
							M.BebiZ=M.z
							M.dir=SOUTH
							M.displaykey=usr.key
							M.key=usr.key
							A.player=0
							A.Savable=0
							A.client.perspective=EYE_PERSPECTIVE
							A.client.eye=M
							M.Finish()
							del(A)
					M.Meditate()
					usr<<"You need to relog to complete the Bebification process."
				if("No") choosing=0
obj/Skills/Upgrade/verb/Enhance(mob/M in view(1))
	set category="Skills"
	if(M.Race=="Android"|M.Race=="Cyborg"&&usr!=M)
		if(M.techrate<usr.techskill)
			if(usr.Ki>=usr.MaxKi)
				usr<<"You upgrade [M]'s Tech Rating to [usr.techskill]."
				M<<"[usr] upgrades your Tech Rating to [usr.techskill]."
				oview(usr)<<"[usr] upgrades [M]'s Tech Rating to [usr.techskill], Increasing their BP and Energy levels"
				M.MaxKi+=M.KiMod*(usr.techskill)/5
				view(M)<<"[M]: Energy increased by [M.KiMod*(usr.techskill)/5]"
				M.techrate=usr.techskill
				usr.Ki=0
				usr.techxp+=50
				usr.Tech_Up()
			else usr<<"You do not have enough energy"
		else usr<<"You dont have the knowledge to upgrade [M], they are too advanced."
	else usr<<"They have to be an android for you to upgrade them, or you are trying to upgrade yourself, which doesn't work."
mob/proc/Android_Choice()
	AndroidChoice=1
	if(Race=="Cyborg")
		usr<<"They are already a cyborg"
		return
	if(Race=="Majin"|Race=="Bebi"|Race=="Android"|Race=="Bio-Android")
		usr<<"A [Race] cannot become a cyborg."
		return
	alert(src,"[usr] wants to make you a Cyborg. As a Cyborg you will recieve a large BP and Energy increase. You will be able to be upgraded like an Android, but you will only recieve half as much BP from it and most likely less Energy since most races have less KiMod than Androids. Your natural health and energy recovery will be halved. Your endurance will be doubled.")
	switch(input(src,"Do you want to become a Cyborg?","",text) in list("No","Yes"))
		if("Yes")
			usr<<"[src] accepts your offer."
			src<<"You are turned into a Cyborg!"
			PLMod=250
			RecordPL+=4000
			Class=Race
			Race="Cyborg"
			HPRegen*=0.5
			KiRegen*=0.5
			EndMod*=2
			flightskill+=50
			haszanzo=1
			zanzoskill+=50
			DeclineAge+=25
			Body=25
			MaxKi+=300
			spacebreather=1
			Str+=100
			Pow+=100
			Spd+=100
			End+=100
			Offense+=100
			Defense+=100
			GravMastered+=10*GravMod
			f2=0
			f3=0
			f4=0
			ssj=0
			usr.techxp+=10
			usr.Tech_Up()
			AndroidChoice=0
		else usr<<"[src] declines your offer."
mob/var/tmp/AndroidChoice

obj/Clone_Machine
	New()
		..()
		while(src)
			if(!Reviving) for(var/mob/A) if(A.client) if(A==Initiator&&Energy>=1&&A.dead)
				Reviving=1
				view(src)<<"[src]: Cloning session activated. Revival in [10/Speed] minutes."
				A<<"Your cloning machine has detected your fatality, it is attempting to resurrect you."
				A<<"This will take [10/Speed] minutes."
				sleep(6000/Speed)
				if(prob(50/Failure)) if(A) A<<"The cloning process failed."
				else if(A)
					A.loc=locate(x,y,z)
					A.dir=SOUTH
					view(src)<<"[src]: Cloning successful."
					A.overlays-='Obj Halo.dmi'
					A.dead=0
					Energy-=1
					view(src)<<"[round((Energy/MaxEnergy)*100)]% Energy remaining."
				break
			sleep(600)
	icon='Turfs 1.dmi'
	icon_state="Healing Tank"
	layer=MOB_LAYER+1
	density=1
	var/tmp/Reviving
	var/Failure=1 //Divisor of the 50% chance of cloning failure.
	var/Speed=1 //How long it takes before cloning is completed.
	var/Health=1 //How easily the tank is destroyed.
	var/MaxHealth=1
	var/Energy
	var/MaxEnergy=1
	var/Encryption=1
	var/Initiator
	verb/Program()
		set src in oview(1)
		set category=null
		var/Guess
		if(Password)
			Guess=input("You must know the password to reset the machine.") as text
			if(Guess!=Password)
				usr<<"Access denied."
				return
		Initiator=usr
		usr<<"Reset to clone [usr] if fatality occurs."
	verb/Info()
		set src in oview(1)
		set category=null
		usr<<"Armor: [Health*100] / [MaxHealth*100]"
		usr<<"Energy: [Energy*100] / [MaxEnergy*100]"
		usr<<"Cloning Speed: [Speed]"
		usr<<"Failure Chance: [round(50/Failure)]"
		if(Password) usr<<"Password Encryption: [Encryption]"
		usr<<"Cost to make: [techcost]z"
	verb/Upgrade()
		set src in oview(1)
		set category=null
		if(usr.KO) return
		var/cost=0
		var/list/Choices=new/list
		Choices.Add("Cancel")
		if(usr.zenni>=1000*Speed) Choices.Add("Clone Time ([1000*Speed]z)")
		if(usr.zenni>=1000*Failure) Choices.Add("Chance of Failure ([1000*Failure]z)")
		if(usr.zenni>=1000*MaxEnergy) Choices.Add("Battery Expansion ([1000*MaxEnergy]z)")
		if(usr.zenni>=100*MaxHealth) Choices.Add("Durability ([100*MaxHealth]z)")
		if(usr.zenni>=1000&&!Password) Choices.Add("Security Password (1000z)")
		if(usr.zenni>=200*Encryption&&Password) Choices.Add("Encryption ([200*Encryption]z)")
		var/A=input("Upgrade what?") in Choices
		if(A=="Cancel") return
		if(A=="Encryption ([200*Encryption]z)")
			cost=200*Encryption
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Password Encryption level increased."
			Encryption+=1
		if(A=="Security Password (1000z)")
			cost=1000
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			Password=input("Set the machine's permanent access code.") as text
			usr<<"Password set."
		if(A=="Clone Time ([1000*Speed]z)")
			cost=1000*Speed
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Clone Time decreased."
			Speed+=1
		if(A=="Chance of Failure ([1000*Failure]z)")
			cost=1000*Failure
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Clone Failure Chance decreased."
			Failure+=1
		if(A=="Battery Expansion ([1000*MaxEnergy]z)")
			cost=1000*MaxEnergy
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Energy Core expanded. Full Energy restored."
			MaxEnergy+=1
			Energy=MaxEnergy
		if(A=="Durability ([100*MaxHealth]z)")
			cost=100*MaxHealth
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Durability increased. Full Armor restored."
			MaxHealth+=1
			Health=MaxHealth
		usr<<"Cost: [cost]z"
		usr.zenni-=cost
		usr.techxp+=round(cost*0.1)
		usr.Tech_Up()
		tech+=1
		techcost+=cost
		icon='Turfs 1.dmi'
		icon_state="Healing Tank"
		layer=MOB_LAYER+1
		density=1
mob/var/creating
mob/verb/Create()
	set category="Skills"
	if(creating)
		creating=0
		usr<<"Creating off"
		for(var/obj/Creatables/A in contents) del(A)
	else
		creating=1
		usr<<"Creating on"
		for(var/A in typesof(/obj/Creatables)) new A(src)
		for(var/obj/Creatables/A in contents) if(techskill<A.neededtech|name=="Creatables") del(A)
obj/Creatables
	var/neededtech=1
	var/cost=1
	New()
		..()
		suffix="[cost]z"
		if(cost==1) del(src)
	Armor
		cost=50
		neededtech=1 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Armor(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				var/list/Styles=new/list
				if(usr.techskill>1)
					Styles.Add("Plain")
				if(usr.techskill>3)
					Styles.Add("Single Pad")
				if(usr.techskill>5)
					Styles.Add("Black")
				if(usr.techskill>7)
					Styles.Add("Rit")
				if(usr.techskill>9)
					Styles.Add("Turles Style")
				if(usr.techskill>11)
					Styles.Add("Tomat Style")
				if(usr.techskill>13)
					Styles.Add("Full Rit")
				if(usr.techskill>15)
					Styles.Add("Elite Armor")
				if(usr.techskill>17)
					Styles.Add("Shoulder")
				if(usr.techskill>19)
					Styles.Add("Yardrat Style")
				if(usr.techskill>21)
					Styles.Add("Bardock Style")
				var/Z=input("What style?") in Styles
				if(A)
					if(Z=="Plain")
						A.armorincrease=1.15
						A.armordecrease=0.95
						A.icon='Clothes_Armor2.dmi'
					if(Z=="Single Pad")
						A.armorincrease=1.25
						A.armordecrease=0.92
						A.icon='Clothes_Armor1.dmi'
					if(Z=="Bardock Style")
						A.armorincrease=1.95
						A.armordecrease=0.65
						A.icon='Armor_Bardock.dmi'
					if(Z=="Black")
						A.armorincrease=1.45
						A.armordecrease=0.91
						A.icon='Armor_Black.dmi'
					if(Z=="Rit")
						A.armorincrease=1.55
						A.armordecrease=0.9
						A.icon='Armor_Rit2.dmi'
					if(Z=="Turles Style")
						A.armorincrease=1.65
						A.armordecrease=0.85
						A.icon='Armor_Turles.dmi'
					if(Z=="Tomat Style")
						A.armorincrease=1.7
						A.armordecrease=0.8
						A.icon='Armor-Tomat.dmi'
					if(Z=="Full Rit")
						A.armorincrease=1.75
						A.armordecrease=0.75
						A.icon='Armor_Rit1.dmi'
					if(Z=="Elite Armor")
						A.armorincrease=1.85
						A.armordecrease=0.72
						A.icon='Armor_Elite.dmi'
					if(Z=="Shoulder")
						A.armorincrease=1.9
						A.armordecrease=0.75
						A.icon='Armor-Sirch1.dmi'
					if(Z=="Yardrat Style")
						A.armorincrease=1.95
						A.armordecrease=0.7
						A.icon='Armor Yardrat.dmi'
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You don't have enough money."
	MP3Player
		cost=100
		neededtech=5
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/MP3(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You don't have enough money."
	PDA
		cost=100
		neededtech=6 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/PDA(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Blaster
		cost=300
		neededtech=8 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Blaster(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Artificial_Moon
		cost=700
		neededtech=12 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Artificial_Moon(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	BattleStaff
		cost=900
		neededtech=15
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Staff(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Sword
		cost=1100
		neededtech=18 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Sword(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Axe
		cost=1200
		neededtech=21
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Axe(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Powersword
		cost=1500
		neededtech=25
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Powersword(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Machineblade
		cost=2000
		neededtech=30
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Machineblade(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Scouter
		cost=1000
		neededtech=16 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Scouter(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Scouter_Shades
		cost=1100
		neededtech=20
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Scouter_Shades(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Scouter_Contacts
		cost=1200
		neededtech=25
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Scouter_Contacts(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Regenerator
		cost=6000
		neededtech=40 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				usr.techxp+=round(cost*0.1)
				var/obj/A=new/obj/items/Regenerator(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Gravity
		cost=4000
		neededtech=30 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				usr.techxp+=round(cost*0.1)
				var/obj/A=new/obj/items/Gravity(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Spacepod
		cost=7500
		neededtech=30 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Spacepod(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	TrainingDummy
		cost=10000
		neededtech=50
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				usr.techxp+=round(cost*0.1)
				var/obj/A=new/mob/Dummy(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.Tech_Up()
			else usr<<"You dont have enough money"
	Emitter
		cost=25000
		neededtech=75 //Deletes itself from contents if the usr doesnt have the needed tech
		Click()
			if(usr.zenni>=cost)
				usr.zenni-=cost
				var/obj/A=new/obj/items/Emitter(locate(usr.x,usr.y,usr.z))
				A.techcost+=cost
				usr.techxp+=round(cost*0.1)
				usr.Tech_Up()
			else usr<<"You dont have enough money"
mob/var/tmp/sim=0
mob/var/tmp/targetmob=null
obj/var/Bolted
mob/var/tmp/inpod
obj/var
	tech=0
	techcost=0 //Tells how much money it took to upgrade it to this level.
obj/items/Spacepod
	density=1
	layer=MOB_LAYER+1
	icon='Spacepod.dmi'
	var/Speed=1 //divisor of the probability of delay (*100) the pod will have when it moves.
	var/PassWord
	var/PassLevel=1
	verb/Launch()
		set category=null
		set src in oview(1)
		if(PassWord)
			var/pass=input("You must know the launch password") as text
			if(pass!=PassWord)
				view(usr)<<"[usr] tried to guess the [src]'s password, but fails."
				return
		if(usr.z==15|usr.z==17|usr.z==16|z==19|z==21|z==22)
			usr<<"You can't do this in the After Life."
			return
		usr.spacebreather=1
		view(usr)<<"[usr] launches into space!"
		loc=locate(rand(20,330),rand(20,330),7)
		usr.loc=locate(x,y,z)
		usr.move=0
		usr.inpod=1
	verb/Icon()
		set category=null
		set src in oview(1)
		switch(input("What would you like your pod to look like?","", text) in list ("Arconia","Arconia Tech", "Earth","Original", "Earth Tech", "Namek", "Vegeta", "Vegeta Tech","Changeling"))
			if("Arconia")
				icon='PodArconia.dmi'
			if("Arconia Tech")
				icon='PodJungle.dmi'
			if("Earth")
				icon='PodEarth.dmi'
			if("Namek")
				icon='PodNamek.dmi'
			if("Vegeta")
				icon='PodVegeta.dmi'
			if("Vegeta Tech")
				icon='PodNewVegeta.dmi'
			if("Changeling")
				icon='PodChangeling.dmi'
			if("Earth Tech")
				icon='PodDesert.dmi'
			if("Original")
				icon='Spacepod.dmi'
			if("Cancel")
				return
	verb/Destination()
		set category=null
		set src in view(0)
		if(z!=7)
			usr<<"You can only do this in space"
			return
		var/list/Choices=new/list
		Choices.Add("Cancel")
		if(Speed>=3) Choices.Add("Vegeta")
		if(Speed>=4) Choices.Add("Earth")
		if(Speed>=4) Choices.Add("Namek")
		if(Speed>=3) Choices.Add("Arconia")
		if(Speed>=2) Choices.Add("Changeling Planet")
		if(Speed>=1) Choices.Add("Android Ship")
		if(Speed>=3) Choices.Add("Station")
		if(Speed>=18) Choices.Add("Jungle Planet")
		if(Speed>=17) Choices.Add("Desert Planet")
		if(Speed>=30) Choices.Add("Sky World")
		var/A=input("Go where?") in Choices
		if(A=="Station")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(170,215,9)
		if(A=="Earth")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),1)
		if(A=="Namek")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),3)
			usr.spacebreather=0
		if(A=="Vegeta")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),4)
			usr.spacebreather=0
		if(A=="Arconia")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),5)
			usr.spacebreather=0
		if(A=="Changeling Planet")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),6)
			usr.spacebreather=0
		if(A=="Android Ship")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(63,308,8)
			usr.spacebreather=0
		if(A=="Jungle Planet")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),10)
			usr.spacebreather=0
		if(A=="Desert Planet")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),12)
			usr.spacebreather=0
		if(A=="Sky World")
			usr<<"ETA [5/Speed] minutes"
			sleep(3000/Speed)
			spawn(1) usr.loc=locate(x,y,z)
			usr.move=1
			usr.inpod=0
			loc=locate(rand(1,350),rand(1,350),11)
			usr.spacebreather=0
	verb/Info()
		set src in oview(1)
		set category=null
		usr<<"Speed: [Speed]"
		if(PassWord) usr<<"Anti-Theft Password: [PassLevel]"
		usr<<"Cost to make: [techcost]z"
	verb/Upgrade()
		set src in oview(1)
		set category=null
		var/cost=0
		var/list/Choices=new/list
		Choices.Add("Cancel")
		if(usr.zenni>=1000*Speed) Choices.Add("Speed ([1000*Speed]z)")
		if(usr.zenni>1000&&usr.techskill>3) Choices.Add("Anti-Theft Password & Encyption ([300*PassLevel]z)")
		var/A=input("Upgrade what?") in Choices
		if(A=="Anti-Theft Password & Encyption ([300*PassLevel]z)")
			cost=300*PassLevel
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			if(!PassWord) usr<<"Password installed"
			else usr<<"Password Encryption enhanced."
			if(!PassWord) PassWord=input(usr,"Enter a permanent password.") as text
			PassLevel+=1
		if(A=="Cancel") return
		if(A=="Speed ([1000*Speed]z)")
			cost=1000*Speed
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Speed increased."
			Speed+=1
		usr<<"Cost: [cost]z"
		usr.zenni-=cost
		usr.techxp+=round(cost*0.01)
		usr.Tech_Up()
		tech+=1
		techcost+=cost
obj/Planets
	icon='Planets.dmi'
	density=1
	New()
		..()
		name="[icon_state]"
		spawn(10) new/turf/Ground8(locate(x,y,z))
		spawn(20) for(var/turf/T in view(0,src))
			T.icon='Misc.dmi'
			T.icon_state="Stars"
mob/var/tmp/choosinggrav=0
obj/items/Gravity
	layer=MOB_LAYER+5
	New()
		..()
		while(src)
			if(Grav>0)
				var/image/I=image(icon='Gravity Field.dmi',layer=MOB_LAYER+5)
				Energy-=Grav*0.01
				if(prob(5/Efficiency))
					view(src)<<"[src]: Unknown error. Unable to sustain field control."
					for(var/turf/B in view(Range,src))
						B.overlays.Remove(I)
						B.gravity=0
					Grav=0
				if(Energy<=0)
					Energy=0
					Grav=0
					view(src)<<"[src]: Battery is completely drained. Shutting down..."
					for(var/turf/B in view(Range,src))
						B.overlays.Remove(I)
						B.gravity=0
				for(var/turf/A in view(Range,src))
					A.gravity=Grav+rand(-50/Stability,50/Stability)
					if(A.gravity<0) A.gravity=0
				del(I)
			else if(prob(NanoCore))
				Energy=MaxEnergy
				view(src)<<"[src]: Nanites activated. Energy fully restored. This feature will only work if the [src] is off."
			sleep(300)
	density=1
	desc="Place this anywhere on the ground to use it, it will affect anything within its radius."
	var/Max=10
	var/Grav=1
	var/Range=0
	var/Stability=1
	var/Efficiency=1
	var/Energy=1
	var/MaxEnergy=1
	var/NanoCore=1
	icon='Scan Machine.dmi'
	verb/Info()
		set src in oview(1)
		set category=null
		usr<<"Field Strength: [Max]x"
		usr<<"Battery: [Energy*100] / [MaxEnergy*100]"
		usr<<"Field Range: [Range]"
		usr<<"Field Fluctuation Control: [Stability]"
		usr<<"Shutdown Protection: [Efficiency]"
		if(NanoCore) usr<<"Nanite Energy Regeneration: [NanoCore]"
		usr<<"Cost to make: [techcost]z"
	verb/Upgrade()
		set src in oview(1)
		set category=null
		if(usr.KO) return
		var/cost=0
		var/list/Choices=new/list
		Choices.Add("Cancel")
		if(usr.zenni>=10*Max) Choices.Add("Field Strength ([10*Max]z)")
		if(usr.zenni>=100*MaxEnergy) Choices.Add("Battery Life ([100*MaxEnergy]z)")
		if(usr.zenni>=5000*(Range+1)) Choices.Add("Field Range ([5000*(Range+1)]z)")
		if(usr.zenni>=250*Stability) Choices.Add("Field Fluctuation ([250*Stability]z)")
		if(usr.zenni>=500*Efficiency) Choices.Add("Shutdown Protection ([500*Efficiency]z)")
		if(usr.zenni>=3000*(NanoCore+1)&&usr.techskill>=6) Choices.Add("Nanite Regeneration ([3000*(NanoCore+1)]z)")
		var/A=input("Upgrade what?") in Choices
		if(A=="Cancel") return
		if(A=="Field Strength ([10*Max]z)")
			cost=10*Max
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Field Strength increased."
			Max=round(Max*1.2)
		if(A=="Battery Life ([100*(MaxEnergy)]z)")
			cost=100*MaxEnergy
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Battery expanded and recharged."
			MaxEnergy+=1
			Energy=MaxEnergy
		if(A=="Field Range ([5000*(Range+1)]z)")
			cost=5000*(Range+1)
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Field Range increased."
			Range+=1
		if(A=="Field Fluctuation ([250*Stability]z)")
			cost=250*Stability
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Field Stability increased."
			Stability+=1
		if(A=="Shutdown Protection ([500*Efficiency]z)")
			cost=500*Efficiency
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Random Error Shutdown chance decreased."
			Efficiency+=1
		if(A=="Nanite Regeneration ([3000*(NanoCore+1)]z)")
			cost=3000*(NanoCore+1)
			if(usr.zenni<cost)
				usr<<"You do not have enough money ([cost]z)"
				return
			usr<<"Nano Regeneration increased."
			NanoCore+=1
		usr<<"Cost: [cost]z"
		usr.zenni-=cost
		usr.techxp+=round(cost*0.01)
		usr.Tech_Up()
		tech+=1
		techcost+=cost
	Click()
		if(Energy<1)
			usr<<"The machine has no battery left..."
			return
		var/inview
		for(var/mob/M in view(1,src)) if(M==usr)
			inview=1
			break
		if(inview)
			if(!usr.choosinggrav)
				usr.choosinggrav=1
				Grav=input("Current grav is [Grav]x. You can set the gravity multiplier by using this panel. Be aware that the level of gravity affects everyone in the room. Maxgrav is [Max]x") as num
				for(var/mob/A in view(src)) A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [usr]([usr.key]) sets the gravity to [Grav]x.<br>
</body><html>"}
				if(usr.choosinggrav&&Energy>=1)
					if(Grav>Max) Grav=Max
					if(Grav<0) Grav=0
					if(!Grav) view(src)<<"<center>[usr] sets the Gravity multiplier to normal."
					else view(src)<<"<center>[usr] sets the Gravity multiplier to [Grav]x"
					usr.choosinggrav=0
					var/image/I=image(icon='Gravity Field.dmi',layer=MOB_LAYER+5)
					for(var/turf/G in view(Range,src))
						G.overlays.Remove(I)
						if(Grav>1) G.overlays.Add(I)
						G.gravity=Grav
				else if(usr.choosinggrav&&Energy<=1)
					usr.choosinggrav=0
					Grav=0
	verb/Bolt()
		set category=null
		set src in oview(1)
		if(x&&y&&z&&!Bolted)
			switch(input("Are you sure you want to bolt this to the ground so nobody can ever pick it up? Not even you?","",text) in list("Yes","No",))
				if("Yes")
					view(src)<<"<font size=1>[usr] bolts the [src] to the ground."
					Bolted=1
turf/var/gravity=0 //1x the normal planet grav, which varies.
