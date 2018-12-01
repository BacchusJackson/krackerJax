mob/var/destroyable
mob/Bump(mob/A)
	if(istype(A,/mob)) if(Oozarou|pet|monster|istype(src,/mob/Splitform))
		if(istype(A,/mob/Splitform))
			var/mob/Splitform/S=A
			if(S.function!=3) return
		if(A.monster) return
		if(Oozarouskill<10) spawn MeleeAttack()
		if(A.HP<=0&&monster)
			move=0
			sleep(50)
			for(var/mob/B in oview(1)) if(B==A)
				view(src)<<"[A] was killed by [src]!"
				spawn A.Death()
			if(!KO) move=1
mob/Dummy
	name="Log"
	dummy=1
	attackable=1
	monster=0
	player=0
	KO=0
	sim=0
	icon='Dummy.dmi'
	icon_state="Off"
	PL=20000
	HP=100
	Ki=5
	Str=5
	Pow=5
	Spd=5
	End=25000
	Offense=15
	Defense=0.01
mob/Punching_Bag
	icon='Punching Bag.dmi'
	dummy=1
	attackable=1
	monster=0
	player=0
	KO=0
	sim=0
	PL=25000
	HP=100
	Ki=5
	Str=5
	Pow=5
	Spd=5
	End=30000
	Offense=15
	Defense=0.01
mob/var/tmp/dummy
mob/var/tmp
	movespeed=6
	movetimer
