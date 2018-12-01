//Tax Stuff
var
	EarthTax=0 //The amount collected each tax period.
	EarthBank=0 //Taxes collected.
	VegetaTax=0
	VegetaBank=0
	ChangelingTax=0
	ChangelingBank=0
	NamekTax=0
	NamekBank=0
	ArconiaTax=0
	ArconiaBank=0
mob/var/PayTaxes=1
mob/verb
	TaxSetting()
		set category="Other"
		if(PayTaxes)
			src<<"You decide not to pay taxes"
			PayTaxes=0
		else
			src<<"You decide to pay taxes"
			PayTaxes=1
//Contact Stuff
mob/verb/SetContact(mob/M in oview())
	set category=null
	var/contacts=0
	for(var/obj/Contact/A in contents) contacts+=1
	if(contacts<25)
		if(M.client)
			var/disapproved
			for(var/obj/Contact/A in contents)
				if(A.name=="[M.name] ([M.displaykey])") disapproved=1
			if(!disapproved)
				var/obj/Contact/A=new/obj/Contact
				A.name="[M.name] ([M.displaykey])"
				contents+=A
	else src<<"You can only have 25 contacts."
obj/Contact
	var/familiarity=0
	var/relation="Neutral"
	suffix="0 / Neutral"
	verb/Delete()
		set category=null
		del(src)
	verb/Relation()
		set category=null
		switch(input(text) in list("Friend","Good","Rival/Good","Rival/Bad","Neutral","Bad","Enemy", "Family"))
			if("Neutral")
				relation="Neutral"
				suffix="[round(familiarity)] / [relation]"
			if("Rival/Bad")
				if(familiarity>=50)
					relation="Rival/Bad"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 50 or more familiarity"
			if("Rival/Good")
				if(familiarity>=50)
					relation="Rival/Good"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 50 or more familiarity"
			if("Good")
				if(familiarity>=75)
					relation="Good"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 75 or more familiarity"
			if("Bad")
				if(familiarity>=75)
					relation="Bad"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 75 or more familiarity"
			if("Family")
				if(familiarity>=125)
					relation="Family"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 125 or more familiarity"
			if("Friend")
				if(familiarity>=100)
					relation="Friend"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 100 or more familiarity"
			if("Enemy")
				if(familiarity>=100)
					relation="Enemy"
					suffix="[round(familiarity)] / [relation]"
				else src<<"You need 100 or more familiarity"
var/OOC=1
mob/var
	muted
	Rankon=0
	OOCon=1
	list/Ignore=new
mob/var
	TextSize=2
	seetelepathy=1
//Lets people turn on and off telepathy messages.
mob/verb
	Save_Now()
		set name="Save"
		set category="Other"
		usr.Save()
		usr<<"Player file saved."
	SeeTelepathy()
		set category="Other"
		if(seetelepathy)
			src<<"Telepathy messages off."
			seetelepathy=0
		else
			src<<"Telepathy messages on."
			seetelepathy=1
mob/var
	OOCFont = "red"
	SayFont = "blue"
	talk = 1
mob/verb/Screen_Size()
	set category="Other"
	screenx=input("Enter the width of the screen, limits are 25, for now.") as num
	screeny=input("Enter the height of the screen.") as num
	if(screenx<5) screenx=5
	if(screeny<5) screeny=5
	if(screenx>25) screenx=25
	if(screeny>25) screeny=25
	client.view="[screenx]x[screeny]"
mob/verb
	Chat_Color()
		set category="Other"
		switch(input("Which would you like to change?") in list ("OOC","Say"))
			if("OOC")
				var/c = input ("Select a color to change your Out of Character Character chat to") as color
				OOCFont="[c]"
			if("Say")
				var/c = input ("Select a color to change your In Character chat to") as color
				SayFont="[c]"

