/// Ammo storage

/obj/item/storage/belt/bandolier/hristov/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_casing/mm712x82 = 12
	)
	generate_items_inside(items_inside, src)

/// Ammo boxes

/obj/item/storage/box/lethalshot/syndi
	name = "box of lethal shotgun shots"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "ntlethalshot_box"

/obj/item/storage/box/lethalshot/syndi/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/lethalshot/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/buckshot(src)

/obj/item/storage/box/dartshells
	name = "box of shotgun darts"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "dartshot_box"

/obj/item/storage/box/dartshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/dartshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/dart(src)

/obj/item/storage/box/dartshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/dart(src)

/obj/item/storage/box/incendiaryshells
	name = "box of incendiary shotgun shots"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "incendiaryshot_box"

/obj/item/storage/box/incendiaryshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/incendiaryshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/incendiary(src)

/obj/item/storage/box/incendiaryshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/incendiary(src)

/obj/item/storage/box/dragonshells
	name = "ammo box (shells (Dragon's Breath))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "dragonshot_box"

/obj/item/storage/box/dragonshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/dragonshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/dragonsbreath(src)

/obj/item/storage/box/dragonshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/dragonsbreath(src)

/obj/item/storage/box/syndieshotshells
	name = "ammo box (shells (Buckshot))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "syndibuckshot_box"

/obj/item/storage/box/syndieshotshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/syndieshotshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/buckshot/syndie(src)

/obj/item/storage/box/syndieshotshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/buckshot/syndie(src)

/obj/item/storage/box/syndieslugshells
	name = "ammo box (shells (Slug))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "syndislugshot_box"

/obj/item/storage/box/syndieslugshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/syndieslugshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/syndie(src)

/obj/item/storage/box/syndieslugshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/syndie(src)

/obj/item/storage/box/tasershells
	name = "ammo box (shells (Taser))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "tasershot_box"

/obj/item/storage/box/tasershells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/tasershells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/stunslug(src)

/obj/item/storage/box/tasershells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/stunslug(src)

/obj/item/storage/box/meteorshells
	name = "ammo box (shells (Meteor Slug))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "meteorshot_box"

/obj/item/storage/box/meteorshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/meteorshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/meteorslug(src)

/obj/item/storage/box/meteorshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/meteorslug(src)

/obj/item/storage/box/pulseshells
	name = "ammo box (shells (Pulse Slug))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "pulseshot_box"

/obj/item/storage/box/pulseshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/pulseshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/pulseslug(src)

/obj/item/storage/box/pulseshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/pulseslug(src)

/obj/item/storage/box/frag12shells
	name = "ammo box (shells (Frag 12))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "fragshot_box"

/obj/item/storage/box/frag12shells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/frag12shells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/frag12(src)

/obj/item/storage/box/frag12shells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/frag12(src)

/obj/item/storage/box/flechetteshells
	name = "ammo box (shells (Flechette))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "flechetteshot_box"

/obj/item/storage/box/flechetteshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/flechetteshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/flechette(src)

/obj/item/storage/box/flechetteshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/flechette(src)

/obj/item/storage/box/rubbershotshells
	name = "ammo box (shells (Rubber Shot))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "rubbershot_box"

/obj/item/storage/box/rubbershotshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/rubbershotshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/rubbershot(src)

/obj/item/storage/box/rubbershotshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/rubbershot(src)

/obj/item/storage/box/ionshells
	name = "ammo box (shells (Ion))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "ionshot_box"

/obj/item/storage/box/ionshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/ionshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/ion(src)

/obj/item/storage/box/ionshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/ion(src)

/obj/item/storage/box/lasershells
	name = "ammo box (shells (Laser Buckshot))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "lasershot_box"

/obj/item/storage/box/lasershells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/lasershells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/laserbuckshot(src)

/obj/item/storage/box/lasershells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/laserbuckshot(src)

/obj/item/storage/box/uraniumshells
	name = "ammo box (shells (Uranium))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "uraniumshot_box"

/obj/item/storage/box/uraniumshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/uraniumshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/uraniumpenetrator(src)

/obj/item/storage/box/uraniumshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/uraniumpenetrator(src)