mob/Enemy
	attackable=1
	monster=1
	player=0
	KO=0
	sim=0
	move=1
	New()
		..()
		Str*=10
		Pow*=10
		Spd*=10
		End*=10
		Offense*=10
		Defense*=10
		for(var/turf/A in view(0,src)) if(istype(A,/turf/buildables)) del(src)
	VegetaFighter
		New()
			var/random
			Tail=2
			var/ticon='Modified Tail.dmi'
			ticon+=rgb(HairR/2,HairG/2,HairB/2)
			overlays+=ticon
			Race="Saiyan"
			BasePL=100
			Omult=10
			Str=20
			Spd=20
			End=20
			Offense=30
			Defense=30
			MaxPL=100
			HP=100
			PL=100
			zenni=rand(75,110)
			random=rand(1,2)
			if(random==1)
				pgender="Male"
				name="Male Saiyan"
				random=rand(1,3)
				if(random==1)
					icon='Base White Male.dmi'
				if(random==2)
					icon='Base Tan Male.dmi'
				if(random==3)
					icon='Base Black Male.dmi'
				random=rand(1,8)
				if(random==1)
					overlays+='Hair_Gohan.dmi'
				if(random==2)
					overlays+='Hair_Goten.dmi'
				if(random==3)
					overlays+='Hair_Mohawk.dmi'
				if(random==4)
					overlays+='Hair_Goku.dmi'
				if(random==5)
					overlays+='Hair_PonyTail.dmi'
				if(random==6)
					overlays+='Hair_Afro.dmi'
				if(random==7)
					overlays+='Hair_Spike.dmi'
				if(random==8)
					overlays+='Hair_Yamcha.dmi'
			if(random==2)
				pgender="Female"
				random=rand(1,3)
				if(random==1)
					icon='Base White Female.dmi'
				if(random==2)
					icon='Base Tan Female.dmi'
				if(random==3)
					icon='Base Black Female.dmi'
				name="Female Saiyan"
				random=rand(1,5)
				if(random==1)
					overlays+='Hair_Female1.dmi'
				if(random==2)
					overlays+='Hair_FemaleLong.dmi'
				if(random==3)
					overlays+='Hair_FemaleLong2.dmi'
				if(random==4)
					overlays+='Hair_PurpleFemale.dmi'
				if(random==5)
					overlays+='Hair_ShortFemale.dmi'
					//Clothes
			var/obj/A = new /obj/items/Pants
			A.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += A.icon
			var/obj/items/Boots/B = new
			B.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += B.icon
			random=rand(1,2)
			if(random==1)
				var/obj/items/Sash/C = new
				C.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += C.icon
			if(random==2)
				var/obj/items/LongSleeveShirt/D = new
				D.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += D.icon
			random=rand(1,10)
			if(random==5)
				var/obj/items/Gi_Top/E = new
				E.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += E.icon
			spawn Mob_AI()
			spawn Res=End
	Bandits
		New()
			var/random
			Race="Human"
			BasePL=20
			Str=0.5
			Spd=0.5
			End=0.5
			Offense=0.5
			Defense=0.5
			MaxPL=20
			HP=100
			PL=20
			zenni=rand(75,110)
			random=rand(1,2)
			if(random==1)
				pgender="Male"
				name="Male Bandit"
				random=rand(1,3)
				if(random==1)
					icon='Base White Male.dmi'
				if(random==2)
					icon='Base Tan Male.dmi'
				if(random==3)
					icon='Base Black Male.dmi'
				random=rand(1,8)
				if(random==1)
					overlays+='Hair_Gohan.dmi'
				if(random==2)
					overlays+='Hair_Goten.dmi'
				if(random==3)
					overlays+='Hair_Mohawk.dmi'
				if(random==4)
					overlays+='Hair_Goku.dmi'
				if(random==5)
					overlays+='Hair_PonyTail.dmi'
				if(random==6)
					overlays+='Hair_Afro.dmi'
				if(random==7)
					overlays+='Hair_Spike.dmi'
				if(random==8)
					overlays+='Hair_Yamcha.dmi'
			if(random==2)
				pgender="Female"
				random=rand(1,3)
				if(random==1)
					icon='Base White Female.dmi'
				if(random==2)
					icon='Base Tan Female.dmi'
				if(random==3)
					icon='Base Black Female.dmi'
				name="Female Bandit"
				random=rand(1,5)
				if(random==1)
					overlays+='Hair_Female1.dmi'
				if(random==2)
					overlays+='Hair_FemaleLong.dmi'
				if(random==3)
					overlays+='Hair_FemaleLong2.dmi'
				if(random==4)
					overlays+='Hair_PurpleFemale.dmi'
				if(random==5)
					overlays+='Hair_ShortFemale.dmi'
					//Clothes
			var/obj/A = new /obj/items/Pants
			A.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += A.icon
			var/obj/items/Boots/B = new
			B.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += B.icon
			random=rand(1,2)
			if(random==1)
				var/obj/items/ShortSleeveShirt/C = new
				C.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += C.icon
			if(random==2)
				var/obj/items/TankTop/D = new
				D.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += D.icon
			random=rand(1,10)
			if(random==5)
				var/obj/items/Jacket/E = new
				E.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += E.icon
			spawn Mob_AI()
			spawn Res=End
	AnimalFighters
		New()
			var/random
			Race="Animal Fighter"
			BasePL=20
			Str=0.5
			Spd=0.5
			End=0.5
			Offense=0.5
			Defense=0.5
			MaxPL=20
			HP=100
			PL=20
			zenni=rand(75,110)
			random=rand(1,4)
			if(random==1)
				icon='NPC Tiger Bandit.dmi'
				name="Tiger Bandit"
			if(random==2)
				icon='NPC Wolf.dmi'
				name="Wolf"
			if(random==3)
				icon='Animal DinoBird.dmi'
				name="DinoBird"
			if(random==4)
				icon='Animal Lion.dmi'
				name="Lion"
			spawn Mob_AI()
			spawn Res=End
	Arconians
		New()
			var/random
			Race="Arconians"
			zenni=rand(75,110)
			BasePL=100
			Str=1
			Spd=1
			End=1
			Offense=2
			Defense=2
			MaxPL=100
			HP=100
			PL=60
			movespeed=3
			random=rand(1,13)
			if(random==1)
				icon='Base Baseniojin.dmi'
				name="Arconian"
			if(random==2)
				icon='Base Burter.dmi'
				name="Arconian"
			if(random==3)
				name="Arconian"
				icon='Base Immecka.dmi'
			if(random==4)
				name="Arconian"
				icon='Base Jeice.dmi'
			if(random==5)
				name="Arconian"
				icon='Base Kanassan.dmi'
			if(random==6)
				name="Arconian"
				icon='Base Konatsu.dmi'
			if(random==7)
				name="Arconian"
				icon='Base Yardrat.dmi'
			if(random==8)
				name="Arconian"
				icon='Base Metamori.dmi'
			if(random==9)
				name="Arconian"
				icon='Base Yukenojin.dmi'
			if(random==10)
				name="Arconian"
				icon='Base_Alien1.dmi'
			if(random==11)
				name="Arconian"
				icon='Base_Alien2.dmi'
			if(random==12)
				name="Arconian"
				icon='Base_Alien3.dmi'
			if(random==13)
				name="Arconian"
				icon='Base_Alien4.dmi'
			random=rand(1,8)
			if(random==1)
				overlays+='Hair_Gohan.dmi'
			if(random==2)
				overlays+='Hair_Goten.dmi'
			if(random==3)
				overlays+='Hair_Mohawk.dmi'
			if(random==4)
				overlays+='Hair_Goku.dmi'
			if(random==5)
				overlays+='Hair_PonyTail.dmi'
			if(random==6)
				overlays+='Hair_Afro.dmi'
			if(random==7)
				overlays+='Hair_Spike.dmi'
			if(random==8)
				overlays+='Hair_Yamcha.dmi'
			var/obj/A = new /obj/items/Pants
			A.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += A.icon
			var/obj/items/Boots/B = new
			B.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += B.icon
			random=rand(1,2)
			if(random==1)
				var/obj/items/ShortSleeveShirt/C = new
				C.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += C.icon
			if(random==2)
				var/obj/items/TankTop/D = new
				D.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += D.icon
			random=rand(1,10)
			if(random==5)
				var/obj/items/LabCoat/E = new
				E.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += E.icon
			spawn Mob_AI()
			spawn Res=End
	Robots
		New()
			var/random
			Race="Robot"
			zenni=rand(75,110)
			BasePL=100
			Str=1
			Spd=1
			End=1
			Offense=2
			Defense=2
			MaxPL=100
			HP=100
			PL=60
			movespeed=3
			random=rand(1,5)
			if(random==1)
				icon='NPC Giant Robot.dmi'
				name="Giant Robot"
			if(random==2)
				icon='NPC Giant Robot 2.dmi'
				name="Giant Robot Mk 2"
			if(random==3)
				icon='NPC Bots.dmi'
				icon_state="3"
				name="Tiny Robot"
			if(random==4)
				icon='NPC Bots.dmi'
				icon_state="4"
				name="Large Robot"
			if(random==5)
				icon='NPC Bots.dmi'
				icon_state="5"
				name="Floating Robot"
			spawn Mob_AI()
			spawn Res=End
	Saibamen
		New()
			var/random
			Race="Saibaman"
			BasePL=12
			Str=9
			Spd=9
			End=9
			Offense=8
			Defense=8
			MaxPL=100
			HP=100
			PL=12
			zenni=rand(75,110)
			random=rand(1,4)
			if(random==1)
				icon='NPC Green Saibaman.dmi'
				name="Green Saibaman"
			if(random==2)
				icon='NPC Black Saiba.dmi'
				name="Black Saibaman"
			if(random==3)
				icon='NPC Saibaman.dmi'
				name="Saibaman"
			if(random==4)
				icon='NPC Small Saiba.dmi'
				name="Small Saiba"
			spawn Mob_AI()
			spawn Res=End
	AfterlifeFighters
		New()
			var/random
			Race="Undead"
			PL=100
			HP=100
			MaxKi=5
			Ki=5
			Str=5
			Pow=5
			Spd=5
			End=5
			Offense=15
			Defense=1
			zenni=rand(75,110)
			random=rand(1,2)
			if(random==1)
				icon='NPC Sprite.dmi'
				name="Spirit"
			if(random==2)
				icon='NPC Evil Entity.dmi'
				name="Evil Entity"
			spawn Mob_AI()
			spawn Res=End
	Namekians
		New()
			var/random
			PL=100
			HP=100
			MaxKi=5
			Ki=5
			Str=5
			Pow=5
			Spd=5
			End=5
			Offense=15
			Defense=1
			zenni=rand(75,110)
			random=rand(1,2)
			if(random==1)
				Race="Namekian"
				icon='Base Ancient Namek.dmi'
				name="Namekian"
			if(random==2)
				Race="Namekian"
				icon='Base Namek.dmi'
				name="Namekian"
			var/obj/A = new /obj/items/Pants
			A.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += A.icon
			var/obj/items/Boots/B = new
			B.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += B.icon
			random=rand(1,2)
			if(random==1)
				var/obj/items/ShortSleeveShirt/C = new
				C.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += C.icon
			if(random==2)
				var/obj/items/TankTop/D = new
				D.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += D.icon
			random=rand(1,10)
			if(random==5)
				var/obj/items/Turban/E = new
				E.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += E.icon
			spawn Mob_AI()
			spawn Res=End
	NamekAnimals
		New()
			var/random
			PL=100
			HP=100
			MaxKi=5
			Ki=5
			Str=5
			Pow=5
			Spd=5
			End=5
			Offense=15
			Defense=1
			zenni=rand(75,110)
			random=rand(1,2)
			if(random==1)
				Race="Dino Monkey"
				icon='Oozarou.dmi'
				icon_state="Dino Munky"
				name="Dino Monkey"
			if(random==2)
				Race="Gremlin"
				icon='NPC Monsters.dmi'
				icon_state="1"
				name="Gremlin"
			spawn Mob_AI()
			spawn Res=End
	Changeling
		New()
			var/random
			Race="Changeling"
			BasePL=rand(600,1000)
			Str=rand(10,50)
			Spd=rand(10,50)
			End=rand(10,50)
			Offense=rand(10,50)
			Defense=rand(10,50)
			MaxPL=BasePL
			HP=100
			PL=BasePL
			zenni=rand(75,110)
			random=rand(1,3)
			if(random==1)
				name="Changeling"
				icon='Base KingKold.dmi'
			if(random==2)
				name="Changeling"
				icon='Base Changeling.dmi'
			if(random==3)
				name="Changeling"
				icon='Base Cooler.dmi'
			var/obj/A = new /obj/items/Pants
			A.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += A.icon
			var/obj/items/Boots/B = new
			B.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
			src.overlays += B.icon
			random=rand(1,2)
			if(random==1)
				var/obj/items/FlowingCape/C = new
				C.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += C.icon
			if(random==2)
				var/obj/items/TankTop/D = new
				D.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += D.icon
			random=rand(1,10)
			if(random==5)
				var/obj/items/Eyepatch/E = new
				E.icon += rgb(rand(0,100),rand(0,100),rand(0,100))
				src.overlays += E.icon
			spawn Mob_AI()
			spawn Res=End
	Archon
		New()
			var/random
			Race="Archon"
			PL=100
			HP=100
			MaxKi=5
			Ki=5
			Str=5
			Pow=5
			Spd=5
			End=5
			Offense=15
			Defense=1
			zenni=rand(75,110)
			random=rand(1,2)
			if(random==1)
				icon='Archon.dmi'
				name="Celestial Archon"
			if(random==2)
				icon='Anti Archon.dmi'
				name="Evil Archon"
			spawn Mob_AI()
			spawn Res=End
