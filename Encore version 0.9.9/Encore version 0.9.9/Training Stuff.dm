mob/var
	tmp/train=0
	tmp/med=0
	gotbodyexpand
mob/proc/Train_Gain()
	if(Class!="Bebi")
		if(Race=="Makyojin"&&(Str+End)>=2&&!gotbodyexpand)
			var/chance=rand(1,10000)
			if(chance==1000)
				gotbodyexpand=1
				contents+=new/obj/Skills/Body_Expand
				usr<<"<font color=red>You can now use the body expand ability."
	var/gravincrease
	if(planetgrav*gravmult<GravMastered) gravincrease=(GravMastered/10)+1
	else gravincrease=((planetgrav*gravmult)/10)+1
	RecordPL+=3*BPRank*GG*gain*PLMod*gravincrease*HBTCMod*weight*weight*TrainMod*timemult
	MaxKi+=0.0004*KiMod*timemult
	if(pfocus=="Balanced"&&RPFight==0)
		if(prob(10)) Str+=0.0015*StrMod*timemult*StatRank
		if(prob(10)) End+=0.0015*EndMod*timemult*StatRank
		if(prob(10)) Spd+=0.0015*SpdMod*timemult*StatRank
	else
		Str+=0
		End+=0
		Spd+=0
	if(prob(10))
		gain+=gainget*timemult/2
mob/verb/Train()
	set category="Skills"
	if(!med&&!KO)
		if(!train&&Ki>=1&&move)
			usr<<"You begin to train."
			dir=SOUTH
			train=1
			if(Savable) icon_state="Train"
			move=0
		else
			usr<<"You stop training."
			train=0
			if(Savable) icon_state=""
			move=1
mob/var
	gotmystic=0 //these are whether the race below got their
	gottelepathy=0
	gotfuse=0
	gotDTeleport=0
	gotsense
	gotsense2
	gotsense3
mob/proc/Med_Gain()
	if(Class!="Bebi")
		if(prob(0.1)) if(Race=="Spirit Doll"&&kimanip>=50)
			var/hasSD
			for(var/obj/Skills/Self_Destruct/A in contents) hasSD=1
			if(!hasSD)
				usr<<"You learned Self Destruct"
				contents+=new/obj/Skills/Self_Destruct
		if(Race=="Namekian"|Race=="Kai") if(!hasmaterialization&&kimanip>=8)
			hasmaterialization=1
			usr<<"You have learned Materialization and Healing."
			contents+=new/obj/Skills/Heal
			contents+=new/obj/Skills/Materialization
		if(Race=="Yukeno-Jin") if(!hasmaterialization&&kimanip>=3)
			hasmaterialization=1
			usr<<"You have leanred Materialization"
			contents+=new/obj/Skills/Materialization
		if(Race=="Kai"|Class=="Kai") if(!gotmystic&&Offense+Defense>=30&&MaxKi>=50)
			contents+=new/obj/Skills/Mystic
			contents+=new/obj/Skills/Teleport
			contents+=new/obj/Skills/Heal
			gotmystic=1
		if(Race=="Namekian"&&!gotfuse&&prob(0.005)&&MaxKi>3000&&kimanip>150)
			contents+=new/obj/Skills/Namekian_Fusion
			gotfuse=1
		if(Race=="Demon"&&Ranked==0&&kimanip>200)
			contents+=new/obj/Skills/DTeleport
			gotDTeleport=1
		if(!gottelepathy&&Race!="Majin")
			if(Race=="Namekian"|Race=="Human") if(MaxKi>=15)
				contents+=new/obj/Skills/Telepathy
				gottelepathy=1
			else if(MaxKi>=50|kimanip>=5)
				contents+=new/obj/Skills/Telepathy
				gottelepathy=1
		if(!gotsense)
			if(Race=="Changeling"&&MaxKi>=2000)
				contents+=new/obj/Skills/Sense
				gotsense=1
			else if(Race=="Namekian"|Race=="Human") if(MaxKi>=150)
				contents+=new/obj/Skills/Sense
				gotsense=1
			else if(MaxKi>=300)
				contents+=new/obj/Skills/Sense
				gotsense=1
		if(!gotsense2)
			if(Race=="Changeling") if(MaxKi>=300)
				contents+=new/obj/Skills/Sense2
				gotsense2=1
			else if(Race=="Namekian" | Race=="Human") if(MaxKi>=500)
				contents+=new/obj/Skills/Sense2
				gotsense2=1
			else if(MaxKi>=1000)
				contents+=new/obj/Skills/Sense2
				gotsense2=1
		if(!gotsense3)
			if(Race=="Changeling") if(MaxKi>=3000)
				contents+=new/obj/Skills/Sense3
				gotsense3=1
			else if(Race=="Namekian" | Race=="Human") if(MaxKi>=1000)
				contents+=new/obj/Skills/Sense3
				gotsense3=1
			else if(MaxKi>=2000)
				contents+=new/obj/Skills/Sense3
				gotsense3=1
		if(Race=="Namekian"&&RecordPL*25>=snjat) if(!snj&&kimanip>=150&&flightskill>=2000&&MaxPLpcnt>=200) SNj()
	var/gravincrease
	if(planetgrav*gravmult<GravMastered) gravincrease=(GravMastered/10)+1
	else gravincrease=(planetgrav*gravmult/10)+1
	RecordPL+=1.5*BPRank*GG*gain*PLMod*gravincrease*HBTCMod*weight*MedMod*timemult
	MaxKi+=0.0004*KiMod*timemult
	if(prob(0.001*(KiMod+KiRegen)*2))
		DeclineAge+=1
	if(sfocus=="Balanced")
		if(prob(10)) Pow+=0.001*PowMod*timemult*StatRank
		if(prob(10)) Spd+=0.001*SpdMod*timemult*StatRank
		if(prob(10)) Res+=0.002*ResMod*timemult*StatRank
	if(prob(10))
		gain+=gainget*timemult/2