/obj/item/storage/box/cryoshotshells
	name = "ammo box (shells (Cryoshot))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "cryoshot_box"

/obj/item/storage/box/cryoshotshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/cryoshotshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/cryoshot(src)

/obj/item/storage/box/cryoshotshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/cryoshot(src)

/obj/item/storage/box/bioterrorshells
	name = "ammo box (shells (Bioterror))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "bioterrorshot_box"

/obj/item/storage/box/bioterrorshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/bioterrorshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/dart/bioterror(src)

/obj/item/storage/box/bioterrorshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/dart/bioterror(src)

/obj/item/storage/box/breachershells
	name = "ammo box (shells (Breacher))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "breachershot_box"

/obj/item/storage/box/breachershells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/breachershells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/breacher(src)

/obj/item/storage/box/breachershells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/breacher(src)

/obj/item/storage/box/thundershotshells
	name = "ammo box (shells (Thundershot))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "thundershot_box"

/obj/item/storage/box/thundershotshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/thundershotshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/thundershot(src)

/obj/item/storage/box/thundershotshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/thundershot(src)

/obj/item/storage/box/hardlightshells
	name = "ammo box (shells (Hardlight))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "hardlightshot_box"

/obj/item/storage/box/hardlightshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/hardlightshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/hardlight(src)

/obj/item/storage/box/hardlightshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/hardlight(src)

/obj/item/storage/box/ripshells
	name = "ammo box (shells (RIP Slug))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "ripslugshot_box"

/obj/item/storage/box/ripshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/ripshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/rip(src)

/obj/item/storage/box/ripshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/rip(src)

/obj/item/storage/box/anarchyshells
	name = "ammo box (shells (Anarchy))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "anarchyshot_box"

/obj/item/storage/box/anarchyshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/anarchyshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/anarchy(src)

/obj/item/storage/box/anarchyshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/anarchy(src)

/obj/item/storage/box/mysteryshells
	name = "ammo box (shells (Mystery))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "mysteryshot_box"

/obj/item/storage/box/mysteryshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/mysteryshells/PopulateContents()
	var/list/types = subtypesof(/obj/item/ammo_casing/shotgun/)
	for(var/i in 1 to 7)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/mysteryshells/syndi/PopulateContents()
	var/list/types = subtypesof(/obj/item/ammo_casing/shotgun/)
	for(var/i in 1 to 14)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/clownshells
	name = "ammo box (shells (Clownly))"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "clownshot_box"

/obj/item/storage/box/clownshells/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/clownshells/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/clownshot(src)

/obj/item/storage/box/clownshells/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/clownshot(src)


/obj/item/ammo_box/n712x82
	name = "ammo box (7.12x82)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "712x82mmbox"
	ammo_type = /obj/item/ammo_casing/mm712x82
	max_ammo = 50

/obj/item/ammo_box/n712x82/hundred
	name = "ammo box (7.12x82)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "mega712x82mmbox"
	ammo_type = /obj/item/ammo_casing/mm712x82
	max_ammo = 100

/obj/item/ammo_box/c9mm/cs
	name = "ammo box (9mm caseless)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "caseless9mmbox"
	ammo_type = /obj/item/ammo_casing/caseless/c9mm

/obj/item/ammo_box/c9mm/fire
	name = "ammo box (9mm incendiary)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "inc9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/c9mm/hp
	name = "ammo box (9mm hollow-point)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "hp9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/c9mm/ap
	name = "ammo box (9mm armor piercing)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "ap9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/c9mm/emp
	name = "ammo box (9mm EMP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "emp9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/emp

/obj/item/ammo_box/c9mm/sp
	name = "ammo box (9mm soporific)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "sleep9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/sp

/obj/item/ammo_box/c9mm/cryo
	name = "ammo box (9mm cryogenic)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "cryo9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/cryo

/obj/item/ammo_box/c9mm/richochet
	name = "ammo box (9mm richochet)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "richochet9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/richochet

/obj/item/ammo_box/c9mm/bomb
	name = "ammo box (9mm explosive)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "bomb9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/bomb

/obj/item/ammo_box/c9mm/sonic
	name = "ammo box (9mm sonic)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "sonic9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/sonic

