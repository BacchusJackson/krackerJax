mob/var
	taxtimer=0
	bounty=0
	Ranked=0
mob/proc/CheckRank()
	if(Turtle==key) Turtle=null
	if(Crane==key) Crane=null
	if(Changeling_Lord==key) Changeling_Lord=null
	if(Demon_Lord==key) Demon_Lord=null
	if(Earth_Guardian==key) Earth_Guardian=null
	if(Korin==key) Korin=null
	if(Namekian_Elder==key) Namekian_Elder=null
	if(Daemon_Commander==key) Daemon_Commander=null
	if(Daemon_General==key) Daemon_General=null
	if(North_Kaio==key) North_Kaio=null
	if(South_Kaio==key) South_Kaio=null
	if(East_Kaio==key) East_Kaio=null
	if(West_Kaio==key) West_Kaio=null
	if(Supreme_Kaio==key) Supreme_Kaio=null
	if(King_of_Vegeta==key) King_of_Vegeta=null
	if(President==key) President=null
	if(Changeling_Lord==key) Changeling_Lord=null
	if(Android_Commander==key) Android_Commander=null
	if(King_Yemma==key) King_Yemma=null
	if(King_of_Arconia==key) King_of_Arconia=null
	if(Drunken_Master==key) Drunken_Master=null
	if(Justicar==key) Justicar=null
	if(Arbiter==key) Arbiter=null
obj/RankChat/verb/RankChat(msg as text)
	set category="Rank"
	for(var/mob/A) for(var/obj/RankChat/B in A.contents) if(A.Rankon)  A<<"<font size=[A.TextSize]><font color=#FF5500>(RankChat)[usr.name]: [html_encode(msg)]"
