/obj/item/storage/toolbox/syndicate/deluxe/PopulateContents() // dont make this carry over the previous stuff
	new /obj/item/screwdriver/power(src)
	new /obj/item/weldingtool/experimental(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/wirecutters(src, "red")
	new /obj/item/multitool(src)
	new /obj/item/clothing/gloves/combat(src)
	for(var/obj/item/I in contents)
		I.toolspeed = 0.3
		I.name = "syndicate [I.name]"



/obj/item/storage/toolbox/guncase/pistols
	name = "dual pistol case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/viper
	var/second_weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/cobra/caseless
	extra_to_spawn = /obj/item/ammo_box/magazine/m10mm
	var/second_extra_to_spawn = /obj/item/ammo_box/magazine/m45/cs

/obj/item/storage/toolbox/guncase/pistols/PopulateContents()
	new weapon_to_spawn (src)
	new second_weapon_to_spawn (src)
	for(var/i in 1 to 2)
		new extra_to_spawn (src)
	for(var/i in 1 to 2)
		new second_extra_to_spawn (src)

/obj/item/storage/toolbox/guncase/elementalguns
	name = "elemental dual gun case"
	weapon_to_spawn = /obj/item/gun/energy/laser/thermal/inferno/syndicate
	var/second_weapon_to_spawn = /obj/item/gun/energy/laser/thermal/cryo/syndicate
	extra_to_spawn = /obj/item/reagent_containers/hypospray/medipen/stimulants

/obj/item/storage/toolbox/guncase/elementalguns/PopulateContents()
	new weapon_to_spawn (src)
	new second_weapon_to_spawn (src)
	for(var/i in 1 to 2)
		new extra_to_spawn (src)
	new /obj/item/clothing/under/chameleon/armored (src)

/obj/item/storage/toolbox/guncase/chinalake
	name = "china lake case"
	weapon_to_spawn = /obj/item/gun/ballistic/chinalake
	extra_to_spawn = /obj/item/ammo_casing/caseless/chinalake/blast
	var/second_extra_to_spawn = /obj/item/ammo_casing/caseless/chinalake/frag

/obj/item/storage/toolbox/guncase/chinalake/PopulateContents()
	new weapon_to_spawn (src)
	for(var/i in 1 to 4)
		new extra_to_spawn (src)
	for(var/i in 1 to 2)
		new second_extra_to_spawn (src)

/obj/item/storage/toolbox/guncase/tommygun
	name = "tommy gun case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/tommygun
	extra_to_spawn = /obj/item/ammo_box/magazine/tommygunm45

/obj/item/storage/toolbox/guncase/tommygun/PopulateContents()
	new weapon_to_spawn (src)
	for(var/i in 1 to 2)
		new extra_to_spawn (src)
