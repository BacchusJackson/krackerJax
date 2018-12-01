/* Two Steps BYOND

   Original Author: Tom of Dantom
   Original Art Work: Chris Johnson
   Maintainer: LordAndrew
   Email: lordovos@live.com
   Version: 2.2 (September 7th, 2012)
   Contributors: Julio Monteiro, Sgeo, TheMonkeyDidIt, Deadron

   This is your world,
   To shape as you may,
   It may look like crap,
   But trust us, it's clay!

   ///////////////////////////////////////////////////////////////////////////////////////////////////
   // READ THIS //
   ///////////////
   If you have a question about a function or class, select the name and hit F1 to see the documentation.
*/

// This turns on extra debugging information in the error reporting.
#define DEBUG

// This specifies directories to look in for icons and sounds.
#define FILE_DIR icons
#define FILE_DIR sounds

// These are the colors and the color names for liquids that can be mixed together.
#define RED           1
#define GREEN         2
#define BLUE          4
#define YELLOW        RED|GREEN
#define MAGENTA       RED|BLUE
#define CYAN          GREEN|BLUE
#define WHITE         RED|GREEN|BLUE
#define BLOOD         8
#define RED_BLOOD     RED|BLOOD
#define BLUE_BLOOD    BLUE|BLOOD
#define MAGENTA_BLOOD MAGENTA|BLOOD
#define OTHER_BLOOD   WHITE|BLOOD

#define RED_NAME      	   "red"
#define GREEN_NAME    	   "green"
#define BLUE_NAME     	   "blue"
#define YELLOW_NAME   	   "yellow"
#define MAGENTA_NAME       "purple"
#define CYAN_NAME          "blue-green"
#define WHITE_NAME         "white"
#define BLOOD_NAME         "murky"
#define RED_BLOOD_NAME     "murky red"
#define BLUE_BLOOD_NAME    "murky blue"
#define MAGENTA_BLOOD_NAME "murky purple"
#define OTHER_BLOOD_NAME   "brown"

// This is the number of lerfs you have to kill to get Frobenius to show up.
#define NUM_LERFS     10


///////////////////////////////////////////////////////////////////////////////////////////////////
// WORLD //
///////////
// The world is a special object that determines the default mob and turf and such.
// Unlike other objects, you can't add attributes or procs to the world; you can only
// use those that already exist.
// Try selecting the word world and hitting F1 to see the documentation for it.
world
	name = "Two Steps BYOND"
	mob = /mob/pc				// By default, players entering the world will take the form of a /mob/pc.
	turf = /turf/void			// If a turf has not been set to something, it will be /turf/void.
	view = 10					// Size of the visible map area.
	map_format = TOPDOWN_MAP	// Allows for multitile objects to actually take up multiple tiles.

///////////////////////////////////////////////////////////////////////////////////////////////////
// AREA //
//////////
// areas are collections of turfs that you want to treat as a unit.
// An area could be a room, or a whole map, or a single turf, depending on your needs.
// This provides the default definition for an area.  Other area types are built on this.
// areas can be created programmatically, but are typically laid out in the map editor.
area
	icon = 'floor.dmi'			// The default icon used for area turfs.

	/* tmp variables are variables that should not be put in a savefile if this object gets saved.
	   Unless a variable has a specific reason to be saved in a file, you should make it tmp.
	   This game doesn't use savefiles right now, but it's best to get in the habit. */
	var/tmp/sound = 'castle.mid'

	Entered(O)
		// The object O has entered this area. If it's a player, do special stuff.
		if (istype(O, /mob/pc))
			/* The entering object is a player mob -- we assign the generic O to a /mob/pc variable
			   called player so the compiler knows what functions we can call for this. */
			var/mob/pc/player = O

			// If the area has a description and/or a sound, use them.
			if (desc)
				/* src is how this object can refer to itself.  This displays the name of the object.
				   The << output operator sends the text to the player. */
				player << "You enter [src]."
				player << desc

			/* Further down in the code we've added a sound attribute to mobs,
			   to store the area midi sound they are currently listening to.
			   In this case, don't play this area's sound unless it's different
			   from they one they are already listening to. */
			if (sound != player.sound)
				player.sound = sound

				/* To repeat a sound, you pass 1 in the sound function.
				   For code clarity, here we create a clearly-named variable and set it to 1,
				   but it could also be called as sound(sound, 1). */
				var/repeatSound = 1
				/* Byond can play multiple sounds at the same time by using what's called
					Channels. Normally, you don't hafta supply what channel to send the sound
					to, BYOND will find an empty one for you. Sometimes, like here with looping
					music, you'll want the previous song/sound to stop when you send a new song
					to a player. We can automatically stop a looping track by sending a new
					song to the same channel as the last one was playing on (channel 2). - TMDI */
				var/musicChannel = 2

				player << sound(sound, repeatSound, channel = musicChannel)


///////////////////////////////////////////////////////////////////////////////////////////////////
// TURF //
//////////
// Turfs are individual spots on the map.  Areas are composed of turfs.
// This is the default turf, as specified in the world object, used
// whenever a turf type has not been specified.
// It's both dense (you can't move into it) and opaque (you can't see throught it) - TMDI
turf/void
	name = "nothing"
	icon = 'void.dmi'
	opacity = TRUE
	density = TRUE


///////////////////////////////////////////////////////////////////////////////////////////////////
// ATOM //
//////////
// The parent class for anything that can show on the map. Let anything visible be bumpable.
atom
	proc/Bumped(mob/M)
		// Subclasses need to implement this if they want to do something when bumped.
		return

	proc/Extinguish()
		// What happens when water is poured on this object. By default, nothing.
		return