mob/proc/Rank_Verb_Assign()
	for(var/obj/RankChat/A in contents) del(A)
	if(Admin) contents+=new/obj/RankChat
	if(Admin) verbs+=/mob/Rank/verb/Toggle_RankChat
	if(Justicar==key)
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		verbs+=/mob/Skills/verb/Divine_Teleport
		verbs+=/obj/Skills/Heal/verb/Heal
		verbs+=/obj/Skills/Materialization/verb/Materialization
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Toggle_RankChat
	if(Arbiter==key)
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		verbs+=/mob/Skills/verb/Infernal_Teleport
		verbs+=/obj/Skills/Heal/verb/Heal
		verbs+=/obj/Skills/Materialization/verb/Materialization
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Toggle_RankChat
	if(Drunken_Master==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/MakeTrench
		verbs+=/mob/Rank/verb/Drunken_Boxing
		verbs+=/mob/Rank/verb/Produce_Beer
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/TeachCorkscrew
	if(Daemon_General==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Skills/verb/Demon_Teleport
		verbs+=/mob/Skills/verb/Demon_Revive
		verbs+=/mob/Rank/verb/TeachUnleash_Rage
		contents+=new/obj/RankChat
	if(Daemon_Commander==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Skills/verb/Demon_Teleport
		verbs+=/mob/Skills/verb/Demon_Revive
		verbs+=/mob/Rank/verb/TeachKaioken
		contents+=new/obj/RankChat
	if(King_of_Arconia==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/MakeMight
		verbs+=/mob/Rank/verb/SetArconiaTax
		verbs+=/mob/Rank/verb/CollectArconiaTax
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		contents+=new/obj/RankChat
		verbs+=/mob/Admin1/verb/Narrate
	if(Changeling_Lord==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/SetCPTax
		verbs+=/mob/Rank/verb/CollectCPTax
		contents+=new/obj/RankChat
		contents+=new/obj/Skills/Power_Control
		verbs+=/mob/Rank/verb/TeachDeathBall
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		verbs+=/mob/Admin1/verb/Narrate
	if(King_Yemma==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/MakeYemma
		contents+=new/obj/PlayerLog
		contents+=new/obj/Skills/Yemma_Port
		contents+=new/obj/RankChat
		verbs+=/mob/Admin1/verb/Dead
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Narrate
	if(Android_Commander==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		contents+=new/obj/Skills/Snare
		contents+=new/obj/Skills/Sense4
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		verbs+=/mob/Admin1/verb/Narrate
	if(Crane==key)
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/MakeWeights
		verbs+=/mob/Rank/verb/TeachDodompa
		verbs+=/mob/Rank/verb/TeachTaiyoken
		verbs+=/mob/Rank/verb/TeachSplitForm
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/CreatePbag
		contents+=new/obj/Skills/Energy_Immersion
	if(Turtle==key)
		verbs+=/mob/Rank/verb/Make_Shell
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/TeachKamehameha
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/TeachSplitForm
		verbs+=/mob/Rank/verb/CreatePbag
		contents+=new/obj/RankChat
		contents+=new/obj/Skills/Body_Expand
	if(Demon_Lord==key)
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Skills/verb/Enslave
		verbs+=/mob/Rank/verb/MakeAmulet
		verbs+=/mob/Skills/verb/Demon_Teleport
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/Reincarnate
		if(Race=="Demon")
			verbs+=/mob/Rank/verb/Unlock_Potential
			verbs+=/mob/Skills/verb/Demon_Revive
			contents-=/obj/Skills/DTeleport
			gotDTeleport=0
			/*
			for(var/verb/Unlock_Potential/A in contents) del(A)
			*/
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
	if(Supreme_Kaio==key)
		/*
		for(var/obj/Skills/Unlock_Potential/A in contents) del(A)
		*/
		verbs+=/mob/Rank/verb/Unlock_Potential
		verbs+=/mob/Rank/verb/Mystify
		verbs+=/mob/Rank/verb/Go_To_Planet
		verbs+=/mob/Rank/verb/Restore_Youth
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/Reincarnate
		verbs+=/mob/Rank/verb/Toggle_RankChat
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		contents+=new/obj/Skills/Kaio_Revive
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
	if(King_of_Vegeta==key)
		verbs+=/mob/Rank/verb/SetVegetaTax
		verbs+=/mob/Rank/verb/CollectVegetaTax
		contents+=new/obj/RankChat
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/TeachFinalFlash
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/View_Bounties
	if(President==key)
		verbs+=/mob/Rank/verb/SetEarthTax
		verbs+=/mob/Rank/verb/CollectEarthTax
		verbs+=/mob/Admin1/verb/Narrate
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/Bunker
	if(West_Kaio==key)
		verbs+=/mob/Rank/verb/Go_To_Planet
		verbs+=/mob/Rank/verb/TeachUnleash_Rage
		verbs+=/mob/Rank/verb/Toggle_RankChat
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/TeachBusterBarrage
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
		contents+=new/obj/Skills/Kaio_Revive
		verbs+=/mob/Rank/verb/CreatePbag
	if(East_Kaio==key)
		verbs+=/mob/Rank/verb/Go_To_Planet
		verbs+=/mob/Rank/verb/TeachBusterShell
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/TeachKiBurst
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Admin1/verb/Narrate
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		contents+=new/obj/Skills/Kaio_Revive
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
	if(South_Kaio==key)
		verbs+=/mob/Rank/verb/Go_To_Planet
		verbs+=/mob/Rank/verb/TeachEnkumei
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/TeachBodyExpand
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Admin1/verb/Narrate
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		contents+=new/obj/Skills/Kaio_Revive
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
	if(North_Kaio==key)
		verbs+=/mob/Rank/verb/Go_To_Planet
		verbs+=/mob/Rank/verb/TeachKaioken
		verbs+=/mob/Rank/verb/TeachSpiritBomb
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Admin1/verb/Narrate
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		contents+=new/obj/Skills/Kaio_Revive
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
	if(Korin==key)
		verbs+=/mob/Rank/verb/Grow_Senzu_Bean
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/MakeWeights
		verbs+=/mob/Rank/verb/Get_Radar
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		verbs+=/mob/Rank/verb/CreatePbag
		verbs+=/mob/Rank/verb/Toggle_RankChat
	if(Earth_Guardian==key)
		/*
		for(var/obj/Skills/Unlock_Potential/A in contents) del(A)
		*/
		verbs+=/mob/Rank/verb/Unlock_Potential
		verbs+=/mob/Rank/verb/Transport
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/MakeWeights
		verbs+=/mob/Rank/verb/CreatePbag
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		contents+=new/obj/Skills/Observe
		if(Race=="Namekian"|Race=="Demon"|Race=="Kai") verbs+=/mob/Rank/verb/Create_Earth_DBs
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
	if(Namekian_Elder==key)
		verbs+=/mob/Rank/verb/SetNamekTax
		verbs+=/mob/Rank/verb/CollectNamekTax
		if(Race=="Namekian") verbs+=/mob/Rank/verb/Create_Namek_DBs
		verbs+=/mob/Admin1/verb/Dead
		verbs+=/mob/Rank/verb/Toggle_RankChat
		verbs+=/mob/Admin1/verb/Narrate
		verbs+=/mob/Rank/verb/MakeWeights
		contents+=new/obj/RankChat
		verbs+=/mob/Rank/verb/Keep_Body
		/*
		for(var/obj/Skills/Unlock_Potential/A in contents) del(A)
		*/
		verbs+=/mob/Rank/verb/Unlock_Potential
		contents+=new/obj/Skills/Observe
		verbs+=/mob/Rank/verb/Place_Bounty
		verbs+=/mob/Rank/verb/View_Bounties
proc/Save_Rank()
	var/savefile/S=new("RANK")
	S["DM"]<<Drunken_Master
	S["DL"]<<Demon_Lord
	S["EG"]<<Earth_Guardian
	S["AG"]<<Korin
	S["DC"]<<Daemon_Commander
	S["DG"]<<Daemon_General
	S["NELD"]<<Namekian_Elder
	S["NK"]<<North_Kaio
	S["SK"]<<South_Kaio
	S["EK"]<<East_Kaio
	S["WK"]<<West_Kaio
	S["SPK"]<<Supreme_Kaio
	S["KOV"]<<King_of_Vegeta
	S["PRS"]<<President
	S["TURT"]<<Turtle
	S["Crane"]<<Crane
	S["HK"]<<Android_Commander
	S["Yemma"]<<King_Yemma
	S["KOA"]<<King_of_Arconia
	S["CL"]<<Changeling_Lord
	S["JS"]<<Justicar
	S["AR"]<<Arbiter
proc/Load_Rank()
	if(fexists("RANK"))
		var/savefile/S=new("RANK")
		S["DM"]>>Drunken_Master
		S["DC"]>>Daemon_Commander
		S["DG"]>>Daemon_General
		S["DL"]>>Demon_Lord
		S["EG"]>>Earth_Guardian
		S["AG"]>>Korin
		S["NELD"]>>Namekian_Elder
		S["NK"]>>North_Kaio
		S["SK"]>>South_Kaio
		S["EK"]>>East_Kaio
		S["WK"]>>West_Kaio
		S["SPK"]>>Supreme_Kaio
		S["KOV"]>>King_of_Vegeta
		S["PRS"]>>President
		S["TURT"]>>Turtle
		S["Crane"]>>Crane
		S["HK"]>>Android_Commander
		S["Yemma"]>>King_Yemma
		S["KOA"]>>King_of_Arconia
		S["CL"]>>Changeling_Lord
		S["JS"]>>Justicar
		S["AR"]>>Arbiter
var
	Drunken_Master
	Turtle //Can make shells up to 10000 pounds, can use and teach Kamehameha
	Crane
	Android_Commander //Can track and snare targets.
	King_Yemma //Can pass judgement onto people.
	Changeling_Lord
	Daemon_General
	Daemon_Commander
	Demon_Lord //Can Majinize
	Earth_Guardian //Can make HBTC Keys, can make Dragonballs if they are Namekian, Demon, or Kaio.
	Korin //Can grow Senzu Beans, Can activate Sacred Water Portal.
	GuardianPower
	Namekian_Elder //Can make Dragonballs. Keeper of 3 Dragonballs. Can assign Elders.
	ElderPower
	North_Kaio //Can teach Kaioken and Spirit Bomb.
	South_Kaio //Can teach Body Expansion. (x2 Str, x1.2 End, /1.2 Spd, -2% Stam per second.)
	East_Kaio //Can teach Ki Burst. (x2 Ki Power, -2% Stam per second.)
	West_Kaio //Can teach Self Destruction.
	Supreme_Kaio //Can grant Mystic indefinitely and teleport to Grand Kaios.
	King_of_Vegeta //Can tax up to 100 zenni an hour, assign bounties, Can observe people
	//using Crystal Ball. Can invite people to Royal Army and
	//Raise army ranks (by numbers) and decide whether or not to tax people in the army, can also
	//decommission those in the army and give them the rank of former soldier rank ??. Saiyans only.

	President //Can tax up to 30 zenni an hour, must be elected.
	//Can give Go To HQ verb, can commission and decommission police and
	//decide whether or not to tax exempt police, police retain their rank through retirement.
	//Can assign bounties.
	King_of_Arconia
	Justicar
	Arbiter
mob/Admin2/verb/GiveRank(mob/M in world)
	set category="Admin"
	switch(input("Give Rank", "", text) in list ("Earth Guardian","Korin"\
	,"Namekian Elder",\
	"Supreme Kaio","King of Vegeta","President","North Kaio","South Kaio",\
	"East Kaio","West Kaio","Demon Lord","Changeling Lord","Turtle","Crane","Daemon General","Daemon Commander","Android Commander","King Yemma","King of Arconia","Drunken Master","Justicar","Arbiter", "None",))
		if("Drunken Master")
			Drunken_Master=M.key
			Ranked=1
		if("Changeling Lord")
			Changeling_Lord=M.key
			Ranked=1
		if("Demon Lord")
			Demon_Lord=M.key
			Ranked=1
		if("Daemon General")
			Daemon_General=M.key
			Ranked=1
		if("Daemon Commander")
			Daemon_Commander=M.key
			Ranked=1
		if("Earth Guardian")
			Earth_Guardian=M.key
			Ranked=1
		if("Korin")
			Korin=M.key
			Ranked=1
		if("Namekian Elder")
			Namekian_Elder=M.key
			Ranked=1
		if("Supreme Kaio")
			Supreme_Kaio=M.key
			Ranked=1
		if("King of Vegeta")
			King_of_Vegeta=M.key
			Ranked=1
		if("President")
			President=M.key
			Ranked=1
		if("North Kaio")
			North_Kaio=M.key
			Ranked=1
		if("South Kaio")
			South_Kaio=M.key
			Ranked=1
		if("East Kaio")
			East_Kaio=M.key
			Ranked=1
		if("West Kaio")
			West_Kaio=M.key
			Ranked=1
		if("Turtle")
			Turtle=M.key
			Ranked=1
		if("Crane")
			Crane=M.key
			Ranked=1
		if("Android Commander")
			Android_Commander=M.key
			Ranked=1
		if("King Yemma")
			King_Yemma=M.key
			Ranked=1
		if("King of Arconia")
			King_of_Arconia=M.key
			Ranked=1
		if("Justicar")
			Justicar=M.key
			Ranked=1
		if("Arbiter")
			Arbiter=M.key
			Ranked=1
	file("AdminLog.log")<<"[usr]([key]) gave [M]([M.key]) a rank at [time2text(world.realtime,"Day DD hh:mm")]"
	M.Rank_Verb_Assign()
var/Ranks={"<html>
<head><title>Ranks</head></title><body>
<center><body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>

</body><html>"}
mob/verb/Ranks()
	set category="Other"
	Ranks={"<html>
<head><title>Ranks</head></title><body>
<body bgcolor="#000000"><font size=2><font color="#00FFFF"><b><i>
Earth Guardian: [Earth_Guardian]<br>
Korin: [Korin]<br>
Demon Lord: [Demon_Lord]<br>
Daemon General: [Daemon_General]<br>
Daemon Commander: [Daemon_Commander]<br>
Namekian Elder: [Namekian_Elder]<br>
South Kaio: [South_Kaio]<br>
East Kaio: [East_Kaio]<br>
West Kaio: [West_Kaio]<br>
North Kaio: [North_Kaio]<br>
Supreme Kaio: [Supreme_Kaio]<br>
Changeling Lord: [Changeling_Lord]<br>
King/Queen of Vegeta: [King_of_Vegeta]<br>
President: [President]<br>
Drunken Master:[Drunken_Master]<br>
Android Commander: [Android_Commander]<br>
Turtle Hermit: [Turtle]<br>
King Yemma: [King_Yemma]<br>
Crane Hermit: [Crane]<br>
King of Arconia:[King_of_Arconia]<br>
Justicar: [Justicar]<br>
Arbiter: [Arbiter]<br>
<br><br>
</body><html>"}
	Ranks+={"<html>
<head><title>Ranks</head></title><body>
<center><body bgcolor="#000000"><font size=2><font color="#22FF22"><b><i>
<br><br>
*Taxes*<br>
Tax on Earth is [EarthTax]z<br>
Tax on Vegeta is [VegetaTax]z<br>
Tax on Changeling Planet is [ChangelingTax]z<br>
Tax on Namek is [NamekTax]z<br>
Tax on Arconia is [ArconiaTax]z<br><br>
<font color="#FFFF00">
Total players since last reboot: [PlayerCount]<br>
</body><html>"}
	usr<<browse(Ranks,"window=Ranks;size=500x500")
mob/Admin2/verb/UnRank(mob/M in Ranks)
	set category="Admin"
	switch(input("UnRank", "", text) in list ("Earth Guardian","Korin"\
	,"Namekian Elder",\
	"Supreme Kaio","King of Vegeta","President","North Kaio","South Kaio",\
	"East Kaio","West Kaio","Demon Lord","Changeling Lord","Turtle","Crane","Daemon General","Daemon Commander","Android Commander","King Yemma","King of Arconia","Drunken Master","Justicar","Arbiter", "None",))
		if("Drunken Master")
			Drunken_Master=null
			Ranked=0
		if("Changeling Lord")
			Changeling_Lord=null
			Ranked=0
		if("Demon Lord")
			Demon_Lord=null
			Ranked=0
		if("Daemon General")
			Daemon_General=null
			Ranked=0
		if("Daemon Commander")
			Daemon_Commander=null
			Ranked=0
		if("Earth Guardian")
			Earth_Guardian=null
			Ranked=0
		if("Korin")
			Korin=null
			Ranked=0
		if("Namekian Elder")
			Namekian_Elder=null
			Ranked=0
		if("Supreme Kaio")
			Supreme_Kaio=null
			Ranked=0
		if("King of Vegeta")
			King_of_Vegeta=null
			Ranked=0
		if("President")
			President=null
			Ranked=0
		if("North Kaio")
			North_Kaio=null
			Ranked=0
		if("South Kaio")
			South_Kaio=null
			Ranked=0
		if("East Kaio")
			East_Kaio=null
			Ranked=0
		if("West Kaio")
			West_Kaio=null
			Ranked=0
		if("Turtle")
			Turtle=null
			Ranked=0
		if("Crane")
			Crane=null
			Ranked=0
		if("Android Commander")
			Android_Commander=null
			Ranked=0
		if("King Yemma")
			King_Yemma=null
			Ranked=0
		if("King of Arconia")
			King_of_Arconia=null
			Ranked=0
		if("Justicar")
			Justicar=null
			Ranked=0
		if("Arbiter")
			Arbiter=null
			Ranked=0
mob/Rank/verb/Place_Bounty(mob/M in world)
	set category="Rank"
	var/money = input("How much zenni would you like to put on their head?") as num
	if(money > usr.zenni)
		return
	if(money < 0)
		return
	else
		usr.zenni -= money
		M.bounty = money
mob/Rank/verb/Bunker()
	set category="Rank"
	switch(input("Go to your armory?","", text) in list ("Yes","No"))
		if("Yes")
			view(6)<<"[usr] vanishes in a flash of light!"
			usr.x=267
			usr.y=97
			usr.z=14
		if("No")
			return
mob/Rank/verb/View_Bounties(mob/M in world)
	set category="Rank"
	if(M.bounty > 0)
		usr << "[M] has a bounty of [M.bounty] zenni."
//Crane Hermit
mob/Rank/verb/TeachDodompa(mob/M in view(1))
	set category="Rank"
	var/hasit
	for(var/obj/KiAttacks/Dodompa/A in M.contents) hasit=1
	if(!hasit)
		if(M.kimanip>=2.2)
			M.contents+=new/obj/KiAttacks/Dodompa
			view(usr)<<"[usr] has taught [M] the Dodompa ray."
		else usr<<"They do not have enough ki manipulation to learn this."
	else usr<<"They already know it."
mob/Rank/verb/TeachTaiyoken(mob/M in view(1))
	set category="Rank"
	var/hasit
	for(var/obj/Skills/Taiyoken/A in M.contents) hasit=1
	if(!hasit)
		if(M.kimanip>=1.2)
			usr.taiyokenusr=1
			usr.hastaiyoken=1
			M.contents+=new/obj/Skills/Taiyoken
			view(usr)<<"[usr] has taught [M] the Taiyoken skill."
		else usr<<"They do not have enough ki manipulation to learn this."
	else usr<<"They already know it."
mob/var/tmp/Dodompaicon='Ki Dodompa.dmi'
obj/KiAttacks/Dodompa
	Wave=1
	var/KiReq=1
	var/WaveMult=4
	var/ChargeRate=0.5
	var/MaxDistance=50
	var/MoveDelay=4
	var/Piercer=0
	var/Sleeper=2
	verb/Description()
		set category=null
		usr<<"This is the attack taught by the Crane Hermit, it is meant to be a counter move to the Kamehameha. It packs 25% less punch per charge than Kamehameha but it charges about 4x faster giving it an edge if used early before the Kamehameha can charge up. It moves very fast but its range isnt so great, its drain isnt very bad either"
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon=usr.Dodompaicon
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
					var/distance=((A.Pow*kilevel-2)/50)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					if(distance>MaxDistance) distance=MaxDistance
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon=usr.Dodompaicon
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
mob/var/hastaiyoken=0
mob/var/taiyokenusr=0
obj/Skills/Taiyoken/verb/Taiyoken()
	set category="Skills"
	if(!usr.blasting)
		usr.blasting=1
		usr.Ki*=0.7
		usr.taiyokenusr=1
		var/distance=round(usr.kimanip*2)
		if(distance>8) distance=8
		if(distance<1) distance=1
		for(var/turf/A in view(distance,usr))
			var/image/I=image(icon='Lightning flash.dmi',layer=MOB_LAYER+1)
			A.overlays+=I
			spawn(5) A.overlays-=I
		sleep(5)
		if(!usr.taiyokenusr|usr.hastaiyoken)
			for(var/mob/A in view(distance,usr))
				A<<"You are blinded by [usr]'s Taiyoken"
				A.sight=1
		if(usr.taiyokenusr|usr.hastaiyoken)
			usr.sight=0
		sleep(usr.refire*5)
		usr.blasting=0
		usr.taiyokenusr=0
//Turtle Hermit
mob/Rank/verb/TeachSplitForm(mob/M in view(1))
	set category="Rank"
	if(!M.hassplitform)
		M.hassplitform=1
		M.contents+=new/obj/SplitForm
		view(usr)<<"[usr] has taught [M] the split form ability."
	usr<<"They already have this ability."
mob/Rank/verb/Get_Radar()
	set category="Rank"
	usr<<"You make a Dragonball Radar."
	var/obj/A=new/obj/items/Radar
	A.loc=locate(x,y,z)
mob/var/pbagcounter
mob/Rank/verb/CreatePbag()
	set category="Rank"
	usr<<"You use your resources wisely and put together a makeshift punching bag for your students."
	var/mob/A=new/mob/Punching_Bag
	A.loc=locate(x,y,z)
	pbagcounter+=1
	if(pbagcounter>7)
		usr<<"You can no longer find the resources to create punching bags."
		verbs-=/mob/Rank/verb/CreatePbag
mob/Rank/verb/CreateTrainingDummy()
	set category="Rank"
	usr<<"You pull your resources together wisely and make a training dummy for your students."
	var/mob/A=new/mob/Dummy
	A.loc=locate(x,y,z)
mob/Rank/verb/Make_Shell()
	set category="Rank"
	var/weights=input("How heavy? Between 10 and 100000 pounds") as num
	if(weights>100000) weights=100000
	if(weights<1) weights=1
	weights=round(weights)
	var/obj/items/A=new/obj/items/Weighted_Gi
	A.weight=weights
	A.icon='Obj Turtle Shell.dmi'
	A.name="Turtle Shell"
	contents+=A
mob/var/knowskamehameha
mob/Rank/verb/TeachKamehameha(mob/M in view(1))
	set category="Rank"
	if(!M.knowskamehameha)
		if(M.kimanip>=2)
			view(usr)<<"[usr] teaches [M] Kamehameha"
			M.knowskamehameha=1
			M.contents+=new/obj/KiAttacks/Kamehameha
			var/type=rand(1,6)
			if(type==1) M.Kamehamehaicon='Ki Kamehameha 1.dmi'
			if(type==2) M.Kamehamehaicon='Ki Kamehameha 2.dmi'
			if(type==3) M.Kamehamehaicon='Ki Kamehameha 3.dmi'
			if(type==4) M.Kamehamehaicon='Ki Kamehameha 4.dmi'
			if(type==5) M.Kamehamehaicon='Ki Kamehameha 5.dmi'
			if(type==6) M.Kamehamehaicon='Ki Kamehameha 6.dmi'
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"They already know it."
//Drunken Master
mob/Rank/verb/TeachCorkscrew(mob/M in view(1))
	set category="Rank"
	var/hasit
	for(var/obj/KiAttacks/Corkscrew_Beam/A in M.contents) hasit=1
	if(!hasit)
		if(M.kimanip>=2.2)
			M.contents+=new/obj/KiAttacks/Corkscrew_Beam
			view(usr)<<"[usr] has taught [M] the Corkscrew Beam."
		else usr<<"They do not have enough ki manipulation to learn this."
	else usr<<"They already know it."
mob/var/tmp/Corkscrewicon='Corkscrew.dmi'
obj/KiAttacks/Corkscrew_Beam
	Wave=1
	var/KiReq=1
	var/WaveMult=4
	var/ChargeRate=0.3
	var/MaxDistance=50
	var/MoveDelay=4
	var/Piercer=0
	var/Sleeper=2
	verb/Description()
		set category=null
		usr<<"This is the attack taught by the Drunken Master, slightly slower on the charge than Dodompa, but makes up for it with additional power."
	Click()
		for(var/obj/KiAttacks/A in usr.contents) if(A.Wave&&A!=src) if(A.charging|A.streaming|A.chargelvl) return
		spawn usr.AddChargeOverlay()
		if(!usr.med&&!usr.train&&!usr.KO)
			if(usr.Ki>=KiReq)
				var/obj/A=new/obj/attack/blast
				A.icon=usr.Corkscrewicon
				A.animate_movement=0
				A.icon+=rgb(usr.blastR,usr.blastG,usr.blastB)
				A.density=0
				A.Pow=(usr.Pow+(kilevel/10))+(6*usr.PowMod)
				A.PL=(usr.PL*chargelvl)*0.2
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
					var/distance=((A.Pow*kilevel-2)/50)
					step(A,usr.dir)
					walk(A,usr.dir,MoveDelay)
					if(distance>MaxDistance) distance=MaxDistance
					spawn(distance) del(A)
					streaming=1
					spawn while(streaming)
						sleep(Sleeper)
						if(prob(10)) usr.Blast_Gain()
						var/obj/B=new/obj/attack/blast/
						B.icon=usr.Corkscrewicon
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
mob/var/tmp/Produce_Beer
mob/Rank/verb
	Produce_Beer()
		set category="Rank"
		if(!Produce_Beer)
			Produce_Beer=1
			usr<<"You start producing a bottle of beer, this will take a moment."
			sleep(300)
			var/obj/A=new/obj/items/Beer
			A.name="Beer"
			contents+=A
			usr<<"All done."
			Produce_Beer=0
		else usr<<"You must wait till you finish producing one before you can produce another."
mob/Rank/verb/MakeTrench()
	set category="Rank"
	var/weights=input("How heavy? Between 10 and 100000 pounds") as num
	if(weights>100000) weights=100000
	if(weights<1) weights=1
	weights=round(weights)
	var/obj/items/A=new/obj/items/Weighted_Coat
	A.weight=weights
	A.name="Weighted Coat"
	A.icon+=rgb(0,0,0)
	contents+=A
//Earth Guardian.
mob/Rank/verb/Transport()
	set category="Rank"
	var/xx=input("X Location?") as num
	var/yy=input("Y Location?") as num
	loc=locate(xx,yy,1)
mob/Rank/verb/MakeWeights() //Korin
	set category="Rank"
	var/weights=input("How heavy? Between 10 and 100000 pounds") as num
	if(weights>100000) weights=100000
	if(weights<1) weights=1
	weights=round(weights)
	var/obj/items/A=new/obj/items/Weighted_Gi
	A.weight=weights
	A.name="Weighted Shirt"
	A.icon+=rgb(0,0,100)
	contents+=A
mob/var/permission=0
mob/Rank/verb/Permission(mob/M in view(6))
	set category="Rank"
	switch(input("Give permission for [M] to enter the fight room?", "", text) in list ("Yes","No",))
		if("Yes")
			usr<<"You give [M] permission to use the fight room"
			M.permission=1
		if("No")
			usr<<"You deny [M] permission to use the fight room"
			M.permission=0
mob/Rank/verb/Create_Earth_DBs()
	set category="Rank"
	set name="Dragon Balls"
	for(var/obj/items/dbs/edbs/A)
		usr<<"There are already dragonballs."
		return
	if(!edragonballs&&Race=="Demon"|Race=="Kai")
		PLpcnt=80
	if(!edragonballs&&Race=="Namekian")
		edragonballs=1
		usr<<"You create dragonballs in your inventory."
		contents+=new/obj/items/dbs/edbs/edb1
		contents+=new/obj/items/dbs/edbs/edb2
		contents+=new/obj/items/dbs/edbs/edb3
		contents+=new/obj/items/dbs/edbs/edb4
		contents+=new/obj/items/dbs/edbs/edb5
		contents+=new/obj/items/dbs/edbs/edb6
		contents+=new/obj/items/dbs/edbs/edb7
		usr<<"The dragonballs are scattered across their planet."
		for(var/obj/items/dbs/edbs/D in contents)
			var/xx=rand(1,400)
			var/yy=rand(1,400)
			D.loc=locate(xx,yy,1)
		for(var/obj/items/dbs/ndbs/D in contents)
			var/xx=rand(1,400)
			var/yy=rand(1,400)
			D.loc=locate(xx,yy,3)
	else usr<<"There are already some dragonballs around."
//Namekian Elder.
mob/Rank/verb/SetNamekTax()
	set category="Rank"
	usr<<"This will adjust the taxes for your planet."
	switch(input("What would you like set the tax rate to?","",text) in list("10 zenni", "25 zenni", "100 zenni","Cancel"))
		if("10 zenni")
			NamekTax=10
		if("25 zenni")
			NamekTax=25
		if("100 zenni")
			NamekTax=100
		if("Cancel")
			return
mob/Rank/verb/CollectNamekTax()
	set category="Rank"
	usr<<"You currently have [NamekBank] zenni in your planetary account."
	switch(input("What would you like to do today?", "",text) in list("Nothing","Deposit","Withdraw"))
		if("Deposit")
			var/amount=input("How much would you like to deposit?") as num
			if(amount>usr.zenni) alert("You cannot put in more money than you have.")
			else if(amount<1) alert("You must put atleast 1 zenni in the bank.")
			else
				if(amount>usr.zenni) amount=usr.zenni
				alert("You have deposited [amount] zenni in the bank.")
				NamekBank+=amount
				usr.zenni-=amount
		if("Withdraw")
			var/amount=input("How much would you like to withdraw? You currently have [NamekBank] zenni in your account.") as num
			if(amount>NamekBank) alert("You cannot take out more than you have in your account.")
			else if(amount<0) alert("You must atleast take out 0 zenni.")
			else
				NamekBank-=amount
				usr.zenni+=amount
mob/Rank/verb/Create_Namek_DBs()
	set category="Rank"
	set name="Dragon Balls"
	for(var/obj/items/dbs/ndbs/A)
		usr<<"There are already dragonballs."
		return
	if(!ndragonballs&&Race=="Namekian")
		ndragonballs=1
		usr<<"You create dragonballs in your inventory."
		contents+=new/obj/items/dbs/ndbs/ndb1
		contents+=new/obj/items/dbs/ndbs/ndb2
		contents+=new/obj/items/dbs/ndbs/ndb3
		contents+=new/obj/items/dbs/ndbs/ndb4
		contents+=new/obj/items/dbs/ndbs/ndb5
		contents+=new/obj/items/dbs/ndbs/ndb6
		contents+=new/obj/items/dbs/ndbs/ndb7
		usr<<"The dragonballs are scattered across their planet."
		for(var/obj/items/dbs/edbs/D in contents)
			var/xx=rand(1,400)
			var/yy=rand(1,400)
			D.loc=locate(xx,yy,1)
		for(var/obj/items/dbs/ndbs/D in contents)
			var/xx=rand(1,400)
			var/yy=rand(1,400)
			D.loc=locate(xx,yy,3)
	else usr<<"There are already some dragonballs around."
//Korin
mob/var/tmp/GrowingBean
mob/Rank/verb
	Grow_Senzu_Bean()
		set category="Rank"
		if(!GrowingBean)
			GrowingBean=1
			usr<<"You start growing a Senzu bean, this will take a minute..."
			sleep(600)
			var/obj/A=new/obj/items/Senzu
			A.loc=locate(x,(y-1),z)
			usr<<"All done."
			GrowingBean=0
		else usr<<"You must wait til you grow this one first."
/*
obj/Portal_Jar
	icon='props.dmi'
	icon_state="Closed"
	density=1
	var/open=0
	verb/Open_Jar()
		set category="Other"
		set src in oview(1)
		if(usr.key==Korin)
			if(!open)
				open=1
				icon_state="Open"
				view(9)<<"[usr] opens the jar."
				sleep(600)
				icon_state="Closed"
				open=0
		else usr<<"You cant seem to open it, its locked by magic or something."
	verb/Enter_Jar()
		set category="Other"
		set src in oview(1)
		if(open)
			view(9)<<"[usr] gets in the jar and is whisked away into another world."
			usr.loc=locate(150,150,25)
		else usr<<"You cant get in the jar its closed."
*/
//Grand Kaio
mob/Rank/verb/Restore_Youth()
	set category="Skills"
	var/mob/M=input("Which mob?","Mob") as null|mob in view(1)
	if(!M) return
	var/age=input("Restore them to what age? Between 0 and 25") as num
	if(age<0) age=0
	if(age>25) age=25
	switch(input(M,"(Offerer=[usr]) Do you want your age to be restored to [age] years?", "", text) in list ("No", "Yes",))
		if("Yes")
			M.Age=age
			M.Body=age
		if("No") usr<<"[M] declined your offer."
//All Kaios
mob/Rank/verb/
	Go_To_Planet()
		set category="Rank"
		switch(input("Which planet?", "", text) in list ("Supreme","North","South","East","West","None",))
			if("Supreme")
				if(Supreme_Kaio==key) loc=locate(200,161,22)
				else usr<<"Only the Supreme Kaio can teleport there."
			if("North")
				if(North_Kaio==key|Supreme_Kaio==key) loc=locate(156,327,21)
				else usr<<"Only the North, or Supreme Kaio can teleport there."
			if("South")
				if(South_Kaio==key|Supreme_Kaio==key) loc=locate(188,25,21)
				else usr<<"Only the South, or Supreme Kaio can teleport there."
			if("East")
				if(East_Kaio==key|Supreme_Kaio==key) loc=locate(342,188,21)
				else usr<<"Only the East, or Supreme Kaio can teleport there."
			if("West")
				if(West_Kaio==key|Supreme_Kaio==key) loc=locate(16,243,21)
				else usr<<"Only the West, or Supreme Kaio can teleport there."
//North Kaio
mob/var/haskaioken
mob/var/hasspiritbomb
mob/Rank/verb
	TeachKaioken(mob/M in view(1))
		set category="Rank"
		if(!M.haskaioken)
			if(M.kimanip>=3&&M.MaxKi>250)
				M.haskaioken=1
				M.contents+=new/obj/Skills/Kaioken
				view(9)<<"[usr] teaches [M] Kaioken."
			else usr<<"Their ki manipulation and max ki is not high enough."
		else usr<<"[M] already knows Kaioken..."
	TeachSpiritBomb(mob/M in view(1))
		set category="Rank"
		if(!M.hasspiritbomb)
			if(M.kimanip>=5)
				M.hasspiritbomb=1
				M.contents+=new/obj/KiAttacks/Spirit_Bomb
				view(9)<<"[usr] teaches [M] the Spirit Bomb."
			else usr<<"Their ki manipulation is not high enough."
		else usr<<"[M] already knows the Spirit Bomb..."
//South Kaio
mob/var/hasenkumei
mob/Rank/verb/TeachEnkumei(mob/M in view(1))
	set category="Rank"
	if(!M.hasenkumei)
		M.hasenkumei=1
		M.contents+=new/obj/KiAttacks/Enkumei
		view(usr)<<"[usr] teaches [M] the Enkumei Dark Fire Wave."
	else usr<<"They already know it."
mob/var/hasexpand
mob/Rank/verb/TeachBodyExpand(mob/M in view(1))
	set category="Rank"
	if(!M.hasexpand)
		if(M.kimanip>=3)
			M.hasexpand=1
			M.contents+=new/obj/Skills/Body_Expand
			view(9)<<"[usr] teaches [M] Body Expand."
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"[M] already knows Body Expand."
//East Kaio
mob/var/hasburst
mob/Rank/verb/TeachKiBurst(mob/M in view(1))
	set category="Rank"
	if(!M.hasburst)
		if(M.kimanip>=3)
			M.hasburst=1
			M.contents+=new/obj/Skills/Ki_Burst
			view(9)<<"[usr] teaches [M] Ki Burst."
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"[M] already knows Ki Burst."
mob/Rank/verb/TeachBusterShell(mob/M in view(1))
	set category="Rank"
	if(!M.hasbustershell)
		if(M.kimanip>=5)
			M.hasbustershell=1
			M.contents+=new/obj/KiAttacks/BusterShell
			view(9)<<"[usr] teaches [M] Buster Shell"
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"[M] already knows the Buster Shell technique..."
//West Kaio
mob/var/hasunleashrage
mob/Rank/verb/TeachUnleash_Rage(mob/M in view(1))
	set category="Rank"
	if(!M.hasunleashrage)
		if(M.kimanip>=5)
			M.hasunleashrage=1
			M.contents+=new/obj/Skills/Unleash_Rage
			view(9)<<"[usr] teaches [M] to unleash their inner rage."
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"[M] already knows how to unleash their rage."
mob/var/
	raging
	rage
obj/Skills/Unleash_Rage/verb/Unleash_Rage()
	set category="Skills"
	if(!usr.rage)
		usr.absorbadd+=usr.BasePL*1.5
		usr.Spd*=2
		usr.Offense*=2
		usr.Defense/=1.5
		usr<<"You unleash your inner rage."
		usr.rage=1
	else
		usr.absorbadd=0
		usr.Spd/=2
		usr.Offense/=2
		usr.Defense*=1.5
		usr.absorbadd=0
		usr<<"You force yourself to calm down."
		usr.rage=0
	sleep(10)
mob/var/hasbuster
mob/Rank/verb/TeachBusterBarrage(mob/M in view(1))
	set category="Rank"
	if(!M.hasbuster&&!M.legendary)
		if(M.kimanip>=3)
			M.hasbuster=1
			M.contents+=new/obj/KiAttacks/BusterBarrage
			view(usr)<<"<b><font size=1>[usr] teaches [M] Buster Barrage."
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"<b><font size=1>[M] either knows this already, or cant learn for some reason."
//Supreme Kaio
mob/var/OPLMod=1
mob/var/KeepsBody //If this is 1 you keep your body when dead.
mob/Rank/verb/Keep_Body(mob/M in view(src))
	set category="Rank"
	if(!M.KeepsBody)
		M.KeepsBody=1
		usr<<"You have made it so [M] will keep their body when they die."
	else
		M.KeepsBody=0
		usr<<"You have made it so [M] will not keep their body when they die."
mob/Rank/verb/Reincarnate(mob/M in oview(usr))
	set category="Rank"
	if(M.dead)
		if(M.Body<=12|M.Body>=65|Race=="Majin"|Race=="Bebi")
			switch(input(M,"[usr] has offered to help reincarnate you into another body and mind, this will purify your spirit and erase your memories, starting your life in the living world all over again. Do you want to do this?", "", text) in list ("Yes", "No",))
				if("Yes") spawn M.Reincarnation()
				if("No") view(M)<<"[M] declines being reincarnated."
	else usr<<"They are not dead..."
var/tech
var/flyskill
var/zanskill
/*
var/kkskill
*/
var/healingskill
var/instantskill
var/manipulation
var/poweruppcnt
var/storedpl
var/strength
var/force
var/endurance
var/resistance
var/speed
var/offense
var/defense
var/energy
var/gains
var/list/incarnatecontents=new/list
mob/var/Incarnate
mob/proc/Reincarnation()
	src<<"Dont log out, or youll lose everything."
	var/mob/A=new/mob
	A.Incarnate=1
	A.name=name
	tech=techskill
	flyskill=flightskill/flightmod
	zanskill=zanzoskill/zanzomod
	/*
	kkskill=KaiokenMastery/KaiokenMod
	*/
	healingskill=healskill/healmod
	instantskill=ITskill/ITMod
	manipulation=kimanip
	poweruppcnt=(MaxPLpcnt-100)/KiRegen
	storedpl=RecordPL
	strength=Str/StrMod
	force=Pow/PowMod
	endurance=End/EndMod
	resistance=Res/ResMod
	speed=Spd/SpdMod
	offense=Offense/OffenseMod
	defense=Defense/DefenseMod
	energy=MaxKi/KiMod
	gains=gain
	for(var/obj/KiAttacks/B in contents) incarnatecontents+=B
	A.key=key
mob/proc/CheckIncarnate() if(Incarnate)
	Incarnate=0
	for(var/obj/A in incarnatecontents) contents+=A
	incarnatecontents=new/list
	flightskill=flyskill*flightmod
	techskill=tech
	zanzoskill=zanskill*zanzomod
	/*
	KaiokenMastery=kkskill*KaiokenMod
	*/
	healskill=healingskill*healmod
	ITskill=instantskill*ITMod
	kimanip=manipulation
	MaxPLpcnt=poweruppcnt*KiRegen
	RecordPL=storedpl
	Str=strength*StrMod
	Pow=force*PowMod
	End=endurance*EndMod
	Res=resistance*ResMod
	Spd=speed*SpdMod
	Offense=offense*OffenseMod
	Defense=defense*DefenseMod
	MaxKi=energy*KiMod
	gain=gains
	Ki=MaxKi
//Changeling Lord
mob/Rank/verb/SetCPTax()
	set category="Rank"
	usr<<"This will adjust the taxes for your planet."
	switch(input("What would you like set the tax rate to?","",text) in list("10 zenni", "25 zenni", "100 zenni","Cancel"))
		if("10 zenni")
			ChangelingTax=10
		if("25 zenni")
			ChangelingTax=25
		if("100 zenni")
			ChangelingTax=100
		if("Cancel")
			return
mob/Rank/verb/CollectCPTax()
	set category="Rank"
	usr<<"You currently have [ChangelingBank] zenni in your planetary account."
	switch(input("What would you like to do today?", "",text) in list("Nothing","Deposit","Withdraw"))
		if("Deposit")
			var/amount=input("How much would you like to deposit?") as num
			if(amount>usr.zenni) alert("You cannot put in more money than you have.")
			else if(amount<1) alert("You must put atleast 1 zenni in the bank.")
			else
				if(amount>usr.zenni) amount=usr.zenni
				alert("You have deposited [amount] zenni in the bank.")
				ChangelingBank+=amount
				usr.zenni-=amount
		if("Withdraw")
			var/amount=input("How much would you like to withdraw? You currently have [ChangelingBank] zenni in your account.") as num
			if(amount>ChangelingBank) alert("You cannot take out more than you have in your account.")
			else if(amount<0) alert("You must atleast take out 0 zenni.")
			else
				ChangelingBank-=amount
				usr.zenni+=amount
mob/var/hasdeathball
mob/Rank/verb/TeachDeathBall(mob/M in view(1))
	set category="Rank"
	if(!M.hasdeathball)
		if(M.kimanip>=20)
			M.hasdeathball=1
			M.contents+=new/obj/KiAttacks/DeathBall
			view(9)<<"[usr] teaches [M] Death Ball."
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"[M] already knows the Death ball technique..."
//King of Vegeta
mob/Rank/verb/SetVegetaTax()
	set category="Rank"
	usr<<"This will adjust the taxes for your planet."
	switch(input("What would you like set the tax rate to?","",text) in list("10 zenni", "25 zenni", "100 zenni","Cancel"))
		if("10 zenni")
			VegetaTax=10
		if("25 zenni")
			VegetaTax=25
		if("100 zenni")
			VegetaTax=100
		if("Cancel")
			return
mob/Rank/verb/CollectVegetaTax()
	set category="Rank"
	usr<<"You currently have [VegetaBank] zenni in your planetary account."
	switch(input("What would you like to do today?", "",text) in list("Nothing","Deposit","Withdraw"))
		if("Deposit")
			var/amount=input("How much would you like to deposit?") as num
			if(amount>usr.zenni) alert("You cannot put in more money than you have.")
			else if(amount<1) alert("You must put atleast 1 zenni in the bank.")
			else
				if(amount>usr.zenni) amount=usr.zenni
				alert("You have deposited [amount] zenni in the bank.")
				VegetaBank+=amount
				usr.zenni-=amount
		if("Withdraw")
			var/amount=input("How much would you like to withdraw? You currently have [VegetaBank] zenni in your account.") as num
			if(amount>VegetaBank) alert("You cannot take out more than you have in your account.")
			else if(amount<0) alert("You must atleast take out 0 zenni.")
			else
				VegetaBank-=amount
				usr.zenni+=amount
mob/var/hasfinalflash
mob/Rank/verb/TeachFinalFlash(mob/M in view(1))
	set category="Rank"
	if(!M.hasfinalflash)
		if(M.kimanip>=5)
			M.hasfinalflash=1
			M.contents+=new/obj/KiAttacks/Final_Flash
			view(9)<<"[usr] teaches [M] Final Flash."
		else usr<<"Their ki manipulation is not high enough."
	else usr<<"[M] already knows the Final Flash technique..."
//Demon Lord
mob/var
	enslaved
	slaving
	hasbeenenslaved
obj/Skills/Seal/verb/Seal()
	set category="Skills"
	if(!usr.slaving)
		usr.slaving=1
		if(!usr.enslaved)
			usr.absorbadd+=usr.BasePL*1.5
			usr.Str*=2
			usr.End*=2
			usr<<"You channel the power of the seal to increase your own abilities."
			usr.enslaved=1
		else
			usr.absorbadd=0
			usr.Str/=2
			usr.End/=2
			usr<<"You deactivate the seal."
			usr.enslaved=0
			usr.Revert()
		sleep(10)
		usr.slaving=0
mob/Skills/verb/Enslave(mob/M in view(1))
	set category="Skills"
	for(var/obj/Skills/Seal/A in M.contents)
		usr<<"They have already been enslaved."
		return
	if(usr.enslaved<2)
		usr.enslaved+=1
		usr<<"You have converted [usr.enslaved] people into slaves. You can this ability a total of 2 times."
		M.hasmystic=0
		for(var/obj/Skills/Mystic/O in M.contents) del(O)
		M.hasbeenenslaved=1
		M.contents+=new/obj/Skills/Seal
mob/Skills/verb/Divine_Teleport()
	set category="Skills"
	if(!usr.KO&&usr.Ki>=usr.MaxKi)
		usr.Ki=0
		view(6)<<"[usr] seems to be concentrating, they suddenly disappear!"
		var/xx
		var/yy
		var/zz
		switch(input("Choose Destination","", text) in list ("Earth","Skyworld","None"))
			if("Earth")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=1
			if("Skyworld")
				xx=rand(1,380)
				yy=rand(1.380)
				zz=11
			if("None") return
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
mob/Skills/verb/Infernal_Teleport()
	set category="Skills"
	if(!usr.KO&&usr.Ki>=usr.MaxKi)
		usr.Ki=0
		view(6)<<"[usr] seems to be concentrating, they suddenly disappear!"
		var/xx
		var/yy
		var/zz
		switch(input("Choose Destination","", text) in list ("Vegeta","Skyworld","None"))
			if("Vegeta")
				xx=rand(1,380)
				yy=rand(1,380)
				zz=4
			if("Skyworld")
				xx=rand(1,380)
				yy=rand(1.380)
				zz=11
			if("None") return
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
mob/Skills/verb/Demon_Teleport()
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
//King Yemma
mob/var/tmp/MakingYemma
mob/Rank/verb
	MakeYemma()
		set category="Rank"
		if(!MakingYemma)
			MakingYemma=1
			usr<<"You start growing a Yemma fruit, this will take a minute..."
			sleep(600)
			var/obj/A=new/obj/items/Yemma_Fruit
			A.loc=locate(x,(y-1),z)
			usr<<"All done."
			MakingYemma=0
		else usr<<"You must wait til you grow this one first."
obj/PlayerLog/verb/ViewPlayerLog(mob/M in world)
	set category="Rank"
	usr<<browse(M.PlayerLog,"window=Log;size=400x400")

obj/Skills/Yemma_Port/verb/Yemma_Port()
	var/mob/M=input("Who?","") as null|mob in view(1)
	set category="Rank"
	switch(input("Choose Destination", "", text) in list ("Hell", "Heaven", "Checkpoint", "Cancel",))
		if("Cancel")
			return
		if("Checkpoint")
			M.loc=locate(173,173,15)
		if("Heaven")
			M.loc=locate(62,314,16)
		if("Hell")
			M.loc=locate(66,321,17)

//Android Commander
mob/var/Snared
obj/Skills/Snare/verb/Snare()
	set category="Rank"
	usr.overlays+='Ki Energy Web.dmi'
	spawn(10) usr.overlays-='Ki Energy Web.dmi'
	for(var/mob/A in oview(usr)) if(!A.Snared&&A.client)
		sleep(10)
		usr.Ki*=0.5
		A.Snared=1
		missile('Ki Energy Web.dmi',usr,A)
		A.overlays+='Ki Energy Web.dmi'
obj/Skills/Sense4/verb/Track()
	set category="Rank"
	var/approved
	for(var/mob/M) if(M.player&&M.key!=usr.key&&M.PL>=5000)
		for(var/obj/Contact/A in usr.contents) if(A.name=="[M.name] ([M.key])") approved=1
		if(usr.Race=="Bebi"|usr.Race=="Android"|usr.Race=="Cyborg")
			if(approved) usr<<"You detect [M.name] ([M.Race]) at (x[M.x],y[M.y],(z[M.z])"
		else if(approved) usr<<"You sense [M.name] ([M.Race]) at (x[M.x],y[M.y],(z[M.z])"
		else usr<<"You sense someone ([M.Race]) at (x[M.x],y[M.y],(z[M.z])"
//President
mob/Rank/verb/SetEarthTax()
	set category="Rank"
	usr<<"This will adjust the taxes for your planet."
	switch(input("What would you like set the tax rate to?","",text) in list("10 zenni", "25 zenni", "100 zenni","Cancel"))
		if("10 zenni")
			EarthTax=10
		if("25 zenni")
			EarthTax=25
		if("100 zenni")
			EarthTax=100
		if("Cancel")
			return
mob/Rank/verb/CollectEarthTax()
	set category="Rank"
	usr<<"You currently have [EarthBank] zenni in your planetary account."
	switch(input("What would you like to do today?", "",text) in list("Nothing","Deposit","Withdraw"))
		if("Deposit")
			var/amount=input("How much would you like to deposit?") as num
			if(amount>usr.zenni) alert("You cannot put in more money than you have.")
			else if(amount<1) alert("You must put atleast 1 zenni in the bank.")
			else
				if(amount>usr.zenni) amount=usr.zenni
				alert("You have deposited [amount] zenni in the bank.")
				EarthBank+=amount
				usr.zenni-=amount
		if("Withdraw")
			var/amount=input("How much would you like to withdraw? You currently have [EarthBank] zenni in your account.") as num
			if(amount>EarthBank) alert("You cannot take out more than you have in your account.")
			else if(amount<0) alert("You must atleast take out 0 zenni.")
			else
				EarthBank-=amount
				usr.zenni+=amount
//King of Arconia
mob/var/tmp/MakingMight
mob/Rank/verb
	MakeMight()
		set category="Rank"
		if(!MakingMight)
			MakingMight=1
			usr<<"You start growing a Mighty fruit, this will take a minute..."
			sleep(600)
			var/obj/A=new/obj/items/Might_Fruit
			A.loc=locate(x,(y-1),z)
			usr<<"All done."
			MakingMight=0
		else usr<<"You must wait til you grow this one first."
mob/Rank/verb/SetArconiaTax()
	set category="Rank"
	usr<<"This will adjust the taxes for your planet."
	switch(input("What would you like set the tax rate to?","",text) in list("10 zenni", "25 zenni", "50 zenni","Cancel"))
		if("10 zenni")
			ArconiaTax=10
		if("25 zenni")
			ArconiaTax=25
		if("50 zenni")
			ArconiaTax=50
		if("Cancel")
			return
mob/Rank/verb/CollectArconiaTax()
	set category="Rank"
	usr<<"You currently have [ArconiaBank] zenni in your planetary account."
	switch(input("What would you like to do today?", "",text) in list("Nothing","Deposit","Withdraw"))
		if("Deposit")
			var/amount=input("How much would you like to deposit?") as num
			if(amount>usr.zenni) alert("You cannot put in more money than you have.")
			else if(amount<1) alert("You must put atleast 1 zenni in the bank.")
			else
				if(amount>usr.zenni) amount=usr.zenni
				alert("You have deposited [amount] zenni in the bank.")
				ArconiaBank+=amount
				usr.zenni-=amount
		if("Withdraw")
			var/amount=input("How much would you like to withdraw? You currently have [ArconiaBank] zenni in your account.") as num
			if(amount>ArconiaBank) alert("You cannot take out more than you have in your account.")
			else if(amount<0) alert("You must atleast take out 0 zenni.")
			else
				ArconiaBank-=amount
				usr.zenni+=amount