mob/var/mob/Target
mob/Enemy/New()
	..()
	spawn Mob_AI()
	spawn Res=End
mob/proc/Wander()
mob/proc/Mob_AI()
	if(player)
		spawn while(Oozarou&&Oozarouskill<10)
			Wander()
			if(!KO)
				if(!Target)
					step_rand(src)
					for(var/mob/M in oview(src)) if(M.client&&!Target&&!M.KO)
						Target=M
						break
				if(Target)
					step_towards(src,Target)
					var/confirmtarget=0
					for(var/mob/M in oview(src))
						if(M.z==z&&M.player&&Target==M)
							confirmtarget=1
							break
					if(!confirmtarget) Target=null
				//Blasts--------
				if(prob(kimanip*10))
					var/bcolor='12.dmi'
					bcolor+=rgb(blastR,blastG,blastB)
					var/obj/A=new/obj/attack/blast/
					spawn(Pow+50) if(A) del(A)
					A.loc=locate(x,y,z)
					A.icon=bcolor
					A.icon_state="12"
					A.density=1
					A.Pow=Pow
					A.PL=PL
					A.KiSetting=0
					A.owner=src
					if(client) A.ownkey=displaykey
					step(A,dir)
					walk(A,dir,2)
				//--------------
			sleep(refire/2)
	if(monster)
		spawn while(src)
			if(HP<=0&&!KO) spawn KO()
			if(name=="Guardian")
				if(!KO)
					if(!Target)
						for(var/mob/M in oview(3)) if(M.z==z&&M.player&&!Target)
							if(!sim) Target=M
							else Target=targetmob
					if(Target)
						step_towards(src,Target)
						var/confirmtarget=0
						for(var/mob/M in oview(3))
							if(M.z==z&&M.player&&Target==M)
								confirmtarget=1
								break
						if(!confirmtarget) Target=null
			else if(!KO)
				if(!Target)
					if(SeedSaiba) del(src)
					step_rand(src)
					for(var/mob/M in oview(6)) if(M.z==z&&M.player&&!Target)
						if(!sim) Target=M
						else Target=targetmob
				if(Target)
					step_towards(src,Target)
					var/confirmtarget=0
					for(var/mob/M in oview(6))
						if(M.z==z&&M.player&&Target==M)
							confirmtarget=1
							break
					if(!confirmtarget) Target=null
			if(Target) sleep(movespeed)
			else sleep(movespeed*rand(8,12))