mob/verb/Meditate()
	set category="Skills"
	if(!blasting&&!train&&!KO&&!Oozarou)
		if(!med&&move)
			usr<<"You begin meditating."
			dir=SOUTH
			med=1
			move=0
			if(Savable) icon_state="Meditate"
		else
			usr<<"You stop meditating."
			med=0
			move=1
			if(Savable) icon_state=""
		if(Race=="Namekian"&&RecordPL*25>=ssjat) if(hasssj<2&&kimanip>=5&&flightskill>=20&&MaxPLpcnt>=200) SNj()
mob/var/hasmaterialization
obj/Skills/Materialization/verb/Materialization()
	set category="Skills"
	var/weights=input("How heavy? Between 1 and [usr.MaxKi*10] pounds (Your race's ability with Materialization is [usr.KiMod]x the average)") as num
	if(weights>usr.MaxKi*10) weights=usr.MaxKi*10
	if(weights<1) weights=1
	weights=round(weights)
	var/obj/items/A=new/obj/items/Weighted_Gi
	switch(input("What kind of weights would you like to make?", "",text) in list ("Weighted Cape", "Weighted Wristbands", "Weighted Gi","Weighted Boots","Weighted Jacket","Weighted Sash", "Cancel"))
		if("Weighted Cape")
			A.weight=weights
			A.name="Weighted Cape"
			A.icon='Clothes_Cape.dmi'
			var/capecolor
			capecolor+=input("Please select the color for this item.") as color
			A.icon+=capecolor
			usr.contents+=A
		if("Weighted Wristbands")
			A.weight=weights
			A.name="Weighted Wristbands"
			A.icon='Clothes_Wristband.dmi'
			var/bandcolor
			bandcolor+=input("Please select the color for this item.") as color
			A.icon+=bandcolor
			usr.contents+=A
		if("Weighted Gi")
			A.weight=weights
			A.name="Weighted Gi"
			A.icon='Clothes_TankTop.dmi'
			var/tankcolor
			tankcolor+=input("Please select the color for this item.") as color
			A.icon+=tankcolor
			usr.contents+=A
		if("Weighted Boots")
			A.weight=weights
			A.name="Weighted Boots"
			A.icon='Clothes_Boots.dmi'
			var/bootcolor
			bootcolor+=input("Please select the color for this item.") as color
			A.icon+=bootcolor
			usr.contents+=A
		if("Weighted Jacket")
			A.weight=weights
			A.name="Weighted Jacket"
			A.icon='Clothes_Jacket.dmi'
			var/jacketcolor
			jacketcolor+=input("Please select the color for this item.") as color
			A.icon+=jacketcolor
			usr.contents+=A
		if("Weighted Sash")
			A.weight=weights
			A.name="Weighted Sash"
			A.icon='Clothes_Sash.dmi'
			var/sashcolor
			sashcolor+=input("Please select the color for this item.") as color
			A.icon+=sashcolor
			usr.contents+=A
		if("Cancel")
			return
