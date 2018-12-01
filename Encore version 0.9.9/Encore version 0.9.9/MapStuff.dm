turf/New()
	..()
	name="o_o"
turf/Del()
	if(istype(src,/turf)) return
	..()
turf/Other
	Curses
		icon='Icons.dmi'
		icon_state="CURSES!"
		density=1
	BlackTurf
		icon='BlackTurf.dmi'
		density=1
		opacity=1
		destroyable=0
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Stars
		icon='Misc.dmi'
		icon_state="Stars"
		destroyable=0
	earthrock
		icon='Turfs 2.dmi'
		icon_state="rock"
	firewood
		icon='roomobj.dmi'
		icon_state="firewood"
		density=1
	Orb
		icon='Turf1.dmi'
		icon_state="spirit"
		density=0
	Sky1
		icon='Misc.dmi'
		icon_state="Sky"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(!usr.flight)
					usr.z=17
					return 1
				else return 1
	AshCloud
		icon='AshCloud.dmi'
		icon_state="Clouds"
		Enter(mob/M)
			if(istype(M,/mob))
				if(!usr.flight)
					usr.z=17
					return 1
				else return 1

	Sky2
		icon='Misc.dmi'
		icon_state="Clouds"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(!usr.flight)
					usr.z=17
					return 1
				else return 1
turf/ManMade
	Door
		icon='Turfs 11.dmi'
		icon_state="closed"
		density=1
		opacity=1
		Click()
			if(icon_state=="closed")
				flick("opening",src)
				density=0
				opacity=0
				icon_state="open"
				sleep(300)
				flick("closing",src)
				density=1
				opacity=1
				icon_state="closed"

		SteelDoor
		icon='Obj Door.dmi'
		icon_state="Closed"
		density=1
		opacity=1
		Click()
			if(icon_state=="Closed")
				flick("Opening",src)
				density=0
				opacity=0
				icon_state="Open"
				sleep(300)
				flick("Closing",src)
				density=1
				opacity=1
				icon_state="Closed"


	Giantskull
		icon='Obj_GiantSkull.dmi'
	ironmaiden
		icon='Obj_IronMaiden.dmi'
	pentagram
		icon='Obj_Pentagram.dmi'
	stretchrack
		icon='Obj_StretchRack.dmi'
	wallshackes
		icon='Obj_WallShackles.dmi'
	gamemachine
		icon='Obj_Pacman.dmi'
	cmachinetop
		icon='NewTurf.dmi'
		icon_state="cmachine top"
	cmachinebottom
		icon='NewTurf.dmi'
		icon_state="cmachine bottom"
	television
		icon='NewTurf.dmi'
		icon_state="tv"
	bridgeN
		icon='Misc.dmi'
		icon_state="N"
		density=1
	bridgeS
		icon='Misc.dmi'
		icon_state="S"
		density=1
	bridgeE
		icon='Misc.dmi'
		icon_state="E"
		density=1
	bridgeW
		icon='Misc.dmi'
		icon_state="W"
		density=1
	Ladder
		icon='Turf1.dmi'
		icon_state="ladder"
		density=0
	Chest
		icon='Turf3.dmi'
		icon_state="161"
	Apples
		icon='Turf3.dmi'
		icon_state="163"
	Book
		icon='Turf3.dmi'
		icon_state="167"
	Bed
		icon='Turfs 2.dmi'
		icon_state="bedN"
		density=1
		New()
			..()
			var/image/A=image(icon='Turfs 2.dmi',icon_state="bedS",pixel_y=-32)
			overlays.Add(A)
	Torch1
		icon='Turf2.dmi'
		icon_state="168"
		density=1
	Torch2
		icon='Turf2.dmi'
		icon_state="169"
		density=1
	barrel
		icon='Turfs 2.dmi'
		icon_state="barrel"
		density=1
	chair
		icon='turfs.dmi'
		icon_state="Chair"
	box2
		icon='Turfs 5.dmi'
		icon_state="box"
		density=1
obj/Lightning
	icon='Lightning.dmi'
obj/Explosion
	icon='Ki Explosion.dmi'
obj/Tornado
	icon='Tornado.dmi'
turf/SpaceStation
	icon='Space.dmi'
	bottom
		icon_state="bottom"
		density=1
	top
		icon_state="top"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	light
		icon_state="light"
		density=1
	glass1
		icon_state="glass1"
		density=1
		layer=MOB_LAYER+1
	glasssw
		icon_state="glass sw"
		density=0
		layer=MOB_LAYER+1
	glassne
		icon_state="glass ne"
		density=0
		layer=MOB_LAYER+1
	glassS
		icon_state="glass s"
		density=1
		layer=MOB_LAYER+1
	glassE
		icon_state="glass e"
		density=1
		layer=MOB_LAYER+1
	glassW
		icon_state="glass w"
		density=1
		layer=MOB_LAYER+1
	bar
		icon_state="bar"
		density=1
	bar2
		icon_state="bar2"
		density=1
	bar3
		icon_state="bar3"
		density=1
	glassnw
		icon_state="glass nw"
		density=0
		layer=MOB_LAYER+1
	glassn
		icon_state="glass n"
		density=1
		layer=MOB_LAYER+1
	glassse
		icon_state="glass se"
		layer=MOB_LAYER+1
		density=0
mob/var/drinking=0
turf/var/destroyable=1
turf/Special
	Teleporter
		destroyable=0
		density=1
		var/gotox
		var/gotoy
		var/gotoz
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.grabbee) for(var/mob/A in view(1,M)) if(A.name==M.grabbee) A.loc=locate(gotox,gotoy,gotoz)
				usr.loc=locate(gotox,gotoy,gotoz)
			else if(M) M.loc=locate(gotox,gotoy,gotoz)
mob/var/spacewalker
turf
	Lava2
		icon='turvs.dmi'
		icon_state="lava"
		density=0
	Wall15
		icon='Turf1.dmi'
		icon_state="1"
		density=1
	Table6
		icon='turfs.dmi'
		icon_state="Table"
		density=1
		layer=TURF_LAYER+1
	Plant12
		icon='Plants.dmi'
		icon_state="plant1"
		density=1
	Plant11
		icon='Plants.dmi'
		icon_state="plant2"
		density=1
	Plant10
		icon='Plants.dmi'
		icon_state="plant3"
		density=1
	Plant16
		icon='roomobj.dmi'
		icon_state="flowers"
	Plant15
		icon='roomobj.dmi'
		icon_state="flowers2"
	Plant2
		icon='Turf3.dmi'
		icon_state="plant"
		density=1
	Plant3
		icon='turfs.dmi'
		icon_state="groundplant"
	Plant4
		icon='Turf2.dmi'
		icon_state="plant2"
	Plant5
		icon='Turf2.dmi'
		icon_state="plant3"
	Grass8
		icon='NewTurf.dmi'
		icon_state="grass a"
	Wall1
		icon='turfs.dmi'
		icon_state="tile5"
		density=1
		opacity=0
	Tile13
		icon='Turfs 15.dmi'
		icon_state="floor6"
	Grass1
		icon='Turfs 12.dmi'
		icon_state="grass2"
	Grass2
		icon='Turfs 5.dmi'
		icon_state="grass"
	Grass3
		icon='NewTurf.dmi'
		icon_state="grass b"
	Grass4
		icon='NewTurf.dmi'
		icon_state="grass c"
	Tile24
		icon='turfs.dmi'
		icon_state="bridgemid2"
	Ground12
		icon='Turfs 1.dmi'
		icon_state="dirt"
	Ground13
		icon='Turfs 1.dmi'
		icon_state="rock"
		density=1
	Ground11
		icon='Turfs 1.dmi'
		icon_state="crack"
		density=1
	Table5
		icon='Turfs 2.dmi'
		icon_state="tableL"
		density=1
	Table3
		icon='Turfs 2.dmi'
		icon_state="tableR"
		density=1
	Table4
		icon='Turfs 2.dmi'
		icon_state="tableM"
		density=1
	Stairs1
		icon='NewTurf.dmi'
		icon_state="steps"
	Grass9
		icon='NewTurf.dmi'
		icon_state="grass d"
	Grass7
		icon='Turfs 1.dmi'
		icon_state="grass"
	Grass12
		icon='Turfs1.dmi'
		icon_state="grassremade"
	Plant17
		icon='Turfs 1.dmi'
		icon_state="bushes"
		density=1
	Water6
		destroyable=0
		icon='Turfs 1.dmi'
		icon_state="water"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Ground16
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone"
	Stairs5
		icon='Turfs 1.dmi'
		icon_state="earthstairs"
	Wall7
		icon='Turfs 1.dmi'
		icon_state="cliff"
		density=1

	Water5
		destroyable=0
		icon='Turfs 4.dmi'
		icon_state="kaiowater"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Wall13
		icon='turfs.dmi'
		icon_state="wall8"
		density=1
	Wall
		icon='NewTurf.dmi'
		icon_state="wall"
		density=1
	Wall2
		icon='NewTurf.dmi'
		icon_state="wall2"
		density=1
	Stairs3
		icon='Turfs 1.dmi'
		icon_state="stairs2"
		destroyable=0
	Water4
		icon='Turfs 1.dmi'
		icon_state="lightwaterfall"
		density=1
		layer=MOB_LAYER+1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight) return 1
				else return
			else
				KiWater()
				return 1
	Wall12
		icon='Turfs 3.dmi'
		icon_state="cliff"
		density=1
	Plant13
		icon='turfs.dmi'
		icon_state="bush"
	Tile26
		icon='turfs.dmi'
		icon_state="tile9"
	Wall10
		icon='Turfs 4.dmi'
		icon_state="ice cliff"
		density=1
	Plant14
		icon='Turfs 1.dmi'
		icon_state="frozentree"
		density=1
	Tile25
		icon='Turfs 4.dmi'
		icon_state="cooltiles"
	Wall3
		destroyable=0
		icon='Turfs 4.dmi'
		icon_state="wall"
		density=1
	Water3
		icon='Misc.dmi'
		icon_state="Water"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Stairs4
		icon='Turfs 1.dmi'
		icon_state="stairs1"
	Wall8
		icon='Turfs 15.dmi'
		icon_state="wall2"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight) return 1
				else return
			else return 1
	Tile22
		icon='FloorsLAWL.dmi'
		icon_state="SS Floor"
	Tile12
		icon='Turfs 15.dmi'
		icon_state="floor7"
	Ground14
		icon='Turfs 2.dmi'
		icon_state="desert"
	Wall5
		icon='turfs.dmi'
		icon_state="tile1"
		density=1
	Wall6
		icon='Turfs 2.dmi'
		icon_state="brick2"
		density=1
	Water8
		icon='turfs.dmi'
		icon_state="nwater"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight) return 1
				else return
			else
				KiWater()
				return 1

	Tile10
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone Vegeta"
	Tile11
		icon='Turfs 2.dmi'
		icon_state="dirt"
	Tile8
		icon='Turfs 1.dmi'
		icon_state="woodenground"
	Ground7
		icon='Turf Snow.dmi'
	Ground10
		icon='Turf1.dmi'
		icon_state="light desert"
	Ground15
		icon='Turfs 1.dmi'
		icon_state="dirt"
	Ground17
		icon='Turfs1.dmi'
		icon_state="dirt"
	Ground18
		icon='turfs.dmi'
		icon_state="hellfloor"
	Ground6
		icon='Turfs 2.dmi'
		icon_state="grass"
	Ground19
		icon='NewTurf.dmi'
		icon_state="darktile"
	Water1
		Water=1
		destroyable=0
		icon='Turfs 12.dmi'
		icon_state="water3"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	proc/KiWater() for(var/obj/attack/blast/M in view(1,src))
		var/image/I=image(icon='KiWater.dmi',dir=M.dir)
		overlays.Add(I)
		spawn(5) overlays.Remove(I)
		break
	Water11
		Water=1
		destroyable=0
		icon='Turfs 12.dmi'
		icon_state="water1"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Tile19
		icon='Turfs 12.dmi'
		icon_state="floor2"
	Tile20
		icon='turfs.dmi'
		icon_state="tile4"
	Ground9
		icon='Turfs 12.dmi'
		icon_state="ice"
	Tile2
		icon='FloorsLAWL.dmi'
		icon_state="Tile"
	Water7
		icon='turfs.dmi'
		icon_state="lava"
		density=0
		Enter(mob/M)
			if(istype(M,/mob))
				if(usr.Race!="Changeling")
					if(!usr.flight)
						M.HP-=(500/usr.End)
						if(M.HP<=0)
							view(M)<<"[M] walks into the lava and dies!"
							M.Death()
					else return 1
				else return 1
			else return 1
	Tile21
		icon='Turfs 12.dmi'
		icon_state="Girly Carpet"
	Tile23
		icon='Turfs 12.dmi'
		icon_state="Wood_Floor"
	Tile17
		icon='turfs.dmi'
		icon_state="roof4"
	Tile15
		icon='Turfs 12.dmi'
		icon_state="stonefloor"
	Wall4
		icon='Turfs.dmi'
		icon_state="roof2"
		density=1
	Tile14
		icon='turfs.dmi'
		icon_state="tile10"
	Stairs2
		icon='Turfs 12.dmi'
		icon_state="Steps"
	Tile18
		icon='Turfs 12.dmi'
		icon_state="Aluminum Floor"
	Ground4
		icon='Turfs 12.dmi'
		icon_state="desert"
	Water2
		Water=1
		destroyable=0
		icon='NewTurf.dmi'
		icon_state="stillwater"
		density=1
		Enter(mob/M)
			if(istype(M,/mob)) if(M.flight|!M.density) return 1
			else return 1
	Tile16
		icon='Turfs 14.dmi'
		icon_state="Stone"
	Ground8
		icon='Turfs 14.dmi'
		icon_state="Dirt"
	Tile27
		icon='turfs.dmi'
		icon_state="tile7"
	Tile28
		icon='turfs.dmi'
		icon_state="floor"
	Wall9
		icon='turfs.dmi'
		icon_state="wall6"
		density=1
	Grass8
		icon='NewTurf.dmi'
		icon_state="grass a"
	Wall2
		icon='Turfs 1.dmi'
		icon_state="wall6"
		opacity=0
		density=1
	Tile9
		icon='Turfs 18.dmi'
		icon_state="wooden"
	Tile8
		icon='Turfs 18.dmi'
		icon_state="diagwooden"
	Wall11
		icon='Turfs 18.dmi'
		icon_state="stone"
		density=1
	Wall14
		icon='Turfs 19.dmi'
		icon_state="jwall"
		density=1
	Plant18
		icon='Trees.dmi'
		icon_state="Dead Tree1"
		density=1
	Plant21
		icon='Turfs1.dmi'
		icon_state="1"
		density=1
	Plant20
		icon='Turfs1.dmi'
		icon_state="2"
		density=1
	Plant19
		icon='Turfs1.dmi'
		icon_state="3"
		density=1
	Plant7
		icon='Trees.dmi'
		icon_state="Tree1"
		density=1
	Ground5
		icon='Turf1.dmi'
		icon_state="dark desert"
		density=0
	Ground6
		icon='Turf1.dmi'
		icon_state="light desert"
		density=0
	Ground3
		icon='Turf1.dmi'
		icon_state="very dark desert"
		density=0
	Table7
		icon='Turf3.dmi'
		icon_state="168"
		density=1
	Table8
		icon='Turf3.dmi'
		icon_state="169"
		density=1
	Tile1
		icon='Turfs 12.dmi'
		icon_state="Brick_Floor"
	Tile2
		icon='Turfs 12.dmi'
		icon_state="Stone Crystal Path"
	Tile3
		icon='Turfs 12.dmi'
		icon_state="Stones"
	Tile4
		icon='Turfs 12.dmi'
		icon_state="Black Tile"
	Tile5
		icon='Turfs 12.dmi'
		icon_state="Dirty Brick"
	Water12
		icon='Turfs 12.dmi'
		icon_state="water4"
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Water9
		icon='Turfs 12.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Water10
		icon='Turfs 1.dmi'
		icon_state="Water 50"
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Grass5
		icon='Turfs 14.dmi'
		icon_state="Grass"
	Grass10
		icon='Turfs 1.dmi'
		icon_state="Grass 1"
	Grass11
		icon='Turfs 1.dmi'
		icon_state="Grass 50"
	Ground1
		icon='Turfs 7.dmi'
		icon_state="Sand"
	Tile6
		icon='Turfs 12.dmi'
		icon_state="floor4"
