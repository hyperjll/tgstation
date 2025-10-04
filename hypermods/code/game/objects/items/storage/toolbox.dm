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

/obj/item/storage/toolbox/guncase/minigun
	name = "minigun case"
	weapon_to_spawn = /obj/item/minigunmount
	extra_to_spawn = /obj/item/storage/medkit/medical_variety_pack

/obj/item/storage/toolbox/guncase/minigun/PopulateContents()
	new weapon_to_spawn (src)
	new extra_to_spawn (src)

/obj/item/storage/toolbox/guncase/tommygun
	name = "tommy gun case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/tommygun
	extra_to_spawn = /obj/item/ammo_box/magazine/tommygunm45

/obj/item/storage/toolbox/guncase/tommygun/PopulateContents()
	new weapon_to_spawn (src)
	for(var/i in 1 to 2)
		new extra_to_spawn (src)

/obj/item/storage/toolbox/guncase/hadar
	name = "hadar power sword case"

/obj/item/storage/toolbox/guncase/hadar/PopulateContents()
	if(prob(50))
		new /obj/item/melee/energy/blade/hadar(src)
	else
		new /obj/item/melee/energy/blade/hadar/red(src)

/obj/item/storage/toolbox/guncase/traitor/m1911pistol
	name = "m1911 gun case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/m1911
	extra_to_spawn = /obj/item/ammo_box/magazine/m45
	ammo_box_to_spawn = /obj/item/ammo_box/c45

/obj/item/storage/toolbox/guncase/traitor/cobra
	name = "cobra gun case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/cobra/caseless
	extra_to_spawn = /obj/item/ammo_box/magazine/m45/cs
	ammo_box_to_spawn = /obj/item/ammo_box/c45/cs

/obj/item/storage/toolbox/guncase/traitor/viper
	name = "viper gun case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/viper
	extra_to_spawn = /obj/item/ammo_box/magazine/m10mm
	ammo_box_to_spawn = /obj/item/ammo_box/c10mm

/obj/item/storage/toolbox/guncase/traitor/fisher
	name = "/improper Ansem/SC gun case"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/clandestine/fisher
	extra_to_spawn = /obj/item/ammo_box/magazine/m10mm
	ammo_box_to_spawn = /obj/item/ammo_box/c10mm

/obj/item/storage/toolbox/guncase/traitor/ammunition/m10mm
	name = "10mm magazine case"
	weapon_to_spawn = /obj/item/ammo_box/magazine/m10mm
	extra_to_spawn = /obj/item/ammo_box/magazine/m10mm
	ammo_box_to_spawn = /obj/item/ammo_box/c10mm

/obj/item/storage/toolbox/guncase/traitor/ammunition/m45
	name = ".45 magazine case"
	weapon_to_spawn = /obj/item/ammo_box/magazine/m45
	extra_to_spawn = /obj/item/ammo_box/magazine/m45
	ammo_box_to_spawn = /obj/item/ammo_box/c45

/obj/item/storage/toolbox/guncase/traitor/ammunition/m50
	name = "m50 magazine case"
	weapon_to_spawn = /obj/item/ammo_box/magazine/m50
	extra_to_spawn = /obj/item/ammo_box/magazine/m50
	ammo_box_to_spawn = /obj/item/ammo_box/m50

/obj/item/storage/toolbox/guncase/traitor/ammunition/c357
	name = ".357 speedloader case"
	weapon_to_spawn = /obj/item/ammo_box/speedloader/c357
	extra_to_spawn = /obj/item/ammo_box/speedloader/c357
	ammo_box_to_spawn = /obj/item/ammo_box/c357/no_direct

/obj/item/storage/toolbox/guncase/flaregun
	name = "flare gun case"
	desc = "A weapon's case. It has a rather distinguished look to it."
	icon = 'hypermods/icons/obj/storage/guncases.dmi'
	icon_state = "hard_case"
	weapon_to_spawn = /obj/item/gun/ballistic/flaregun
	extra_to_spawn = /obj/item/storage/box/flareshot/syndi

/obj/item/storage/toolbox/guncase/flaregun/PopulateContents()
	new weapon_to_spawn (src)
	new extra_to_spawn (src)

/obj/item/storage/toolbox/guncase/kestral
	name = "kestral revolver case"
	desc = "A weapon's case. It has a rather distinguished look to it."
	icon = 'hypermods/icons/obj/storage/guncases.dmi'
	icon_state = "hard_case"
	weapon_to_spawn = /obj/item/gun/ballistic/revolver/c38/kestrel
	extra_to_spawn = /obj/item/ammo_box/speedloader/c38
	var/second_extra_to_spawn = /obj/item/ammo_box/speedloader/c357

/obj/item/storage/toolbox/guncase/kestral/PopulateContents()
	new weapon_to_spawn (src)
	for(var/i in 1 to 2)
		new extra_to_spawn (src)
	for(var/i in 1 to 2)
		new second_extra_to_spawn (src)
	new /obj/item/wrench(src)

/obj/item/storage/toolbox/guncase/spes
	name = "spes shotgun case"
	desc = "A weapon's case. It has a rather distinguished look to it."
	icon = 'hypermods/icons/obj/storage/guncases.dmi'
	icon_state = "hard_case"
	weapon_to_spawn = /obj/item/gun/ballistic/shotgun/spes
	extra_to_spawn = /obj/item/storage/box/lethalshot

/obj/item/storage/toolbox/guncase/flaregun/PopulateContents()
	new weapon_to_spawn (src)
	new extra_to_spawn (src)