//Lets players ignore one another.
	Ignore()
		set category="Other"
		switch(input("Add or Remove someone from the ignore list?", "", text) in list ("Add","Remove","View List","Nevermind",))
			if("Add")
				var/mob/M=input("Which mob?","Mob") as null|mob in world
				if(M.client)
					Ignore+=M.key
					src<<"[M.key] added to ignore list."
				else src<<"They are an NPC"
			if("Remove")
				var/mob/M=input("Which mob?","Mob") as null|mob in world
				if(M.client)
					Ignore-=M.key
					src<<"[M.key] removed from ignore list."
				else src<<"They are an NPC"
			if("View List") src<<"[list2params(Ignore)]"
//Lets players change their aura and blast color.
	Aura_and_Blast_Color()
		set category="Other"
		if(!powerup&&!shielding&&!flight)
			Aura_Color()
			Blast_Color()
			EnergyCalibrate()
		else src<<"You have to stop powering up, down, shielding, or flying to do this."
mob/proc/EnergyCalibrate()
	var/image/I=image(icon='Shield Big.dmi')
	I.icon+=rgb(blastR,blastG,blastB)
	shieldcolor=I
mob/Rank/verb/Toggle_RankChat()
	set category="Rank"
	if(Rankon)
		Rankon=0
		src<<"RankChat is now disabled."
	else
		Rankon=1
		src<<"RankChat is now enabled."
mob/verb
//Lets players turn their OOC off.
	OOC_Switch()
		set category="Other"
		if(OOCon)
			OOCon=0
			src<<"OOC text is now off."
		else
			OOCon=1
			src<<"OOC text is now visible."
//Lets players use the OOC channel.
	OOC(msg as text)
		set category="Other"
		msg=copytext(msg,1,500)
		if(findtext(msg,"<font")==0|findtext(msg,"   ")==0)
			if(OOC) if(talk&&!muted) for(var/mob/M) if(M.Ignore.Find(key)==0) if(M.OOCon) M<<"<font size=[M.TextSize]><font color=[OOCFont]>[name]([displaykey]): <font color=white>[html_encode(msg)]"
			else usr<<"OOC is disabled currently."
		else
			world<<"[key] ([client.address]) tried to spam. They were key banned."
			Bans.Add(key)
			Logout()
//Lets players whisper to one another.
	Whisper(msg as text)
		set category="Other"
		if(Oozarou&&Oozarouskill<10) for(var/mob/M in range(src)) M<<"<font size=[M.TextSize]><font color=green><font face=Old English Text MT>-Oozarou yells, 'RAWR!'"
		else
			for(var/mob/M in range()) M<<"<font size=[M.TextSize]>-[name] whispers something..."
			for(var/mob/M in range(2)) M<<"<font size=[M.TextSize]><font color=[SayFont]>*[name] whispers: [html_encode(msg)]"
			for(var/mob/A in view(src)) A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]): [msg]<br>
</body><html>"}
//Lets players talk to each other ICly.
	Say(msg as text)
		set category="Other"
		if(Oozarou&&Oozarouskill<10) for(var/mob/M in view(usr)) M<<"<font size=[M.TextSize]><font color=[SayFont]>Oozarou yells, 'RAWR!'"
		if(msg=="")
			return
		range() << "<font color=[usr.SayFont]><font size=[usr.TextSize]>[usr] says<font color=[usr.SayFont]>: [html_encode(msg)]"
		for(var/mob/A in view(src)) A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [src]([key]): [msg]<br>