///////////////////////////////////////////////////////////////////////////////////////////////////
// MOB //
/////////
// mob is short for 'mobile object', a traditional MUD term.
// It typically means any living (or undead!) being in your game that can move
// around and display some form of intelligent behavior.
mob
	var/tmp
		has_hands = 1	// If they have hands, they can hold stuff.
		wielded			// The weapon currently being wielded.
		sound			// The midi song the player is currently listening to.
		aura			// from the potion
		magic			// casting a spell


	Bump(atom/obstacle)
		// When a mob bumps into something, give the bumpee a chance to react.
		obstacle.Bumped(src)

	verb
		// Verbs are commands that players can type in.
		say(msg as text)
			/* For documentation on what "msg as text" means, select the word 'verb',
			   hit F1, and read the information on verb arguments. */
			src << "You say, \"[msg]\""
			oview(src) << "[src] says, \"[msg]\""

	proc
		ObjectDropped(O)
			/* An object has been dropped within sight of this mob.
			   For mob subclasses to handle if they wish. */
			return

		Receive(obj/O)
			/* Someone is giving me something.
			   For mob subclasses to handle if they wish. By default, don't accept. */
			return 0


///////////////////////////////////////////////////////////////////////////////////////////////////
// PLAYER //
////////////
// Above, world.mob is set to mob/pc, so players logging in will be this class.
mob/pc
	icon = 'pc.dmi'
	var/tmp/finished = 0	 	// quest complete!

	Login()

		/* 	This next command will use winset (move your cursor over the word
			winset and press F1 for more info on it) to make the map control
			(where the player's character and the all the walls, floors, etc.
			are displayed) draw all the icons it uses at exactly 32 pixels wide
			by 32 pixels high. If we didn't call this command, the icons would
			be stretched or shrunk to fit the screen of whatever resolution the
			player's monitor is at when they run the game.
		*/
		winset(src,"map","icon-size=32")

		/* The player is logging in. Start by displaying some introductory text.
		   src refers to the object whose function we're currently in.
		   In this case, the player's mob.

		   We can use HTML tags for formatting. However, quotation marks within
		   the HTML formatting (") have to be escaped with the \ character, such
		   as \"my text\". */
		src << "<H1><font color=\"blue\">You have taken...A Step BYOND!</font></H1>"
		src << "<B>This is a fun little game designed to teach you how to create worlds using the BYOND system.</B>"
		src << "<B>To download the fully commented source code for this game, <a href=\"http://www.deadron.com/Admin/StepBeyond.zip\">click here</a>.</B>"
		src << "<BR><BR>"

		/* Make sure they land in the right area when they arrive,
		   then let the superclass handle the rest of the login process.
		   ..() is how you call the superclass version of this method. */
		Move(locate(/area/entrance))
		return ..()

	say(msg as text)
		/* Adding to the mob say() verb to make a check for the player saying Frobenius
		   while they are magic.
		   First, let the mob superclass handle the actual saying, then make the check. */
		..()

		if(magic && findtext(msg,"Frobenius"))
			magic = 0
			var/old_loc = loc

			src << "The world fades from view..."
			Move(locate(/area/lerf_kingdom))

			/* Give them 50 seconds to try and kill Frobenius, then if they haven't killed
			   send a warning message.  After 10 more seconds bring them back. */
			sleep(500)
			if(!finished)
				src << "You feel the dream begin to fade..."
				sleep(100)
				if(!finished)
					src << "You drift back into reality."
					Move(old_loc)

	Entered(atom/movable/thing)
		// Something has been added to my contents (inventory), so update my inventory display.
		UpdateInventory()

	Exited(atom/movable/thing)
		// Something has been removed from my contents (inventory), so update my inventory display.
		UpdateInventory()

	proc/UpdateInventory()
		// The inventory has two columns: The first is used to indicate wielded items,
		// the second to display and name the item.
		var/item_count = 0

		// Set which cell in the inventory window to draw to, then output the item to it.
		winset(src, "inventory", "current-cell=1,1")
		src << output("Inventory\n(Right click an item for more options)", "inventory")

		// TODO: List wielded item first and give it special indicator.
		for(var/obj/O in src)
			item_count++

			// Set which cell in the inventory window to draw to, then output the item to it.
			winset(src, "inventory", "current-cell=[item_count+1],1")
			src << output(O, "inventory")

		// In case there was more inventory previously, set the number of cells so no old info is left at the bottom.
		winset(src, "inventory", "cells=[item_count+1]x1")

	proc
		Win()
			// Called by Frobenius when he is killed.
			if (!finished)
				finished = 1
				src << "You feel a great sense of relief. The dream fades..."
				spawn(50)
					src << "But wait, it wasn't a dream at all!"
					Move(locate(/turf/end))