turf/var/FlyOverAble
obj/Turfs
	Savable=0
	layer=4
	New()
		..()
		spawn(1) if(src) if(!Builder) for(var/turf/A in view(0,src)) if(A.Builder) del(src)
		spawn(1) if(src) for(var/obj/A in view(0,src)) if(A!=src) if(loc==initial(loc)) del(src)
	Door
		density=1
		icon='Obj Door.dmi'
		icon_state="Closed"
		New()
			..()
			Close()
		proc/Open()
			density=0
			opacity=0
			flick("Opening",src)
			icon_state="Open"
			spawn(50) Close()
		proc/Close()
			density=1
			opacity=1
			flick("Closing",src)
			icon_state="Closed"
	HBTCdoor
		icon='Turf HBTC.dmi'
		icon_state="closed"
		density=1
		opacity=1
		Click()
			if(icon_state=="closed")
				flick("opening",src)
				density=0
				opacity=0
				icon_state="open"
				sleep(300)
				flick("closing",src)
				density=1
				opacity=1
				icon_state="closed"
obj/Trees
	Savable=0
	layer=4
	New()
		..()
		spawn(1) if(src) if(!Builder) for(var/turf/A in view(0,src)) if(A.Builder) del(src)
		spawn(1) if(src) for(var/obj/A in view(0,src)) if(A!=src) if(loc==initial(loc)) del(src)
	SmallPine
		icon='Turf 58.dmi'
		icon_state="2"
		density=1
		New()
			..()
			var/image/A=image(icon='Turf 58.dmi',icon_state="1",pixel_y=0,pixel_x=-32,layer=50)
			var/image/B=image(icon='Turf 58.dmi',icon_state="0",pixel_y=-32,pixel_x=0,layer=50)
			var/image/C=image(icon='Turf 58.dmi',icon_state="3",pixel_y=32,pixel_x=-32,layer=50)
			var/image/D=image(icon='Turf 58.dmi',icon_state="4",pixel_y=32,pixel_x=0,layer=50)
			overlays.Add(A,B,C,D)
	RedTree
		density=1
		New()
			..()
			var/image/A=image(icon='Turf 55.dmi',icon_state="1",pixel_y=32,pixel_x=-32,layer=50)
			var/image/B=image(icon='Turf 55.dmi',icon_state="2",pixel_y=0,pixel_x=0,layer=50)
			var/image/C=image(icon='Turf 55.dmi',icon_state="3",pixel_y=32,pixel_x=32,layer=50)
			var/image/D=image(icon='Turf 55.dmi',icon_state="4",pixel_y=0,pixel_x=-32,layer=50)
			var/image/E=image(icon='Turf 55.dmi',icon_state="5",pixel_y=32,pixel_x=0,layer=50)
			var/image/F=image(icon='Turf 55.dmi',icon_state="6",pixel_y=0,pixel_x=32,layer=50)
			overlays.Add(A,B,C,D,E,F)
	BigHousePlant
		density=1
		icon='Turf 52.dmi'
		icon_state="plant bottom"
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="plant top",pixel_y=32,pixel_x=0,layer=50)
			overlays.Add(A)
	Oak
		density=1
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="1",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='turfs.dmi',icon_state="2",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='turfs.dmi',icon_state="3",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='turfs.dmi',icon_state="4",pixel_y=32,pixel_x=16,layer=50)
			var/image/E=image(icon='turfs.dmi',icon_state="5",pixel_y=64,pixel_x=-16,layer=50)
			var/image/F=image(icon='turfs.dmi',icon_state="6",pixel_y=64,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D,E,F)
	RoundTree
		density=1
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="01",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='turfs.dmi',icon_state="02",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='turfs.dmi',icon_state="03",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='turfs.dmi',icon_state="04",pixel_y=32,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D)
	Tree
		density=1
		icon='turfs.dmi'
		icon_state="bottom"
		New()
			..()
			var/image/B=image(icon='turfs.dmi',icon_state="middle",pixel_y=32,pixel_x=0,layer=50)
			var/image/C=image(icon='turfs.dmi',icon_state="top",pixel_y=64,pixel_x=0,layer=50)
			overlays.Add(B,C)
	Palm
		density=1
		New()
			..()
			var/image/A=image(icon='Trees2.dmi',icon_state="1",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='Trees2.dmi',icon_state="2",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='Trees2.dmi',icon_state="3",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='Trees2.dmi',icon_state="4",pixel_y=32,pixel_x=16,layer=50)
			var/image/E=image(icon='Trees2.dmi',icon_state="5",pixel_y=64,pixel_x=-16,layer=50)
			var/image/F=image(icon='Trees2.dmi',icon_state="6",pixel_y=64,pixel_x=16,layer=50)
			var/image/G=image(icon='Trees2.dmi',icon_state="7",pixel_y=96,pixel_x=-16,layer=50)
			var/image/H=image(icon='Trees2.dmi',icon_state="8",pixel_y=96,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D,E,F,G,H)
	LargePine
		density=1
		New()
			..()
			var/image/A=image(icon='Tree Good.dmi',icon_state="1",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='Tree Good.dmi',icon_state="2",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='Tree Good.dmi',icon_state="3",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='Tree Good.dmi',icon_state="4",pixel_y=32,pixel_x=16,layer=50)
			var/image/E=image(icon='Tree Good.dmi',icon_state="5",pixel_y=64,pixel_x=-16,layer=50)
			var/image/F=image(icon='Tree Good.dmi',icon_state="6",pixel_y=64,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D,E,F)
	TallBush
		density=1
		icon='Turf3.dmi'
		icon_state="tallplantbottom"
		density=1
		New()
			..()
			var/image/A=image(icon='Turf3.dmi',icon_state="tallplanttop",pixel_y=32,layer=50)
			overlays.Add(A)
	NamekTree
		density=1
		icon='turfs.dmi'
		icon_state="nt1"
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="nt2",pixel_y=32,layer=50)
			overlays.Add(A)
obj/Edges
	RockEdgeN
		icon='Edges1.dmi'
		icon_state="N"
		density=1
	RockEdgeW
		icon='Edges1.dmi'
		icon_state="W"
		density=1
	RockEdgeE
		icon='Edges1.dmi'
		icon_state="E"
		density=1
	RockEdge2N
		icon='Edges2.dmi'
		icon_state="N"
		density=1
	RockEdge2W
		icon='Edges2.dmi'
		icon_state="W"
		density=1
	RockEdge2E
		icon='Edges2.dmi'
		icon_state="E"
		density=1
	Edge3N
		icon='Edges3.dmi'
		icon_state="N"
		density=1
	Edge3W
		icon='Edges3.dmi'
		icon_state="W"
		density=1
	Edge3E
		icon='Edges3.dmi'
		icon_state="E"
		density=1
	Edge4N
		icon='Edges4.dmi'
		icon_state="N"
		density=1
	Edge4W
		icon='Edges4.dmi'
		icon_state="W"
		density=1
	Edge4E
		icon='Edges4.dmi'
		icon_state="E"
		density=1
	Edge5N
		icon='Edges5.dmi'
		icon_state="N"
		density=1
	Edge5W
		icon='Edges5.dmi'
		icon_state="W"
		density=1
	Edge5E
		icon='Edges5.dmi'
		icon_state="E"
		density=1
	Edge6N
		icon='Edges6.dmi'
		icon_state="N"
		density=1
	Edge6W
		icon='Edges6.dmi'
		icon_state="W"
		density=1
	Edge6E
		icon='Edges6.dmi'
		icon_state="E"
		density=1
