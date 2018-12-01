obj/items/Com_Badge
	name="*Com Badge - Space Cruiser*"
	icon='Com Badge.dmi'
	verb/Beam_Up()
		if(usr.dead)
			usr<<"It doesnt work because your dead."
			return
		view(usr)<<"[usr]: [usr] to Space Cruiser, one to beam up."
		sleep(50)
		view(usr)<<"A light trail from space hits [usr] and they disappear"
		usr.overlays+='SBombGivePower.dmi'
		sleep(10)
		usr.loc=locate(326,374,26)
		sleep(10)
		usr.overlays-='SBombGivePower.dmi'
	verb/Equip()
		set category=null
		set src in usr
		if(!suffix)
			suffix="*Equipped*"
			usr.overlays+=icon
			usr<<"You put on the [src]."
		else
			suffix=null
			usr.overlays-=icon
			usr<<"You take off the [src]."
obj/SpaceCruiser_D
	Click()
		usr.client.perspective=EYE_PERSPECTIVE
		usr.client.eye=usr
	New()
		..()
		for(var/obj/SpaceCruiser_D/Q) if(Q!=src)
			view(src)<<"Only 1 of these may exist at once."
			del(src)
		var/image/A=image(icon='Ship1.dmi',icon_state="1")
		var/image/B=image(icon='Ship1.dmi',icon_state="2")
		var/image/C=image(icon='Ship1.dmi',icon_state="3")
		var/image/D=image(icon='Ship1.dmi',icon_state="4")
		A.pixel_y+=16
		A.pixel_x-=16
		B.pixel_y+=16
		B.pixel_x+=16
		C.pixel_y-=16
		C.pixel_x-=16
		D.pixel_y-=16
		D.pixel_x+=16
		overlays+=A
		overlays+=B
		overlays+=C
		overlays+=D
		spawn while(src)
			sleep(1)
			for(var/mob/Z in view(0,src)) if(Z.z==z)
				Z<<"Computer: You have been beamed aboard the Space Cruiser."
				Z.loc=locate(317,374,35)
obj/proc/CCMove()
	while(z==7)
		sleep(5)
		step_rand(src)
obj/SpaceCruiser_D_Computer
	icon='Enterprise D Computer.dmi'
	icon_state="2"
	Click()
		for(var/obj/SpaceCruiser_D/A)
			if(A.z!=7)
				view(src)<<"Computer: The Space Cruiser has entered orbit"
				A.loc=locate(rand(1,350),rand(1,350),7)
			if(A.z==7)
				var/list/Choices=new/list
				Choices.Add("Cancel")
				Choices.Add("Vegeta")
				Choices.Add("Earth")
				Choices.Add("Namek")
				Choices.Add("Arconia")
				Choices.Add("Changeling Planet")
				Choices.Add("Android Ship")
				Choices.Add("Station")
				var/B=input("Go where?") in Choices
				if(B=="Station")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(170,215,9)
					view(src)<<"Computer: Coordinates reached."
				if(B=="Earth")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(rand(1,350),rand(1,350),1)
					view(src)<<"Computer: Coordinates reached."
				if(B=="Namek")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(rand(1,350),rand(1,350),3)
					view(src)<<"Computer: Coordinates reached."
				if(B=="Vegeta")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(rand(1,350),rand(1,350),4)
					view(src)<<"Computer: Coordinates reached."
				if(B=="Arconia")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(rand(1,350),rand(1,350),5)
					view(src)<<"Computer: Coordinates reached."
				if(B=="Changeling Planet")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(rand(1,350),rand(1,350),6)
					view(src)<<"Computer: Coordinates reached."
				if(B=="Android Ship")
					view(src)<<"Coordinate set to [B]"
					sleep(500)
					spawn(1) usr.loc=locate(x,y,z)
					A.loc=locate(63,308,8)
					view(src)<<"Computer: Coordinates reached."

	verb/ObserveShip()
		set category="Other"
		set src in oview(1)
		for(var/obj/SpaceCruiser_D/A)
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=A
			usr<<"Click the ship to go back to normal."
turf/Special/Enterprise_D_Teleport
	destroyable=0
	density=1
	Enter(mob/M)
		var/gotox
		var/gotoy
		var/gotoz
		for(var/obj/SpaceCruiser_D/A)
			gotox=A.x
			gotoy=A.y-1
			gotoz=A.z
		if(istype(M,/mob))
			usr.x=gotox
			usr.y=gotoy
			usr.z=gotoz
		else if(M) M.loc=locate(gotox,gotoy,gotoz)