///////////////////////////////////////////////////////////////////////////////////////////////////
// OBJECT //
////////////
// obj is the base class for objects.  Objects are items with a physical presence on the map
// that are not usually intelligent or mobile.  So a jug is an object, an ant is a mob.
// The code here adds some standard functionality to all objects in the game, such as the ability
// to drop or throw them.
obj
	// Verbs are commands that players can type in to manipulate this object.
	verb
		get()
			// The player has to be within one turf but not on top of the obj to use get() for it.
			set src in oview(1)

			/* usr is always set to the last player who did something.
			   So in a verb, it would be the player who typed in the verb.
			   Moving to the usr adds the obj to the player's contents list,
			   which is their inventory. */
			if(Move(usr))
				usr << "You get [src]."
			else
				usr << "You are unable to get [src]."


		drop()
			// Move to the turf the player is standing on.
			if(Move(usr.loc))
				usr << "You drop [src]."
			else
				usr << "You are unable to drop [src]."

			/* Give anyone who sees this being dropped a chance to react.
			   This is here to allow rats go after cheese when they see it thrown.
			   The for(item in list) syntax iterates through each item of the specified type in
			   the specified list. In this case, the list is everyone else in view of this object.
			   src is how this object refers to itself. */
			var/mob/witness
			for (witness in oview())
				witness.ObjectDropped(src)

		throw()
			/* If the player throws the object, skip the object across the floor.
			   First move to the player's turf. */
			if(Move(usr.loc))
				// Find the next turf in the direction the player is facing.
				var/turf/T
				T = get_step(src, usr.dir)

				// If the next turf is not dense (a wall), sleep for 1 tick and move to it.
				if(!T.density)
					sleep(1)
					if(Move(T))
						// Do the steps again to skip one more time.
						T = get_step(src, usr.dir)
						if(!T.density)
							sleep(1)
							Move(T)

					usr << "You throw [src]."
					oview() << "[usr] throws [src]."
				else
					// We hit a wall, so just stop here.
					usr << "You throw [src] to the ground."
					oview() << "[usr] throws [src] to the ground."

				// Give anyone who sees this being dropped a chance to react.
				var/mob/witness
				for (witness in oview())
					witness.ObjectDropped(src)
			else
				usr << "You are unable to throw [src]."

		give(mob/receiver as mob in oview(1))
			/* The player specifies a receiving mob to give this object to.
			   For documentation on what "mob/receiver as mob in oview(1)" means,
			   select the word 'verb', hit F1, and read the information on verb arguments.
			   If the receiving mob doesn't have hands, drop this on the ground. */
			if(!receiver.has_hands)
				if (Move(receiver.loc))
					usr << text("You drop [src] to the ground.")

			/* The receiver has hands so see if they want to receive me and try to move to them.
			   mob.receive() is a mob function defined above. */
			else if(receiver.Receive(src) && Move(receiver))
				usr << "You give [src] to [receiver]."
				receiver << "[usr] gives [src] to you."
			else usr << "[receiver] doesn't want [src]."


///////////////////////////////////////////////////////////////////////////////////////////////////
// SCROLL //
////////////
// There are a number of scrolls in the game.
// This defines the scroll look & behavior, so scroll subclasses only need to specify a description
// which makes up the scroll text.
obj/scroll
	name = "scroll"
	icon = 'scroll.dmi'

	verb
		read()
			// Using HTML coding here to make the message stand out.
			usr << "<BR><BR><B>[desc]</B><BR>"


///////////////////////////////////////////////////////////////////////////////////////////////////
// ENTRANCE //
//////////////
// Here are the various pieces used in the starting area for the player.
// The areas and turfs are laid out in the map editor.  Open map.dmm to
// see the map. Use the Help->General menu item to see documentation for the
// map editor.
area/entrance
	name = "hallway"
	desc = "A large rat lurks nearby..."
	icon = 'areas.dmi'
	icon_state = "entrance"

turf/wall
	icon = 'wall.dmi'
	density = 1		// This is dense -- it can't be moved through.
	opacity = 1		// This is opaque -- you can't see through it.

turf/floor
	name = "floor"
	icon = 'floor.dmi'
	opacity = FALSE		//you can also set these using TRUE and FALSE (called boolean values)
	density = FALSE		// which correspond to 1 and 0 respectively and
						// (essentially) are the same as 1 and 0
						//By default all turfs are opacity = 0, density = 0
						// but they're set here to show you how it can be done - TMDI
turf/arch
	icon = 'arch.dmi' 	// a doorway -- density = 0 by default, so you can move through it

	//!but, since a mob can move through it, we hafta be careful here. The archway is supposedly
	//	above the player, so -> if a player moves through it we'll hafta make it look like
	//	they're moving _UNDER_ it. We can do this by drawing the floor on the normal level
	//	and having the arch drawn on a layer above the mobs. Then the map will automatically
	//	draw the mobs in between the two and the mobs will look like they're moveing under the
	//	arch to player.

	icon_state = "floor"	//this will be the floor drawn on the normal turf layer below mobs
	New()
		//this is a procedure ('proc') DM uses to initialize any new atom (or datum)
		//	it's called by the system whenever something is created, so we'll use it to
		//	set up the arch pic
		.=..()								//this line makes sure everything else about this turf
											//	is set up correctly
		var/image/archImage = new/image( 'arch.dmi' )	//create a new image from the arch icon
		archImage.icon_state = "arch"		//grab the arch 'frame' from the icon file
		archImage.layer = MOB_LAYER + 1		//here we'll make the arch layer one ABOVE the mobs
		archImage.pixel_y += 6				//we'll move it up/north just a bit so it fits in with the rest
		src.overlays += archImage			//then we'll add the new image to the turf's (src)
											//	overlays list (which is like a list that holds
											//	extra pictures you can put OVER your icons


obj/scroll/intro
	desc = "The lerfs have our city in a trance. You are our only hope!<BR>\
	        Enter the lerf realm through a dream portal and slay their king, Frobenius.<BR>\
	        Only then will we be free..."

mob/rat
	name = "giant rat"
	icon = 'rat.dmi'
	desc = "This is one HUGE rat!"
	has_hands = 0

	Bumped(mob/M)
		view(src) << "The giant rat defends its territory ferociously!"
		dir = turn(M.dir,180)
		flick('rat_fight.dmi', src)

	ObjectDropped(O)
		/* If the rat sees cheese dropped, it goes for the cheese.
		   The walk_towards() function stays in effect until another walk-related function
		   is called, so this means if the player then picks up the cheese and walks away,
		   the rat will automatically follow the cheese. */
		if (istype(O, /obj/cheese))
			view(O) << "The giant rat scurries towards the cheese!"
			walk_towards(src, O)


///////////////////////////////////////////////////////////////////////////////////////////////////
// STORAGE ROOM //
//////////////////
area/storage_room
	name = "storage room"
	desc = "Various objects are scattered about this room."

/* The door is handled here using two kinds of turfs, one open and one closed.
   The door could also be treated as one obj or turf with different states, so this is
   just to demonstrate how you can replace turfs at runtime. When the open door is
   closed, the turf/door/open object is replaced by a turf/door/closed object. */