obj/Skills/Sense2/verb/Sense_Planet()
	set category="Skills"
	var/approved
	for(var/mob/M) if(M.client&&M.key!=usr.key&&M.PL>=10000&&M.z==usr.z)
		for(var/obj/Contact/A in usr.contents) if(A.name=="[M.name] ([M.key])") approved=1
		if(usr.Race=="Bebi"|usr.Race=="Android"|usr.Race=="Cyborg")
			if(approved) usr<<"<br>[M.name]([M.x],[M.y]): BP [num2text(round(M.PL),20)]"
			else usr<<"<br>([M.x],[M.y]): BP [num2text(round(M.PL),20)]"
		else if(approved) usr<<"<br>[M.name]([M.x],[M.y]): [round(((M.PL+1)/(usr.PL+1))*100)]% your power."
		else if((((M.PL+1)/(usr.PL+1))*100)>500) usr<<"<br>Unknown([M.x],[M.y]): Power beyond your comprehension."
		else usr<<"<br>([M.x],[M.y]): [round((M.PL/usr.PL)*100)]% your power."
obj/Skills/Sense3/verb/Sense_Galaxy()
	set category="Skills"
	var/approved
	for(var/mob/M) if(M.player&&M.key!=usr.key&&M.PL>=10000000)
		for(var/obj/Contact/A in usr.contents) if(A.name=="[M.name] ([M.key])") approved=1
		if(usr.Race=="Bebi"|usr.Race=="Android"|usr.Race=="Cyborg")
			if(approved) usr<<"You detect [M.name] at (z[M.z])"
			else usr<<"You detect Unknown at (z[M.z])"
		else if(approved) usr<<"You sense [M.name] at (z[M.z])"
		else usr<<"You sense someone at (z[M.z])"
mob/var
	Advantage
	Disadvantage
mob/proc/Senseproc()
	Advantage=max(Defense,Offense,Res,End,Spd,Pow,Str)
	if(Advantage==Defense) Advantage="Defense"
	if(Advantage==Offense) Advantage="Offense"
	if(Advantage==Res) Advantage="Resistance"
	if(Advantage==End) Advantage="Endurance"
	if(Advantage==Spd) Advantage="Speed"
	if(Advantage==Pow) Advantage="Force"
	if(Advantage==Str) Advantage="Strength"

	Disadvantage=min(Defense,Offense,Res,End,Spd,Pow,Str)
	if(Disadvantage==Defense) Disadvantage="Defense"
	if(Disadvantage==Offense) Disadvantage="Offense"
	if(Disadvantage==Res) Disadvantage="Resistance"
	if(Disadvantage==End) Disadvantage="Endurance"
	if(Disadvantage==Spd) Disadvantage="Speed"
	if(Disadvantage==Pow) Disadvantage="Force"
	if(Disadvantage==Str) Disadvantage="Strength"
