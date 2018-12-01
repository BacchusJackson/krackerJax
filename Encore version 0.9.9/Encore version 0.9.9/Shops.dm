mob/var/deposited_zenni=0
mob/Shop/var
	item1="Armbands"
	item2="Baggy Pants"
	item3="Bandana"
	item4="Boots"
	item5="Belt"
	item6="Belt2"
	item7="Cape"
	item8="Cape2"
	item9="Eye Patch"
	item10="Flowing Cape"
	item11="GiBottom"
	item12="GiTop"
	item13="Gloves"
	item14="Half Mask"
	item15="Headband"
	item16="Hood"
	item17="Jacket"
	item18="KaioSuit"
	item19="LabCoat"
	item20="Legbands"
	item21="LongSleeveShirt"
	item22="Mask1"
	item23="Mask2"
	item24="Mask3"
	item25="Mask4"
	item26="Mask5"
	item27="MimiShirt"
	item28="NamekianScarf"
	item29="Necklace"
	item30="Necklace2"
	item31="Pants"
	item32="Ripped Bandana"
	item33="Saibaman Seed"
	item34="SamuraiHat1"
	item35="SamuraiHat2"
	item36="Sash"
	item37="Shades"
	item38="Shoes"
	item39="ShortSleeveShirt"
	item40="Suit"
	item41="Tanktop"
	item42="Tipped Boots"
	item43="Trenchcoat"
	item44="Tuffle Suit"
	item45="Turban"
	item46="WaisRobe"
	item47="Wristband"
mob/var/tmp/interest
	interest=0.5
mob/Shop
	icon='Base Tan Male.dmi'
	verb/Talk()
		set category=null
		set src in oview(1)
		switch(input("What are you here to do?", "", text) in list ("Nothing","Shop","Bank","Barber","Eye Doctor"))
			if("Eye Doctor")
				usr.Eyes()
			if("Barber")
				usr.overlays-=usr.hair
				usr.Hair()
			if("Bank")
				usr<<"You currently have [usr.deposited_zenni] zenni in your account."
				switch(input("What would you like to do today?", "",text) in list("Nothing","Deposit","Withdraw"))
					if("Deposit")
						var/amount=input("How much would you like to deposit?") as num
						if(amount>usr.zenni) alert("You cannot put in more money than you have.")
						else if(amount<1) alert("You must put atleast 1 zenni in the bank.")
						else
							if(amount>usr.zenni) amount=usr.zenni
							alert("You have deposited [amount] zenni in the bank.")
							usr.deposited_zenni+=amount
							usr.zenni-=amount
					if("Withdraw")
						var/amount=input("How much would you like to withdraw? You currently have [usr.deposited_zenni] zenni in your account.") as num
						if(amount>usr.deposited_zenni) alert("You cannot take out more than you have in your account.")
						else if(amount<0) alert("You must atleast take out 0 zenni.")
						else
							usr.deposited_zenni-=amount
							usr.zenni+=amount

			if("Shop")
				switch(input("What do you want to buy?", "", text) in list ("Cancel","[item1]","[item2]","[item3]","[item4]","[item5]","[item6]","[item7]","[item8]","[item9]","[item10]","[item11]","[item12]","[item13]","[item14]","[item15]","[item16]","[item17]","[item18]","[item19]","[item20]","[item21]","[item22]","[item23]","[item24]","[item25]","[item26]","[item27]","[item28]","[item29]","[item30]","[item31]","[item32]","[item33]","[item34]","[item35]","[item36]","[item37]","[item38]","[item39]","[item40]","[item41]","[item42]","[item43]","[item44]","[item45]","[item46]","[item47]",))
					if("Tipped Boots")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/TippedBoots
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("SamuraiHat1")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/SamuraiHat1
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("SamuraiHat2")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/SamuraiHat2
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("MimiShirt")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/MimiShirt
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Half Mask")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/HalfMask
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Hood")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Hood
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("LabCoat")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/LabCoat
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Trenchcoat")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/TrenchCoat
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Armbands")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Armbands
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Legbands")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Legbands
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Baggy Pants")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/BaggyPants
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Eye Patch")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Eyepatch
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Flowing Cape")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/FlowingCape
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Necklace2")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Necklace2
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Shades")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Shades
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Suit")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Suit
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Cape2")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Cape2
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Belt2")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Belt2
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Mask3")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Mask3
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Mask4")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Mask4
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Mask5")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Mask5
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("GiTop")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Gi_Top
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Ripped Bandana")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/RippedBandana
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("WaisRobe")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/WaisRobe
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("Necklace")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Necklace1
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("Mask1")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Mask1
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("Mask2")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Mask2
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("GiBottom")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Gi_Bottom
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("Cape")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Cape
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else
									usr<<"You do not have enough money."
					if("Weighted Clothing")
						var/weight=input("How much weight? The cost will be the same as the weight you entered +10, and max weight is 1000 pounds, but i will make the suit 10x that weight for free, for a max of 10000 pounds, but what kind of psycho would want a 10000 pound suit? For that matter why would you want weighted clothes at all? Oh well.") as num
						if(weight>1000) weight=1000
						if(weight<1) weight=1
						weight=round(weight)
						switch(input("This will cost [weight+100] zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=(weight+100))
									usr.zenni-=(weight+100)
									var/obj/A=new/obj/items/Weighted_Gi
									A.weight=weight
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Saibaman Seed")
						var/weight=input("The more you pay me the higher quality Saibaman Seeds I will sell you.") as num
						if(weight<1) weight=1
						weight=round(weight)
						switch(input("This will cost [weight] zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=weight)
									usr.zenni-=weight
									var/obj/A=new/obj/items/Saibaman_Seed
									A.SBP=weight*1000
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Bandana")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Bandana
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Tuffle Suit")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/TuffleTux
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Belt")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Belt
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Boots")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Boots
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Gloves")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Gloves
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Headband")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Headband
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Jacket")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Jacket
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("KaioSuit")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/KaioSuit
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("LongSleeveShirt")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/LongSleeveShirt
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("NamekianScarf")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/NamekianScarf
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Pants")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Pants
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Sash")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Sash
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Shoes")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Shoes
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("ShortSleeveShirt")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/ShortSleeveShirt
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Tanktop")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/TankTop
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Turban")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Turban
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."
					if("Wristband")
						switch(input("This will cost 5 zenni, accept?", "", text) in list ("Yes", "No",))
							if("Yes")
								if(usr.zenni>=5)
									usr.zenni-=5
									var/obj/A=new/obj/items/Wristband
									var/iconcolor
									iconcolor+=input("Pick a color for your clothing.") as color
									A.icon += iconcolor
									usr.contents+=A
								else usr<<"You do not have enough money."