turf/door
	name = "door"

turf/door/open
	icon = 'open_door.dmi'

	verb
		close()
			// set src defines where a player has to be to use this verb.
			// In this case, the player must be within one square of this door.
			set src in view(1)

			// flick() plays an animation once at the specified location.
			// Using src for the location means "play the animation at the location of me (the door)".
			flick('closing_door.dmi', src)

			// This sends the sound 'door.wav' to everyone in view of the door at 50% of it's normal volume.
			view() << sound( 'door.wav', volume = 50 )

			// This creates a new closed door turf at this location, replacing this open door turf.
			new /turf/door/closed(src)


turf/door/closed
	icon = 'closed_door.dmi'
	opacity = 1		// Can't see things on the other side of the door.
	density = 1		// The door is solid -- you can't move through it.

	Click()
		if (get_dist(usr, src) < 2)
			open()

	Enter(O)
		// If a player tries to enter the closed door, be nice and open it for them.
		if (istype(O, /mob/pc))
			// On someone entering this closed door turf, automatically open the door.
			open()
			// And let them enter.
			return 1

		// Otherwise don't let this non-player enter.
		return 0

	verb
		open()
			set src in view(1)
			flick('opening_door.dmi',src)
			view() << sound( 'door.wav', volume = 50 )
			new /turf/door/open(src)


//more window dressing - TMDI
turf/table
	name = "table"
	icon = 'table.dmi'
	opacity = FALSE
	density = TRUE


obj/cheese
	icon = 'cheese.dmi'
	desc = "Yuck. This cheese is pretty moldy."

	verb
		eat()
			usr << "You nibble the cheese a bit."


obj/jug
	icon = 'jug.dmi'
	desc = "This sturdy jug would be perfect for storing a tasty beverage."
	var/obj/liquid/Liquid	// The liquid contained in this jug.

	proc
		mix(obj/liquid/new_liquid)
			/* If there is already liquid in the jug, mix the new liquid with it.
			   Otherwise, fill the empty jug with this liquid and add verbs for drinking and pouring it. */
			var/new_color
			if (Liquid)
				if (Liquid.color == new_liquid.color)
					usr << "You pour out some [Liquid.color_name] liquid and replace it with another batch of [Liquid.color_name] liquid."
					return

				new_color = Liquid.color | new_liquid.color
				var/color_type
				switch(new_color)
					if(RED)				color_type = /obj/liquid/red
					if(GREEN)			color_type = /obj/liquid/green
					if(BLUE)			color_type = /obj/liquid/blue
					if(YELLOW)			color_type = /obj/liquid/yellow
					if(MAGENTA)			color_type = /obj/liquid/magenta
					if(CYAN)			color_type = /obj/liquid/cyan
					if(WHITE)			color_type = /obj/liquid/white
					if(BLOOD)			color_type = /obj/liquid/blood
					if(RED_BLOOD)		color_type = /obj/liquid/blood/red
					if(BLUE_BLOOD)		color_type = /obj/liquid/blood/blue
					if(MAGENTA_BLOOD)	color_type = /obj/liquid/blood/magenta
					else				color_type = /obj/liquid/blood/other
				Liquid = new color_type()
				usr << "The liquid in the jug turns [Liquid.color_name]"
			else
				// Create a new copy of the liquid here, otherwise we take part of the pool with us.
				var/color_type = new_liquid.type
				Liquid = new color_type()

				/* The verbs for an object are treated as a list, and you can add and remove
				   procs/verbs at runtime. In this case, we only add the drink/pour procs as verbs
				   when there is liquid in the jug. */
				verbs += /obj/jug/proc/drink
				verbs += /obj/jug/proc/pour
			suffix = " ([Liquid.color_name])"
			icon_state = Liquid.color_name


		/* drink() and pour() are procs that are installed by mix() as verbs
		   whenever the jug contains liquid. */
		drink()
			set desc = "() Drink the contents."

			usr << "You gulp down [Liquid]."
			Liquid.drink()
			Liquid = null

			verbs -= /obj/jug/proc/drink
			verbs -= /obj/jug/proc/pour
			suffix = ""
			icon_state = ""


		pour(O as null|turf|obj|mob in view(1))
			set desc = "(target) Pour contents onto something."

			if(!O) O = usr.loc
			usr << "You pour [Liquid] on [O]."

			// If the pour proc returns a value, then the liquid was successfully poured out.
			var/success = Liquid.pour(O)
			if (success)
				Liquid = null
				verbs -= /obj/jug/proc/drink
				verbs -= /obj/jug/proc/pour
				suffix = ""
				icon_state = ""


///////////////////////////////////////////////////////////////////////////////////////////////////
// CHAMBER OF LIGHT //
//////////////////////
area/pool_room
	name = "chamber of light"
	desc = "This room contains three mesmerizing pools of \"liquid-light.\""
	icon = 'areas.dmi'
	icon_state = "lights"

	Entered( var/atom/a )
		.=..(a)

		if( istype( a, /mob/pc ) )
			var/mob/pc = a

			//this is the fountain bubbly sound the player will hear when walking (entering)
			//	this area
			//there are a lot of vars you can manipulate in the sound datum
			//	highlight the word sound and press F1 for more info
			var/sound/fountainSound = new()
			fountainSound.file = 'fountain.wav'
			fountainSound.repeat = TRUE
			fountainSound.volume = 25
			fountainSound.channel = 8
			pc << fountainSound


	Exited( var/atom/a )
		.=..()

		if( istype( a, /mob/pc ) )
			var/mob/pc = a
			pc << sound( file=null, channel=8 )