obj/Skills/Sense/verb/Sense(mob/M in view(usr))
	set category="Skills"
	M.Senseproc()
	var/range=(2000/(usr.Offense+usr.Defense)) //Sensing accuracy. By the time you get sense, it ranges by +/- 20
	if(range<1) range=0 //Perfection of accurate sensing.
	usr<<"<br>"
	if(usr.Race=="Bebi"|usr.Race=="Android"|usr.Race=="Cyborg")
		usr<<"Battle Power, [num2text(round(M.PL),20)]"
		if(M.Race=="Cyborg"|M.Race=="Android") usr<<"Class [M.techrate] [M.Race]"
	else if(M.Race=="Bebi"|M.Race=="Android") usr<<"You cant sense any energy from [M]..."
	else if((((M.PL+1)/(usr.PL+1))*100)>500) usr<<"[M] is more than 500% your power."
	else usr<<"[M] is around [round((((M.PL+1)/(usr.PL+1))*100)+rand((0-range),range))]% your power."
	usr<<"[M.Emotion], [round(M.Age)] year old [M.BodyType]"
	usr<<"<br>"
	if(usr.Defense*usr.KiMod>300) usr<<"Advantage is [M.Advantage]"
	if(usr.Offense*usr.KiMod>300) usr<<"Disadvantage is [M.Disadvantage]"
	usr<<"<br>"
	if(usr.Offense*usr.KiMod>1000)
		var/damage=round((100-M.HP)+rand((0-range),range))
		usr<<"[damage]% damaged."
	if(usr.Defense*usr.KiMod>1000)
		var/energy=round(((M.Ki*100)/M.MaxKi)+rand((0-range),range))
		usr<<"[energy]% energy."
	usr<<"<br>"
	if(usr.thirdeye|usr.snj|usr.kimanip>=150)
		usr<<"Body is at [round(M.Body*4)]% of its full potential"
		if(showstats)
			usr<<"[M] has [round(M.MaxKi)] Max Energy."
			usr<<"[M] has [round(M.Str)] Strength"
			usr<<"[M] has [round(M.End)] Endurance"
			usr<<"[M] has [round(M.Pow)] Force"
			usr<<"[M] has [round(M.Res)] Resistance"
			usr<<"[M] has [round(M.Spd)] Speed"
			usr<<"[M] has [round(M.Offense)] Offense"
			usr<<"[M] has [round(M.Defense)] Defense"
		else
			usr<<"[M] has [round(M.strpcnt)]% Strength"
			usr<<"[M] has [round(M.endpcnt)]% Endurance"
			usr<<"[M] has [round(M.powpcnt)]% Force"
			usr<<"[M] has [round(M.respcnt)]% Resistance"
			usr<<"[M] has [round(M.spdpcnt)]% Speed"
			usr<<"[M] has [round(M.offpcnt)]% Offense"
			usr<<"[M] has [round(M.defpcnt)]% Defense"
mob/proc/Learn()
	//Learning from others...
	for(var/mob/A in oview()) if(A.client)
		if(A.blasting)
			for(var/obj/KiAttacks/Basic/B in contents) return
			src<<"You have learned the basics of energy use from watching [A]!"
			contents+=new/obj/KiAttacks/Basic
		if(A.haszanzo&&!haszanzo)
			if(prob(kimanip**18))
				src<<"You have learned the basics of zanzoken from watching [A]!"
				haszanzo=1
		if(A.flight)
			for(var/obj/Skills/Fly/B in contents) return
			if(prob(kimanip**12))
				src<<"You have learned the basics of energy flight from watching [A]!"
				contents+=new/obj/Skills/Fly
		if(A.powerup)
			for(var/obj/Skills/Power_Control/B in contents) return
			if(prob(kimanip**10))
				src<<"You have learned the basics of energy control from watching [A]!"
				contents+=new/obj/Skills/Power_Control
	//Learning on your own...
	if(prob(5*kimanip))
		if(prob(50))
			for(var/obj/KiAttacks/Basic/B in contents) return
			contents+=new/obj/KiAttacks/Basic
			src<<"You have learned to use energy on your own."
		if(prob(kimanip**18)&&!haszanzo)
			haszanzo=1
			src<<"You have learned zanzoken on your own."
		if(prob(kimanip**12))
			for(var/obj/Skills/Fly/B in contents) return
			contents+=new/obj/Skills/Fly
			src<<"You have learned the basics of energy flight on your own."
		if(prob(50))
			for(var/obj/Skills/Power_Control/B in contents) return
			src<<"You have learned energy control on your own."
			contents+=new/obj/Skills/Power_Control