turf/var/Water
turf/Other
	Lava2
		icon='turvs.dmi'
		icon_state="lava"
		Enter(mob/M)
			return ..()
			if(ismob(M))
				M<<"You fell in the lava and died -_-"
				spawn M.Death()
	Lava
		icon='turfs.dmi'
		icon_state="lava"
		Enter(mob/M)
			return ..()
			if(ismob(M))
				M<<"You fell in the lava and died -_-"
				spawn M.Death()
	Blank
		opacity=1
		Enter(mob/M) return
	MountainCave
		density=1
		icon='Turf1.dmi'
		icon_state="mtn cave"
	Stars
		icon='Misc.dmi'
		icon_state="Stars"
		Enter(mob/A)
			if(ismob(A))
				if(A.Race=="Changeling"|A.Race=="Majin"|A.Race=="Android"|A.Race=="Bio-Android"|A.Race=="Makyojin"|usr.inpod|usr.insuit) return ..()
				else
					A<<"<font color=#FFFF00>The vacuum of space kills you instantly"
					spawn A.Death()
			else return ..()
	Orb
		icon='Turf1.dmi'
		icon_state="spirit"
		density=0
	Sky1
		icon='Misc.dmi'
		icon_state="Sky"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Sky2
		icon='Misc.dmi'
		icon_state="Clouds"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Ladder
		icon='Turf1.dmi'
		icon_state="ladder"
		density=0
	topdoor
		icon='topdoor.dmi'
		icon_state="Closed"
		density=1
		opacity=1
		Click()
			if(icon_state=="Closed")
				flick("Opening",src)
				density=0
				opacity=0
				icon_state="Open"
				sleep(300)
				flick("Closing",src)
				density=1
				opacity=1
				icon_state="Closed"
var/HBTC_Open
proc/HBTC()
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will remain open for one hour, \
	if you do not exit before then you will be trapped until someone enters the time chamber again, \
	and you will continue aging at ten times the normal rate until you exit"
	sleep(6000)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will be unlocked for 50 more minutes"
	sleep(6000)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will be unlocked for 40 more minutes"
	sleep(6000)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will be unlocked for 30 more minutes"
	sleep(6000)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will be unlocked for 20 more minutes"
	sleep(6000)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will be unlocked for 10 more minutes"
	sleep(3000)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will be unlocked for 5 more minutes"
	sleep(2400)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber will remain unlocked for ONE more minute"
	sleep(600)
	for(var/mob/A in Players) if(A.z==19) A<<"The time chamber exit disappears. You are now trapped"
	HBTC_Open=0
turf
	Bridge1V
		icon='Turf 50.dmi'
		icon_state="1.8"
	Bridge1H
		icon='Turf 50.dmi'
		icon_state="3.3"
	Bridge2V
		icon='Turf 57.dmi'
		icon_state="26"
	Bridge2H
		icon='Turf 57.dmi'
		icon_state="123"
	Bridge1V
		icon='Turf 50.dmi'
		icon_state="1.8"
	Bridge1H
		icon='Turf 50.dmi'
		icon_state="3.3"
	Bridge2V
		icon='Turf 57.dmi'
		icon_state="26"
	Bridge2H
		icon='Turf 57.dmi'
		icon_state="123"
	EdgeN
		icon='Edges1.dmi'
		icon_state="North"
	EdgeE
		icon='Edges1.dmi'
		icon_state="East"
	EdgeW
		icon='Edges1.dmi'
		icon_state="West"
	Edge1W
		icon='Edges.dmi'
		icon_state="West"
	Edge1NW
		icon='Edges.dmi'
		icon_state="NorthWest"
	Edge1E
		icon='Edges.dmi'
		icon_state="East"
	Edge1N
		icon='Edges.dmi'
		icon_state="North"
	Edge1NE
		icon='Edges1.dmi'
		icon_state="NorthEast"
	Edge2N
		icon='Edges2.dmi'
		icon_state="North"
	Edge2E
		icon='Edges2.dmi'
		icon_state="East"
	Edge2W
		icon='Edges2.dmi'
		icon_state="West"
	Edge3N
		icon='Edges3.dmi'
		icon_state="North"
	Edge3E
		icon='Edges3.dmi'
		icon_state="East"
	Edge3W
		icon='Edges3.dmi'
		icon_state="West"
	Edge4N
		icon='Edges4.dmi'
		icon_state="North"
	Edge4E
		icon='Edges4.dmi'
		icon_state="East"
	Edge4W
		icon='Edges4.dmi'
		icon_state="West"
	Edge5N
		icon='Edges5.dmi'
		icon_state="North"
	Edge5E
		icon='Edges5.dmi'
		icon_state="East"
	Edge5W
		icon='Edges5.dmi'
		icon_state="West"
	Edge6N
		icon='Edges6.dmi'
		icon_state="North"
	Edge6E
		icon='Edges6.dmi'
		icon_state="East"
	Edge6W
		icon='Edges6.dmi'
		icon_state="West"
	Grass8
		icon='NewTurf.dmi'
		icon_state="grass a"
	GroundDirt
		icon='Turfs 14.dmi'
		icon_state="Dirt"
	GroundIce
		icon='Turf 57.dmi'
		icon_state="8"
	GroundIce2
		icon='Turf 55.dmi'
		icon_state="ice"
	GroundDirtSand
		icon='Turfs 96.dmi'
		icon_state="dirt"
	GroundSnow icon='Turf Snow.dmi'
	Ground4
		icon='Turfs 12.dmi'
		icon_state="desert"
	Ground10
		icon='Turf1.dmi'
		icon_state="light desert"
	Ground17
		icon='Turfs1.dmi'
		icon_state="dirt2"
	Ground18
		icon='turfs.dmi'
		icon_state="hellfloor"
	Ground19
		icon='Turfs 96.dmi'
		icon_state="darktile"
	GroundIce3
		icon='Turfs 12.dmi'
		icon_state="ice"
	GroundHell
		icon='Turf 57.dmi'
		icon_state="hellturf1"
	Ground16
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone"
	Ground12
		icon='Turfs 1.dmi'
		icon_state="dirt"
	Ground13
		icon='Turfs 1.dmi'
		icon_state="rock"
		density=1
	GroundPebbles
		icon='Turfs 7.dmi'
		icon_state="Sand"
	Ground11
		icon='Turfs 1.dmi'
		icon_state="crack"
		density=1
	GroundSandDark
		icon='Turf1.dmi'
		icon_state="dark desert"
		density=0
	Ground3
		icon='Turf1.dmi'
		icon_state="very dark desert"
		density=0
	Grass9
		icon='Turfs 96.dmi'
		icon_state="grass d"
	Grass13
		icon='Turf 57.dmi'
		icon_state="grass"
	Grass7
		icon='Turfs 1.dmi'
		icon_state="grass"
	Grass5
		icon='Turfs 14.dmi'
		icon_state="Grass"
	Grass11
		icon='Turfs 1.dmi'
		icon_state="Grass 50"
	Grass12
		icon='Turfs1.dmi'
		icon_state="grassremade"
	Grass1
		icon='Turfs 12.dmi'
		icon_state="grass2"
	Grass8
		icon='Turfs 96.dmi'
		icon_state="grass a"
	GrassNamek
		icon='turfs.dmi'
		icon_state="ngrass"
	Grass2
		icon='Turfs 5.dmi'
		icon_state="grass"
	Grass3
		icon='Turfs 96.dmi'
		icon_state="grass b"
	Grass4
		icon='Turfs 96.dmi'
		icon_state="grass c"
	Grass11
		icon='turfs.dmi'
		icon_state="ngrass"
	Ground14
		icon='Turfs 2.dmi'
		icon_state="desert"
	Grass14
		icon='Turfs 96.dmi'
		icon_state="grass a"
	Grass12
		icon='Turfs 1.dmi'
		icon_state="Grass!"
	Wall12
		icon='Turfs 3.dmi'
		icon_state="cliff"
		density=1
	Wall10
		icon='Turfs 4.dmi'
		icon_state="ice cliff"
		density=1
	Wall3
		icon='Turfs 4.dmi'
		icon_state="wall"
		density=1
	Wall17
		icon='Turf 57.dmi'
		icon_state="1"
		density=1
	Wall7
		icon='Turfs 1.dmi'
		icon_state="cliff"
		density=1
	Wall2
		icon='Turfs 1.dmi'
		icon_state="wall6"
		opacity=0
		density=1
	WallSand
		icon='Turf 50.dmi'
		icon_state="3.2"
		density=1
	WallStone
		icon='Turf 57.dmi'
		icon_state="stonewall2"
		density=1
	WallStone2
		icon='Turf 57.dmi'
		icon_state="stonewall4"
		density=1
	WallStone3
		icon='Turfs 96.dmi'
		icon_state="wall3"
		density=1
	WallTech
		icon='Space.dmi'
		icon_state="bottom"
		density=1
	Wall18
		icon='Turf 57.dmi'
		icon_state="2"
		density=1
	Wall19
		icon='Turf 57.dmi'
		icon_state="3"
		density=1
	Wall20
		icon='Turf 57.dmi'
		icon_state="6"
		density=1
	Wall13
		icon='turfs.dmi'
		icon_state="wall8"
		density=1
	Wall16
		icon='Turf 50.dmi'
		icon_state="2.6"
		density=1
	Wall11
		icon='Turfs 18.dmi'
		icon_state="stone"
		density=1
	Wall5
		icon='turfs.dmi'
		icon_state="tile1"
		density=1
	Wall6
		icon='Turfs 2.dmi'
		icon_state="brick2"
		density=1
	Wall15
		icon='Turf1.dmi'
		icon_state="1"
		density=1
	Wall1
		icon='turfs.dmi'
		icon_state="tile5"
		density=1
		opacity=0
	RoofTech
		icon='Space.dmi'
		icon_state="top"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Roof1
		icon='Turfs 96.dmi'
		icon_state="roof3"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Roof2
		icon='Turfs.dmi'
		icon_state="roof2"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Roof3
		icon='Turfs 96.dmi'
		icon_state="roof4"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	RoofWhite
		icon='turfs.dmi'
		icon_state="block_wall1"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	TileWood
		icon='Turfs 96.dmi'
		icon_state="woodfloor"
	TileBlue
		icon='turfs.dmi'
		icon_state="tile11"
	Tile26
		icon='turfs.dmi'
		icon_state="tile9"
	Tile25
		icon='Turfs 4.dmi'
		icon_state="cooltiles"
	Tile21
		icon='Turfs 12.dmi'
		icon_state="Girly Carpet"
	Tile23
		icon='Turfs 12.dmi'
		icon_state="Wood_Floor"
	Tile17
		icon='turfs.dmi'
		icon_state="roof4"
	Tile15
		icon='Turfs 12.dmi'
		icon_state="stonefloor"
	Tile6
		icon='Turfs 12.dmi'
		icon_state="floor4"
	Tile14
		icon='turfs.dmi'
		icon_state="tile10"
	Tile22
		icon='FloorsLAWL.dmi'
		icon_state="SS Floor"
	TileStone
		icon='Turf 57.dmi'
		icon_state="55"
	Tile13
		icon='Turfs 1.dmi'
		icon_state="ground"
	TileWood
		icon='Turf 57.dmi'
		icon_state="woodfloor"
	Tile19
		icon='Turfs 12.dmi'
		icon_state="floor2"
	Tile20
		icon='turfs.dmi'
		icon_state="tile4"
	Tile2
		icon='FloorsLAWL.dmi'
		icon_state="Tile"
	Tile12
		icon='Turfs 15.dmi'
		icon_state="floor7"
	TileBlue2
		icon='turfs.dmi'
		icon_state="tile12"
	Tile13
		icon='Turfs 15.dmi'
		icon_state="floor6"
	Tile24
		icon='turfs.dmi'
		icon_state="bridgemid2"
	Tile10
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone Vegeta"
	Tile11
		icon='Turfs 2.dmi'
		icon_state="dirt"
	Tile18
		icon='Turfs 12.dmi'
		icon_state="Aluminum Floor"
	Tile8
		icon='Turfs 1.dmi'
		icon_state="woodenground"
	Tile16
		icon='Turfs 14.dmi'
		icon_state="Stone"
	Tile27
		icon='turfs.dmi'
		icon_state="tile7"
	Tile28
		icon='turfs.dmi'
		icon_state="floor"
	TileGold
		icon='Turf 55.dmi'
		icon_state="goldfloor"
	Tile9
		icon='Turfs 18.dmi'
		icon_state="wooden"
	Tile8
		icon='Turfs 18.dmi'
		icon_state="diagwooden"
	Tile1
		icon='Turfs 12.dmi'
		icon_state="Brick_Floor"
	Tile2
		icon='Turfs 12.dmi'
		icon_state="Stone Crystal Path"
	Tile3
		icon='Turfs 12.dmi'
		icon_state="Stones"
	Tile4
		icon='Turfs 12.dmi'
		icon_state="Black Tile"
	Tile5
		icon='Turfs 12.dmi'
		icon_state="Dirty Brick"
	Stairs1
		icon='Turfs 96.dmi'
		icon_state="steps"
	StairsHell
		icon='Turf 57.dmi'
		icon_state="hellstairs"
	Stairs4
		icon='Turfs 1.dmi'
		icon_state="stairs1"
	Stairs5
		icon='Turfs 1.dmi'
		icon_state="earthstairs"
	Stairs3
		icon='Turfs 1.dmi'
		icon_state="stairs2"
	Stairs2
		icon='Turfs 12.dmi'
		icon_state="Steps"
	WaterNew
		icon='turvs.dmi'
		icon_state="water"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water6
		icon='Turfs 1.dmi'
		icon_state="water"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	WaterReal
		icon='Turfs 96.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water5
		icon='Turfs 4.dmi'
		icon_state="kaiowater"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	WaterFall
		icon='Turfs 1.dmi'
		icon_state="lightwaterfall"
		density=1
		layer=MOB_LAYER+1
		Enter(mob/M)
			if(ismob(M))
				if(M.icon_state=="Flight") return ..()
				else return
			else return ..()
	Water3
		icon='Misc.dmi'
		icon_state="Water"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Wall8
		icon='Turfs 15.dmi'
		icon_state="wall2"
		density=1
		Enter(mob/M)
			if(ismob(M))
				if(M.icon_state=="Flight") return ..()
				else return
			else return ..()
	Water8
		icon='turfs.dmi'
		icon_state="nwater"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water1
		icon='Turfs 12.dmi'
		icon_state="water3"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water11
		icon='Turfs 12.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water7
		icon='turfs.dmi'
		icon_state="lava"
		density=0
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water2
		icon='Turfs 96.dmi'
		icon_state="stillwater"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water12
		icon='Turfs 12.dmi'
		icon_state="water4"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water9
		icon='Turfs 12.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water10
		icon='Turf 50.dmi'
		icon_state="9.1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	CaveEntrance
		icon='Turf 57.dmi'
		icon_state="13"
	Door
		icon='Obj Door.dmi'
		icon_state="door"