obj/liquid
	var
		aura
		color
		color_name

	desc = "The liquid swirls about pleasantly, illuminating the room with waves of light."

	get()
		set src in oview(1)
		var/obj/jug/container
		for(container in usr.contents)
			usr << "You scoop up some of [src] into [container]."
			container.mix(src)
			return
		usr << "You'll need a container to hold [src]."

	proc
		drink()
			if(!usr.aura)
				usr << "You are suddenly enveloped by a [color_name] aura!"
				usr.aura = aura

				/* We'll add a visible aura to the player character by using an image.
					Images are a powerful means of adding pictures to just one client's (player's)
					map screen.
				   We do this by creating a new image object with an icon
					(in this case, usr.aura), a location or loc (this is what the image
					is attached to, in this case the usr - you can think of the image
					as a sticker and the loc is what we'll stick it on) and a layer
					(here, we want it under the player character, so we'll use MOB_LAYER
					and subtract one to move it below the player mob)
				   Then we hafta output the image to those we want to see it. In this
				 	case, only the player, so, we'll use the output operator (<<) to
				 	'send' the image to the player (sort of like text output)
				*/
				var/image/aura_image = new/image(usr.aura, usr, layer = MOB_LAYER - 1)
				usr << aura_image
				usr.suffix = " ([color_name] aura)"

				//after a while...
				spawn(100)
					usr << "The [color_name] aura fades away"
					del(aura_image)			//..we'll delete the aura image
					usr.aura = null
					usr.suffix = 0

		pour(atom/O)
			// Returning 1 means the liquid was poured out successfully.
			O.Extinguish()
			return 1

// pools
turf/red_fountain
	name = "pool of liquid, red light"
	icon = 'red_fountain.png'
	opacity = FALSE
	density = FALSE

	fountainhead
		name = "red fountain"
		icon = 'red_pool.dmi'
		opacity = FALSE
		density = TRUE

	fountainhead/wall
		opacity = TRUE
		icon_state = "fountain center"


turf/green_fountain
	name = "pool of liquid, green light"
	icon = 'green_fountain.png'
	opacity = FALSE
	density = FALSE

	fountainhead
		name = "green fountain"
		icon = 'green_pool.dmi'
		opacity = FALSE
		density = TRUE

	fountainhead/wall
		opacity = TRUE
		icon_state = "fountain center"


turf/blue_fountain
	name = "pool of liquid, blue light"
	icon = 'blue_fountain.png'
	opacity = FALSE
	density = FALSE


//the statue - a gigantic red herring!
turf/statue
	name = "a statue with glowing eyes - impressive, but probably insignificant"
	icon = 'statue.png'
	opacity = FALSE
	density = FALSE


//the liquid light
obj/liquid/red
	name = "red liquid"
	density = TRUE
	aura = 'red_aura.dmi'
	color = RED
	color_name = RED_NAME

obj/liquid/blue
	name = "blue liquid"
	aura = 'blue_aura.dmi'
	density = TRUE
	color = BLUE
	color_name = BLUE_NAME

obj/liquid/green
	name = "green liquid"
	aura = 'green_aura.dmi'
	density = TRUE
	color = GREEN
	color_name = GREEN_NAME

// mixes
obj/liquid/yellow
	name = "yellow liquid"
	aura = 'yellow_aura.dmi'
	color = YELLOW
	color_name = YELLOW_NAME

obj/liquid/magenta
	name = "purple liquid"
	aura = 'magenta_aura.dmi'
	color = MAGENTA
	color_name = MAGENTA_NAME

obj/liquid/cyan
	name = "blue-green liquid"
	aura = 'cyan_aura.dmi'
	color = CYAN
	color_name = CYAN_NAME

obj/liquid/white
	name = "white liquid"
	aura = 'white_aura.dmi'
	color = WHITE
	color_name = WHITE_NAME

// rat guts . . yech
obj/liquid/blood
	name = "rat guts"
	icon = 'rat_corpse.dmi'
	color = BLOOD
	color_name = BLOOD_NAME

	drink()
		usr << "Yecch!	You vomit uncontrollably!"
		view() << 'puke.wav'

	pour()
		// Overrides the pour function so that nothing happens when you pour blood.
		// Returning 0 means the pouring failed.
		usr << "Hmm the rat guts seem to be sticking to the jug."
		return 0

obj/liquid/blood/red
	name = "murky red liquid"
	color = RED_BLOOD
	color_name = RED_BLOOD_NAME

obj/liquid/blood/blue
	name = "murky blue liquid"
	color = BLUE_BLOOD
	color_name = BLUE_BLOOD_NAME

obj/liquid/blood/other
	name = "brown liquid"
	color = OTHER_BLOOD
	color_name = OTHER_BLOOD_NAME

// magical lerf potion
obj/liquid/blood/magenta
	name = "murky purple liquid"
	color = MAGENTA_BLOOD
	color_name = MAGENTA_BLOOD_NAME

	drink()
		/* When the player drinks this potion, give them magic for 10 seconds.
		   Either spawn() or sleep() could be used for the 10 second countdown.
		   sleep() is used when you simply want to wait before executing the rest of the function.
		   spawn() is used when you just need to execute a section of code after the delay. */
		usr << "Yecch!	You have to force yourself to hold it down!"
		usr.magic = 1
		spawn(100) usr.magic = 0


///////////////////////////////////////////////////////////////////////////////////////////////////
// MOUTH ROOM //
////////////////
area/mouth_room
	name = "mouth room"
	desc = "A giant mouth guards one exit to this otherwise empty room."
	icon = 'areas.dmi'
	icon_state = "mouth"


	//If the rat is one of the atoms (in the rat's case an atom of type mob) that enters this
	//	area, we'll have the mouth acknowledge it's presence and give the player a clue
	Entered( var/atom/a )
		//only the base atom type enters an area
		.=..()
		//we'll see if the atom is a mob of type rat
		if( istype( a, /mob/rat ) )
			//and display the clue
			src.contents << ( "The giant mouth eyes the rat and licks it's lips" )

