/obj/item/grenade/chem_grenade/randomdisease
	name = "disease grenade"
	desc = "Used for personnel suppression via biological warfare."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/randomdisease/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 60)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 30)
	B1.reagents.add_reagent(/datum/reagent/diseasedblood, 10)
	B2.reagents.add_reagent(/datum/reagent/potassium, 60)
	B2.reagents.add_reagent(/datum/reagent/consumable/sugar, 30)
	B2.reagents.add_reagent(/datum/reagent/diseasedblood, 10)

	beakers += B1
	beakers += B2

/obj/item/grenade/chem_grenade/eyebreaker
	name = "eyebreaking grenade"
	desc = "Used for deteriorating the eyes of everyone nearby."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/eyebreaker/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 40)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 40)
	B1.reagents.add_reagent(/datum/reagent/toxin/norepinephricacid, 20)
	B2.reagents.add_reagent(/datum/reagent/potassium, 40)
	B2.reagents.add_reagent(/datum/reagent/toxin/norepinephricacid, 60)

	beakers += B1
	beakers += B2

/obj/item/grenade/chem_grenade/mindbreaker
	name = "mindbreaking grenade"
	desc = "Used for deteriorating the mental state of everyone nearby."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/mindbreaker/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 40)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 40)
	B1.reagents.add_reagent(/datum/reagent/toxin/mindbreaker, 20)
	B2.reagents.add_reagent(/datum/reagent/potassium, 40)
	B2.reagents.add_reagent(/datum/reagent/toxin/mindbreaker, 60)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/pyro/explosive
	name = "explosive grenade"
	desc = "Used for eliminating the enemy at any cost."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/pyro/explosive/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/gunpowder, 100)
	B2.reagents.add_reagent(/datum/reagent/gunpowder, 100)

	beakers += B1
	beakers += B2

/obj/item/grenade/chem_grenade/pyro/explosive/pinkglitter
	name = "pink glitter bomb"
	desc = "For that HOT glittery look."

/obj/item/grenade/chem_grenade/pyro/explosive/blueglitter
	name = "white glitter bomb"
	desc = "For that somnolent glittery look."

/obj/item/grenade/chem_grenade/pyro/explosive/whiteglitter
	name = "blue glitter bomb"
	desc = "For that COOL glittery look."


/obj/item/grenade/chem_grenade/syndiefire
	name = "incendiary grenade"
	desc = "Used for clearing rooms of living things."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/syndiefire/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 65)
	B1.reagents.add_reagent(/datum/reagent/stable_plasma, 35)
	B2.reagents.add_reagent(/datum/reagent/stable_plasma, 35)
	B2.reagents.add_reagent(/datum/reagent/toxin/acid, 65)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/syndierads
	name = "radiation grenade"
	desc = "The best grenade to irridiate the fuck out of someone."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/syndierads/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/toxin/mutagen, 30)
	B1.reagents.add_reagent(/datum/reagent/toxin/polonium, 10)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 10)
	B2.reagents.add_reagent(/datum/reagent/potassium, 10)
	B2.reagents.add_reagent(/datum/reagent/phosphorus, 10)
	B2.reagents.add_reagent(/datum/reagent/toxin/polonium, 10)
	B2.reagents.add_reagent(/datum/reagent/toxin/mutagen, 20)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/syndiclf3
	name = "hellfoam grenade"
	desc = "BURN!-brand foaming clf3. In a special applicator for rapid purging of wide areas."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/syndiclf3/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/fluorosurfactant, 50)
	B1.reagents.add_reagent(/datum/reagent/clf3, 50)
	B2.reagents.add_reagent(/datum/reagent/water, 50)
	B2.reagents.add_reagent(/datum/reagent/clf3, 50)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/highacidfoam
	name = "highly acidic foam grenade"
	desc = "A foam grenade containing an extremely corrosive chemical substance that violently reacts with living organic tissue."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/highacidfoam/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/fluorosurfactant, 35)
	B1.reagents.add_reagent(/datum/reagent/toxin/acid/nitracid, 60)
	B2.reagents.add_reagent(/datum/reagent/water, 35)
	B2.reagents.add_reagent(/datum/reagent/toxin/acid/nitracid, 60)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/bloodyfoam
	name = "bloody foam grenade"
	desc = "A foam grenade that leaves behind a plethora of blood splatters."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/bloodyfoam/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/fluorosurfactant, 45)
	B1.reagents.add_reagent(/datum/reagent/blood, 50)
	B2.reagents.add_reagent(/datum/reagent/water, 45)
	B2.reagents.add_reagent(/datum/reagent/blood, 50)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/nofoam
	name = "nitrous oxide foam grenade"
	desc = "A foam grenade containing a gaseous chemical that puts people to sleep and can be highly toxic in small amounts if it finds it's way to one's bloodstream."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/nofoam/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/fluorosurfactant, 15)
	B1.reagents.add_reagent(/datum/reagent/nitrous_oxide, 80)
	B2.reagents.add_reagent(/datum/reagent/water, 15)
	B2.reagents.add_reagent(/datum/reagent/nitrous_oxide, 80)

	beakers += B1
	beakers += B2