mob/Pet
	Saiba
		icon='NPC Saibaman.dmi'
		icon_state="Saibaman"
		RecordPL=1200
		BasePL=1200
		MaxPL=1200
		PL=1200
		HP=100
		MaxKi=5
		Ki=5
		Str=15
		Pow=10
		Spd=10
		End=3
		Offense=10
		Defense=1
		GravMastered=30
		MaxPLpcnt=105
		MaxAnger=105
		PLMod=1
		KiMod=1
		PowMod=1
		StrMod=1
		SpdMod=1
		EndMod=1
		OffenseMod=1
		DefenseMod=1
		HPRegen=0.5
		KiRegen=0.2
		GravMod=0.2
		ZenkaiMod=0.5
		movespeed=3
		pet=1
		player=0
		monster=0
		attackable=1
		move=1
mob/var/
	pet
	petmaster
	petxp=0
	petlvl=1
mob/proc/Pokevolve()
	petxp+=1
	if(petxp>=(petlvl*petlvl*5))
		petxp-=petlvl*petlvl*5
		petlvl+=1
		view(src)<<"[src] pokevolves!"
		PL*=2
		zanzoskill+=10
	for(var/obj/items/Saibaman_Seed/A) if(originator==A)
		A.SXP=petxp
		A.SLVL=petlvl
		A.SBP=PL
		A.suffix="Level [A.SLVL]"