atom/var/tmp
	Builder
	Savable
obj/Surf
	layer=2
	Savable=0
	New()
		..()
		spawn(1) if(src) for(var/obj/A in view(0,src)) if(A!=src) if(loc==initial(loc)) del(src)
	Water10Surf
		icon='Surf1.dmi'
	Water10Surf2
		icon='Surf1.dmi'
		icon_state="N"
	Water9Surf
		icon='Surf6.dmi'
	Water9Surf2
		icon='Surf6.dmi'
		icon_state="N"
	Water2Surf
		icon='Surf2.dmi'
	Water2Surf2
		icon='Surf2.dmi'
		icon_state="N"
	Water8Surf
		icon='Surf4.dmi'
	Water8Surf2
		icon='Surf4.dmi'
		icon_state="N"
	Water3Surf
		icon='Surf3.dmi'
	Water3Surf2
		icon='Surf3.dmi'
		icon_state="N"
	Water5Surf
		icon='Surf5.dmi'
	Water5Surf2
		icon='Surf5.dmi'
		icon_state="S"
obj/Lightning
	icon='Lightning.dmi'
	New()
		..()
		spawn(600) if(src) del(src)
obj/Explosion
	icon='Ki Explosion.dmi'
	New()
		..()
		for(var/obj/Explosion/A in view(0,src)) if(A!=src) del(A)
		pixel_x=rand(-8,8)
		pixel_y=rand(-8,8)
		spawn(rand(4,6)) if(src) del(src)
obj/Tornado
	icon='Tornado.dmi'
	New()
		..()
		spawn(600) if(src) del(src)
//var/itemenabled=1
//proc/SaveItems()
//	if(itemenabled)
//		var/foundobjects=0
//		var/savefile/F=new("ItemSave")
//		var/list/L=new/list
//		for(var/obj/A) if(A.x&&A.y&&A.z&&!A.NotSavable&&!istype(A,/obj/Planets)&&!istype(A,/obj/DeadZone)&&!istype(A,/obj/Explosion)&&!istype(A,/obj/attack/blast)&&!istype(A,/obj/Lightning)&&!istype(A,/obj/Porunga)&&!istype(A,/obj/Shenron))
//			foundobjects+=1
//			A.saved_x=A.x
//			A.saved_y=A.y
//			A.saved_z=A.z
//			L.Add(A)
//		F["SavedItems"]<<L
//		world<<"<font size=1>Items saved ([foundobjects] items)"
//proc/LoadItems()
//	var/amount=0
//	for(var/obj/A) if(A.x&&A.y&&A.z) del(A)
//	if(fexists("ItemSave"))
//		var/savefile/F=new("ItemSave")
//		var/list/L=new/list
//		F["SavedItems"]>>L
//		for(var/obj/A in L)
//			amount+=1
//			A.loc=locate(A.saved_x,A.saved_y,A.saved_z)
//	world<<"<font size=1>Items Loaded ([amount])."
obj/var
	saved_x=1
	saved_y=1
	saved_z=1
	savetype
//var/mapenabled=1
//proc/MapSave()
//	if(mapenabled)
//		var/amount=0
//		fdel("MapSave")
//		var/savefile/F=new("MapSave")
//		var/list/L=new/list
//		F["MapSave"]<<L
//		world<<"Map Saved ([amount])"
//proc/MapLoad()
//	if(fexists("MapSave"))
//		var/savefile/F=new("MapSave")
//		var/list/L=new/list
//		F["MapSave"]>>L
//	world<<"<font size=1>Map Loaded."
area
	Inside //Placed where built things are, so it doesnt have weather inside.
	SafeZone //Stop turf destroy at spawns
var/builtobjects=0
atom/var/tmp/buildon
mob/var/tmp/upgrading
obj/var
	BUILDRES=1
	BUILDPASS
	BUILDOWNER
turf/var
	Resistance=1
	password
	owner
	isbuilt
mob/proc/AddBuilds()
	for(var/A in typesof(/turf/buildables)) if(A!=/turf/buildables)
		if(prob(5)) sleep(1)
		var/turf/buildables/C=new A(locate(1,1,1))
		var/obj/buildables/B=new/obj/buildables
		B.icon=C.icon
		B.icon_state=C.icon_state
		B.savetype="[C.type]"
		B.name=C.name
		contents.Add(B)
		del(C)
	for(var/A in typesof(/obj/buildables)) if(A!=/obj/buildables)
		if(prob(5)) sleep(1)
		var/obj/buildables/C=new A
		var/obj/buildables/B=new/obj/buildables
		B.icon=C.icon
		B.icon_state=C.icon_state
		B.savetype="[C.type]"
		B.name=C.name
		contents.Add(B)
		del(C)
mob/verb/BuildToggle()
	set category="Other"
	if(!buildon)
		buildon=1
		usr<<"<b><font size=1>Building on."
		AddBuilds()
	else
		usr<<"<b><font size=1>Building off."
		buildon=0
		for(var/obj/buildables/A in contents) del(A)
obj/buildables
	DblClick() if(usr.buildon)
		if(savetype=="/turf/buildables/SecurityWall")
			var/turf/A=new/turf/buildables/SecurityWall(locate(usr.x,usr.y,usr.z))
			A.owner=usr.name
		else if(savetype=="/turf/buildables/SecurityDoor")
			var/turf/A=new/turf/buildables/SecurityDoor(locate(usr.x,usr.y,usr.z))
			A.password=input("Enter a permanent password for this door.") as text
			A.owner=usr.name
		else for(var/turf/C in view(0,usr)) new savetype(locate(usr.x,usr.y,usr.z))