mob/mouth
	name = "cavernous mouth"
	icon = 'mouth.dmi'
	desc = "A large mouth guards the exit."
	opacity = TRUE
	has_hands = 0
	var/fed

	Bumped( atom/a )

		if( istype( a, /mob ) )
			var/mob/M = a

			if(fed)
				//this'll allow another mob to move into where the mouth was
				M.loc = loc

			else if(istype(M, /mob/rat))
				icon_state = "open"
				view(src) << "[src] devours [M]!"
				del(M)

				//a lot of this uses sleep to make sure things are timed right
				icon_state = "chewing"
				sleep(10)
				view(src) << "[src] emits disgusting crunching noises as it chews its prey!"
				sleep(10)
				flick("burp",src)
				view(src) << "[src] spits out the bloody remains!"
				view(src) << 'burp.wav'

				//create the rat corpse and move in front of the mouth
				var/obj/liquid/blood/remains = new(loc)
				remains.density = FALSE
				remains.Move(locate(x,y-1,z),SOUTH)

				fed = 1
				sleep(12)
				flick("opening door",src)
				sleep(8)
				opacity = FALSE
				sleep(3)
				icon = null

			else
				flick("not until you feed me",src)
				say("Not until you FEED ME!")


	ObjectDropped(O)
		//we can't allow the cheese without the rat (or any other object)
		//  to be 'held' by the mouth (since the they won't open the mouth),
		//  so we'll need to spit it back out again

		if( istype( O, /obj ) )
			var/obj/o = O

			if( o.loc == src.loc )

				if( istype( o, /obj/cheese ) )
					sleep( 5 )
					icon_state = "chewing"
					view(src) << "[src] tastes the cheese!"
					//we'll hold the cheese a bit longer, so the rat can chase it
					sleep(20)
					view(src) << "It would seem the mouth is lactose intolerant!"

				else
					icon_state = "chewing"
					sleep(10)
					view( src ) << "The mouth spits [o.name] back out"

				flick( "spit", src )
				icon_state = ""

				//we need objs spit out from the mouth to be above the mouth icon,
				//	so, we'll bump up their layer while they're 'flying' and restore
				//	them after they've landed
				var/oldLayer = o.layer
				o.layer = MOB_LAYER + 1
				sleep(1)
				o.Move(locate(x,y-2,z),SOUTH)
				sleep(5)
				o.layer = oldLayer


///////////////////////////////////////////////////////////////////////////////////////////////////
// HALL OF SHADOWS //
/////////////////////
area/shadow_room
	name = "hall of shadows"
	luminosity = 0		// This makes the room dark.
	desc = "Twin hearths occupy this ominous room"

/*
   ICONS
   The hearth makes use of several features of BYOND icons.
   Even though many individual icons are used to handle everything
   related to the hearth, they are all stored in one .dmi file, hearth.dmi.
   If you open that file you will see two pairs of icons: two icons for a
   lit hearth and two for an unlit hearth. If you double-click on the unlit hearth,
   you will find that it is in reality four versions of the same icon, one facing
   in each direction that a hearth might be pointed.
   You can supply more or fewer directions for an icon by
   setting the Dirs popup in the icon editor.  If the object or mob moves around,
   the icon directions will be used automatically.  If you want to specify the
   icon direction, you can set the dir attribute programmatically, or you can use
   the mapper's instance editor to set it.  (Use the Help->General menu item to
   see the mapper documentation.)

   The icon for the lit hearth has the word "lit" under it.  The name indicates an icon state.
   The lit hearth icon will be used whenever the object's icon_state is set to "lit".
   If you open the lit hearth icon, you will see it is actually four little movies showing
   a hearth with fire in each of the four directions.

*/
turf/hearth
	icon = 'hearth.dmi'

	density = 1
	opacity = 1
	luminosity = 1		// This causes the object to emit light.
	name = "hearth"

	icon_state = "lit"	// The icon state of the object sets the icon_state for its icon.
						// Our icon has two states: "" (default, which is unlit) and "lit".

	Extinguish()
		if (luminosity)
			usr << "You extinguish [src]!"
			oview() << "[usr] extinguishes [src]!"

			// Stop giving off light and set icon to default unlit state.
			luminosity = 0
			icon_state = ""


mob/thief
	icon = 'thief.dmi'
	desc = "This shady character skulks about in the corner."

	New()
		..()
		new /obj/lerfblade(src)

	Bumped(mob/M)

		// See if I have a lerfblade in my possession to trade.
		// for(blade in contents) looks for a lerfblade in the thief's contents.
		var/obj/lerfblade/blade
		for(blade in contents)
			say("I'll trade you this beautiful sword for a chest 'o gold.")
			view() << "[src] displays [blade]."
			flick( "show the sword", src )
			return
		M << "[src] glares at you."
		say("I have nothing more to trade.")

	Receive(obj/O)
		if(istype(O,/obj/chest))
			spawn(5)
				usr << "[src] looks pleased with [O]."
				for(O in src)
					if(istype(O,/obj/lerfblade))
						usr << "[src] hands you [O]."
						O.Move(usr)
						break
			return 1
		else return 0


obj/lerfblade
	name = "lerf blade"
	icon = 'sword.dmi'
	desc = "Inscribed on the hilt is the message:<BR>\
	        Upon humans, refrain!<BR>\
	        Upon lerfs, twice the pain!"

	verb
		wield()
			usr << "You wield [src]."
			usr << "You are suddenly consumed by an overwhelming hatred for little purple people!"
			suffix =" (wielded)"
			usr.wielded = src
			usr.icon_state = "with sword"	//TMDI

		remove()
			usr << "You remove [src]."
			suffix = null
			usr.wielded = null
			usr.icon_state = ""	//TMDI

	//if we throw or drop the blade, we'll need to chenge a few things then, too.
	throw()
		.=..()
		suffix = null
		usr.wielded = null
		usr.icon_state = ""

	drop()
		.=..()
		suffix = null
		usr.wielded = null
		usr.icon_state = ""


	proc
		move_to_ground()
			suffix = null
			usr.wielded = null
			usr.icon_state = ""