mob/proc/Pet_AI()
	spawn while(src)
		if(HP<=0)
			view(src)<<"[src] is defeated..."
			for(var/obj/items/Saibaman_Seed/A) if(originator==A)
				A.saibaout=0
			del(src)
		if(!KO)
			if(!Target)
				var/dostuff=1
				for(var/mob/M in view(2,src)) if(petmaster==M)
					dostuff=0
					break
				if(dostuff)
					for(var/mob/M) if(petmaster==M)
						z=M.z
						if(prob(20)) step_rand(src)
						else step_towards(src,M)
			if(Target)
				step_towards(src,Target)
				//Blasts--------
				if(prob(petlvl**3))
					var/bcolor='12.dmi'
					bcolor+=rgb(50,250,50)
					var/obj/A=new/obj/attack/blast/
					spawn(Pow+50) if(A) del(A)
					A.loc=locate(x,y,z)
					A.icon=bcolor
					A.icon_state="12"
					A.density=0
					A.Pow=Pow
					A.PL=PL
					A.KiSetting=1
					A.owner=src
					step(A,dir)
					walk(A,dir,2)
					A.density=1
				//--------------
				var/confirmtarget=0
				for(var/mob/M in oview(src))
					if(M.z==z&&Target==M)
						confirmtarget=1
						break
				if(!confirmtarget) Target=null
		sleep(movespeed)