obj/buildables
	TransporterPad
		icon='TransporterPad.dmi'
	Plant8
		icon='Turfs 1.dmi'
		icon_state="smalltree"
		density=1
	Plant9
		icon='Turfs 2.dmi'
		icon_state="treeb"
		density=1
	SmallPine
		icon='Turf 58.dmi'
		icon_state="2"
		density=1
		New()
			..()
			var/image/A=image(icon='Turf 58.dmi',icon_state="1",pixel_y=0,pixel_x=-32,layer=50)
			var/image/B=image(icon='Turf 58.dmi',icon_state="0",pixel_y=-32,pixel_x=0,layer=50)
			var/image/C=image(icon='Turf 58.dmi',icon_state="3",pixel_y=32,pixel_x=-32,layer=50)
			var/image/D=image(icon='Turf 58.dmi',icon_state="4",pixel_y=32,pixel_x=0,layer=50)
			overlays.Add(A,B,C,D)
	RedTree
		density=1
		New()
			..()
			var/image/A=image(icon='Turf 55.dmi',icon_state="1",pixel_y=32,pixel_x=-32,layer=50)
			var/image/B=image(icon='Turf 55.dmi',icon_state="2",pixel_y=0,pixel_x=0,layer=50)
			var/image/C=image(icon='Turf 55.dmi',icon_state="3",pixel_y=32,pixel_x=32,layer=50)
			var/image/D=image(icon='Turf 55.dmi',icon_state="4",pixel_y=0,pixel_x=-32,layer=50)
			var/image/E=image(icon='Turf 55.dmi',icon_state="5",pixel_y=32,pixel_x=0,layer=50)
			var/image/F=image(icon='Turf 55.dmi',icon_state="6",pixel_y=0,pixel_x=32,layer=50)
			overlays.Add(A,B,C,D,E,F)
	BigHousePlant
		density=1
		icon='Turf 52.dmi'
		icon_state="plant bottom"
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="plant top",pixel_y=32,pixel_x=0,layer=50)
			overlays.Add(A)
	BookCaseBotton
		density=1
		icon='Turf 52.dmi'
		icon_state="book case"
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="book case top",pixel_y=32,pixel_x=0,layer=50)
			overlays.Add(A)
	BookCaseBottomEmpty
		density=1
		icon='Turf 52.dmi'
		icon_state="empty bookcase"
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="book case top",pixel_y=32,pixel_x=0,layer=50)
			overlays.Add(A)
	Oak
		density=1
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="1",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='turfs.dmi',icon_state="2",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='turfs.dmi',icon_state="3",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='turfs.dmi',icon_state="4",pixel_y=32,pixel_x=16,layer=50)
			var/image/E=image(icon='turfs.dmi',icon_state="5",pixel_y=64,pixel_x=-16,layer=50)
			var/image/F=image(icon='turfs.dmi',icon_state="6",pixel_y=64,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D,E,F)
	RoundTree
		density=1
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="01",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='turfs.dmi',icon_state="02",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='turfs.dmi',icon_state="03",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='turfs.dmi',icon_state="04",pixel_y=32,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D)
	Tree
		density=1
		icon='turfs.dmi'
		icon_state="bottom"
		New()
			..()
			var/image/B=image(icon='turfs.dmi',icon_state="middle",pixel_y=32,pixel_x=0,layer=50)
			var/image/C=image(icon='turfs.dmi',icon_state="top",pixel_y=64,pixel_x=0,layer=50)
			overlays.Add(B,C)
	Palm
		density=1
		New()
			..()
			var/image/A=image(icon='Trees2.dmi',icon_state="1",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='Trees2.dmi',icon_state="2",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='Trees2.dmi',icon_state="3",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='Trees2.dmi',icon_state="4",pixel_y=32,pixel_x=16,layer=50)
			var/image/E=image(icon='Trees2.dmi',icon_state="5",pixel_y=64,pixel_x=-16,layer=50)
			var/image/F=image(icon='Trees2.dmi',icon_state="6",pixel_y=64,pixel_x=16,layer=50)
			var/image/G=image(icon='Trees2.dmi',icon_state="7",pixel_y=96,pixel_x=-16,layer=50)
			var/image/H=image(icon='Trees2.dmi',icon_state="8",pixel_y=96,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D,E,F,G,H)
	LargePine
		density=1
		New()
			..()
			var/image/A=image(icon='Tree Good.dmi',icon_state="1",pixel_y=0,pixel_x=-16,layer=50)
			var/image/B=image(icon='Tree Good.dmi',icon_state="2",pixel_y=0,pixel_x=16,layer=50)
			var/image/C=image(icon='Tree Good.dmi',icon_state="3",pixel_y=32,pixel_x=-16,layer=50)
			var/image/D=image(icon='Tree Good.dmi',icon_state="4",pixel_y=32,pixel_x=16,layer=50)
			var/image/E=image(icon='Tree Good.dmi',icon_state="5",pixel_y=64,pixel_x=-16,layer=50)
			var/image/F=image(icon='Tree Good.dmi',icon_state="6",pixel_y=64,pixel_x=16,layer=50)
			overlays.Add(A,B,C,D,E,F)
	TallBush
		density=1
		icon='Turf3.dmi'
		icon_state="tallplantbottom"
		density=1
		New()
			..()
			var/image/A=image(icon='Turf3.dmi',icon_state="tallplanttop",pixel_y=32,layer=50)
			overlays.Add(A)
	NamekTree
		density=1
		icon='turfs.dmi'
		icon_state="nt1"
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="nt2",pixel_y=32,layer=50)
			overlays.Add(A)
	MountainCave
		density=1
		icon='Turf1.dmi'
		icon_state="mtn cave"
	Rock
		icon='Turfs 2.dmi'
		icon_state="rock"
	LargeRock
		density=1
		icon='turfs.dmi'
		icon_state="rockl"
	firewood
		icon='roomobj.dmi'
		icon_state="firewood"
		density=1
	WaterRock
		density=1
		icon='turfs.dmi'
		icon_state="waterrock"
	HellRock
		density=1
		icon='turfs.dmi'
		icon_state="hellrock1"
	HellRock2
		density=1
		icon='turfs.dmi'
		icon_state="hellrock2"
	HellRock3
		density=1
		icon='turfs.dmi'
		icon_state="hellrock3"
	LargeRock2
		density=1
		icon='turfs.dmi'
		icon_state="terrainrock"
	Rock1
		icon='Turf 50.dmi'
		icon_state="1.9"
		density=1
	Rock2
		icon='Turf 50.dmi'
		icon_state="2.0"
		density=1
	Stalagmite
		density=1
		icon='Turf 57.dmi'
		icon_state="44"
	Fence
		density=1
		icon='Turf 55.dmi'
		icon_state="woodenfence"
	Rock3
		icon='Turf 57.dmi'
		icon_state="19"
		density=1
	Rock4
		icon='Turf 57.dmi'
		icon_state="20"
		density=1
	Flowers
		icon='Turf 52.dmi'
		icon_state="flower bed"
	Rock6
		icon='Turf 57.dmi'
		icon_state="64"
		density=1
	Bush1
		icon='Turf 57.dmi'
		icon_state="bush"
		density=1
	Whirlpool icon='Whirlpool.dmi'
	Bush2
		icon='Turf 57.dmi'
		icon_state="bushbig1"
		density=1
	Bush3
		icon='Turf 57.dmi'
		icon_state="bushbig2"
		density=1
	Bush4
		icon='Turf 57.dmi'
		icon_state="bushbig3"
		density=1
	Bush5
		icon='Turf 50.dmi'
		icon_state="2.1"
		density=1
	SnowBush
		icon='Turf 57.dmi'
		icon_state="snowbush"
		density=1
	Plant12
		icon='Plants.dmi'
		icon_state="plant1"
		density=1
	Table7
		icon='Turf3.dmi'
		icon_state="168"
		density=1
	Table8
		icon='Turf3.dmi'
		icon_state="169"
		density=1
	Plant11
		icon='Plants.dmi'
		icon_state="plant2"
		density=1
	Plant10
		icon='Plants.dmi'
		icon_state="plant3"
		density=1
	Plant16
		icon='roomobj.dmi'
		icon_state="flowers"
	Plant15
		icon='roomobj.dmi'
		icon_state="flowers2"
	Plant2
		icon='Turf3.dmi'
		icon_state="plant"
		density=1
	Plant3
		icon='turfs.dmi'
		icon_state="groundplant"
	Plant4
		icon='Turf2.dmi'
		icon_state="plant2"
	Plant5
		icon='Turf2.dmi'
		icon_state="plant3"
	Plant13
		icon='turfs.dmi'
		icon_state="bush"
	Plant14
		icon='Turfs 1.dmi'
		icon_state="frozentree"
		density=1
	Plant18
		icon='Trees.dmi'
		icon_state="Dead Tree1"
		density=1
	Plant6
		icon='Turfs1.dmi'
		icon_state="1"
		density=1
	Plant20
		icon='Turfs1.dmi'
		icon_state="2"
		density=1
	Plant19
		icon='Turfs1.dmi'
		icon_state="3"
		density=1
	Plant7
		icon='Trees.dmi'
		icon_state="Tree1"
		density=1
	Plant8
		icon='Turfs 1.dmi'
		icon_state="smalltree"
		density=1
	Plant9
		icon='Turfs 2.dmi'
		icon_state="treeb"
		density=1
	bridgeN
		icon='Misc.dmi'
		icon_state="N"
		density=1
	bridgeS
		icon='Misc.dmi'
		icon_state="S"
		density=1
	bridgeE
		icon='Misc.dmi'
		icon_state="E"
		density=1
	Table9
		icon='Turf 52.dmi'
		icon_state="small table"
		density=1
	bridgeW
		icon='Misc.dmi'
		icon_state="W"
		density=1
	pot
		icon='NewTurf.dmi'
		icon_state="pot"
		density=1
	table1
		icon='NewTurf.dmi'
		icon_state="Table1"
		density=1
		layer=TURF_LAYER+1
	Chest
		icon='Turf3.dmi'
		icon_state="161"
	HellPot
		icon='turfs.dmi'
		icon_state="flamepot2"
		density=1
		New()
			..()
			var/image/A=image(icon='turfs.dmi',icon_state="flamepot1",pixel_y=32)
			overlays.Add(A)
	RugLarge
		New()
			..()
			var/image/A=image(icon='Turfs 96.dmi',icon_state="spawnrug1",pixel_x=-16,pixel_y=16,layer=2)
			var/image/B=image(icon='Turfs 96.dmi',icon_state="spawnrug2",pixel_x=16,pixel_y=16,layer=2)
			var/image/C=image(icon='Turfs 96.dmi',icon_state="spawnrug3",pixel_x=-16,pixel_y=-16,layer=2)
			var/image/D=image(icon='Turfs 96.dmi',icon_state="spawnrug4",pixel_x=16,pixel_y=-16,layer=2)
			overlays.Add(A,B,C,D)
	Apples
		icon='Turf3.dmi'
		icon_state="163"
	Book
		icon='Turf3.dmi'
		icon_state="167"
	Light
		icon='Space.dmi'
		icon_state="light"
		density=1
	Glass
		icon='Space.dmi'
		icon_state="glass1"
		density=1
		layer=MOB_LAYER+1
	Table6
		icon='turfs.dmi'
		icon_state="Table"
		density=1
	Table5
		icon='Turfs 2.dmi'
		icon_state="tableL"
		density=1
	Throne
		icon='NewTurfs.dmi'
		icon_state="throne"
		density=1
	Log
		density=1
		New()
			..()
			var/image/A=image(icon='Turf 57.dmi',icon_state="log1",pixel_x=-16)
			var/image/B=image(icon='Turf 57.dmi',icon_state="log2",pixel_x=16)
			overlays.Add(A,B)
	FancyCouch
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="couch left",pixel_x=-16)
			var/image/B=image(icon='Turf 52.dmi',icon_state="couch right",pixel_x=16)
			overlays.Add(A,B)
	Table3
		icon='Turfs 2.dmi'
		icon_state="tableR"
		density=1
	Table4
		icon='Turfs 2.dmi'
		icon_state="tableM"
		density=1
	Jugs
		icon='Turf 52.dmi'
		icon_state="jugs"
		density=1
	Hay
		icon='Turf 52.dmi'
		icon_state="hay"
		density=1
	Clock
		icon='Turf 52.dmi'
		icon_state="clock"
		density=1
	Torch3
		icon='Turf 57.dmi'
		icon_state="83"
		density=1
	Fire
		icon='Turf 57.dmi'
		icon_state="82"
		density=1
	Table9
		icon='Turf 52.dmi'
		icon_state="small table"
		density=1
	Waterpot
		icon='Turf 52.dmi'
		icon_state="water pot"
		density=1
	Stove
		icon='Turf 52.dmi'
		icon_state="stove"
		density=1
	Drawer
		icon='Turf 52.dmi'
		icon_state="drawers"
		density=1
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="drawers top",pixel_y=32)
			overlays.Add(A)
	Bed
		icon='Turf 52.dmi'
		icon_state="bed top"
		New()
			..()
			var/image/A=image(icon='Turf 52.dmi',icon_state="bed",pixel_y=-32)
			overlays.Add(A)
	Torch1
		icon='Turf2.dmi'
		icon_state="168"
		density=1
	Torch2
		icon='Turf2.dmi'
		icon_state="169"
		density=1
	Fire
		icon='Turf 57.dmi'
		icon_state="82"
		density=1
	barrel
		icon='Turfs 2.dmi'
		icon_state="barrel"
		density=1
	chair
		icon='turfs.dmi'
		icon_state="Chair"
	Plant8
		icon='Turfs 1.dmi'
		icon_state="smalltree"
		density=1
	Plant9
		icon='Turfs 2.dmi'
		icon_state="treeb"
		density=1
	Plant18
		icon='Trees.dmi'
		icon_state="Dead Tree1"
		density=1
	Plant21
		icon='Turfs1.dmi'
		icon_state="1"
		density=1
	Plant20
		icon='Turfs1.dmi'
		icon_state="2"
		density=1
	Plant19
		icon='Turfs1.dmi'
		icon_state="3"
		density=1
	Plant7
		icon='Trees.dmi'
		icon_state="Tree1"
		density=1
	tpalm
		icon='turfs.dmi'
		icon_state="1"
		layer=MOB_LAYER+1
		New()
			..()
			icon=null
			icon_state=null
			var/amount=6
			while(amount)
				var/image/I=image(icon='turfs.dmi',icon_state="[amount]")
				if(amount==6)
					I.pixel_x+=16
					I.pixel_y+=64
				if(amount==5)
					I.pixel_x-=16
					I.pixel_y+=64
				if(amount==4)
					I.pixel_x+=16
					I.pixel_y+=32
				if(amount==3)
					I.pixel_x-=16
					I.pixel_y+=32
				if(amount==2) I.pixel_x+=16
				if(amount==1) I.pixel_x-=16
				overlays+=I
				amount-=1
	Table2Left
		icon='Turf3.dmi'
		icon_state="168"
		density=1
	Table2Right
		icon='Turf3.dmi'
		icon_state="169"
		density=1
	table
		icon='turfs.dmi'
		icon_state="Table"
		density=1
	grain1
		icon='Turfs 1.dmi'
		icon_state="grain1"
	Sign
		icon='Obj Sign.dmi'
		density=1
		var/Message="<font color=#FF0000>Nothing is written on this sign..."
		Click() usr<<"[Message]"
		verb/ChangeMessage()
			set category=null
			set src in oview(1)
			Message=input("") as text
	glass1
		icon='Space.dmi'
		icon_state="glass1"
		density=1
		layer=MOB_LAYER+1
	borderN
		icon='Misc.dmi'
		icon_state="N"
		density=1
	borderS
		icon='Misc.dmi'
		icon_state="S"
		density=1
	borderE
		icon='Misc.dmi'
		icon_state="E"
		density=1
	borderW
		icon='Misc.dmi'
		icon_state="W"
		density=1
	waterfall
		icon='Turfs 1.dmi'
		icon_state="waterfall"
		density=1
		layer=MOB_LAYER+1
	lightwaterfall
		icon='Turfs 1.dmi'
		icon_state="lightwaterfall"
		density=1
		layer=MOB_LAYER+1
	flowers
		icon='Turfs 1.dmi'
		icon_state="flowers"
	chair
		icon='turfs.dmi'
		icon_state="Chair"
	Giantskull
		icon='Obj_GiantSkull.dmi'
	ironmaiden
		icon='Obj_IronMaiden.dmi'
	pentagram
		icon='Obj_Pentagram.dmi'
	stretchrack
		icon='Obj_StretchRack.dmi'
	wallshackes
		icon='Obj_WallShackles.dmi'
	gamemachine
		icon='Obj_Pacman.dmi'
		density=1
	cmachinetop
		icon='NewTurf.dmi'
		icon_state="cmachine top"
		density=1
	cmachinebottom
		icon='NewTurf.dmi'
		icon_state="cmachine bottom"
		density=1
	television
		icon='NewTurf.dmi'
		icon_state="tv"
		density=1
	box2
		icon='Turfs 5.dmi'
		icon_state="box"
		density=1
	strangetree
		icon='Turfs 1.dmi'
		icon_state="smalltree"
		density=1
	smalltree
		icon='Turfs 2.dmi'
		icon_state="treeb"
		density=1
	bedS
		icon='Turfs 2.dmi'
		icon_state="BEDL"
	bedN
		icon='Turfs 2.dmi'
		icon_state="BEDR"
	tree2
		icon='Turfs 5.dmi'
		icon_state="tree"
		density=1
	box2
		icon='Turfs 5.dmi'
		icon_state="box"
		density=1
	deadtree
		icon='Trees.dmi'
		icon_state="Dead Tree1"
		density=1
	tree2
		icon='Trees.dmi'
		icon_state="Tree1"
		density=1
	trees3
		icon='tree3.dmi'
		density=1
	trees2
		icon='turfs.dmi'
		icon_state="bush"
		density=1
	CURSES
		icon='Icons.dmi'
		icon_state="CURSES!"
		density=1
	trees1
		icon='turfs.dmi'
		icon_state="groundplant"
		density=1
	Torch1
		icon='Turf2.dmi'
		icon_state="168"
		density=1
	Torch2
		icon='Turf2.dmi'
		icon_state="169"
		density=1
	Knife
		icon='Turf1.dmi'
		icon_state="knife"
		density=1
	Axe
		icon='Turf1.dmi'
		icon_state="axe"
		density=1
	Swords
		icon='Turf1.dmi'
		icon_state="sword crisscross"
		density=1
	Ladder
		icon='Turf1.dmi'
		icon_state="ladder"
		density=0
	Bow
		icon='Turf1.dmi'
		icon_state="bow"
		density=0
	Arrow
		icon='Turf1.dmi'
		icon_state="arrow"
		density=0
	Book
		icon='Turf3.dmi'
		icon_state="167"
	Computer
		icon='Turfs 5.dmi'
		icon_state="computer"
	HousePlant
		icon='Turf3.dmi'
		icon_state="plant"
	Speaker
		icon='Turfs 5.dmi'
		icon_state="ssystem"
	Microwave
		icon='Turfs 5.dmi'
		icon_state="micro"
	frozentree
		icon='Turfs 1.dmi'
		icon_state="frozentree"
		density=1
	brownrock
		icon='Turfs 1.dmi'
		icon_state="rock2"
		density=1
	earthrock
		icon='Turfs 2.dmi'
		icon_state="rock"