/obj/item/ammo_box/c9mm/mutate
	name = "ammo box (9mm mutation)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "mutate9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm/mutate

/obj/item/ammo_box/c9mm/fifty
	name = "ammo box (9mm)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "mega9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 50

/obj/item/ammo_box/c10mm/cs
	name = "ammo box (10mm caseless)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "caseless10mmbox"
	ammo_type = /obj/item/ammo_casing/caseless/c10mm

/obj/item/ammo_box/c10mm/sp
	name = "ammo box (10mm soporific)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "sleep10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/sp

/obj/item/ammo_box/c10mm/ap
	name = "ammo box (10mm armor-piercing)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "ap10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/ap

/obj/item/ammo_box/c10mm/hp
	name = "ammo box (10mm hollow-point)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "hp10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/hp

/obj/item/ammo_box/c10mm/inc
	name = "ammo box (10mm incendiary)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "inc10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/fire

/obj/item/ammo_box/c10mm/emp
	name = "ammo box (10mm EMP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "emp10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/emp

/obj/item/ammo_box/c10mm/bleedout
	name = "ammo box (10mm bleedout)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "bleedout10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/bleedout

/obj/item/ammo_box/c10mm/rad
	name = "ammo box (10mm radiation)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "rad10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/rad

/obj/item/ammo_box/c10mm/fragment
	name = "ammo box (10mm fragmentation)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "fragment10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm/fragment

/obj/item/ammo_box/c10mm/fifty
	name = "ammo box (10mm)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "mega10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 50

/obj/item/ammo_box/c45/cs
	name = "ammo box (.45 caseless)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "caseless45box"
	ammo_type = /obj/item/ammo_casing/caseless/c45

/obj/item/ammo_box/c45/sp
	name = "ammo box (.45 soporific)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "sleep45box"
	ammo_type = /obj/item/ammo_casing/c45/sp

/obj/item/ammo_box/c45/ap
	name = "ammo box (.45 armor piercing)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "ap45box"
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_box/c45/hp
	name = "ammo box (.45 hollow point)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "hp45box"
	ammo_type = /obj/item/ammo_casing/c45/hp

/obj/item/ammo_box/c45/inc
	name = "ammo box (.45 incendiary)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "inc45box"
	ammo_type = /obj/item/ammo_casing/c45/inc

/obj/item/ammo_box/c45/emp
	name = "ammo box (.45 emp)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "emp45box"
	ammo_type = /obj/item/ammo_casing/c45/emp

/obj/item/ammo_box/c45/venom
	name = "ammo box (.45 venom)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "venom45box"
	ammo_type = /obj/item/ammo_casing/c45/venom

/obj/item/ammo_box/c45/pacify
	name = "ammo box (.45 pacification)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "pacify45box"
	ammo_type = /obj/item/ammo_casing/c45/pacify

/obj/item/ammo_box/c45/delay
	name = "ammo box (.45 delayed)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "delay45box"
	ammo_type = /obj/item/ammo_casing/c45/delay

/obj/item/ammo_box/c45/tranq
	name = "ammo box (.45 tranquilizer)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "tranq45box"
	ammo_type = /obj/item/ammo_casing/c45/tranq

/obj/item/ammo_box/c45/fifty
	name = "ammo box (.45)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "mega45box"
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 50

/obj/item/ammo_box/m50
	name = "ammo box (.50 AE)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae
	max_ammo = 20

/obj/item/ammo_box/m50/ap
	name = "ammo box (.50 AE armor piercing)"
	icon_state = "ap50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/ap

/obj/item/ammo_box/m50/hp
	name = "ammo box (.50 AE hollow point)"
	icon_state = "hp50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/hp

/obj/item/ammo_box/m50/inc
	name = "ammo box (.50 AE incendiary)"
	icon_state = "inc50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/inc

/obj/item/ammo_box/m50/caseless
	name = "ammo box (.50 AE caseless)"
	icon_state = "caseless50aebox"
	ammo_type = /obj/item/ammo_casing/caseless/a50ae

/obj/item/ammo_box/m50/emp
	name = "ammo box (.50 AE EMP)"
	icon_state = "emp50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/emp

/obj/item/ammo_box/m50/hi
	name = "ammo box (.50 AE hi-power)"
	icon_state = "hi50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/hi

