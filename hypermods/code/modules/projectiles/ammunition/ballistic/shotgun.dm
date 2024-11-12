// Shotgun

/obj/item/ammo_casing/shotgun/syndie
	name = "syndicate shotgun slug"
	desc = "An illegal 12-gauge slug produced by the Syndicate."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "sblshell"
	projectile_type = /obj/projectile/bullet/shotgun/slug/syndie

/obj/item/ammo_casing/shotgun/buckshot/syndie
	name = "syndicate buckshot shell"
	desc = "An illegal 12-gauge buckshot shell produced by the Syndicate."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "sgshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot/syndie

/obj/item/ammo_casing/shotgun/flechette
	name = "flechette shell"
	desc = "A 12-gauge flechette shell."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "flshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_flechette
	pellets = 6
	variance = 10

/obj/item/ammo_casing/shotgun/laserbuckshot
	name = "laser buckshot"
	desc = "An advanced shotgun shell that uses micro lasers to replicate the effects of a laser weapon in a ballistic package."
	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "lshell"
	projectile_type = /obj/projectile/beam/laser/buckshot
	pellets = 5
	variance = 30

/obj/item/ammo_casing/shotgun/uraniumpenetrator
	name = "depleted uranium slug"
	desc = "A relatively low-tech shell, utilizing the unique properties of Uranium, and possessing \
	very impressive armor penetration capabilities."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "dushell"
	projectile_type = /obj/projectile/bullet/shotgun/slug/uranium

/obj/item/ammo_casing/shotgun/cryoshot
	name = "cryoshot shell"
	desc = "A state-of-the-art shell which uses the cooling power of Cryogelidia to snap freeze a target, without causing \
	them much harm."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "fshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_cryoshot
	pellets = 4
	variance = 30

/obj/item/ammo_casing/shotgun/thundershot
	name = "thunder slug"
	desc = "An advanced shotgun shell that uses stored electrical energy to discharge a massive shock on impact, arcing to nearby targets."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "Thshell"
	pellets = 3
	variance = 25
	projectile_type = /obj/projectile/bullet/pellet/shotgun_thundershot

/obj/item/ammo_casing/shotgun/hardlight
	name = "hardlight shell"
	desc = "An advanced shotgun shell that fires a hardlight beam and scatters it."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "hshell"
	projectile_type = /obj/projectile/bullet/pellet/hardlight
	harmful = FALSE
	pellets = 6
	variance = 20

/obj/item/ammo_casing/shotgun/hardlight/emp_act(severity)
	if (. & EMP_PROTECT_SELF)
		return
	variance = initial(variance) + severity*4 // yikes
	if(severity > EMP_LIGHT)
		pellets = initial(pellets) * (0.5**(severity / EMP_HEAVY)) // also yikes
	addtimer(CALLBACK(src, PROC_REF(remove_emp)), severity SECONDS, TIMER_OVERRIDE|TIMER_UNIQUE)

/obj/item/ammo_casing/shotgun/hardlight/proc/remove_emp()
	variance = initial(variance)
	pellets = initial(pellets)

/obj/item/ammo_casing/shotgun/rip //two pellet slug bc why not
	name = "ripslug shell"
	desc = "An advanced shotgun shell that uses a narrow choke in the shell to split the slug in two.\
	This makes them less able to break through armor, but really hurts everywhere else."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "rsshell"
	projectile_type = /obj/projectile/bullet/shotgun/slug/rip
	pellets = 2
	variance = 3 // the tight spread

/obj/item/ammo_casing/shotgun/anarchy
	name = "anarchy shell"
	desc = "An advanced shotgun shell that has low impact damage, wide spread, and loads of pellets that bounce everywhere. Good luck"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "anashell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_anarchy
	pellets = 10 // AWOOGA!!
	variance = 50

/obj/item/ammo_casing/shotgun/clownshot
	name = "buckshot shell..?"
	desc = "This feels a little light for a buckshot shell."
	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "gshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_clownshot
	pellets = 20
	variance = 35

// Flare gun

/obj/item/ammo_casing/shotgun/flare
	name = "flare shell"
	desc = "A flare casing for a flare gun, it could probably be fired from a shotgun too."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "flare"
	projectile_type = /obj/projectile/bullet/pellet/flare