mob/var
	regen=0
	tmp/healing=0
	healskill=1
	healmod=1
obj/Skills/Heal/verb/Heal(mob/M in oview(1))
	set category="Skills"
	if(!usr.healing && usr.Ki>=(usr.MaxKi/usr.healskill))
		usr.healing=1
		oview(usr)<<"[usr] heals [M]."
		usr<<"You heal [M]."
		M.Un_KO()
		M.HP=100
		M.Ki=M.MaxKi

		//---
		usr.HP-=30
		usr.Ki-=(usr.MaxKi/usr.healskill)
		usr.healskill+=(0.1*usr.healmod)
		sleep(50)
		usr.healing=0
obj/Skills/Regenerate/verb/Regenerate()
	set category="Skills"
	if(!usr.regen)
		usr.regen=1
		usr<<"You start to regenerate"
	else
		usr.regen=0
		usr<<"You stop regenerating"
mob/var/tmp
	planetgrav=1
	gravmult=0
mob/var
	HBTCMod=1 //Multiplies gain while in there.
	HBTCTime=18000 //-1 every sleep(1), equals 1 hour
	EnteredHBTC=0 //How many times you have been in HBTC.
mob/proc/Grav()
	if(prob(15)) GravUpdate()
	//Regular Stuff
	var/Gravity=gravmult+planetgrav
	var/Tier=round(GravMastered/100)**3
	if(Tier<1) Tier=1
	if(!KO)
		if(Gravity>GravMastered) HP-=3*((((Gravity*2)/GravMastered)-2)**2)
		GravMastered+=0.0001*Gravity*GravMod*(train+1)/Tier
		if(attacking) GravMastered+=0.0009*Gravity*GravMod*(train+1)/Tier
		spawn(100) if(prob(20)&&KO&&Gravity/GravMastered>5&&Gravity>50) Death()
	else if(GravMastered<20) if(prob(10)) GravMastered+=0.001*Gravity*GravMod
	if(GravMastered>500) GravMod=1
	//Planet Grav...
	if(z==1) planetgrav=1 //Earth
	else if(z==8) planetgrav=1 //Sky Planet
	else if(z==3) planetgrav=2 //Namek
	else if(z==6) planetgrav=5 //Changeling Planet
	else if(z==17) planetgrav=10 //Hell
	else if(z==4) planetgrav=5 //Vegeta
	else if(z==5) planetgrav=1 //Arconia
	else if(z==15) planetgrav=1 //Checkpoint
	else if(z==16) planetgrav=1 //Heaven
	else if(z==9) planetgrav=1 //Space Station
	else if(z==19) planetgrav=20 //HBTC
	else if(z==18) planetgrav=10 //Dead Zone
	else if(z==26) planetgrav=1 //Earth Guardian Tower
	else if(z==21) planetgrav=5 //Cardinal Planets
	else if(z==22) planetgrav=10 //SPK Planet
	else if(z==20) planetgrav=5 //Vegeta Caves
	else if(z==23) planetgrav=1 //Arconia Caves
	else if(z==24) planetgrav=2 //Namek Caves
	else if(z==25) planetgrav=5 //Makyo Star
	else if(z==12) planetgrav=5 //Desert World
	else if(z==10) planetgrav=5 //Jungle World
	else if(z==14) planetgrav=1 //prison/pres armory