/obj/item/ammo_box/m50/demo
	name = "ammo box (.50 AE demolishing)"
	icon_state = "demo50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/demo

/obj/item/ammo_box/m50/rod
	name = "ammo box (.50 AE immovable)"
	icon_state = "rod50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/rod

/obj/item/ammo_box/m50/bomb
	name = "ammo box (.50 AE ordinance)"
	icon_state = "bomb50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/bomb

/obj/item/ammo_box/m50/rep
	name = "ammo box (.50 AE repulsive)"
	icon_state = "rep50aebox"
	ammo_type = /obj/item/ammo_casing/a50ae/rep

/obj/item/ammo_box/m50/fifty
	icon_state = "mega50aebox"
	max_ammo = 50

/obj/item/ammo_box/c357/no_direct
	name = "ammo box (.357 Magnum)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "357box"
	ammo_type = /obj/item/ammo_casing/c357
	max_ammo = 20

/obj/item/ammo_box/c357/no_direct/ironfeather
	name = "ammo box (.357 Ironfeather)"
	icon_state = "if357box"
	ammo_type = /obj/item/ammo_casing/c357/ironfeather

/obj/item/ammo_box/c357/no_direct/nutcracker
	name = "ammo box (.357 Nutcracker)"
	icon_state = "nc357box"
	ammo_type = /obj/item/ammo_casing/c357/nutcracker

/obj/item/ammo_box/c357/no_direct/metalshock
	name = "ammo box (.357 Metalshock)"
	icon_state = "ms357box"
	ammo_type = /obj/item/ammo_casing/c357/metalshock

/obj/item/ammo_box/c357/no_direct/heartpiercer
	name = "ammo box (.357 Heartpiercer)"
	icon_state = "hp357box"
	ammo_type = /obj/item/ammo_casing/c357/heartpiercer

/obj/item/ammo_box/c357/no_direct/wallstake
	name = "ammo box (.357 Wallstake)"
	icon_state = "ws357box"
	ammo_type = /obj/item/ammo_casing/c357/wallstake

/obj/item/ammo_box/c357/no_direct/fifty
	icon_state = "mega357box"
	max_ammo = 50

/obj/item/storage/box/flareshot
	name = "box of flare shells"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "flareshell_box"

/obj/item/storage/box/flareshot/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/flare(src)

/obj/item/storage/box/flareshot/syndi/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/shotgun/flare(src)

/obj/item/ammo_box/a40mm/shocker
	name = "ammo box (40mm SH grenades)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "40mmSH"
	ammo_type = /obj/item/ammo_casing/a40mm/shocker
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/a40mm/spread
	name = "ammo box (40mm SP grenades)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "40mmSP"
	ammo_type = /obj/item/ammo_casing/a40mm/spread
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/a40mm/sucking
	name = "ammo box (40mm SU grenades)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "40mmSU"
	ammo_type = /obj/item/ammo_casing/a40mm/sucking
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/a40mm/nuke
	name = "ammo box (40mm SL grenades)"
	icon = 'hypermods/icons/obj/weapons/guns/ammobox.dmi'
	icon_state = "40mmSL"
	ammo_type = /obj/item/ammo_casing/a40mm/nuke
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

// Nade pouches

/obj/item/ammo_box/nadepouch
	name = "grenade pouch"
	icon = 'hypermods/icons/obj/storage/armaments.dmi'
	icon_state = "ammopouch"
	ammo_type = null
	max_ammo = 5

/obj/item/ammo_box/nadepouch/frag
	name = "grenade pouch (fragmentation)"
	icon_state = "ammopouch-grenade"
	ammo_type = /obj/item/grenade/frag
	max_ammo = 5

/obj/item/ammo_box/nadepouch/gluon
	name = "grenade pouch (gluon)"
	icon_state = "ammopouch-gluon"
	ammo_type = /obj/item/grenade/gluon
	max_ammo = 5

/obj/item/ammo_box/nadepouch/incendiary
	name = "grenade pouch (incendiary)"
	icon_state = "ammopouch-incendiary"
	ammo_type = /obj/item/grenade/chem_grenade/syndiefire
	max_ammo = 5

