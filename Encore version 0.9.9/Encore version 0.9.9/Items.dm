obj/var/Password
obj/var/mapsave
obj/items/MP3
	icon='Obj PDA.dmi'
	var/notes={"<html>
<head><title>MP3 Player</head></title><body>
<center><body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
</body><html>"}
	var/player={"<img style="visibility:hidden;width:0px;height:0px;" border=0 width=0 height=0 src="http://counters.gigya.com/wildfire/IMP/CXNID=2000002.0NXC/bT*xJmx*PTEyNjUxNDc*NTgwODUmcHQ9MTI2NTE*NzQ3MTcyNSZwPTY5NDMwMSZkPSZnPTEmbz*zOWY1NmI*NjRlYzk*NTZhYmQy/ODYxMGI4YWFmOTliNSZvZj*w.gif" /><div style="text-align: center; margin-left: auto; visibility:visible; margin-right: auto; width:450px;"> <object width="435" height="270"> <param name="movie" value="http://www.musicplaylist.us/mc/mp3player_new.swf"></param> <param name="allowscriptaccess" value="never"></param> <param name="wmode" value="transparent"></param> <param name="flashvars" value="config=http%3A%2F%2Fwww.indimusic.us%2Fext%2Fpc%2Fconfig_black.xml&amp;mywidth=435&amp;myheight=270&amp;playlist_url=http%3A%2F%2Fwww.musicplaylist.us%2Fpl.php%3Fplaylist%3D74752576%26t%3D1265147447&amp;wid=os"></param> <embed style="width:435px; visibility:visible; height:270px;" allowScriptAccess="never" src="http://www.musicplaylist.us/mc/mp3player_new.swf" flashvars="config=http%3A%2F%2Fwww.indimusic.us%2Fext%2Fpc%2Fconfig_black.xml&amp;mywidth=435&amp;myheight=270&amp;playlist_url=http%3A%2F%2Fwww.musicplaylist.us%2Fpl.php%3Fplaylist%3D74752576%26t%3D1265147447&amp;wid=os" width="435" height="270" name="mp3player" wmode="transparent" type="application/x-shockwave-flash" border="0"/> </object> <br/> <a href="http://www.musicplaylist.us"><img src="http://www.musicplaylist.us/mc/images/create_black.jpg" border="0" alt="Get a playlist!"/></a> <a href="http://www.musicplaylist.us/playlist/19136659467/standalone" target="_blank"><img src="http://www.musicplaylist.us/mc/images/launch_black.jpg" border="0" alt="Standalone player"/></a> <a href="http://www.musicplaylist.us/playlist/19136659467/download"><img src="http://www.musicplaylist.us/mc/images/get_black.jpg" border="0" alt="Get Ringtones"/></a> </div> "}
	name="MP3 Player"
	verb/Play()
		set category=null
		set src in oview(1)
		usr<<browse(notes+player, "window=Notes;size=500x500")
obj/items/PDA
	icon='Obj PDA.dmi'
	var/notes={"<html>
<head><title>Notes</head></title><body>
<center><body bgcolor="#000000"><font size=2><font color="#0099FF"><b><i>
</body><html>"}
	verb/Name()
		set category=null
		name=input("") as text
	verb/View()
		set category=null
		set src in oview(1)
		usr<<browse(notes,"window=Notes;size=500x500")
	verb/Input()
		set category=null
		notes=input(usr,"Notes","Notes",notes) as message
obj/var/WindmillShuriken
obj/GK_Well
	icon='props.dmi'
	icon_state="21"
	density=1
	var/effectiveness=2
	verb/Action()
		set category="Other"
		set src in oview(1)
		if(!usr.drinking&&!usr.train&&!usr.med)
			usr.drinking=1
			view(6)<<"<font color=red>* [usr] drinks some water. *"
			if(usr.HP<100) usr.HP+=(100/effectiveness)
			if(usr.Ki<usr.MaxKi) if(!usr.dead) usr.Ki+=(usr.MaxKi/effectiveness)
			sleep(20)
			usr.drinking=0
mob/var/firsttimehealtank
mob/var/weight=1
mob/var/tmp/Baseweight=1
mob/var/tmp/SeedSaiba
obj/var/SBP=600
obj/var/SLVL=1
obj/var/SXP=0
mob/var/tmp/originator
obj
	items
		Saibaman_Seed
			icon='Obj Saiba Seed.dmi'
			suffix="Level 1"
			var/sicon
			var/saibaout
			verb/Plant()
				set category=null
				set src in usr.contents
				if(!saibaout)
					view(usr)<<"[usr] plants a Saibaman Seed."
					var/mob/M=new/mob/Pet/Saiba
					M.PL=SBP
					M.petlvl=SLVL
					M.petxp=SXP
					M.loc=usr.loc
					M.originator=src
					M.petmaster=usr
					M.name=name
					saibaout=1
					if(sicon) M.icon=sicon
					spawn M.Pet_AI()
				else usr<<"You already have a saiba out, use recall."
			verb/Name()
				set category=null
				set src in usr.contents
				name=input("Set a name for your Saibaman") as text
			verb/Icon(icon as icon)
				set category=null
				set src in usr.contents
				sicon=icon
			verb/Recall()
				set category=null
				set src in usr.contents
				for(var/mob/M) if(M.originator==src)
					del(M)
					view(usr)<<"[usr] recalls [name]"
				saibaout=0
			verb/PetAttack()
				set category=null
				set src in usr.contents
				var/list/PeopleList=new/list
				PeopleList+="Stop Attacking"
				for(var/mob/A in view(usr)) if(A.attackable) PeopleList.Add(A.name)
				var/Choice=input("Attack who?") in PeopleList
				if(Choice=="Stop Attacking") for(var/mob/M) if(M.originator==src) M.Target=null
				else for(var/mob/M in view(usr)) if(M.originator==src)
					for(var/mob/A in view(M)) if(A.name==Choice) M.Target=A
		Weighted_Coat
			icon='Trench Coat.dmi'
			equipped=0
			New()
				..()
				spawn(600) name="[round(weight)]lb Weights"
			verb/Equip()
				set category=null
				set src in usr
				if(usr.Oozarou|usr.bigform)
					usr<<"You cant, your a fat-ass monkey."
					return
				for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your sword is in the way of putting it on."
					return
				for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your sword is in the way of putting it on."
					return
				for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your axe is in the way of putting it on."
					return
				for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your staff is in the way of putting it on."
					return
				for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your blade is in the way of putting it on."
					return
				for(var/obj/items/Armor/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your weights are getting in the way of putting this one."
				for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"You already have a weapon equipped."
					return
				var/hasoneon=0
				for(var/obj/items/Weighted_Coat/G in usr.contents) if(G!=src&&G.equipped) hasoneon=1
				if(!hasoneon)
					if(!equipped)
						if(weight<((usr.Str+usr.End)*5))
							equipped=1
							suffix="*Equipped*"
							usr.Baseweight=weight
							usr.overlays+=icon
							usr<<"You put on the [src]."
						else usr<<"You cant even lift this [src]!"
					else
						equipped=0
						suffix=""
						usr.Baseweight=1
						usr.overlays-=icon
						usr<<"You take off the [src]."
				else usr<<"You already have one on."
		Weighted_Gi
			icon='Clothes_ShortSleeveShirt.dmi'
			equipped=0
			New()
				..()
				spawn(600) name="[round(weight)]lb Weights"
			verb/Equip()
				set category=null
				set src in usr
				if(usr.Oozarou|usr.bigform)
					usr<<"You cant, your a fat-ass monkey."
					return
				for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your sword is in the way of putting it on."
					return
				for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your sword is in the way of putting it on."
					return
				for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your axe is in the way of putting it on."
					return
				for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your staff is in the way of putting it on."
					return
				for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your blade is in the way of putting it on."
					return
				for(var/obj/items/Armor/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
					usr<<"Your weights are getting in the way of putting this one."
					return
				var/hasoneon=0
				for(var/obj/items/Weighted_Gi/G in usr.contents) if(G!=src&&G.equipped) hasoneon=1
				if(!hasoneon)
					if(!equipped)
						if(weight<((usr.Str+usr.End)*5))
							equipped=1
							suffix="*Equipped*"
							usr.Baseweight=weight
							usr.overlays+=icon
							usr<<"You put on the [src]."
						else usr<<"You cant even lift this [src]!"
					else
						equipped=0
						suffix=""
						usr.Baseweight=1
						usr.overlays-=icon
						usr<<"You take off the [src]."
				else usr<<"You already have one on."
		Artificial_Moon
			icon='Obj Artificial Moon.dmi'
			icon_state="Off"
			var/mooning
			verb/Moon()
				set category=null
				set src in oview(1)
				if(!mooning)
					mooning=1
					icon_state="On"
					view(usr)<<"[usr] activates an artificial moon!"
					while(mooning)
						sleep(5)
						for(var/mob/M in view(src))
							if(M.Race=="Saiyan"|M.Race=="Half-Saiyan")
								if(!M.Oozarou&&M.Tail)
									M<<"You catch a glimpse of the moon."
									M.Oozarou()
								else if(!M.Tail) M.Tail_Grow()
						spawn(100) del(src)
				else usr<<"It has already been activated..."
		Emitter
			icon='Obj Emitter.dmi'
			icon_state="Off"
			var/mooning
			verb/Activate()
				set category=null
				set src in oview(1)
				if(!mooning)
					mooning=1
					flick("Turning",src)
					icon_state="On"
					view(usr)<<"[usr] activates the emitter!"
					while(mooning)
						sleep(5)
						for(var/mob/M in view(src))
							if(M.Race=="Saiyan"&&M.Class!="Bebi")
								if(!M.Tail) M.Tail_Grow()
								if(!M.Oozarou&&M.Tail&&M.hasssj) M.GoldenOozarou()
						spawn(100) del(src)
				else usr<<"It has already been activated..."
		Regenerator
			New()
				..()
				var/image/A=image(icon='Obj Heal Tank.dmi',icon_state="top",pixel_y=32)
				var/image/B=image(icon='Obj Heal Tank.dmi',icon_state="bottom",pixel_y=-32)
				overlays.Remove(A,B)
				overlays.Add(A,B)
				while(src)
					if(usable)
						for(var/mob/M in view(0,src)) if(M.HP<100&&Energy>=0.002)
							if(!M.firsttimehealtank)
								M.firsttimehealtank=1
								M.RecordPL+=M.gain*7500*M.PLMod*M.UPMod
							M.HP+=0.1*efficiency*M.HPRegen
							Energy-=0.002*efficiency
							if(Energy<=0) view(src)<<"[src]: Battery has been completely drained."
							M.Zenkai()
							M.dir=SOUTH
							if(M.icon_state=="KO") M.icon_state=""
							if(M.KO&&M.HP>=100/M.HPRegen) M.Un_KO()
						for(var/turf/T in view(0,src)) if(T.gravity>10*Durability&&usable)
							usable=0
							icon_state="middlebroke"
							view(src)<<"The [src] is crushed by the force of the gravity!"
						if(prob(NanoCore*0.1)&&Energy<MaxEnergy*0.1)
							view(src)<<"[src]: Nanite Regeneration activated. Battery fully recharged."
							Energy=MaxEnergy
					else if(prob(NanoCore*0.1))
						usable=1
						view(src)<<"[src]: Nanite Regeneration activated. Damage fully restored."
						icon_state="middle"
					sleep(10)
			icon='Obj Heal Tank.dmi'
			icon_state="middle"
			layer=MOB_LAYER+1
			var/usable=1
			var/efficiency=1
			var/Durability=1
			var/Energy=1
			var/MaxEnergy=1
			var/NanoCore=0
			verb/Info()
				set src in oview(1)
				set category=null
				usr<<"Battery Life: [Energy*100] / [MaxEnergy*100]"
				usr<<"Regeneration: +[efficiency]%"
				usr<<"Durability: [Durability*10]x"
				if(NanoCore) usr<<"Nano Regeneration: [NanoCore]"
				usr<<"Cost to make: [techcost]z"
			verb/Upgrade()
				set src in oview(1)
				set category=null
				if(usr.KO) return
				var/cost=0
				var/list/Choices=new/list
				Choices.Add("Cancel")
				if(usr.zenni>=500*MaxEnergy) Choices.Add("Battery Life ([500*MaxEnergy]z)")
				if(usr.zenni>=1000*efficiency) Choices.Add("Recovery Speed ([1000*efficiency]z)")
				if(usr.zenni>=1000*Durability) Choices.Add("Durability ([1000*Durability]z)")
				if(usr.zenni>=2000*(NanoCore+1)&&usr.techskill>=6) Choices.Add("Nano Regeneration ([2000*(NanoCore+1)]z)")
				var/A=input("Upgrade what?") in Choices
				if(A=="Cancel") return
				if(A=="Battery Life ([500*MaxEnergy]z)")
					cost=500*MaxEnergy
					if(usr.zenni<cost)
						usr<<"You do not have enough money ([cost]z)"
						return
					usr<<"Battery expanded and recharged."
					MaxEnergy+=1
					Energy=MaxEnergy
				if(A=="Recovery Speed ([1000*efficiency]z)")
					cost=1000*efficiency
					if(usr.zenni<cost)
						usr<<"You do not have enough money ([cost]z)"
						return
					usr<<"Healing Speed increased."
					efficiency+=1
				if(A=="Durability ([1000*Durability]z)")
					cost=1000*Durability
					if(usr.zenni<cost)
						usr<<"You do not have enough money ([cost]z)"
						return
					usr<<"Durability increased and fully repaired"
					Durability+=1
					if(!usable)
						usable=1
						icon_state="middle"
				if(A=="Nano Regeneration ([2000*(NanoCore+1)]z)")
					cost=2000*(NanoCore+1)
					if(usr.zenni<cost)
						usr<<"You do not have enough money ([cost]z)"
						return
					usr<<"Nanite Regeneration increased."
					NanoCore+=1
				usr<<"Cost: [cost]z"
				usr.zenni-=cost
				usr.techxp+=round(cost*0.01)
				usr.Tech_Up()
				tech+=1
				techcost+=cost
			verb/Bolt()
				set category=null
				set src in oview(1)
				if(x&&y&&z&&!Bolted)
					switch(input("Are you sure you want to bolt this to the ground so nobody can ever pick it up? Not even you?","",text) in list("Yes","No",))
						if("Yes")
							view(src)<<"<font size=1>[usr] bolts the [src] to the ground."
							Bolted=1
mob/var/yemmas=0
mob/var/might=0
obj/var
	weight=1
	skill=1
	BulletIcon='Blasts.dmi'
	BulletState="Bullet"
obj/items
	Might_Fruit
		icon='Obj Might Fruit.dmi'
		var/power=1
		verb/Eat()
			set category=null
			set src in usr
			if(!usr.might)
				usr.might=1
				usr<<"You eat the Might Fruit and feel your strength mysteriously increase."
				var/boost=usr.gain*100000*GG*usr.PLMod*power
				if(boost>usr.RecordPL) boost=usr.RecordPL
				usr.RecordPL+=boost
				usr.Str+=(250*usr.StrMod)
				usr.MaxKi+=(75*usr.KiMod)
				del(src)
			else
				usr<<"You eat it, but nothing happens."
				del(src)
	Yemma_Fruit
		icon='Obj Yemma Fruit.dmi'
		var/power=1
		verb/Eat()
			set category=null
			set src in usr
			if(usr.yemmas<3)
				usr.yemmas+=1
				usr<<"Wow, these things are good, you feel a bit stronger now."
				var/boost=usr.gain*3400*GG*usr.PLMod*power
				if(boost>usr.RecordPL) boost=usr.RecordPL
				usr.RecordPL+=boost
				usr.MaxKi+=(75*usr.KiMod)
				usr.Spd+=(250*usr.SpdMod)
				del(src)
			else
				usr<<"Nothing happens..."
				del(src)

	Blaster
		New()
			..()
			BlasterR=rand(0,255)
			BlasterG=rand(0,255)
			BlasterB=rand(0,255)
		icon='Obj Blaster.dmi'
		var/BlasterR=0
		var/BlasterG=0
		var/BlasterB=0
		var/reserve=10
		var/maxreserve=10
		var/power=10
		var/powerlevel=100
		var/refire=1
		var/critical=1
		var/failure=1 //Sometimes the shot fails, 50% of the time.
		var/knockback //Can make it a knockback shot
		var/stun //Can make it a stun shot
		BulletIcon='23.dmi'
		BulletState="23"
		verb/Info()
			set src in oview(1)
			set category=null
			usr<<"Energy: [reserve] / [maxreserve]"
			usr<<"Force: [power*powerlevel]"
			usr<<"Refire: [refire]"
			usr<<"Failure Chance: [round(20/failure)]%"
			usr<<"Critical Hit: [critical]%"
			if(knockback) usr<<"Knockback feature installed."
			if(stun) usr<<"Stun feature installed."
			usr<<"Cost to make: [techcost]z"
		verb/Upgrade()
			set src in oview(1)
			set category=null
			if(usr.KO) return
			var/cost=0
			var/list/Choices=new/list
			Choices.Add("Cancel")
			if(usr.zenni>=10*maxreserve) Choices.Add("Energy Reserve ([10*maxreserve]z)")
			if(usr.zenni>=10*power) Choices.Add("Force ([10*power]z)")
			if(usr.zenni>=100*refire) Choices.Add("Refire ([100*refire]z)")
			if(usr.zenni>=100*failure) Choices.Add("Reduce Failure ([100*failure]z)")
			if(usr.zenni>=500*critical) Choices.Add("Critical Chance ([500*critical]z)")
			if(usr.zenni>=2000) Choices.Add("Knockback effect (2000z)")
			if(usr.zenni>=3000) Choices.Add("Stun effect (3000z)")
			var/A=input("Upgrade what?") in Choices
			if(A=="Cancel") return
			if(A=="Critical Chance ([500*critical]z)")
				cost=500*critical
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Critical hit chance increased."
				critical+=1
			if(A=="Energy Reserve ([10*maxreserve]z)")
				cost=10*maxreserve
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Energy Reserve increased. Energy fully restored."
				maxreserve*=2
				reserve=maxreserve
			if(A=="Force ([10*power]z)")
				cost=10*power
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Force increased."
				power*=2
				powerlevel*=2
			if(A=="Refire ([100*refire]z)")
				cost=100*refire
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Refire time decreased."
				refire+=1
			if(A=="Reduce Failure ([100*failure]z)")
				cost=100*failure
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Chance of failure decreased."
				failure+=1
			if(A=="Knockback effect (2000z)")
				cost=2000
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Knockback feature added."
				knockback=1
			if(A=="Stun effect (3000z)")
				cost=3000
				if(usr.zenni<cost)
					usr<<"You do not have enough money ([cost]z)"
					return
				usr<<"Stun feature added."
				stun=1
			usr<<"Cost: [cost]z"
			usr.zenni-=cost
			usr.techxp+=round(cost*0.01)
			usr.Tech_Up()
			tech+=1
			techcost+=cost
		Click()
			set category=null
			if(!usr.med&&!usr.train&&!usr.KO&&!usr.blasting&&reserve>=1)
				if(prob(20/failure))
					usr<<"The shot was a dud."
					return
				usr.blasting=1
				var/obj/A=new/obj/attack/blast
				A.loc=locate(usr.x,usr.y,usr.z)
				A.icon=BulletIcon
				A.icon_state=BulletState
				A.icon+=rgb(BlasterR,BlasterG,BlasterB)
				A.density=1
				if(knockback) A.shockwave=1
				if(stun) A.paralysis=1
				A.Pow=power
				A.PL=powerlevel
				A.KiSetting=0
				if(prob(critical))
					A.PL*=10
					A.icon='16.dmi'
					A.icon_state="16"
					A.icon+=rgb(BlasterR,BlasterG,BlasterB)
				walk(A,usr.dir)
				reserve-=1
				spawn(100/refire)
				usr.blasting=0
				if(reserve<1) usr<<"[src]: Out of energy!"
obj/var/NotSavable
obj/var
	armorincrease=1
	armordecrease=1
obj/items/Armor
	icon='Clothes_Armor1.dmi'
	NotSavable=1
	verb/Description()
		set category=null
		usr<<"This armor increases endurance to [armorincrease*100]%, and reduces speed to [armordecrease*100]%"
	verb/Equip()
		set category=null
		set src in usr
		for(var/obj/items/Armor/A in usr.contents) if(A.equipped&&A!=src)
			usr<<"You already have armor equipped."
			return
		if(!equipped)
			equipped=1
			suffix="*Equipped*"
			usr.overlays+=icon
			usr<<"You put on the [src]."
			usr.End*=armorincrease
			usr.Spd*=armordecrease
		else
			equipped=0
			suffix=""
			usr.overlays-=icon
			usr<<"You take off the [src]."
			usr.End/=armorincrease
			usr.Spd/=armordecrease
mob/var/equipped=0
obj/var/zenni
obj/var/equipped=0
obj/var
	IP1
	IP2
	IP3
	key1
	key2
	key3
obj/items
	verb
		Get()
			set category=null
			set src in oview(1)
			if(Bolted)
				usr<<"It is bolted to the ground, you cannot get it."
				return
			if(usr.client&&world.host!=usr.key)
				if(IP1==usr.client.address&&key1!=usr.key)
					usr<<"You cannot pick up items dropped by your multikey."
					return
				else if(IP2==usr.client.address&&key2!=usr.key)
					usr<<"You cannot pick up items dropped by your multikey."
					return
				else if(IP3==usr.client.address&&key3!=usr.key)
					usr<<"You cannot pick up items dropped by your multikey."
					return
			if(usr)
				if(!usr.KO)
					for(var/turf/G in view(src)) G.gravity=0
					Move(usr)
					view(usr)<<"<font color=teal><font size=1>[usr] picks up [src]."
					for(var/mob/A in view(usr))
						A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [usr]([usr.key]) picks up [src].<br>
</body><html>"}
				else usr<<"You cant, you are knocked out."
		Drop()
			set category=null
			set src in usr
			if(equipped|suffix=="*Equipped*")
				usr<<"You must unequip it first"
				return
			if(!IP1)
				IP1=usr.client.address
				key1=usr.key
			else if(!IP2)
				IP2=usr.client.address
				key2=usr.key
			else if(!IP3)
				key3=usr.key
				IP3=usr.client.address
			else
				var/chance=rand(1,3)
				if(chance==1)
					IP1=null
					key1=null
				else if(chance==2)
					IP2=null
					key2=null
				else
					key3=null
					IP3=null
			usr.overlays-=icon
			loc=usr.loc
			step(src,usr.dir)
			view(usr)<<"<font size=1><font color=teal>[usr] drops [src]."
			for(var/mob/A in view(usr))
				A.PlayerLog+={"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=1><font color="#0099FF"><b><i>
[time2text(world.realtime,"Day DD hh:mm")] [usr]([usr.key]) drops [src].<br>
</body><html>"}
obj/Zenni
	icon='Misc.dmi'
	icon_state="ZenniBag"
	var/getkey
	var/getIP
	verb/Drop()
		set category=null
		set src in usr
		var/zenni=input("Drop how much Zenni?") as num
		if(zenni>usr.zenni) zenni=usr.zenni
		if(zenni<=0) usr<<"You must atleast drop 1 Zenni."
		if(zenni>=1)
			zenni=round(zenni)
			usr.zenni-=zenni
			var/obj/Zenni/A=new/obj/Zenni
			A.loc=locate(usr.x,usr.y,usr.z)
			A.zenni=zenni
			A.name="[num2text(A.zenni,20)] Zenni"
			A.getkey=usr.key
			A.getIP=usr.client.address
			step(A,usr.dir)
			view(usr)<<"<font size=1><font color=teal>[usr] drops [num2text(zenni,20)] zenni."
			if(A.zenni<100) A.icon_state="Zenni1"
			else if(A.zenni<200) A.icon_state="Zenni2"
			else if(A.zenni<500) A.icon_state="Zenni3"
			else if(A.zenni<1000) A.icon_state="Zenni4"
			else
				A.icon_state="Zenni4"
				var/Size=round(A.zenni/2000)
				var/Offset=10+round(A.zenni/4000)
				if(Size>1000) Size=1000
				if(Offset>128) Offset=128
				while(Size&&src)
					Size-=1
					var/image/I=image(icon='Misc.dmi',icon_state="Zenni4",pixel_y=rand(-Offset,Offset),pixel_x=rand(-Offset,Offset))
					A.underlays.Add(I)
					sleep(1)
mob/var/tmp/insuit
obj/items/SpaceSuit
	icon='Space Suit.dmi'
	verb/Equip()
		set category=null
		set src in usr
		for(var/obj/items/SpaceSuit/A in usr.contents) if(A.equipped&&A!=src)
			usr<<"You already have a suit equipped."
			return
		if(!equipped)
			equipped=1
			suffix="*Equipped*"
			usr.overlays+=icon
			usr<<"You put on the [src]."
			usr.insuit=1
			usr.spacebreather=1
		else
			equipped=0
			suffix=""
			usr.overlays-=icon
			usr<<"You take off the [src]."
			usr.insuit=0
			usr.spacebreather=0
obj/items/Radar
	icon='Misc2.dmi'
	icon_state="Radar"
	New()
		..()
		for(var/obj/items/Radar/A) if(A!=src)
			view(src)<<"One of these already exist, only one can exist at once."
			del(src)
	verb/Locate()
		set category=null
		if(!eactive) usr<<"Active dragonballs not detected."
		for(var/obj/items/dbs/edbs/O) if(O.z==usr.z) if(eactive) usr<<"<font color=green>------------<br>Dragonball found at ([O.x],[O.y],[O.z])"
		for(var/mob/M) if(M.z==usr.z) for(var/obj/items/dbs/edbs/A in M.contents) if(eactive) usr<<"<font color=green>------------<br>Dragonball found at ([M.x],[M.y],[M.z])"
		//-----------------------------
		if(!nactive) usr<<"Active dragonballs not detected."
		for(var/obj/items/dbs/ndbs/O) if(O.z==usr.z) if(nactive) usr<<"<font color=green>------------<br>Dragonball found at ([O.x],[O.y],[O.z])"
		for(var/mob/M) if(M.z==usr.z) for(var/obj/items/dbs/ndbs/A in M.contents) if(nactive) usr<<"<font color=green>------------<br>Dragonball found at ([M.x],[M.y],[M.z])"
mob/var/scouteron //if you do or do not hear scouter speak
mob/var/weapon
obj/items
	Scouter_Contacts
		icon='Scouter Contact - Black.dmi'
		var/maxscan=500
		verb
			Icon()
				set category=null
				set src in oview(1)
				var/scoutercolor
				var/scoutercontact='Scouter Contact - Black.dmi'
				switch(input("Which eye would you like to place it on?","", text) in list ("Left", "Right"))
					if("Left")
						scoutercolor+=input("Please select the color for this device.") as color
						scoutercontact+=scoutercolor
						icon=scoutercontact
					if("Right")
						scoutercolor+=input("Please select the color for this device.") as color
						scoutercontact='Scouter Contact - Black 2.dmi'
						scoutercontact+=scoutercolor
						icon=scoutercontact
			Scouter_Speak(msg as text)
				set category=null
				for(var/mob/M) if(usr.scouteron&&M.scouteron&&M.dead==usr.dead) M<<"(Scouter)<font color=[usr.SayFont]>[usr] says, '[msg]'"
			Equip()
				set category=null
				set src in usr
				if(!usr.scouteron)
					usr.scouteron=1
					usr<<"You put on the [src]."
					usr.overlays+=icon
					suffix="*Equipped*"
				else
					usr.scouteron=0
					usr<<"You take off the [src]."
					usr.overlays-=icon
					suffix=""
			Scan(mob/M in view(usr))
				set category=null
				var/accuracy
				if(M.PL<1000) accuracy=10
				else if(M.PL<10000) accuracy=100
				else if(M.PL<100000) accuracy=1000
				else if(M.PL<1000000) accuracy=10000
				else if(M.PL<10000000) accuracy=100000
				else accuracy=1000000
				if(usr.scouteron)
					if(M.PL<maxscan)
						usr<<"<font color=green><br>-----<br>Scanning..."
						sleep(20)
						usr<<"<font color=green>Battle Power: [num2text((round(M.PL,accuracy)),20)]<br>-Scan Complete-"
						if(M.Race=="Saiyan") usr<<"<font color=green>Records show this [M.Race] was born with [M.FirstYearPower] Battle Power."
					else
						usr<<"<font color=green><br>-----<br>Scanning..."
						sleep(20)
						usr<<"<font color=green>..."
						sleep(20)
						if(M.Race=="Saiyan") usr<<"<font color=green>Records show this [M.Race] was born with [M.FirstYearPower] Battle Power."
						view(usr)<<"<font color=red>*[usr]'s scouter explodes!*"
						usr.scouteron=0
						usr.overlays-=icon
						suffix=""
						del(src)
				else usr<<"You must equip the scouter."
			Upgrade()
				set category=null
				set src in oview(1)
				if(usr.KO) return
				if((usr.techskill**3)*1000>maxscan)
					usr.Tech_Up()
					maxscan=(usr.techskill**3)*1000
					view(6)<<"[usr] upgrades the scouters max scan to [num2text((round(maxscan)),20)]"
				else usr<<"This is already beyond any of your machine skills."
			Scan_Planet()
				set category=null
				for(var/mob/M)
					var/accuracy
					if(M.PL<1000) accuracy=10
					else if(M.PL<10000) accuracy=100
					else if(M.PL<100000) accuracy=1000
					else if(M.PL<1000000) accuracy=10000
					else if(M.PL<10000000) accuracy=100000
					else accuracy=1000000
					if(usr.scouteron&&M.player&&M.key!=usr.key&&M.PL>=100&&M.z==usr.z)
						if(M.PL<=maxscan) usr<<"<font color=green>[num2text((round(M.PL,accuracy)),20)] at ([M.x],[M.y])"
						else usr<<"<font color=green>Immeasurable BP at ([M.x],[M.y])"

	Scouter_Shades
		icon='Scouter Shades - White.dmi'
		var/maxscan=500
		verb
			Icon()
				set category=null
				set src in oview(1)
				var/scoutercolor
				var/scoutershades='Scouter Shades - White.dmi'
				scoutercolor+=input("Please select the color for this device.") as color
				scoutershades+=scoutercolor
				icon=scoutershades
			Scouter_Speak(msg as text)
				set category=null
				for(var/mob/M) if(usr.scouteron&&M.scouteron&&M.dead==usr.dead) M<<"(Scouter)<font color=[usr.SayFont]>[usr] says, '[msg]'"
			Equip()
				set category=null
				set src in usr
				if(!usr.scouteron)
					usr.scouteron=1
					usr<<"You put on the [src]."
					usr.overlays+=icon
					suffix="*Equipped*"
				else
					usr.scouteron=0
					usr<<"You take off the [src]."
					usr.overlays-=icon
					suffix=""
			Scan(mob/M in view(usr))
				set category=null
				var/accuracy
				if(M.PL<1000) accuracy=10
				else if(M.PL<10000) accuracy=100
				else if(M.PL<100000) accuracy=1000
				else if(M.PL<1000000) accuracy=10000
				else if(M.PL<10000000) accuracy=100000
				else accuracy=1000000
				if(usr.scouteron)
					if(M.PL<maxscan)
						usr<<"<font color=green><br>-----<br>Scanning..."
						sleep(20)
						usr<<"<font color=green>Battle Power: [num2text((round(M.PL,accuracy)),20)]<br>-Scan Complete-"
						if(M.Race=="Saiyan") usr<<"<font color=green>Records show this [M.Race] was born with [M.FirstYearPower] Battle Power."
					else
						usr<<"<font color=green><br>-----<br>Scanning..."
						sleep(20)
						usr<<"<font color=green>..."
						sleep(20)
						if(M.Race=="Saiyan") usr<<"<font color=green>Records show this [M.Race] was born with [M.FirstYearPower] Battle Power."
						view(usr)<<"<font color=red>*[usr]'s scouter explodes!*"
						usr.scouteron=0
						usr.overlays-=icon
						suffix=""
						del(src)
				else usr<<"You must equip the scouter."
			Upgrade()
				set category=null
				set src in oview(1)
				if(usr.KO) return
				if((usr.techskill**3)*1000>maxscan)
					usr.Tech_Up()
					maxscan=(usr.techskill**3)*1000
					view(6)<<"[usr] upgrades the scouters max scan to [num2text((round(maxscan)),20)]"
				else usr<<"This is already beyond any of your machine skills."
			Scan_Planet()
				set category=null
				for(var/mob/M)
					var/accuracy
					if(M.PL<1000) accuracy=10
					else if(M.PL<10000) accuracy=100
					else if(M.PL<100000) accuracy=1000
					else if(M.PL<1000000) accuracy=10000
					else if(M.PL<10000000) accuracy=100000
					else accuracy=1000000
					if(usr.scouteron&&M.player&&M.key!=usr.key&&M.PL>=100&&M.z==usr.z)
						if(M.PL<=maxscan) usr<<"<font color=green>[num2text((round(M.PL,accuracy)),20)] at ([M.x],[M.y])"
						else usr<<"<font color=green>Immeasurable BP at ([M.x],[M.y])"


	Scouter
		icon='Scouterblack.dmi'
		var/maxscan=500
		verb
			Icon()
				set category=null
				set src in oview(1)
				var/scoutercolor
				var/scouter='Scouterblack.dmi'
				switch(input("Which eye would you like to place it on?","", text) in list ("Left", "Right"))
					if("Left")
						scoutercolor+=input("Please select the color for this device.") as color
						scouter+=scoutercolor
						icon=scouter
					if("Right")
						scoutercolor+=input("Please select the color for this device.") as color
						scouter='Scouter-Black2.dmi'
						scouter+=scoutercolor
						icon=scouter

			Scouter_Speak(msg as text)
				set category=null
				for(var/mob/M) if(usr.scouteron&&M.scouteron&&M.dead==usr.dead) M<<"(Scouter)<font color=[usr.SayFont]>[usr] says, '[msg]'"
			Equip()
				set category=null
				set src in usr
				if(!usr.scouteron)
					usr.scouteron=1
					usr<<"You put on the [src]."
					usr.overlays+=icon
					suffix="*Equipped*"
				else
					usr.scouteron=0
					usr<<"You take off the [src]."
					usr.overlays-=icon
					suffix=""
			Scan(mob/M in view(usr))
				set category=null
				var/accuracy
				if(M.PL<1000) accuracy=10
				else if(M.PL<10000) accuracy=100
				else if(M.PL<100000) accuracy=1000
				else if(M.PL<1000000) accuracy=10000
				else if(M.PL<10000000) accuracy=100000
				else accuracy=1000000
				if(usr.scouteron)
					if(M.PL<maxscan)
						usr<<"<font color=green><br>-----<br>Scanning..."
						sleep(20)
						usr<<"<font color=green>Battle Power: [num2text((round(M.PL,accuracy)),20)]<br>-Scan Complete-"
						if(M.Race=="Saiyan") usr<<"<font color=green>Records show this [M.Race] was born with [M.FirstYearPower] Battle Power."
					else
						usr<<"<font color=green><br>-----<br>Scanning..."
						sleep(20)
						usr<<"<font color=green>..."
						sleep(20)
						if(M.Race=="Saiyan") usr<<"<font color=green>Records show this [M.Race] was born with [M.FirstYearPower] Battle Power."
						view(usr)<<"<font color=red>*[usr]'s scouter explodes!*"
						usr.scouteron=0
						usr.overlays-=icon
						suffix=""
						del(src)
				else usr<<"You must equip the scouter."
			Upgrade()
				set category=null
				set src in oview(1)
				if(usr.KO) return
				if((usr.techskill**3)*1000>maxscan)
					usr.Tech_Up()
					maxscan=(usr.techskill**3)*1000
					view(6)<<"[usr] upgrades the scouters max scan to [num2text((round(maxscan)),20)]"
				else usr<<"This is already beyond any of your machine skills."
			Scan_Planet()
				set category=null
				for(var/mob/M)
					var/accuracy
					if(M.PL<1000) accuracy=10
					else if(M.PL<10000) accuracy=100
					else if(M.PL<100000) accuracy=1000
					else if(M.PL<1000000) accuracy=10000
					else if(M.PL<10000000) accuracy=100000
					else accuracy=1000000
					if(usr.scouteron&&M.player&&M.key!=usr.key&&M.PL>=100&&M.z==usr.z)
						if(M.PL<=maxscan) usr<<"<font color=green>[num2text((round(M.PL,accuracy)),20)] at ([M.x],[M.y])"
						else usr<<"<font color=green>Immeasurable BP at ([M.x],[M.y])"

	ArmorAzure
		icon='ArmorAzureedit.dmi'
		var/armorincrease2=1.65
		var/armorincrease3=1.65
		var/armordecrease2=0.7
		var/armordecrease3=0.8
		verb/Description()
			set category=null
			usr<<"This armor increases resistance to [armorincrease2*100]%, increases endurance to [armorincrease3*100]%, reduces speed to [armordecrease2*100]%, and reduces offense to [armordecrease3*100]%"
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Armor/A in usr.contents) if(A.equipped&&A!=src)
				usr<<"You already have armor equipped."
				return
			if(!equipped)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
				usr.Res*=armorincrease2
				usr.End*=armorincrease3
				usr.Spd*=armordecrease2
				usr.Offense*=armordecrease3
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
				usr.Res/=armorincrease2
				usr.End/=armorincrease3
				usr.Spd/=armordecrease2
				usr.Offense/=armordecrease3

	Axe
		icon='Obj Battle Axe Sheathed.dmi'
		var/Power=3
		var/Speed=1
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
			for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			if(!suffix)
				suffix="*Equipped*"
				usr.Str*=Power
				usr.orefire*=Speed
				usr.overlays+=icon
				usr<<"You put on the [src]."
				equipped=1
				usr.weapon=1
			else
				suffix=null
				usr.Str/=Power
				usr.orefire/=Speed
				usr.overlays-=icon
				usr<<"You take off the [src]."
				equipped=0
				usr.weapon=0
	Staff
		icon='Obj Battle Staff Sheathed.dmi'
		var/Power=1.5
		var/Speed=3
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
			for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			if(!suffix)
				suffix="*Equipped*"
				usr.Str*=Power
				usr.orefire*=Speed
				usr.overlays+=icon
				usr<<"You put on the [src]."
				equipped=1
				usr.weapon=1
			else
				suffix=null
				usr.Str/=Power
				usr.orefire/=Speed
				usr.overlays-=icon
				usr<<"You take off the [src]."
				equipped=0
				usr.weapon=0
	Sword
		icon='Obj Sword Regular.dmi'
		var/Power=1.5
		var/Speed=2
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
			for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			if(!suffix)
				suffix="*Equipped*"
				usr.Str*=Power
				usr.orefire*=Speed
				usr.overlays+=icon
				usr<<"You put on the [src]."
				equipped=1
				usr.weapon=1
			else
				suffix=null
				usr.Str/=Power
				usr.orefire/=Speed
				usr.overlays-=icon
				usr<<"You take off the [src]."
				equipped=0
				usr.weapon=0
		verb/Icon()
			set category=null
			set src in oview(1)
			switch(input("Which sword style do you want?","", text) in list ("Regular", "Claymore","Buster",))
				if("Regular")
					icon='Obj Sword Regular.dmi'
				if("Claymore")
					icon='Obj Claymore.dmi'
				if("Buster")
					icon='Obj Bustersword.dmi'

	Powersword
		icon='Power Sword.dmi'
		var/Power=2.5
		var/Speed=1.5
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
			for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			if(!suffix)
				suffix="*Equipped*"
				usr.Str*=Power
				usr.orefire*=Speed
				usr.overlays+=icon
				usr<<"You put on the [src]."
				equipped=1
				usr.weapon=1
			else
				suffix=null
				usr.Str/=Power
				usr.orefire/=Speed
				usr.overlays-=icon
				usr<<"You take off the [src]."
				equipped=0
				usr.weapon=0
	Machineblade
		icon='machineblade.dmi'
		var/Power=2.5
		var/Speed=1
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
			for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			if(!suffix)
				suffix="*Equipped*"
				usr.Str*=Power
				usr.orefire*=Speed
				usr.overlays+=icon
				usr<<"You put on the [src]."
				equipped=1
				usr.weapon=1
			else
				suffix=null
				usr.Str/=Power
				usr.orefire/=Speed
				usr.overlays-=icon
				usr<<"You take off the [src]."
				equipped=0
				usr.weapon=0
	KiSword
		icon='KiSword.dmi'
		var/Power=2.5
		var/Speed=1
		verb/Equip()
			set category=null
			set src in usr
			for(var/obj/items/Axe/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Staff/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Sword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Powersword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			for(var/obj/items/Machineblade/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
			for(var/obj/items/KiSword/A in usr.contents) if(A!=src&&A.suffix=="*Equipped*")
				usr<<"You already have a weapon equipped."
				return
			if(!suffix)
				suffix="*Equipped*"
				usr.Pow*=Power
				usr.orefire*=Speed
				usr.overlays+=icon
				usr.kimanip+=20
				usr<<"You put on the [src]."
				equipped=1
				usr.weapon=1
			else
				suffix=null
				usr.Pow/=Power
				usr.orefire/=Speed
				usr.overlays-=icon
				usr.kimanip-=20
				usr<<"You take off the [src]."
				equipped=0
				usr.weapon=0
	SamuraiHat1
		icon='Samurai Hat.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	SamuraiHat2
		icon='SamuraiHat2.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	MimiShirt
		icon='Mime Shirt.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	HalfMask
		icon='Half Mask.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Armbands
		icon='Clothing_Armbands.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Necklace2
		icon='Clothing_LegendaryNecklace.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	FlowingCape
		icon='Flowing Cape.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Eyepatch
		NotSavable=1
		icon='Eye Patch.dmi'
		verb
			Switch()
				set category=null
				set src in oview(1)
				switch(input("Which eye would you like to place it on?","", text) in list ("Left", "Right"))
					if("Left")
						icon='Eye Patch.dmi'
					if("Right")
						icon='Eye Patch2.dmi'
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	TrenchCoat
		icon='Trench Coat.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	TuffleTux
		icon='Tuffle Tux.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	LabCoat
		icon='Lab Coat Black.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Legbands
		icon='Leg Bands.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Hood
		icon='Clothes_Hood.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	BaggyPants
		icon='Clothes_PantsBaggy.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."

	Shades
		icon='Clothing_Shades.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Suit
		icon='Clothing_Suit.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Cape2
		icon='Clothing_Cape2.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Belt2
		icon='Clothing_Legendarybelt.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Mask3
		icon='Clothing_Black and Silver Mask.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Mask4
		icon='Clothing_Red and Silver Mask.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Mask5
		icon='Clothing_White and Red Mask.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Necklace1
		icon='Clothes_Necklace1.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	RippedBandana
		icon='Clothes_Bandana_Ripped.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	WaisRobe
		icon='Clothes_WaisRobe.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	TippedBoots
		icon='Clothing_TippedBoots.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Wristband
		icon='Clothes_Wristband.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Turban
		icon='Clothes_Turban.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	TankTop
		icon='Clothes_TankTop.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	ShortSleeveShirt
		icon='Clothes_ShortSleeveShirt.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Shoes
		icon='Clothes_Shoes.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Sash
		icon='Clothes_Sash.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Pants
		icon='Clothes_Pants.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	NamekianScarf
		icon='Clothes_NamekianScarf.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	LongSleeveShirt
		icon='Clothes_LongSleeveShirt.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	KaioSuit
		icon='Clothes_KaioSuit.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Jacket
		icon='Clothes_Jacket.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Headband
		icon='Clothes_Headband.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Gloves
		icon='Clothes_Gloves.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Boots
		icon='Clothes_Boots.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Bandana
		icon='Clothes_Bandana.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Belt
		icon='Clothes_Belt.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Cape
		icon='Clothes_Cape.dmi'
		NotSavable=1
		verb
			Equip()
				set category=null
				set src in usr
				if(equipped==0)
					equipped=1
					suffix="*Equipped*"
					usr.overlays+=icon
					usr<<"You put on the [src]."
				else
					equipped=0
					suffix=""
					usr.overlays-=icon
					usr<<"You take off the [src]."
	Gi_Bottom
		icon='Clothes_GiBottom.dmi'
		NotSavable=1
		verb
			Equip()
				set category=null
				set src in usr
				if(equipped==0)
					equipped=1
					suffix="*Equipped*"
					usr.overlays+=icon
					usr<<"You put on the [src]."
				else
					equipped=0
					suffix=""
					usr.overlays-=icon
					usr<<"You take off the [src]."
	Mask1
		icon='Clothes_Mask1.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Mask2
		icon='Clothes_Mask2.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
	Gi_Top
		icon='Clothes_GiTop.dmi'
		NotSavable=1
		verb/Equip()
			set category=null
			set src in usr
			if(equipped==0)
				equipped=1
				suffix="*Equipped*"
				usr.overlays+=icon
				usr<<"You put on the [src]."
			else
				equipped=0
				suffix=""
				usr.overlays-=icon
				usr<<"You take off the [src]."
mob/var/Beer
obj/items/Beer
	icon='Beer.dmi'
	name="Beer"
	var/Increase=4
	New()
		..()
		pixel_x+=rand(-16,16)
		pixel_y+=rand(-16,16)
	verb
		Drink()
			set category=null
			if(!usr.KO)
				while(prob(95)) usr.Zenkai()
				if(usr.HP<100) usr.HP+=100
				if(usr.Ki<usr.MaxKi) usr.Ki+=100
				usr.Beer+=Increase
				usr<<"You down some beer."
				del(src)
			else usr<<"You cant drink while unconscious."
		Throw(mob/M in oview(usr))
			set category=null
			view(usr)<<"[usr] throws a beer to [M]."
			missile('Beer.dmi',usr,M)
			sleep(2)
			view(usr)<<"[M] catches the beer."
			Move(M)
		Use_on(mob/M in oview(1))
			set category=null
			if(M.KO)
				view(usr)<<"[usr] pours a beer down [M]'s throat."
				M.Un_KO()
				if(usr.HP<100) usr.HP+=100
				if(usr.Ki<usr.MaxKi) usr.Ki+=100
				while(prob(95)) M.Zenkai()
				M.Beer+=Increase
				del(src)
			else usr<<"You can only use this on an unconscious person."
mob/var/Senzu
obj/items/Senzu
	icon='Senzu.dmi'
	name="Senzu"
	var/Increase=4
	var/division=1
	New()
		..()
		pixel_x+=rand(-16,16)
		pixel_y+=rand(-16,16)
	verb
		Eat()
			set category=null
			if(!usr.KO)
				while(prob(75)) usr.Zenkai()
				if(usr.HP<100) usr.HP+=100
				usr.Senzu+=Increase
				usr<<"You eat a Senzu Bean"
				del(src)
			else usr<<"You cant eat a Senzu while unconscious"
		Throw(mob/M in oview(usr))
			set category=null
			view(usr)<<"[usr] throws a Senzu to [M]"
			missile('Senzu.dmi',usr,M)
			sleep(2)
			view(usr)<<"[M] catches the Senzu"
			Move(M)
		Use_on(mob/M in oview(1))
			set category=null
			if(M.KO)
				view(usr)<<"[usr] gives a Senzu to [M]"
				M.Un_KO()
				if(usr.HP<100) usr.HP+=100
				while(prob(75)) M.Zenkai()
				M.Senzu+=Increase
				del(src)
			else usr<<"You can only use this on an unconscious person."
		Split()
			set category=null
			view(usr)<<"[usr] splits a senzu in half"
			var/amount=2
			while(amount)
				var/obj/items/Senzu/A=new/obj/items/Senzu
				A.division=division*2
				A.Increase=Increase*0.5
				A.name="1/[A.division] Senzu"
				usr.contents+=A
				amount-=1
			del(src)
		Plant()
			set category=null
			loc=locate(usr.x,usr.y,usr.z)
			view(src)<<"[usr] plants a senzu bean in the ground..."
			while(x&&y&&z)
				sleep(100)
				if(prob(0.1))
					var/blarg=name
					division*=0.5
					Increase*=2
					if(division>1) name="1/[division] Senzu"
					else
						icon='Senzu.dmi'
						name="Senzu"
					view(src)<<"The [blarg] grows into a [name]..."
mob/var/tmp/summoning
obj/var/summoned=0
obj/Shenron
	icon='shenronnew.dmi'
	icon_state="Shenron"
	density=1
obj/Porunga
	icon='NPC Dragons.dmi'
	icon_state="Porunga"
	density=1
obj/DB/EDB/verb/Summon_Shenron()
	set category="Other"
	set src in usr
	if(!usr.summoning&&!summoned)
		summoned=1
		usr.summoning=1
		world<<"<font color=yellow>[usr] summons the great dragon Shenron!"
		sleep(100)
		var/obj/A=new/obj/Shenron
		var/xx=usr.x
		var/yy=usr.y+2
		var/zz=usr.z
		A.loc=locate(xx,yy,zz)
		view(9)<<"The Great Dragon appears and asks [usr] for their 1 wish."
		var/wishes=1
		while(wishes)
			switch(input("Make your wish.", "", text) in list ("Power","Revive","Revive-All","Immortality",))
				if("Power")
					world<<"[usr] wishes for power!"
					if(Earth_Guardian!=usr.key) usr.RecordPL+=GG*(GuardianPower/10)*usr.PLMod*usr.BPRank
					else
						world<<"[usr]'s wish fails because they are the guardian."
						usr<<"You cannot increase your power with the dragonballs, because the dragonballs use your power to increase the power of others, and your power cant increase your own power."
				if("Revive-All")
					world<<"[usr] wishes to revive everyone!"
					var/summon
					switch(input("Summon them to you?", "", text) in list ("Yes","No",))
						if("Yes") summon=1
					for(var/mob/M)
						if(M.dead)
							M.dead=0
							M.overlays-='Obj Halo.dmi'
							sleep(10)
							if(summon) M.loc=locate(usr.x,(usr.y-2),usr.z)
				if("Immortality")
					if(!usr.immortal)
						usr.immortal=1
						world<<"[usr] wishes for immortality!"
						usr<<"You are now immortal."
					else
						usr.immortal=0
						world<<"[usr] wishes to be mortal!"
						usr<<"You are now mortal."
			wishes-=1
		view(9)<<"Shenron yells, 'YOUR WISH HAS BEEN GRANTED! TIL THE NEXT SUMMONING, FAREWELL!'"
		sleep(20)
		view(9)<<"The seven dragonballs scatter in all directions across the planet!"
		var/obj/B=new/obj/attack/blast
		B.loc=locate(xx,yy,zz)
		B.icon='16.dmi'
		B.icon_state="16"
		B.icon+=rgb(255,255,0)
		B.density=0
		B.Pow=20
		B.PL=500000
		walk(B,NORTH,1)
		var/obj/C=new/obj/attack/blast
		C.loc=locate(xx,yy,zz)
		C.icon='16.dmi'
		C.icon_state="16"
		C.icon+=rgb(255,255,0)
		C.density=0
		C.Pow=20
		C.PL=500000
		walk(C,NORTHEAST,1)
		var/obj/D=new/obj/attack/blast
		D.loc=locate(xx,yy,zz)
		D.icon='16.dmi'
		D.icon_state="16"
		D.icon+=rgb(255,255,0)
		D.density=0
		D.Pow=20
		D.PL=500000
		walk(D,EAST,1)
		var/obj/F=new/obj/attack/blast
		F.loc=locate(xx,yy,zz)
		F.icon='16.dmi'
		F.icon_state="16"
		F.icon+=rgb(255,255,0)
		F.density=0
		F.Pow=20
		F.PL=500000
		walk(F,SOUTHEAST,1)
		var/obj/G=new/obj/attack/blast
		G.loc=locate(xx,yy,zz)
		G.icon='16.dmi'
		G.icon_state="16"
		G.icon+=rgb(255,255,0)
		G.density=0
		G.Pow=20
		G.PL=500000
		walk(G,SOUTH,1)
		var/obj/I=new/obj/attack/blast
		I.loc=locate(xx,yy,zz)
		I.icon='16.dmi'
		I.icon_state="16"
		I.icon+=rgb(255,255,0)
		I.density=0
		I.Pow=20
		I.PL=500000
		walk(I,SOUTHWEST,1)
		var/obj/J=new/obj/attack/blast
		J.loc=locate(xx,yy,zz)
		J.icon='16.dmi'
		J.icon_state="16"
		J.icon+=rgb(255,255,0)
		J.density=0
		J.Pow=20
		J.PL=500000
		walk(J,WEST,1)
		var/obj/K=new/obj/attack/blast
		K.loc=locate(xx,yy,zz)
		K.icon='16.dmi'
		K.icon_state="16"
		K.icon+=rgb(255,255,0)
		K.density=0
		K.Pow=20
		K.PL=500000
		walk(K,NORTHWEST,1)
		for(var/obj/Shenron/S) del(S)
		for(var/obj/items/dbs/edbs/E)
			E.loc=locate(rand(1,380),rand(1,380),1)
			E.icon_state="inactive"
		usr.summoning=0
		eactive=0
		usr.hasshenron=0
		del(src)
obj/DB/NDB/verb/Summon_Porunga()
	set category="Other"
	set src in usr
	if(!usr.summoning&&!summoned)
		summoned=1
		usr.summoning=1
		world<<"<font color=yellow>[usr] summons the great dragon Porunga!"
		sleep(20)
		var/obj/A=new/obj/Porunga
		var/xx=usr.x
		var/yy=usr.y+2
		var/zz=usr.z
		A.loc=locate(xx,yy,zz)
		view(9)<<"The Great Dragon appears and asks [usr] for their 2 wishes."
		var/wishes=2
		while(wishes)
			switch(input("Make your wishes.", "", text) in list ("Power","Revive","Revive-All","Immortality",))
				if("Power")
					world<<"[usr] wishes for power!"
					if(Namekian_Elder!=usr.key) usr.RecordPL+=GG*(GuardianPower/10)*usr.PLMod*usr.BPRank
					else
						world<<"[usr]'s wish fails because they are the guardian."
						usr<<"You cannot increase your power with the dragonballs, because the dragonballs use your power to increase the power of others, and your power cant increase your own power."
				if("Revive-All")
					world<<"[usr] wishes to revive everyone!"
					var/summon
					switch(input("Summon them to you?", "", text) in list ("Yes","No",))
						if("Yes") summon=1
					for(var/mob/M)
						if(M.dead)
							M.dead=0
							M.overlays-='Obj Halo.dmi'
							sleep(10)
							if(summon) M.loc=locate(usr.x,(usr.y-2),usr.z)
				if("Immortality")
					if(!usr.immortal)
						usr.immortal=1
						world<<"[usr] wishes for immortality!"
						usr<<"You are now immortal."
					else
						usr.immortal=0
						world<<"[usr] wishes to be mortal!"
						usr<<"You are now mortal."
			wishes-=1
		view(9)<<"Porunga yells, 'YOUR WISH HAS BEEN GRANTED!' and suddenly vanishes..."
		sleep(20)
		view(9)<<"The seven dragonballs scatter in all directions across the planet!"
		var/obj/B=new/obj/attack/blast
		B.loc=locate(xx,yy,zz)
		B.icon='16.dmi'
		B.icon_state="16"
		B.icon+=rgb(255,125,0)
		B.density=0
		B.Pow=20
		B.PL=500000
		walk(B,NORTH,1)
		var/obj/C=new/obj/attack/blast
		C.loc=locate(xx,yy,zz)
		C.icon='16.dmi'
		C.icon_state="16"
		C.icon+=rgb(255,125,0)
		C.density=0
		C.Pow=20
		C.PL=500000
		walk(C,NORTHEAST,1)
		var/obj/D=new/obj/attack/blast
		D.loc=locate(xx,yy,zz)
		D.icon='16.dmi'
		D.icon_state="16"
		D.icon+=rgb(255,125,0)
		D.density=0
		D.Pow=20
		D.PL=500000
		walk(D,EAST,1)
		var/obj/F=new/obj/attack/blast
		F.loc=locate(xx,yy,zz)
		F.icon='16.dmi'
		F.icon_state="16"
		F.icon+=rgb(255,125,0)
		F.density=0
		F.Pow=20
		F.PL=500000
		walk(F,SOUTHEAST,1)
		var/obj/G=new/obj/attack/blast
		G.loc=locate(xx,yy,zz)
		G.icon='16.dmi'
		G.icon_state="16"
		G.icon+=rgb(255,125,0)
		G.density=0
		G.Pow=20
		G.PL=500000
		walk(G,SOUTH,1)
		var/obj/I=new/obj/attack/blast
		I.loc=locate(xx,yy,zz)
		I.icon='16.dmi'
		I.icon_state="16"
		I.icon+=rgb(255,125,0)
		I.density=0
		I.Pow=20
		I.PL=500000
		walk(I,SOUTHWEST,1)
		var/obj/J=new/obj/attack/blast
		J.loc=locate(xx,yy,zz)
		J.icon='16.dmi'
		J.icon_state="16"
		J.icon+=rgb(255,125,0)
		J.density=0
		J.Pow=20
		J.PL=500000
		walk(J,WEST,1)
		var/obj/K=new/obj/attack/blast
		K.loc=locate(xx,yy,zz)
		K.icon='16.dmi'
		K.icon_state="16"
		K.icon+=rgb(255,125,0)
		K.density=0
		K.Pow=20
		K.PL=500000
		walk(K,NORTHWEST,1)
		for(var/obj/Porunga/P) del(P)
		for(var/obj/items/dbs/ndbs/N)
			N.loc=locate(rand(1,380),rand(1,380),3)
			N.icon_state="inactive"
		usr.summoning=0
		nactive=0
		usr.hasporunga=0
		del(src)
var
	edragonballs
	eactive=1
	ndragonballs
	nactive=1
	dbtimer=0 //Cleaner adds 1 to this each time til it reaches 2 hours.
	snimbus
obj/var/ostate //original icon state
obj/items/dbs/edbs/edb1
	icon='Earth DragonBalls.dmi'
	icon_state="1"
	ostate="1"
obj/items/dbs/edbs/edb2
	icon='Earth DragonBalls.dmi'
	icon_state="2"
	ostate="2"
	pixel_y=3
obj/items/dbs/edbs/edb3
	icon='Earth DragonBalls.dmi'
	icon_state="3"
	ostate="3"
	pixel_y=-3
obj/items/dbs/edbs/edb4
	icon='Earth DragonBalls.dmi'
	icon_state="4"
	ostate="4"
	pixel_x=3
obj/items/dbs/edbs/edb5
	icon='Earth DragonBalls.dmi'
	icon_state="5"
	ostate="5"
	pixel_x=-3
obj/items/dbs/edbs/edb6
	icon='Earth DragonBalls.dmi'
	icon_state="6"
	ostate="6"
	pixel_x=3
	pixel_y=3
obj/items/dbs/edbs/edb7
	icon='Earth DragonBalls.dmi'
	icon_state="7"
	ostate="7"
	pixel_x=-3
	pixel_y=-3
obj/items/dbs/ndbs/ndb1
	icon='Namek Dragonballs.dmi'
	icon_state="1"
	ostate="1"
obj/items/dbs/ndbs/ndb2
	icon='Namek Dragonballs.dmi'
	icon_state="2"
	ostate="2"
	pixel_y=3
obj/items/dbs/ndbs/ndb3
	icon='Namek Dragonballs.dmi'
	icon_state="3"
	ostate="3"
	pixel_y=-3
obj/items/dbs/ndbs/ndb4
	icon='Namek Dragonballs.dmi'
	icon_state="4"
	ostate="4"
	pixel_x=3
obj/items/dbs/ndbs/ndb5
	icon='Namek Dragonballs.dmi'
	icon_state="5"
	ostate="5"
	pixel_x=-3
obj/items/dbs/ndbs/ndb6
	icon='Namek Dragonballs.dmi'
	icon_state="6"
	ostate="6"
	pixel_x=3
	pixel_y=3
obj/items/dbs/ndbs/ndb7
	icon='Namek Dragonballs.dmi'
	icon_state="7"
	ostate="7"
	pixel_x=-3
	pixel_y=-3