/// Podperson syndi item
/obj/item/grenade/chem_grenade/large/phytosiansmoke
	name = "large grenade"
	desc = "A custom made large grenade. Larger splash range and increased ignition temperature compared to basic grenades. Fits exotic and bluespace based containers."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/large/phytosiansmoke/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/bluespace/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/bluespace/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 50)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 50)
	B1.reagents.add_reagent(/datum/reagent/diethylamine, 50)
	B1.reagents.add_reagent(/datum/reagent/plantnutriment/eznutriment, 150)
	B2.reagents.add_reagent(/datum/reagent/potassium, 50)
	B2.reagents.add_reagent(/datum/reagent/plantnutriment/robustharvestnutriment, 50)
	B2.reagents.add_reagent(/datum/reagent/saltpetre, 50)
	B2.reagents.add_reagent(/datum/reagent/plantnutriment/eznutriment, 150)

	beakers += B1
	beakers += B2

// Jellyperson syndi item
/obj/item/grenade/chem_grenade/jellypersonsmoke
	name = "large grenade"
	desc = "A custom made large grenade. Larger splash range and increased ignition temperature compared to basic grenades. Fits exotic and bluespace based containers."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/jellypersonsmoke/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/bluespace/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/bluespace/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 100)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 100)
	B1.reagents.add_reagent(/datum/reagent/mutationtoxin/jelly, 100)
	B2.reagents.add_reagent(/datum/reagent/potassium, 100)
	B2.reagents.add_reagent(/datum/reagent/mutationtoxin/jelly, 200)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/pyro/tesla
	name = "pyro grenade"
	desc = "A custom made pyrotechnical grenade. Heats up contents upon ignition."
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/pyro/tesla/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/teslium, 100)
	B2.reagents.add_reagent(/datum/reagent/teslium, 100)

	beakers += B1
	beakers += B2

/obj/item/grenade/chem_grenade/engiairfoam
	name = "breatheable air grenade"
	desc = "A foam grenade containing highly condensed breatheable air, pull the pin and launch into a room that has been vacuumed for easy air distribution."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "oxy"
	base_icon_state = "oxy"
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/engiairfoam/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/fluorosurfactant, 15)
	B1.reagents.add_reagent(/datum/reagent/liquid_air, 80)
	B2.reagents.add_reagent(/datum/reagent/water, 15)
	B2.reagents.add_reagent(/datum/reagent/liquid_air, 80)

	beakers += B1
	beakers += B2


/obj/item/grenade/chem_grenade/saxitoxin
	name = "saxitoxin grenade"
	desc = "A smoke grenade containing highly toxin saxitoxin, those who breathe the smoke will suffer burn, toxin, and brain damage."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "saxitoxin"
	base_icon_state = "saxitoxin"
	stage = GRENADE_READY
	can_dismantle = FALSE

/obj/item/grenade/chem_grenade/saxitoxin/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/cup/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/potassium, 15)
	B1.reagents.add_reagent(/datum/reagent/consumable/sugar, 15)
	B1.reagents.add_reagent(/datum/reagent/toxin/saxitoxin, 65)
	B2.reagents.add_reagent(/datum/reagent/phosphorus, 15)
	B2.reagents.add_reagent(/datum/reagent/toxin/saxitoxin, 80)

	beakers += B1
	beakers += B2
