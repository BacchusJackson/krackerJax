//Dead Zone Stuff
obj/DeadZone
	icon='Portal.dmi'
	icon_state="center"
	New()
		..()
		var/image/A=image(icon='Portal.dmi',icon_state="n")
		var/image/B=image(icon='Portal.dmi',icon_state="e")
		var/image/C=image(icon='Portal.dmi',icon_state="s")
		var/image/D=image(icon='Portal.dmi',icon_state="w")
		var/image/E=image(icon='Portal.dmi',icon_state="ne")
		var/image/F=image(icon='Portal.dmi',icon_state="nw")
		var/image/G=image(icon='Portal.dmi',icon_state="sw")
		var/image/H=image(icon='Portal.dmi',icon_state="se")
		A.pixel_y+=32
		B.pixel_x+=32
		C.pixel_y-=32
		D.pixel_x-=32
		E.pixel_y+=32
		E.pixel_x+=32
		F.pixel_y+=32
		F.pixel_x-=32
		G.pixel_y-=32
		G.pixel_x-=32
		H.pixel_y-=32
		H.pixel_x+=32
		overlays+=A
		overlays+=B
		overlays+=C
		overlays+=D
		overlays+=E
		overlays+=F
		overlays+=G
		overlays+=H
		spawn while(src)
			sleep(1)
			for(var/mob/M in oview(12,src)) if(prob(20)&&!M.expandlevel)
				M.move=1
				step_towards(M,src)
			for(var/mob/M in view(0,src))
				view(12,src)<<"[M] is sucked into the dead zone!!"
				M.loc=locate(25,23,18)
			if(prob(0.5)) del(src)
mob/Rank/verb/MakeAmulet()
	set category="Skills"
	var/obj/A=new/obj/items/Amulet
	usr.contents+=A
obj/items/Amulet
	icon='Object DZ Amulet.dmi'
	var/tmp/using
	verb/Open()
		set category=null
		set src in usr
		if(!using)
			using=1
			view(1)<<"[usr] opens the amulet and a portal to the dead zone appears!!"
			new/obj/DeadZone(locate(usr.x,usr.y+5,usr.z))
			spawn(300) using=0
//Conjure Stuff
mob/var/tmp
	Conjurer
	ConjureX=1
	ConjureY=1
	ConjureZ=1
obj/Skills/Conjure/
	verb/DeConjure()
		set category="Skills"
		var/list/Demons=new/list
		for(var/mob/Demon) if(Demon.client) if(Demon.Conjurer==usr.key) Demons.Add(Demon)
		var/mob/Choice=input("Send back which Demon?") in Demons
		Choice<<"[usr] has sent you back from whence you came."
		var/image/I=image(icon='Black Hole.dmi',icon_state="full")
		flick(I,Choice)
		Choice.loc=locate(Choice.ConjureX,Choice.ConjureY,Choice.ConjureZ)
		flick(I,Choice)
	verb/Conjure()
		set category="Skills"
		usr.Ki*=0.5
		usr.HP*=0.5
		var/list/Demons=new/list
		for(var/mob/Demon) if(Demon.client) if(Demon.Race=="Demon") Demons.Add(Demon)
		var/mob/Choice=input("Conjure which Demon?") in Demons
		var/Reason=input("Input a reason or reward for the demon so they can decide whether they want to come or not...W") as text
		spawn switch(input(Choice,"[usr] wishes to conjure you from the underworld to his location. !WARNING! The conjurer has full control over you.: [Reason]", "", text) in list ("No", "Yes",))
			if("Yes")
				if(usr)
					usr<<"[Choice] has agreed to be conjured to you."
					oview(usr)<<"[usr] conjures the demon [Choice] to do his bidding!"
					Choice.ConjureX=Choice.x
					Choice.ConjureY=Choice.y
					Choice.ConjureZ=Choice.z
					var/image/I=image(icon='Black Hole.dmi',icon_state="full")
					flick(I,Choice)
					Choice.loc=locate(usr.x,usr.y-1,usr.z)
					flick(I,Choice)
					spawn(1) step(Choice,SOUTH)
					Choice.Conjurer=usr.key
			else if(usr) usr<<"[Choice] has denied the conjurer."
//Imitation, allows players that have this verb to imitate another player.
obj/Skills/Imitation
	var/imitating
	var/imitatorname
	var/list/imitatoroverlays=new/list
	var/imitatoricon
	verb/Imitate()
		set category="Skills"
		if(!imitating)
			imitating=1
			imitatorname=usr.name
			imitatoroverlays.Add(usr.overlays)
			imitatoricon=usr.icon
			var/list/People=new/list
			for(var/mob/A in oview(usr)) if(A.client) People.Add(A)
			var/Choice=input("Imitate who?") in People
			for(var/mob/A) if(A==Choice)
				usr.icon=A.icon
				usr.overlays.Remove(usr.overlays)
				usr.overlays.Add(A.overlays)
				usr.name=A.name
		else
			imitating=0
			usr.name=imitatorname
			usr.overlays.Remove(usr.overlays)
			usr.overlays.Add(imitatoroverlays)
			usr.icon=imitatoricon
			imitatoroverlays.Remove(imitatoroverlays)
//Invis stuff
obj/Skills/Invisibility
	var/invising=0
	verb/Invisibility()
		set category="Skills"
		if(!invising)
			invising=1
			usr.invisibility=4
			spawn while(invising)
				sleep(10)
				usr.Ki-=5
				if(usr.Ki<10)
					invising=0
					usr.invisibility=0
					usr<<"Your energy has run out, therefore you cannot remain invisible."
		else
			invising=0
			usr.invisibility=0

//Demon Revive
mob/Skills/verb/Demon_Revive(mob/M in world)
	set category="Skills"
	if(!usr.dead)
		if(M==usr) usr<<"You cannot revive yourself."
		else if(M.dead)
			switch(input(usr,"This will revive one dead person and bring them back to your location, But it has a 25% chance of killing you as well.","",text) in list ("No","Yes",))
				if("Yes")
					usr<<"You revive [M] and bring them to your location!"
					M.dead=0
					M.overlays-='Obj Halo.dmi'
					M<<"[usr] has brought you back to the living world!"
					M.loc=locate(usr.x,usr.y,usr.z)
					var/deathchance=rand(1,4)
					if(deathchance==3)
						view(6)<<"[usr] dies from his attempt to bring [M] back to life!"
						usr.Death()
		else usr<<"They are not dead."
	else usr<<"You must be alive to revive someone."