///////////////////////////////////////////////////////////////////////////////////////////////////
// HALL OF EVIL //
//////////////////
area/evil_room
	name = "hall of evil"
	desc = "Something seems altogether wrong about this place..."


mob/witch
	icon = 'witch.dmi'
	desc = "You don't want to mess with this nasty witch!"

	Bumped(mob/M)
		view() << "[src] casts forth a bolt of lightning!"
		dir = turn(M.dir,180)
		flick('witch_fight.dmi', src)
		sleep(3)
		view(src) << 'arc.wav'


	Extinguish()
		view() << "[src] screams, \"I'm meeeeelting!\""
		view() << 'melting.ogg'
		flick("melting",src)
		sleep(48)

		// Place the scroll where the witch was -- loc is the object's location, in this case the turf.
		new /obj/scroll/magic(loc)
		del(src)


obj/scroll/magic
	name = "Witch's Scroll"
	desc = "Upon the scroll is written the following:<BR>\
	        Lerf Dream (be careful!):<BR>\
	        1 part purple mixture<BR>\
	        1k part innards of rat<BR>\
	        Drink quickly and utter the name of the lerf king."



///////////////////////////////////////////////////////////////////////////////////////////////////
// HALL OF LIGHT //
///////////////////
area/light_room
	name = "hall of light"
	desc = "A large wall surrounds a barrier of light."

/* These light trigger turfs are the archways the player must pass through before reaching
   the treasure.  The secret here is that each lightway puts up a different colored light wall
   around the treasure when the player passes through the arch. */
turf/light_trigger
	var/aura
	icon = 'arch.dmi'

	New()
		.=..()

		//This is the same thing happening in turf/arch
		//	(see turf/arch in the entrance area above for more details on this)
		var/image/archImage = new/image( 'arch.dmi' )
		archImage.icon_state = "arch"
		archImage.layer = MOB_LAYER + 1
		archImage.pixel_y += 6
		src.overlays += archImage


	Entered(O)
		// If a player enters, find the light wall area and set its icon to my aura icon.
		if (istype(O, /mob/pc))
			var/area/A
			A = locate(/area/light_wall)

			A.icon = aura
			A.layer = MOB_LAYER - 1
			usr	<< "You hear a buzzing sound"
			view() << sound( 'buzz.wav', volume = 25 )



turf/light_trigger/red
	aura = 'red_aura.dmi'
turf/light_trigger/green
	aura = 'green_aura.dmi'
turf/light_trigger/blue
	aura = 'blue_aura.dmi'
turf/light_trigger/yellow
	aura = 'yellow_aura.dmi'
turf/light_trigger/magenta
	aura = 'magenta_aura.dmi'
turf/light_trigger/cyan
	aura = 'cyan_aura.dmi'
turf/light_trigger/white
	aura = 'white_aura.dmi'


area/light_wall
	name = "wall of light"
	icon_state = "wall"

	Enter(O)
		/* Enter() is called when something is trying to enter.
		   Entry is only allowed if Enter() returns 1.
		   In this case, a player can only enter if they have the correct aura,
		   which they get by walking through the correct archway. */
		if (istype(O, /mob/pc))
			var/mob/pc/player = O

			if(player.aura == icon)
				player << "Your mystical aura cuts through [src]."
				return 1
			else
				player << "You are unable to penetrate [src]."
				return 0
		return 0

obj/chest
	icon = 'chest.dmi'
	desc = "This chest is packed with gold!"




///////////////////////////////////////////////////////////////////////////////////////////////////
// LERF KINGDOM //
//////////////////
area/lerf_kingdom
	name = "lerf kingdom"
	icon = 'grass.dmi'
	sound = 'lerf.mid'
	desc = "The cheerfulness of this place sickens you."

turf/grass
	icon = 'grass.dmi'
	name = "grass"

turf/hill
	icon = 'hills.dmi'
	opacity = FALSE
	density = 1

turf/tree
	icon = 'forest.dmi'
	name = "a happy tree"
	icon_state = "left"
	density = TRUE

obj/barrel
	name = "lerf hut"
	icon = 'barrel.dmi'

	get()
		usr << "The barrel is too heavy to get!"
		return

mob/lerf
	var
		dead
		death_icon

	var/global
		list/barrel_list
		lerf_count = 0

	Bumped(mob/M)
		if(dead) return

		dir = turn(M.dir,180)
		if(usr.wielded && istype(usr.wielded, /obj/lerfblade))
			flick( "striking", M )
			M << "You madly slice your blade through [src]!"
			view() << 'ow.wav'
			walk(src, 0)
			dead = 1
			flick( death_icon, src )
			spawn(15)					//TMDI - from 8
				del(src)
				return

			if (!barrel_list)
				barrel_list = new()
				var/area/kingdom = locate(/area/lerf_kingdom)
				var/obj/barrel/Barrel
				for(Barrel in kingdom)
					barrel_list += Barrel

			if(lerf_count <= NUM_LERFS)
				var/obj/barrel
				barrel = barrel_list[rand(1,barrel_list.len)]
				if(lerf_count==NUM_LERFS) new /mob/lerf/Frobenius(barrel.loc)
				else new /mob/lerf/worker(barrel.loc)
				lerf_count++
		else
			usr << "You can't catch the slippery little devil with your bare hands!"


mob/lerf/worker
	name = "lerf worker"
	desc = "This annoying little purple critter bustles around the village."
	icon = 'lerf1.dmi'
	death_icon = 'lerf1_death.dmi'

	New()
		..()
		range(10, src) << "Another lerf pops out!"
		walk_rand(src,5)

