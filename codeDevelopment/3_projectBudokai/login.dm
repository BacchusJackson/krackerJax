//1 - Configuration

//temp log ip address
var/list/IP_Address[] = new()
var/Maximum_Addresses_Allowed = 2

client
	New()

		//if the person has an address
		//When hosting, there is no IP Address
		if(address)
			//if the ip address is already in the array
			if(IP_Address.Find("[computer_id]") && IP_Address["[computer_id]"]>0)
				//add the ip address to the array
				IP_Address["[computer_id]"]++
				if(IP_Address["[computer_id]"]>Maximum_Addresses_Allowed&&usr.key!="Titan")
					src<<"<font color=red>You can only have a maximum of [Maximum_Addresses_Allowed] keys on at a time per computer.</font>"
					del(src)
			else
				IP_Address["[computer_id]"] = 1
		..()
	Del()
		//Remove the IP address from the array so they can login
		if(address && IP_Address.Find("[computer_id]"))
			IP_Address["[computer_id]"]--
			if(IP_Address["[computer_id]"]<=0)
				IP_Address -= "[computer_id]"
		..()

//give admin 1 the ability to change the addresses allowed
mob/Admin1
	verb
		Change_Addresses_Allowed(n as num)
			set hidden = 1
			if(!n) n = 1
			if(n <= 0) n = 1
			Maximum_Addresses_Allowed = n
			world<<"<b>>Announcement<</b> - [Maximum_Addresses_Allowed] People can be logged in at a time with the same computer, as decleared by [usr]"

world
	name = "Project Budokai"
	mob = /mob/player

mob
	player
		verb
			say(msg as text)
				view(src) << "[src] says, \"[msg]\""

		icon = 'White Male.dmi'
	rat
		icon = 'rat.dmi'

turf
	floor
		icon = 'floor.dmi'

	wall
		icon = 'wall.dmi'
		density = 1
		opacity = 1

obj
	cheese
		icon = 'cheese.dmi'

	scroll
		icon = 'scroll.dmi'

area
	outside

	cave