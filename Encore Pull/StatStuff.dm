mob/var
	hud="blue"
obj/Display
	icon='StatBar.dmi'
	layer=999
obj/Display
	icon='StatBar.dmi'
	layer=999
mob/verb/StatColor()
	set category="Other"
	var/c = input ("Select a color to change your hud to") as color
	hud="[c]"
	Add_Stats()
mob/proc/Add_Stats()
	for(var/obj/Display/A in client.screen) del(A)
	var/obj/HP1=new/obj/Display
	var/obj/HP2=new/obj/Display
	var/obj/HP3=new/obj/Display
	var/obj/EP1=new/obj/Display
	var/obj/EP2=new/obj/Display
	var/obj/EP3=new/obj/Display
	var/obj/hppcnt=new/obj/Display
	var/obj/eppcnt=new/obj/Display
	HP1.icon+=hud
	HP2.icon+=hud
	HP3.icon+=hud
	EP1.icon+=hud
	EP2.icon+=hud
	EP3.icon+=hud
	hppcnt.icon+=hud
	eppcnt.icon+=hud
	HP1.name="HP1"
	HP2.name="HP2"
	HP3.name="HP3"
	EP1.name="EP1"
	EP2.name="EP2"
	EP3.name="EP3"
	hppcnt.name="hppcnt"
	eppcnt.name="eppcnt"
	HP1.screen_loc="1,1"
	HP2.screen_loc="2:-16,1"
	HP3.screen_loc="3:-32,1"
	hppcnt.screen_loc="4:-48,1"
	EP1.screen_loc="4,1"
	EP2.screen_loc="5:-16,1"
	EP3.screen_loc="6:-32,1"
	eppcnt.screen_loc="7:-48,1"
	var/image/Health=image(icon='StatBar.dmi',icon_state="Health")
	var/image/Energy=image(icon='StatBar.dmi',icon_state="Energy")
	Health.icon+=hud
	Energy.icon+=hud
	Health.pixel_y+=18
	Energy.pixel_y+=18
	HP1.overlays.Add(Health)
	EP1.overlays.Add(Energy)
	client.screen+=HP1
	client.screen+=HP2
	client.screen+=HP3
	client.screen+=hppcnt
	client.screen+=EP1
	client.screen+=EP2
	client.screen+=EP3
	client.screen+=eppcnt
	var/obj/BP1=new/obj/Display
	var/obj/BP2=new/obj/Display
	var/obj/BP3=new/obj/Display
	var/obj/bppcnt=new/obj/Display
	BP1.icon+=hud
	BP2.icon+=hud
	BP3.icon+=hud
	bppcnt.icon+=hud
	BP1.name="BP1"
	BP2.name="BP2"
	BP3.name="BP3"
	bppcnt.name="bppcnt"
	BP1.screen_loc="7,1"
	BP2.screen_loc="8:-16,1"
	BP3.screen_loc="9:-32,1"
	bppcnt.screen_loc="10:-48,1"
	var/image/Power=image(icon='StatBar.dmi',icon_state="Power")
	Power.icon+=hud
	Power.pixel_y+=18
	BP1.overlays.Add(Power)
	client.screen+=BP1
	client.screen+=BP2
	client.screen+=BP3
	client.screen+=bppcnt
	var/obj/P1=new/obj/Display
	var/obj/P2=new/obj/Display
	var/obj/P3=new/obj/Display
	var/obj/Lpara=new/obj/Display
	var/obj/Plus=new/obj/Display
	var/obj/Ppcnt=new/obj/Display
	var/obj/Rpara=new/obj/Display
	P1.icon+=hud
	P2.icon+=hud
	P3.icon+=hud
	Lpara.icon+=hud
	Plus.icon+=hud
	Ppcnt.icon+=hud
	Rpara.icon+=hud
	P1.name="P1"
	P2.name="P2"
	P3.name="P3"
	Lpara.name="Lpara"
	Plus.name="Plus"
	Ppcnt.name="Ppcnt"
	Rpara.name="Rpara"
	Lpara.screen_loc="10,1"
	Plus.screen_loc="11:-32,1"
	P1.screen_loc="12:-48,1"
	P2.screen_loc="13:-64,1"
	P3.screen_loc="14:-80,1"
	Ppcnt.screen_loc="15:-96,1"
	Rpara.screen_loc="15:-96,1"
	client.screen+=Lpara
	client.screen+=Plus
	client.screen+=P1
	client.screen+=P2
	client.screen+=P3
	client.screen+=Ppcnt
	client.screen+=Rpara
mob/proc/StatUpdate()
	//Health and Energy.
	var/HPpcnt=num2text(round(HP))
	var/EPpcnt=num2text(round((Ki/MaxKi)*100))
	var/HPstate1=copytext(HPpcnt,1,2)
	var/EPstate1=copytext(EPpcnt,1,2)
	var/HPstate2=copytext(HPpcnt,2,3)
	var/EPstate2=copytext(EPpcnt,2,3)
	var/HPstate3=copytext(HPpcnt,3,4)
	var/EPstate3=copytext(EPpcnt,3,4)
	var/BPpcnt=num2text(round((PL/MaxPL)*100))
	if(round((PL/MaxPL)*100)>999) BPpcnt="999"
	var/BPstate1=copytext(BPpcnt,1,2)
	var/BPstate2=copytext(BPpcnt,2,3)
	var/BPstate3=copytext(BPpcnt,3,4)
	for(var/obj/Display/A in client.screen)
		if(A.name=="HP1") A.icon_state=HPstate1
		else if(A.name=="HP2") A.icon_state=HPstate2
		else if(A.name=="HP3") A.icon_state=HPstate3
		else if(A.name=="EP1") A.icon_state=EPstate1
		else if(A.name=="EP2") A.icon_state=EPstate2
		else if(A.name=="EP3") A.icon_state=EPstate3
		else if(A.name=="hppcnt") A.icon_state="%"
		else if(A.name=="eppcnt") A.icon_state="%"
		else if(A.name=="BP1") A.icon_state=BPstate1
		else if(A.name=="BP2") A.icon_state=BPstate2
		else if(A.name=="BP3") A.icon_state=BPstate3
		else if(A.name=="bppcnt") A.icon_state="%"
		else for(var/obj/Skills/Power_Control/P in contents)
			var/Poweruppcnt=round(PLpcnt-100)
			if(Poweruppcnt<-99) Poweruppcnt=-99
			Poweruppcnt=num2text(Poweruppcnt)
			if(A.name=="P1") A.icon_state=copytext(Poweruppcnt,1,2)
			if(A.name=="P2") A.icon_state=copytext(Poweruppcnt,2,3)
			if(A.name=="P3") A.icon_state=copytext(Poweruppcnt,3,4)
			if(A.name=="Lpara") A.icon_state="("
			if(A.name=="Plus")
				if(PLpcnt<100) A.icon_state=""
				else A.icon_state="+"
			if(A.name=="Ppcnt") A.icon_state="%"
			if(A.name=="Rpara") A.icon_state=")"
	spawn(30) StatUpdate()
mob/var
	strpcnt
	endpcnt
	powpcnt
	respcnt
	spdpcnt
	offpcnt
	defpcnt
mob/proc/Greatest_Stat()
	var/total=Str+End+Pow+Res+Spd+Offense+Defense
	strpcnt=(Str/total)*100
	endpcnt=(End/total)*100
	powpcnt=(Pow/total)*100
	respcnt=(Res/total)*100
	spdpcnt=(Spd/total)*100
	offpcnt=(Offense/total)*100
	defpcnt=(Defense/total)*100