</body><html>"}
//Lets players roleplay.
	Roleplay()
		set category = "Other"
		var/image/C=image(icon='RPBubble.dmi',icon_state="",pixel_y=32,pixel_x=0,layer=50)
		overlays.Add(C)
		var/msg = input("Roleplay") as message | null
		if(msg == null || msg == "" || !(length(msg)))
			overlays.Remove(C)
			return
		overlays.Remove(C)
		msg = " " + msg
		var/i = findtext(msg, " \"") // I have to Look for the quotation mark in the message.
		while(i)// When I find the quotation mark i want to start this shit
			var/msgStart = copytext(msg, 1, i) + " <font color=[SayFont]>\"" //+ copytext(msg,i+length("\"")+1))
			var/msgEnd = copytext(msg,i+length("\"")+1)
			var/check = findtext(msgEnd, "\"")
			var/check2 = findtext(msgEnd, "\".")
			var/check4 = findtext(msgEnd, "\"\n")
			if(check)
				msgEnd = copytext(msgEnd,1, check) + "\" </font><font color = yellow>" + copytext(msgEnd, check+length("\"")+1)
			else if(check2)
				msgEnd = copytext(msgEnd,1, check2) + "\" </font><font color = yellow>." + copytext(msgEnd, check2+length("\"")+1)
			else if(check4)
				msgEnd = copytext(msgEnd,1, check4) + "\" </font><font color = yellow>" + copytext(msgEnd, check4+length("\""))
			msg = msgStart + msgEnd
			i = findtext(msg, " \"")
		i = findtext(msg, " (") // Look for the Quotation mark in the message.
		while(i)// When it finds the Quotation mark
			var/msgStart = copytext(msg, 1, i) + " <font color=[OOCFont]>(" //+ copytext(msg,i+length("\"")+1))
			var/msgEnd = copytext(msg,i+length("(")+1)
			var/check = findtext(msgEnd, ")")
			var/check2 = findtext(msgEnd, ").")
			var/check4 = findtext(msgEnd, ")\n")
			if(check)
				msgEnd = copytext(msgEnd,1, check) + ") </font><font color = yellow>" + copytext(msgEnd, check+length(")")+1)
			else if(check2)
				msgEnd = copytext(msgEnd,1, check2) + ") </font><font color = yellow>." + copytext(msgEnd, check2+length(")")+1)
			else if(check4)
				msgEnd = copytext(msgEnd,1, check4) + ") </font><font color = yellow>" + copytext(msgEnd, check4+length(")"))
			msg = msgStart + msgEnd
			i = findtext(msg, " (")
		if(Oozarou&&Oozarouskill<10) for(var/mob/M in range(usr)) M<<"<font size=[M.TextSize]><[OOCFont]>-Oozarou yells, 'ROAAARRR!!!'"
		else for(var/mob/M in range(screenx,usr)) M<<"<font size=[M.TextSize]><font color=yellow>~*[name][msg]*~"
		world<<output("<font color= yellow>*<font color=yellow>[usr] [(msg)]<font color = white>*","Rpspy.output1")
		for(var/mob/A in view(src)) A.PlayerLog+={"<html>
			<head><title></head></title><body>
			<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
			**[time2text(world.realtime,"Day DD hh:mm")] [src]([key]) [msg]**<br>
			</body><html>"}
//Lets players communicate via telepathy.
obj/Skills/Telepathy/verb/Telepathy(mob/M in world)
	set category="Skills"
	if(M.telepathy==0)
		usr<<"You are muted."
	if(M.telepathy==1|M.seetelepathy)
		var/message=input("Say what in telepathy?") as text
		if(M) M<<"<font size=[M.TextSize]><font face=Old English Text MT><font color=red>[usr] says in telepathy, '[html_encode(message)]'"
		usr<<"<font face=Old English Text MT><font color=red>[usr] says in telepathy, '[html_encode(message)]'"
		usr.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
Telepathy to [time2text(world.realtime,"Day DD hh:mm")] [M]([M.key]): [message]<br>
</body><html>"}
	else usr<<"They have their telepathy turned off."
//Lets players see who is online.
mob/var/tmp/Who={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
</body><html>"}
mob/verb/Who()
	set category="Other"
	var/amount=0
	for(var/mob/M) if(M.client) amount+=1
	Who+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
<br>Players: [amount]
</body><html>"}
	for(var/mob/M) if(M.client) Who+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
<br><font color=[rand(2,9)][rand(2,9)][rand(2,9)][rand(2,9)][rand(2,9)][rand(2,9)]>[M.name] ([M.displaykey])
</body><html>"}
	usr<<browse(Who,"window=Who;size=400x400")
	Who={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
</body><html>"}
//Allows players to create their own factions.
mob/verb/CreateFaction()
	set category="Other"
	usr<<"Faction created."
	var/obj/Faction/A=new/obj/Faction
	A.factioncode=rand(1,1000000000)
	A.leader=1
	contents+=A
obj/Faction
	var/version=0 //Version goes up when leader changes something...
	var/rank=1 //2, 3... 4, leader....
	var/factioncode
	var/notes
	var/leader=0
	suffix="Rank 1" //Changes in faction update...
	verb/Name()
		set category=null
		if(rank>=4|leader)
			version+=1
			name=input("") as text
		else usr<<"This is for the faction leader only."
	verb/SwitchLeader(mob/M in world)
		set category=null
		if(leader)
			for(var/obj/Faction/A in M.contents) if(A.factioncode==factioncode)
				leader=0
				A.leader=1
				M<<"[usr] has made you the new leader of the faction..."
				usr<<"You are no longer the leader of this faction, you have given it to [M]"
			else usr<<"You can only make someone else the leader if you are the leader in the first place."
	verb/Boot(mob/M in world)
		set category=null
		for(var/obj/Faction/A in M.contents) if(A.factioncode==factioncode)
			M<<"You have been booted from the [name] by [usr.name]"
			del(A)
	verb/Rank(mob/M in world)
		set category=null
		for(var/obj/Faction/A in M.contents) if(A.factioncode==factioncode)
			if(A.rank<rank|leader)
				usr<<"[M] is currently rank [A.rank]"
				A.rank=input("Input a rank between 1 and 4, 1 will have only basic commands, 2 will be able to recruit, 3 will be able to boot those who are lower than them, level 4 has the same powers as the leader. All ranks can rank other members but only if that members rank is lower than theirs, and they cant set the rank past what their rank is.") as num
				if(A.rank>rank&&!leader) A.rank=rank
				A.suffix="Rank [A.rank]"
			else usr<<"You cant do anything against them their rank is higher than yours."
	verb/Icon(A as icon)
		set category=null
		if(leader)
			icon=A
			var/state=input("Enter an icon_state if any") as text
			icon_state=state
			version+=1
		else usr<<"This is for the faction leader only."
	verb/EditNotes()
		set category=null
		if(leader)
			version+=1
			notes=input("") as text
		else usr<<"This is for the leader only."
	verb/Recruit(mob/M in view(usr))
		set category=null
		if(rank>=2|leader)
			switch(input(M,"Join [name]?","",text) in list("Yes","No",))
				if("Yes")
					var/obj/Faction/A=new/obj/Faction
					A.icon=icon
					A.name=name
					A.version=version
					A.rank=1
					A.factioncode=factioncode
					A.notes=notes
					M.contents+=A
					M<<"You have recieved the faction badge of this guild, it is electronic and will update itself when it gets near another member that has a higher badge version than you. It also functions as a communicator."
					view(M)<<"[M] is now a member of the [name]"
				else view(M)<<"Has declined to join the [name]"
		else usr<<"This is for rank 2 or above."
	verb/Leave()
		set category=null
		del(src)
	verb/Notes()
		set category=null
		usr<<notes
	verb/MembersOnline()
		set category=null
		for(var/mob/M) for(var/obj/Faction/A in M.contents) if(A.factioncode==factioncode) usr<<"[M] ([M.displaykey])"
	verb/Speak(A as text)
		set category=null
		oview(usr)<<"<font color=#FF0000><font size=1>[usr] speaks into a faction badge..."
		for(var/mob/M) for(var/obj/Faction/F in M.contents) if(F.factioncode==factioncode) M<<"<font color=[usr.SayFont]><b>(Faction)[usr]: [A]"
mob/proc/FactionUpdate()
	for(var/obj/Faction/F in contents) for(var/mob/M in view(src))
		for(var/obj/Faction/A in M.contents) if(F.factioncode==A.factioncode)
			if(A.version>F.version)
				F.name=A.name
				F.icon=A.icon
				F.version=A.version
				F.notes=A.notes
				src<<"[M]'s faction ([A.name]) is a higher version than your faction ([F.name]), your faction has automatically been updated to their version."