/obj/item/ammo_box/nadepouch/antigrav
	name = "grenade pouch (anti-gravity)"
	icon_state = "ammopouch-antigrav"
	ammo_type = /obj/item/grenade/antigravity/syndicate
	max_ammo = 6

/obj/item/ammo_box/nadepouch/rads
	name = "grenade pouch (radiation)"
	icon_state = "ammopouch-rads"
	ammo_type = /obj/item/grenade/chem_grenade/syndierads
	max_ammo = 5

/obj/item/ammo_box/nadepouch/highacidfoam
	name = "grenade pouch (highly acidic)"
	icon_state = "ammopouch-facid"
	ammo_type = /obj/item/grenade/chem_grenade/highacidfoam
	max_ammo = 5

/obj/item/ammo_box/nadepouch/clf3
	name = "grenade pouch (hellfoam)"
	icon_state = "ammopouch-clf3"
	ammo_type = /obj/item/grenade/chem_grenade/syndiclf3
	max_ammo = 5

/obj/item/ammo_box/nadepouch/sonic
	name = "grenade pouch (sonic)"
	icon_state = "ammopouch-sonic"
	ammo_type = /obj/item/grenade/sonic
	max_ammo = 5

/obj/item/ammo_box/nadepouch/eyebreak
	name = "grenade pouch (eyebreaker)"
	icon_state = "ammopouch-eyebreak"
	ammo_type = /obj/item/grenade/chem_grenade/eyebreaker
	max_ammo = 5

/obj/item/ammo_box/nadepouch/sm
	name = "grenade pouch (supermatter)"
	icon_state = "ammopouch-sm"
	ammo_type = /obj/item/grenade/supermatter
	max_ammo = 5

/obj/item/ammo_box/nadepouch/wh
	name = "grenade pouch (whitehole)"
	icon_state = "ammopouch-wh"
	ammo_type = /obj/item/grenade/whitehole
	max_ammo = 5

/obj/item/ammo_box/nadepouch/tesla
	name = "grenade pouch (tesla)"
	icon_state = "ammopouch-emp"
	ammo_type = /obj/item/grenade/chem_grenade/pyro/tesla
	max_ammo = 5

/obj/item/ammo_box/nadepouch/wasp
	name = "grenade pouch (wasp)"
	icon_state = "ammopouch-wasp"
	ammo_type = /obj/item/grenade/spawnergrenade/buzzkill
	max_ammo = 5

/obj/item/ammo_box/nadepouch/visc
	name = "grenade pouch (viscerator)"
	icon_state = "ammopouch-visc"
	ammo_type = /obj/item/grenade/spawnergrenade/manhacks
	max_ammo = 5

/obj/item/ammo_box/nadepouch/concussion
	name = "grenade pouch (concussive)"
	icon_state = "ammopouch-concussion"
	ammo_type = /obj/item/grenade/concussive
	max_ammo = 5

/obj/item/ammo_box/nadepouch/flashbang
	name = "grenade pouch (flashbang)"
	icon_state = "ammopouch-flash"
	ammo_type = /obj/item/grenade/flashbang
	max_ammo = 5

/obj/item/ammo_box/nadepouch/firecracker
	name = "grenade pouch (firecracker)"
	icon_state = "ammopouch-firecracker"
	ammo_type = /obj/item/grenade/firecracker
	max_ammo = 10

/obj/item/ammo_box/nadepouch/stingbang
	name = "grenade pouch (stingbang)"
	icon_state = "ammopouch-stingbang"
	ammo_type = /obj/item/grenade/stingbang
	max_ammo = 5

/obj/item/ammo_box/nadepouch/mirage
	name = "grenade pouch (mirage)"
	icon_state = "ammopouch-mirage"
	ammo_type = /obj/item/grenade/mirage
	max_ammo = 5

/obj/item/ammo_box/nadepouch/bananapeel
	name = "grenade pouch (banana peels)"
	icon_state = "ammopouch-banana"
	ammo_type = /obj/item/grenade/spawnergrenade/bananapeel
	max_ammo = 5

/obj/item/ammo_box/nadepouch/beartraps
	name = "grenade pouch (bear traps)"
	icon_state = "ammopouch-quad"
	ammo_type = /obj/item/restraints/legcuffs/beartrap
	max_ammo = 5