turf/buildables
	New()
		isbuilt=1
		new/area/Inside(locate(x,y,z))
	SecurityDoor
		icon='turfs.dmi'
		icon_state="doorclosed"
		opacity=1
		Click()
			if(icon_state=="doorclosed")
				var/guess=input("You must know the password to enter here.") as text
				if(guess==password)
					icon_state="dooropen"
					spawn(50) icon_state="doorclosed"
				else usr<<"Wrong!"
		Enter(mob/M)
			if(istype(M,/mob))
				if(icon_state=="doorclosed") return
				else return 1
			if(istype(M,/obj/attack))
				Resistance-=M.Pow
				if(Resistance<=0) new/turf/Ground8(locate(x,y,z))
				del(M)
		verb/Knock()
			set category=null
			set src in oview(6)
			oview(src)<<"**There is a knock at the door**"
		verb/Upgrade()
			set category="Other"
			set src in view(1)
			if(usr.KO) return
			if(Resistance<(usr.techskill**2)*10000)
				if(!usr.upgrading)
					usr.upgrading=1
					view(usr)<<"[usr] upgrades all of [owner]'s security walls to tech level [usr.techskill]"
					for(var/turf/buildables/SecurityDoor/A)
						if(prob(10)) sleep(1)
						if(A.owner==owner) if(A.Resistance<(usr.techskill**2)*10000) A.Resistance=(usr.techskill**2)*10000
					for(var/turf/buildables/SecurityWall/A)
						if(prob(10)) sleep(1)
						if(A.owner==owner&&usr) if(A.Resistance<(usr.techskill**2)*10000) A.Resistance=(usr.techskill**2)*10000
					usr.upgrading=0
				else usr<<"There is a time limit before you can use this again."
	SecurityWall
		icon='turfs.dmi'
		icon_state="SecurityWall"
		opacity=1
		Enter(mob/M)
			if(istype(M,/mob)) return
			if(istype(M,/obj/attack))
				Resistance-=M.Pow
				if(Resistance<=0) new/turf/Ground8(locate(x,y,z))
				del(M)
		verb/Upgrade()
			set category="Other"
			set src in view(1)
			if(usr.KO) return
			if(Resistance<(usr.techskill**2)*10000)
				if(!usr.upgrading)
					usr.upgrading=1
					view(usr)<<"[usr] upgrades all of [owner]'s security walls to tech level [usr.techskill]"
					for(var/turf/buildables/SecurityDoor/A)
						if(prob(10)) sleep(1)
						if(A.owner==owner) if(A.Resistance<(usr.techskill**2)*10000) A.Resistance=(usr.techskill**2)*10000
					for(var/turf/buildables/SecurityWall/A)
						if(prob(10)) sleep(1)
						if(A.owner==owner&&usr) if(A.Resistance<(usr.techskill**2)*10000) A.Resistance=(usr.techskill**2)*10000
					usr.upgrading=0
				else usr<<"There is a time limit before you can use this again."

	wall
		icon='Turf1.dmi'
		icon_state="wall"
		density=1
	wallz
		icon='turfs.dmi'
		icon_state="tile5"
		density=1
		opacity=0
	floorz
		icon='Turfs 15.dmi'
		icon_state="floor6"
	grassz1
		icon='NewTurf.dmi'
		icon_state="grass c"
	grassz2
		icon='turfs.dmi'
		icon_state="grass"
	grassz3
		icon='Turfs 12.dmi'
		icon_state="grass4"
	grassz4
		icon='Turfs 12.dmi'
		icon_state="grass5"
	bridge
		icon='turfs.dmi'
		icon_state="bridgemid2"
	browndirt
		icon='Turfs 1.dmi'
		icon_state="dirt"
	browncrack
		icon='Turfs 1.dmi'
		icon_state="crack"
		density=1
	browncave
		icon='Turfs 1.dmi'
		icon_state="cave"
	vegetastairs
		icon='Turfs 1.dmi'
		icon_state="stairs"
	lightgrass
		icon='NewTurf.dmi'
		icon_state="grass d"
	earthgrass
		icon='Turfs 1.dmi'
		icon_state="grass"
	lightrockground
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone"
	earthstairs1
		icon='Turfs 1.dmi'
		icon_state="earthstairs"
	cliff
		icon='Turfs 1.dmi'
		icon_state="cliff"
		density=1
	kaiowater
		icon='Turfs 4.dmi'
		icon_state="kaiowater"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	namekstonewall
		icon='turfs.dmi'
		icon_state="wall8"
		density=1
	destroyednamekwallleft
		icon='NewTurfs.dmi'
		icon_state="brokennamekleft"
		density=1
	destroyednamekwallright
		icon='NewTurfs.dmi'
		icon_state="brokennamekright"
		density=1
	shinystairs
		icon='Turfs 1.dmi'
		icon_state="stairs2"
	steelwall
		icon='Turfs 3.dmi'
		icon_state="cliff"
		density=1
	darktiles
		icon='turfs.dmi'
		icon_state="tile9"
	icecliff
		icon='Turfs 4.dmi'
		icon_state="ice cliff"
		density=1
	icefloor
		icon='Turfs 4.dmi'
		icon_state="ice cliff"
	icecave
		icon='Turfs 4.dmi'
		icon_state="ice cave"
		opacity=1
	coolflooring
		icon='Turfs 4.dmi'
		icon_state="cooltiles"
	vegetarockwall
		icon='Turfs 4.dmi'
		icon_state="wall"
		density=1
	vegetawater
		icon='Misc.dmi'
		icon_state="Water"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	namekstairs
		icon='Turfs 1.dmi'
		icon_state="stairs1"
	earthrockwall
		icon='Turfs 1.dmi'
		icon_state="wall"
		density=1
	SSFloor
		icon='FloorsLAWL.dmi'
		icon_state="SS Floor"
	tourneytiles
		icon='Turfs 2.dmi'
		icon_state="tourneytiles"
	brickwall
		icon='turfs.dmi'
		icon_state="tile1"
		density=1
	brickwall2
		icon='Turfs 2.dmi'
		icon_state="brick2"
		density=1
	namekgrass
		icon='FloorsLAWL.dmi'
		icon_state="Grass Namek"
	namekwater
		icon='turfs.dmi'
		icon_state="nwater"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	sky
		icon='Misc.dmi'
		icon_state="Sky"
		density=1
	afterlifesky
		icon='Misc.dmi'
		icon_state="Clouds"
		density=1
	vegetaparchedground
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone Vegeta"
	vegetaparcheddirt
		icon='Turfs 2.dmi'
		icon_state="dirt"
	woodfloor
		icon='Turfs 1.dmi'
		icon_state="woodenground"
	snow
		icon='FloorsLAWL.dmi'
		icon_state="Snow"
	sand
		icon='Turfs 1.dmi'
		icon_state="sand"
	tilefloor
		icon='Turfs 1.dmi'
		icon_state="ground"
	dirt
		icon='Turfs 1.dmi'
		icon_state="dirt"
	NormalGrass
		icon='Turfs 2.dmi'
		icon_state="grass"
	Water
		icon='Turfs 1.dmi'
		icon_state="water"
		Water=1
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Floor
		icon='Turfs 12.dmi'
		icon_state="floor2"
	Floor2
		icon='Turfs 12.dmi'
		icon_state="floor4"
	Ice
		icon='Turfs 12.dmi'
		icon_state="ice"
	Tile2
		icon='FloorsLAWL.dmi'
		icon_state="Tile"
	Lava
		icon='turfs.dmi'
		icon_state="lava"
		density=1
	GirlyCarpet
		icon='Turfs 12.dmi'
		icon_state="Girly Carpet"
	WoodFloor2
		icon='Turfs 12.dmi'
		icon_state="Wood_Floor"
	Btile
		icon='turfs.dmi'
		icon_state="roof4"
	StoneFloor
		icon='Turfs 12.dmi'
		icon_state="stonefloor"
	GraniteSlab
		icon='Turfs.dmi'
		icon_state="roof2"
		density=1
		opacity=1
	BlackMarble
		icon='turfs.dmi'
		icon_state="tile10"
	Steps
		icon='Turfs 12.dmi'
		icon_state="Steps"
	AluminumFloor
		icon='Turfs 12.dmi'
		icon_state="Aluminum Floor"
	Desert
		icon='Turfs 12.dmi'
		icon_state="desert"
	Water2
		icon='NewTurf.dmi'
		icon_state="stillwater"
		Water=1
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Stone2
		icon='Turfs 14.dmi'
		icon_state="Stone"
	Dirt
		icon='Turfs 14.dmi'
		icon_state="Dirt"
		layer=OBJ_LAYER-1
	fanceytile
		icon='turfs.dmi'
		icon_state="tile7"
	fanceywall
		icon='turfs.dmi'
		icon_state="wall6"
		density=1
	grass2
		icon='Turfs 17.dmi'
		icon_state="grass"
	wall6
		icon='turfs.dmi'
		icon_state="wall6"
		opacity=0
		density=1
	wooden
		icon='Turfs 18.dmi'
		icon_state="wooden"
	diagwooden
		icon='Turfs 18.dmi'
		icon_state="diagwooden"
	stone
		icon='Turfs 18.dmi'
		icon_state="stone"
		density=1
	jwall
		icon='Turfs 19.dmi'
		icon_state="jwall"
		density=1
	darkdesert
		icon='Turf1.dmi'
		icon_state="dark desert"
		density=0
	o1
		icon='Turf1.dmi'
		icon_state="light desert"
		density=0
	o2
		icon='Turf1.dmi'
		icon_state="very dark desert"
		density=0
	o12
		icon='Turf2.dmi'
		icon_state="146"
	o16
		icon='Turf2.dmi'
		icon_state="150"
		density=1
	o26
		icon='Turf2.dmi'
		icon_state="160"
	o43
		icon='Turfs 12.dmi'
		icon_state="Brick_Floor"
	o44
		icon='Turfs 12.dmi'
		icon_state="Stone Crystal Path"
	o45
		icon='Turfs 12.dmi'
		icon_state="Stones"
	o46
		icon='Turfs 12.dmi'
		icon_state="Black Tile"
	o47
		icon='Turfs 12.dmi'
		icon_state="Dirty Brick"
	o48
		icon='turfs2.dmi'
		icon_state="water"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	o49
		icon='Turfs 14.dmi'
		icon_state="Grass"
	o54
		icon='Turfs 7.dmi'
		icon_state="Sand"
	o55
		icon='Turfs 12.dmi'
		icon_state="floor4"
	o56
		icon='Turfs 8.dmi'
		icon_state="Sand"
	Lava2
		icon='turvs.dmi'
		icon_state="lava"
		density=0
	Wall15
		icon='Turf1.dmi'
		icon_state="1"
		density=1
	Grass8
		icon='NewTurf.dmi'
		icon_state="grass a"
	Wall1
		icon='turfs.dmi'
		icon_state="tile5"
		density=1
		opacity=0
	Tile13
		icon='Turfs 15.dmi'
		icon_state="floor6"
	Grass1
		icon='Turfs 12.dmi'
		icon_state="grass2"
	Grass2
		icon='Turfs 5.dmi'
		icon_state="grass"
	Grass3
		icon='NewTurf.dmi'
		icon_state="grass b"
	Grass4
		icon='NewTurf.dmi'
		icon_state="grass c"
	Tile24
		icon='turfs.dmi'
		icon_state="bridgemid2"
	Ground12
		icon='Turfs 1.dmi'
		icon_state="dirt"
	Ground13
		icon='Turfs 1.dmi'
		icon_state="rock"
		density=1
	Ground11
		icon='Turfs 1.dmi'
		icon_state="crack"
		density=1
	Table5
		icon='Turfs 2.dmi'
		icon_state="tableL"
		density=1
	Table3
		icon='Turfs 2.dmi'
		icon_state="tableR"
		density=1
	Table4
		icon='Turfs 2.dmi'
		icon_state="tableM"
		density=1
	Stairs1
		icon='NewTurf.dmi'
		icon_state="steps"
	Grass9
		icon='NewTurf.dmi'
		icon_state="grass d"
	Grass7
		icon='Turfs 1.dmi'
		icon_state="grass"
	Grass12
		icon='Turfs1.dmi'
		icon_state="grassremade"
	Water6
		destroyable=0
		icon='Turfs 1.dmi'
		icon_state="water"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Ground16
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone"
	Stairs5
		icon='Turfs 1.dmi'
		icon_state="earthstairs"
	Wall7
		icon='Turfs 1.dmi'
		icon_state="cliff"
		density=1
	Water5
		destroyable=0
		icon='Turfs 4.dmi'
		icon_state="kaiowater"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Wall13
		icon='turfs.dmi'
		icon_state="wall8"
		density=1
	Wall
		icon='NewTurf.dmi'
		icon_state="wall"
	Wall2
		icon='NewTurf.dmi'
		icon_state="wall2"
		density=1
	Stairs3
		icon='Turfs 1.dmi'
		icon_state="stairs2"
		destroyable=0
	Water4
		icon='Turfs 1.dmi'
		icon_state="lightwaterfall"
		density=1
		layer=MOB_LAYER+1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight) return 1
				else return
			else
				KiWater()
				return 1
	Wall12
		icon='Turfs 3.dmi'
		icon_state="cliff"
		density=1
	Tile26
		icon='turfs.dmi'
		icon_state="tile9"
	Wall10
		icon='Turfs 4.dmi'
		icon_state="ice cliff"
		density=1
	Tile25
		icon='Turfs 4.dmi'
		icon_state="cooltiles"
	Wall3
		destroyable=0
		icon='Turfs 4.dmi'
		icon_state="wall"
		density=1
	Water3
		icon='Misc.dmi'
		icon_state="Water"
		density=1
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Stairs4
		icon='Turfs 1.dmi'
		icon_state="stairs1"
	Wall8
		icon='Turfs 15.dmi'
		icon_state="wall2"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight) return 1
				else return
			else return 1
	Tile22
		icon='FloorsLAWL.dmi'
		icon_state="SS Floor"
	Tile12
		icon='Turfs 15.dmi'
		icon_state="floor7"
	Ground14
		icon='Turfs 2.dmi'
		icon_state="desert"
	Wall5
		icon='turfs.dmi'
		icon_state="tile1"
		density=1
	Wall6
		icon='Turfs 2.dmi'
		icon_state="brick2"
		density=1
	Tile10
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone Vegeta"
	Tile11
		icon='Turfs 2.dmi'
		icon_state="dirt"
	Tile8
		icon='Turfs 1.dmi'
		icon_state="woodenground"
	Ground7
		icon='Turf Snow.dmi'
	Ground10
		icon='Turf1.dmi'
		icon_state="light desert"
	Tile13
		icon='Turfs 1.dmi'
		icon_state="ground"
	Ground15
		icon='Turfs 1.dmi'
		icon_state="dirt"
	Ground17
		icon='Turfs1.dmi'
		icon_state="dirt"
	Ground18
		icon='turfs.dmi'
		icon_state="hellfloor"
	Ground6
		icon='Turfs 2.dmi'
		icon_state="grass"
	Ground19
		icon='NewTurf.dmi'
		icon_state="darktile"
	Water1
		Water=1
		destroyable=0
		icon='Turfs 12.dmi'
		icon_state="water3"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Water11
		Water=1
		destroyable=0
		icon='Turfs 12.dmi'
		icon_state="water1"
		density=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Tile19
		icon='Turfs 12.dmi'
		icon_state="floor2"
	Tile20
		icon='turfs.dmi'
		icon_state="tile4"
	Ground9
		icon='Turfs 12.dmi'
		icon_state="ice"
	Tile2
		icon='FloorsLAWL.dmi'
		icon_state="Tile"
	Water7
		icon='turfs.dmi'
		icon_state="lava"
		density=0
		Enter(mob/M)
			if(istype(M,/mob))
				if(usr.Race!="Changeling")
					if(!usr.flight)
						M.HP-=(500/usr.End)
						if(M.HP<=0)
							view(M)<<"[M] walks into the lava and dies!"
							M.Death()
					else return 1
				else return 1
			else return 1
	Tile21
		icon='Turfs 12.dmi'
		icon_state="Girly Carpet"
	Tile23
		icon='Turfs 12.dmi'
		icon_state="Wood_Floor"
	Tile17
		icon='turfs.dmi'
		icon_state="roof4"
	Tile15
		icon='Turfs 12.dmi'
		icon_state="stonefloor"
	Wall4
		icon='Turfs.dmi'
		icon_state="roof2"
		density=1
	Tile14
		icon='turfs.dmi'
		icon_state="tile10"
	Stairs2
		icon='Turfs 12.dmi'
		icon_state="Steps"
	Tile18
		icon='Turfs 12.dmi'
		icon_state="Aluminum Floor"
	Ground4
		icon='Turfs 12.dmi'
		icon_state="desert"
	Water2
		Water=1
		destroyable=0
		icon='NewTurf.dmi'
		icon_state="stillwater"
		density=1
		Enter(mob/M)
			if(istype(M,/mob)) if(M.flight|!M.density) return 1
			else return 1
	Tile16
		icon='Turfs 14.dmi'
		icon_state="Stone"
		density=0
	Ground8
		icon='Turfs 14.dmi'
		icon_state="Dirt"
	Tile27
		icon='turfs.dmi'
		icon_state="tile7"
	Tile28
		icon='turfs.dmi'
		icon_state="floor"
	Wall9
		icon='turfs.dmi'
		icon_state="wall6"
		density=1
	Grass8
		icon='NewTurf.dmi'
		icon_state="grass a"
	Wall2
		icon='Turfs 1.dmi'
		icon_state="wall6"
		opacity=0
		density=1
	Tile9
		icon='Turfs 18.dmi'
		icon_state="wooden"
	Tile8
		icon='Turfs 18.dmi'
		icon_state="diagwooden"
	Wall11
		icon='Turfs 18.dmi'
		icon_state="stone"
		density=1
	Wall14
		icon='Turfs 19.dmi'
		icon_state="jwall"
		density=1
	Ground5
		icon='Turf1.dmi'
		icon_state="dark desert"
		density=0
	Ground6
		icon='Turf1.dmi'
		icon_state="light desert"
		density=0
	Ground3
		icon='Turf1.dmi'
		icon_state="very dark desert"
		density=0
	Tile1
		icon='Turfs 12.dmi'
		icon_state="Brick_Floor"
	Tile2
		icon='Turfs 12.dmi'
		icon_state="Stone Crystal Path"
	Tile3
		icon='Turfs 12.dmi'
		icon_state="Stones"
	Tile4
		icon='Turfs 12.dmi'
		icon_state="Black Tile"
	Tile5
		icon='Turfs 12.dmi'
		icon_state="Dirty Brick"
	Water12
		icon='Turfs 12.dmi'
		icon_state="water4"
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Water9
		icon='Turfs 12.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Water10
		icon='Turfs 1.dmi'
		icon_state="Water 50"
		Water=1
		Enter(mob/M)
			if(istype(M,/mob))
				if(M.flight|!M.density) return 1
				else return
			else
				KiWater()
				return 1
	Grass5
		icon='Turfs 14.dmi'
		icon_state="Grass"
	Grass10
		icon='Turfs 1.dmi'
		icon_state="Grass 1"
	Grass11
		icon='Turfs 1.dmi'
		icon_state="Grass 50"
	Ground1
		icon='Turfs 7.dmi'
		icon_state="Sand"
	Tile6
		icon='Turfs 12.dmi'
		icon_state="floor4"
	Bridge1V
		icon='Turf 50.dmi'
		icon_state="1.8"
	Bridge1H
		icon='Turf 50.dmi'
		icon_state="3.3"
	Bridge2V
		icon='Turf 57.dmi'
		icon_state="26"
	Bridge2H
		icon='Turf 57.dmi'
		icon_state="123"
	Bridge1V
		icon='Turf 50.dmi'
		icon_state="1.8"
	Bridge1H
		icon='Turf 50.dmi'
		icon_state="3.3"
	Bridge2V
		icon='Turf 57.dmi'
		icon_state="26"
	Bridge2H
		icon='Turf 57.dmi'
		icon_state="123"
	Grass8
		icon='NewTurf.dmi'
		icon_state="grass a"
	GroundDirt
		icon='Turfs 14.dmi'
		icon_state="Dirt"
	GroundIce
		icon='Turf 57.dmi'
		icon_state="8"
	GroundIce2
		icon='Turf 55.dmi'
		icon_state="ice"
	GroundDirtSand
		icon='Turfs 96.dmi'
		icon_state="dirt"
	GroundSnow icon='Turf Snow.dmi'
	Ground4
		icon='Turfs 12.dmi'
		icon_state="desert"
	Ground10
		icon='Turf1.dmi'
		icon_state="light desert"
	Ground17
		icon='Turfs1.dmi'
		icon_state="dirt2"
	Ground18
		icon='turfs.dmi'
		icon_state="hellfloor"
	Ground19
		icon='Turfs 96.dmi'
		icon_state="darktile"
	GroundIce3
		icon='Turfs 12.dmi'
		icon_state="ice"
	GroundHell
		icon='Turf 57.dmi'
		icon_state="hellturf1"
	Ground16
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone"
	Ground12
		icon='Turfs 1.dmi'
		icon_state="dirt"
	Ground13
		icon='Turfs 1.dmi'
		icon_state="rock"
		density=1
	GroundPebbles
		icon='Turfs 7.dmi'
		icon_state="Sand"
	Ground11
		icon='Turfs 1.dmi'
		icon_state="crack"
		density=1
	GroundSandDark
		icon='Turf1.dmi'
		icon_state="dark desert"
		density=0
	Ground3
		icon='Turf1.dmi'
		icon_state="very dark desert"
		density=0
	Grass9
		icon='Turfs 96.dmi'
		icon_state="grass d"
	Grass13
		icon='Turf 57.dmi'
		icon_state="grass"
	Grass7
		icon='Turfs 1.dmi'
		icon_state="grass"
	Grass5
		icon='Turfs 14.dmi'
		icon_state="Grass"
	Grass11
		icon='Turfs 1.dmi'
		icon_state="Grass 50"
	Grass1
		icon='Turfs 12.dmi'
		icon_state="grass2"
	Grass8
		icon='Turfs 96.dmi'
		icon_state="grass a"
	GrassNamek
		icon='turfs.dmi'
		icon_state="ngrass"
	Grass2
		icon='Turfs 5.dmi'
		icon_state="grass"
	Grass3
		icon='Turfs 96.dmi'
		icon_state="grass b"
	Grass4
		icon='Turfs 96.dmi'
		icon_state="grass c"
	Ground14
		icon='Turfs 2.dmi'
		icon_state="desert"
	Grass14
		icon='Turfs 96.dmi'
		icon_state="grass a"
	Wall12
		icon='Turfs 3.dmi'
		icon_state="cliff"
		density=1
	Wall10
		icon='Turfs 4.dmi'
		icon_state="ice cliff"
		density=1
	Wall3
		icon='Turfs 4.dmi'
		icon_state="wall"
		density=1
	Wall17
		icon='Turf 57.dmi'
		icon_state="1"
		density=1
	Wall7
		icon='Turfs 1.dmi'
		icon_state="cliff"
		density=1
	Wall2
		icon='Turfs 1.dmi'
		icon_state="wall6"
		opacity=0
		density=1
	WallSand
		icon='Turf 50.dmi'
		icon_state="3.2"
		density=1
	WallStone
		icon='Turf 57.dmi'
		icon_state="stonewall2"
		density=1
	WallStone2
		icon='Turf 57.dmi'
		icon_state="stonewall4"
		density=1
	WallStone3
		icon='Turfs 96.dmi'
		icon_state="wall3"
		density=1
	WallTech
		icon='Space.dmi'
		icon_state="bottom"
		density=1
	Wall18
		icon='Turf 57.dmi'
		icon_state="2"
		density=1
	Wall19
		icon='Turf 57.dmi'
		icon_state="3"
		density=1
	Wall20
		icon='Turf 57.dmi'
		icon_state="6"
		density=1
	Wall13
		icon='turfs.dmi'
		icon_state="wall8"
		density=1
	Wall16
		icon='Turf 50.dmi'
		icon_state="2.6"
		density=1
	Wall11
		icon='Turfs 18.dmi'
		icon_state="stone"
		density=1
	Wall5
		icon='turfs.dmi'
		icon_state="tile1"
		density=1
	Wall6
		icon='Turfs 2.dmi'
		icon_state="brick2"
		density=1
	Wall15
		icon='Turf1.dmi'
		icon_state="1"
		density=1
	Wall1
		icon='turfs.dmi'
		icon_state="tile5"
		density=1
		opacity=0
	RoofTech
		icon='Space.dmi'
		icon_state="top"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Roof1
		icon='Turfs 96.dmi'
		icon_state="roof3"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Roof2
		icon='Turfs.dmi'
		icon_state="roof2"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	Roof3
		icon='Turfs 96.dmi'
		icon_state="roof4"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	RoofWhite
		icon='turfs.dmi'
		icon_state="block_wall1"
		density=1
		opacity=1
		Enter(atom/A)
			if(ismob(A))
				if(FlyOverAble) return ..()
				else return
			else return ..()
	TileWood
		icon='Turfs 96.dmi'
		icon_state="woodfloor"
	TileBlue
		icon='turfs.dmi'
		icon_state="tile11"
	Tile26
		icon='turfs.dmi'
		icon_state="tile9"
	Tile25
		icon='Turfs 4.dmi'
		icon_state="cooltiles"
	Tile21
		icon='Turfs 12.dmi'
		icon_state="Girly Carpet"
	Tile23
		icon='Turfs 12.dmi'
		icon_state="Wood_Floor"
	Tile17
		icon='turfs.dmi'
		icon_state="roof4"
	Tile15
		icon='Turfs 12.dmi'
		icon_state="stonefloor"
	Tile6
		icon='Turfs 12.dmi'
		icon_state="floor4"
	Tile14
		icon='turfs.dmi'
		icon_state="tile10"
	Tile22
		icon='FloorsLAWL.dmi'
		icon_state="SS Floor"
	TileStone
		icon='Turf 57.dmi'
		icon_state="55"
	Tile13
		icon='Turfs 1.dmi'
		icon_state="ground"
	TileWood
		icon='Turf 57.dmi'
		icon_state="woodfloor"
	Tile19
		icon='Turfs 12.dmi'
		icon_state="floor2"
	Tile20
		icon='turfs.dmi'
		icon_state="tile4"
	Tile2
		icon='FloorsLAWL.dmi'
		icon_state="Tile"
	Tile12
		icon='Turfs 15.dmi'
		icon_state="floor7"
	TileBlue2
		icon='turfs.dmi'
		icon_state="tile12"
	Tile13
		icon='Turfs 15.dmi'
		icon_state="floor6"
	Tile24
		icon='turfs.dmi'
		icon_state="bridgemid2"
	Tile10
		icon='FloorsLAWL.dmi'
		icon_state="Flagstone Vegeta"
	Tile11
		icon='Turfs 2.dmi'
		icon_state="dirt"
	Tile18
		icon='Turfs 12.dmi'
		icon_state="Aluminum Floor"
	Tile8
		icon='Turfs 1.dmi'
		icon_state="woodenground"
	Tile16
		icon='Turfs 14.dmi'
		icon_state="Stone"
	Tile27
		icon='turfs.dmi'
		icon_state="tile7"
	Tile28
		icon='turfs.dmi'
		icon_state="floor"
	TileGold
		icon='Turf 55.dmi'
		icon_state="goldfloor"
	Tile9
		icon='Turfs 18.dmi'
		icon_state="wooden"
	Tile8
		icon='Turfs 18.dmi'
		icon_state="diagwooden"
	Tile1
		icon='Turfs 12.dmi'
		icon_state="Brick_Floor"
	Tile2
		icon='Turfs 12.dmi'
		icon_state="Stone Crystal Path"
	Tile3
		icon='Turfs 12.dmi'
		icon_state="Stones"
	Tile4
		icon='Turfs 12.dmi'
		icon_state="Black Tile"
	Tile5
		icon='Turfs 12.dmi'
		icon_state="Dirty Brick"
	Stairs1
		icon='Turfs 96.dmi'
		icon_state="steps"
	StairsHell
		icon='Turf 57.dmi'
		icon_state="hellstairs"
	Stairs4
		icon='Turfs 1.dmi'
		icon_state="stairs1"
	Stairs5
		icon='Turfs 1.dmi'
		icon_state="earthstairs"
	Stairs3
		icon='Turfs 1.dmi'
		icon_state="stairs2"
	Stairs2
		icon='Turfs 12.dmi'
		icon_state="Steps"
	WaterNew
		icon='turvs.dmi'
		icon_state="water"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water6
		icon='Turfs 1.dmi'
		icon_state="water"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	WaterReal
		icon='Turfs 96.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water5
		icon='Turfs 4.dmi'
		icon_state="kaiowater"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	WaterFall
		icon='Turfs 1.dmi'
		icon_state="lightwaterfall"
		density=1
		layer=MOB_LAYER+1
		Enter(mob/M)
			if(ismob(M))
				if(M.icon_state=="Flight") return ..()
				else return
			else return ..()
	Water3
		icon='Misc.dmi'
		icon_state="Water"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Wall8
		icon='Turfs 15.dmi'
		icon_state="wall2"
		density=1
		Enter(mob/M)
			if(ismob(M))
				if(M.icon_state=="Flight") return ..()
				else return
			else return ..()
	Water8
		icon='turfs.dmi'
		icon_state="nwater"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water1
		icon='Turfs 12.dmi'
		icon_state="water3"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water11
		icon='Turfs 12.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water7
		icon='turfs.dmi'
		icon_state="lava"
		density=0
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water2
		icon='Turfs 96.dmi'
		icon_state="stillwater"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water12
		icon='Turfs 12.dmi'
		icon_state="water4"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water9
		icon='Turfs 12.dmi'
		icon_state="water1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Water10
		icon='Turf 50.dmi'
		icon_state="9.1"
		Water=1
		Enter(mob/M)
			if(ismob(M)) if(M.icon_state=="Flight"|!M.density) return ..()
			else return ..()
	Door
		icon='Obj Door.dmi'
		icon_state="door"

obj/Planets/Earth
	icon='Planets.dmi'
	icon_state="Earth"
	density=1
	var/gotox
	var/gotoy
	var/gotoz
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.grabbee) for(var/mob/A in view(1,M)) if(A.name==M.grabbee) A.loc=locate(gotox,gotoy,gotoz)
			usr.loc=locate(gotox,gotoy,gotoz)
		else if(M) M.loc=locate(gotox,gotoy,gotoz)