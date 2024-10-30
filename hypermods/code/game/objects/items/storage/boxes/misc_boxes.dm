/obj/item/storage/box/lights/mixed/radiation/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/light/tube/radiation(src)
	for(var/i in 1 to 6)
		new /obj/item/light/bulb/radiation(src)

/obj/item/storage/box/randomjunk
	name = "Random Junk Package"

/obj/item/storage/box/randomjunk/PopulateContents()
	new /obj/effect/spawner/random/maintenance/eight(src)

/obj/item/storage/box/randomextractfull
	name = "extract box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "box"
	illustration = "extract"
	desc = "The label on this box was damaged."

/obj/item/storage/box/randomextractfull/PopulateContents()
	new /obj/item/slime_extract/grey(src)
	new /obj/item/slime_extract/gold(src)
	new /obj/item/slime_extract/silver(src)
	new /obj/item/slime_extract/metal(src)
	new /obj/item/slime_extract/purple(src)
	new /obj/item/slime_extract/darkpurple(src)
	new /obj/item/slime_extract/orange(src)
	new /obj/item/slime_extract/yellow(src)
	new /obj/item/slime_extract/red(src)
	new /obj/item/slime_extract/blue(src)
	new /obj/item/slime_extract/darkblue(src)
	new /obj/item/slime_extract/pink(src)
	new /obj/item/slime_extract/green(src)
	new /obj/item/slime_extract/lightpink(src)
	new /obj/item/slime_extract/black(src)
	new /obj/item/slime_extract/oil(src)
	new /obj/item/slime_extract/adamantine(src)
	new /obj/item/slime_extract/bluespace(src)
	new /obj/item/slime_extract/pyrite(src)
	new /obj/item/slime_extract/cerulean(src)
	new /obj/item/slime_extract/sepia(src)
	new /obj/item/slime_extract/rainbow(src)

/obj/item/storage/box/randomextract
	name = "extract box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "box"
	illustration = "extract"
	desc = "The label on this box was damaged."

/obj/item/storage/box/randomextract/PopulateContents()
	var/list/types = subtypesof(/obj/item/slime_extract/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/randomextractcross
	name = "slimecross box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "box"
	illustration = "extract"
	desc = "The label on this box was greatly damaged."

/obj/item/storage/box/randomextractcross/PopulateContents()
	var/list/types = subtypesof(/obj/item/slimecross/)
	for(var/i in 1 to 1)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/randomcyberneticimplants
	name = "cybernetic implant box"
	desc = "It's a cardboard box with a tag labeled 'Cyberimp inc'."

/obj/item/storage/box/randomcyberneticimplants/PopulateContents()
	var/list/item_list = list(
		/obj/item/organ/cyberimp/arm/toolset,
		/obj/item/organ/cyberimp/eyes/hud/diagnostic,
		/obj/item/organ/cyberimp/chest/nutriment/plus,
		/obj/item/organ/cyberimp/chest/reviver,
		/obj/item/organ/cyberimp/arm/surgery,
		/obj/item/organ/eyes/robotic/shield,
		/obj/item/organ/eyes/robotic/xray,
		/obj/item/organ/eyes/robotic/glow,
		/obj/item/organ/cyberimp/leg/jumpboots,
		/obj/item/organ/cyberimp/chest/thrusters,
		/obj/item/organ/cyberimp/eyes/hud/diagnostic,
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/eyes/hud/medical,
		/obj/item/organ/cyberimp/brain/anti_stun,
		/obj/item/organ/cyberimp/brain/anti_drop,
		/obj/item/organ/cyberimp/mouth/breathing_tube,
		/obj/item/organ/cyberimp/leg/magboot,
		/obj/item/organ/cyberimp/chest/nutriment,
		/obj/item/organ/cyberimp/leg/galosh
	)

	for(var/i in 1 to 2)
		var/item = pick(item_list)
		new item(src)


/obj/item/storage/box/spongecapsules
	name = "sponge capsule box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "spongecapsules"
	desc = "The instructions of the back read 'WARNING, DO NOT EXPOSE TO WATER UNLESS YOU HAVE A DEATH WISH'."

/obj/item/storage/box/spongecapsules/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/food/monkeycube/biosponge(src)


/obj/item/storage/box/syndie_kit/tapepackage
	name = "box of tape"
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "tape"

/obj/item/storage/box/syndie_kit/tapepackage/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)

/obj/item/storage/box/syndie_kit/tapepackage/PopulateContents()
	new /obj/item/stack/sticky_tape/pointy/super(src)
	new /obj/item/stack/sticky_tape/pointy(src)
	new /obj/item/stack/sticky_tape/super(src)
	new /obj/item/stack/sticky_tape(src)