mob/lerf/Frobenius
	desc = "This bearded fellow appears to be the leader of the village."
	icon = 'lerf2.dmi'
	death_icon = 'lerf2_death.dmi'

	New()
		..()
		range(10, src) << "[src] awakens from his slumber, looking very upset!"
		walk_rand(src,5)

	Bumped(mob/pc/player)
		// Let the lerf Bumped() proc do its thing.
		// If we're dead after that, this is player who has won.
		..()
		if (dead)
			player.Win()
		return


///////////////////////////////////////////////////////////////////////////////////////////////////
// OASIS //
///////////
area/end
	sound = 'smooth.mid'

turf/end
	// Due to how turfs are rendered in TOPDOWN_MAP, large turfs now have a precedence for layers.
	layer = OBJ_LAYER + 1

	Entered(O)
		O << "With the death of Frobenius, order is finally restored!"
		O << "Congratulations, [O]!	You are rewarded with an island paradise!"
		return 1

turf/oasis
	icon = 'oasis.dmi'

turf/ocean
	density = 1
	icon = 'ocean.dmi'

turf/palm_tree_1			//what? no corona?
	name = "palm tree"
	icon = 'palm 1.dmi'
	icon_state = "3"		//this is the frame of the icon with the trunk, we'll start here
	density = TRUE
	layer = OBJ_LAYER

	New()
		.=..()

		//for us to do a multi-tiled icon for a tree, we'll use image overlays here
		//Overlays are like extra drawings you can attach to an atom - things like
		//	extra tiles for pictures larger than 32x32 pixels (like we're doing here)
		//	or other things like special effects (say you're mob was on fire! - you
		//	could add a fire overlay over the mob) or clothes, etc.
		//You can use icons, too, but one of the advantages of images is we can
		//	attach them to the turf and scoot them left, right, up, or down using
		//	the image's pixel_x and pixel_y variables.
		//You can also set an overlay's layer. We'll make the layer for these
		//	greater than the layer we draw mobs like the player on (MOB_LAYER), so that,
		//	when the player walks into the same spot the overlays are, the overlays
		//	will be drawn OVER the player and it'll look like the tree is between
		//	us and the player - pretty handy for things that you want to seem tall

		var/image/i = image( icon=icon, icon_state="1", layer=MOB_LAYER + 1 )
		i.pixel_y = 32		//place this added icon image directly ABOVE the main icon
		overlays += i

		//btw, the icon=icon part simply tells the image proc to use this turfs
		//	main icon ('palm 1.dmi') to pull these extra pictures from
		i = image( icon=icon, icon_state="2", layer=MOB_LAYER + 1 )
		i.pixel_y = 32		//this one will hafta go above and to right
		i.pixel_x = 32		//	so, we'll increase both the x AND the y
		overlays += i

		i = image( icon=icon, icon_state="4", layer=MOB_LAYER + 1 )
		i.pixel_x = 32		//and this hanging bit will go to the left of the main icon
		overlays += i


	palm_2_sand

		//here's the same palm on sandy ground
		icon = 'palm 1 sand.dmi'
		//We can do it here, too and, since this is a type of the palm tree
		//	above, we don't even hafta rewrite the code. That's a pretty nice
		//	side effect of using what's called an object oriented programming language
		//	like BYOND


turf/palm_tree_2
	name = "palm tree"
	icon = 'palm 2.dmi'
	icon_state = "4"
	density = TRUE
	layer = OBJ_LAYER

	//Since this tree is a mirror image (basically) of the other tree,
	//	we'll hafta write some new code to handle the difference (since this
	//	is a new type - or what's generally known as a class)
	New()
		.=..()

		var/image/i = image( icon=icon, icon_state="2", layer=MOB_LAYER + 1 )
		i.pixel_y = 32		//again, directly above
		overlays += i

		i = image( icon=icon, icon_state="1", layer=MOB_LAYER + 1 )
		i.pixel_y = 32		//this time above AND LEFT of the main icon
		i.pixel_x = -32
		overlays += i

		i = image( icon=icon, icon_state="3", layer=MOB_LAYER + 1 )
		i.pixel_x = -32		//and LEFT of the trunk for this hanging part
		overlays += i

	//palm_2_sand is the same tree on sandy ground, so we can use the code above
	//	by making it a 'derived type' (or 'child' class) of palm_tree_2 (the 'parent' class)
	//By doing that, palm_2_sand 'inherits' the code in New() and behaves just like
	//	palm_tree_2 (like we inherit genes from our parents and sometimes act like them - Arg!)
	palm_2_sand
		icon = 'palm 2 sand.dmi'


turf/waterfall

	//this is actually one big pic (about 5 tiles wide and 3 tiles high)
	//	placed directly on the map - it's pretty simple to do multi-tile pictures
	//	with turf atoms
	name = "waterfall"
	icon = 'waterfall.gif'
	density = TRUE
	layer = OBJ_LAYER

turf/spray

	name = "waterfall"
	icon = null		//we just want the spray for this turf (the image added
					//	to overlays below, so we set this turf's icon to null
					//  and, using the map editor, place it over the larger
					//	waterfall pic mentioned	above. The part of the pic we place
					// 	it over won't be erased. It'll automatically become part
					//	of this turf.
	layer = OBJ_LAYER + 1

	New()
		.=..()

		//here, we'll use images again to make a picture (an overlay)
		//	that's layered over	the main icon of this turf. -
		var/image/sprayImage = new( 'waterfall spray.dmi' )
		sprayImage.pixel_x = 8		//we'll also bump it over a bit
		overlays += sprayImage


//hey! a whole island can be a single turf and the map editor will even split that up right!
//	w00t. easy.
turf/island
	icon = 'island pic.png'