/obj/item/storage/box/syndie_kit/flamethrower_bundle/PopulateContents()
	new /obj/item/flamethrower/full(src)
	for(var/i in 1 to 3)
		new /obj/item/tank/internals/plasma(src)
	for(var/i in 1 to 3)
		new /obj/item/grenade/chem_grenade/incendiary(src)

/obj/item/storage/box/syndie_kit/stripperclips/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/ammo_box/strilka310(src)

/obj/item/storage/harpoon_quiver
	name = "quiver"
	desc = "A quiver for holding harpoons."
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	slot_flags = ITEM_SLOT_POCKETS
	icon_state = "quiver"
	inhand_icon_state = "quiver"

/obj/item/storage/harpoon_quiver/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 27
	atom_storage.set_holdable(list(
		/obj/item/ammo_casing/harpoon,
	))

/obj/item/storage/harpoon_quiver/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/harpoon(src)

/obj/item/storage/box/syndie_kit/pistolammo9mm/random
	name = "random 9mm magazine box"

/obj/item/storage/box/syndie_kit/pistolammo9mm/random/PopulateContents()
	var/list/item_list = list(
		/obj/item/ammo_box/magazine/m9mm,
		/obj/item/ammo_box/magazine/m9mm/ap,
		/obj/item/ammo_box/magazine/m9mm/hp,
		/obj/item/ammo_box/magazine/m9mm/fire,
		/obj/item/ammo_box/magazine/m9mm/caseless,
		/obj/item/ammo_box/magazine/m9mm/emp,
		/obj/item/ammo_box/magazine/m9mm/sp,
		/obj/item/ammo_box/magazine/m9mm/cryo,
		/obj/item/ammo_box/magazine/m9mm/richochet,
		/obj/item/ammo_box/magazine/m9mm/bomb,
		/obj/item/ammo_box/magazine/m9mm/sonic,
		/obj/item/ammo_box/magazine/m9mm/mutate
	)

	for(var/i in 1 to 3)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/pistol9mmammo
	name = "9mm magazine box"

/obj/item/storage/box/syndie_kit/pistol9mmammo/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m9mm(src)

/obj/item/storage/box/syndie_kit/pistol9mmsleepyammo
	name = "9mm soporific magazine box"

/obj/item/storage/box/syndie_kit/pistol9mmsleepyammo/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m9mm/sp(src)

/obj/item/storage/box/syndie_kit/pistolammo10mm/random
	name = "random 10mm magazine box"

/obj/item/storage/box/syndie_kit/pistolammo10mm/random/PopulateContents()
	var/list/item_list = list(
		/obj/item/ammo_box/magazine/m10mm,
		/obj/item/ammo_box/magazine/m10mm/cs,
		/obj/item/ammo_box/magazine/m10mm/sp,
		/obj/item/ammo_box/magazine/m10mm/ap,
		/obj/item/ammo_box/magazine/m10mm/hp,
		/obj/item/ammo_box/magazine/m10mm/fire,
		/obj/item/ammo_box/magazine/m10mm/emp,
		/obj/item/ammo_box/magazine/m10mm/bleedout,
		/obj/item/ammo_box/magazine/m10mm/rad,
		/obj/item/ammo_box/magazine/m10mm/fragment
	)

	for(var/i in 1 to 3)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/pistol10mmammo
	name = "10mm magazine box"

/obj/item/storage/box/syndie_kit/pistol10mmammo/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m10mm(src)

/obj/item/storage/box/syndie_kit/pistolcaselessammo
	name = "10mm caseless magazine box"

/obj/item/storage/box/syndie_kit/pistolcaselessammo/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m10mm/cs(src)

/obj/item/storage/box/syndie_kit/pistolsleepyammo
	name = "10mm soporific magazine box"

/obj/item/storage/box/syndie_kit/pistolsleepyammo/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m10mm/sp(src)

/obj/item/storage/box/syndie_kit/pistolammo45/random
	name = "random .45 magazine box"

/obj/item/storage/box/syndie_kit/pistolammo45/random/PopulateContents()
	var/list/item_list = list(
		/obj/item/ammo_box/magazine/m45,
		/obj/item/ammo_box/magazine/m45/cs,
		/obj/item/ammo_box/magazine/m45/sp,
		/obj/item/ammo_box/magazine/m45/ap,
		/obj/item/ammo_box/magazine/m45/hp,
		/obj/item/ammo_box/magazine/m45/inc,
		/obj/item/ammo_box/magazine/m45/emp,
		/obj/item/ammo_box/magazine/m45/venom,
		/obj/item/ammo_box/magazine/m45/pacify,
		/obj/item/ammo_box/magazine/m45/delay,
		/obj/item/ammo_box/magazine/m45/tranq
	)

	for(var/i in 1 to 3)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/fourtyfivemmmagbox/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m45(src)

/obj/item/storage/box/syndie_kit/fourtyfivemmmagboxcs/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m45/cs(src)

/obj/item/storage/box/syndie_kit/fourtyfivemmmagboxsp/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/m45/sp(src)

/obj/item/storage/box/syndie_kit/revolverammo/random
	name = "random .357 speed loader box"

/obj/item/storage/box/syndie_kit/revolverammo/random/PopulateContents()
	var/list/item_list = list(
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/a357/ironfeather,
		/obj/item/ammo_box/a357/nutcracker,
		/obj/item/ammo_box/a357/metalshock,
		/obj/item/ammo_box/a357/heartpiercer,
		/obj/item/ammo_box/a357/wallstake
	)

	for(var/i in 1 to 2)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/revolvershotgunammo
	name = ".357 Ironfeather speed loader box"

/obj/item/storage/box/syndie_kit/revolvershotgunammo/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/a357/ironfeather(src)

/obj/item/storage/box/syndie_kit/stripperclips/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/ammo_box/strilka310(src)

/obj/item/storage/box/syndie_kit/deagleammo/random
	name = "random .50 AE magazine box"

/obj/item/storage/box/syndie_kit/deagleammo/random/PopulateContents()
	var/list/item_list = list(
		/obj/item/ammo_box/magazine/m50,
		/obj/item/ammo_box/magazine/m50/ap,
		/obj/item/ammo_box/magazine/m50/hp,
		/obj/item/ammo_box/magazine/m50/inc,
		/obj/item/ammo_box/magazine/m50/cs,
		/obj/item/ammo_box/magazine/m50/emp,
		/obj/item/ammo_box/magazine/m50/hi,
		/obj/item/ammo_box/magazine/m50/demo,
		/obj/item/ammo_box/magazine/m50/rod,
		/obj/item/ammo_box/magazine/m50/bomb,
		/obj/item/ammo_box/magazine/m50/rep
	)

	for(var/i in 1 to 2)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/bioterrorammo/PopulateContents()
	new /obj/item/reagent_containers/cup/beaker/large/polonium(src)
	new /obj/item/reagent_containers/cup/beaker/large/venom(src)
	new /obj/item/reagent_containers/cup/beaker/large/fentanyl(src)
	new /obj/item/reagent_containers/cup/beaker/large/formaldehyde(src)
	new /obj/item/reagent_containers/cup/beaker/large/spewium(src)
	new /obj/item/reagent_containers/cup/beaker/large/cyanide(src)
	new /obj/item/reagent_containers/cup/beaker/large/histamine(src)
	new /obj/item/reagent_containers/cup/beaker/large/initropidril(src)
	new /obj/item/reagent_containers/cup/beaker/large/pancuronium(src)
	new /obj/item/reagent_containers/cup/beaker/large/sodium_thiopental(src)
	new /obj/item/reagent_containers/cup/beaker/large/coniine(src)
	new /obj/item/reagent_containers/cup/beaker/large/curare(src)
	new /obj/item/reagent_containers/cup/beaker/large/amanitin(src)
	new /obj/item/reagent_containers/cup/beaker/large/condensedcapsaicin(src)

/obj/item/storage/box/syndie_kit/bioterrorammodeluxe/PopulateContents()
	new /obj/item/reagent_containers/cup/beaker/large/polonium(src)
	new /obj/item/reagent_containers/cup/beaker/large/venom(src)
	new /obj/item/reagent_containers/cup/beaker/large/fentanyl(src)
	new /obj/item/reagent_containers/cup/beaker/large/formaldehyde(src)
	new /obj/item/reagent_containers/cup/beaker/large/spewium(src)
	new /obj/item/reagent_containers/cup/beaker/large/cyanide(src)
	new /obj/item/reagent_containers/cup/beaker/large/histamine(src)
	new /obj/item/reagent_containers/cup/beaker/large/initropidril(src)
	new /obj/item/reagent_containers/cup/beaker/large/pancuronium(src)
	new /obj/item/reagent_containers/cup/beaker/large/sodium_thiopental(src)
	new /obj/item/reagent_containers/cup/beaker/large/coniine(src)
	new /obj/item/reagent_containers/cup/beaker/large/curare(src)
	new /obj/item/reagent_containers/cup/beaker/large/amanitin(src)
	new /obj/item/reagent_containers/cup/beaker/large/condensedcapsaicin(src)
	new /obj/item/reagent_containers/cup/beaker/large/amatoxin(src)
	new /obj/item/reagent_containers/cup/beaker/large/lexorin(src)
	new /obj/item/reagent_containers/cup/beaker/large/slimejelly(src)
	new /obj/item/reagent_containers/cup/beaker/large/spore_burning(src)
	new /obj/item/reagent_containers/cup/beaker/large/mutetoxin(src)
	new /obj/item/reagent_containers/cup/beaker/large/staminatoxin(src)
	new /obj/item/reagent_containers/cup/beaker/large/sulfonal(src)
	new /obj/item/reagent_containers/cup/beaker/large/lipolicide(src)
	new /obj/item/reagent_containers/cup/beaker/large/heparin(src)
	new /obj/item/reagent_containers/cup/beaker/large/rotatium(src)
	new /obj/item/reagent_containers/cup/beaker/large/anacea(src)
	new /obj/item/reagent_containers/cup/beaker/large/acid(src)
	new /obj/item/reagent_containers/cup/beaker/large/fluacid(src)
	new /obj/item/reagent_containers/cup/beaker/large/nitracid(src)
	new /obj/item/reagent_containers/cup/beaker/large/delayed(src)
	new /obj/item/reagent_containers/cup/beaker/large/bungotoxin(src)
	new /obj/item/reagent_containers/cup/beaker/large/leadacetate(src)
	new /obj/item/reagent_containers/cup/beaker/large/teslium(src)

/obj/item/storage/box/syndie_kit/trappeddisks/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/computer_disk/black_market/trap(src)

/obj/item/storage/box/syndie_kit/molotovs/PopulateContents()
	new /obj/item/lighter(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/ethanol(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/fuel(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/clf3(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/phlogiston(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/napalm(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/hellwater(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/plasma(src)
	new /obj/item/reagent_containers/cup/glass/bottle/molotov/spore_burning(src)

/obj/item/storage/box/syndie_kit/syndirigcells/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/stock_parts/power_store/cell/bluespace/syndirig(src)

/obj/item/storage/box/lights/mixed/syndirigged
	name = "box of replacement lights"
	illustration = "lightmixed"

/obj/item/storage/box/lights/mixed/syndirigged/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/light/tube/syndirig(src)
	for(var/i in 1 to 7)
		new /obj/item/light/bulb/syndirig(src)

/obj/item/storage/box/syndie_kit/explosivemines/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/deployablemine/explosive(src)

/obj/item/storage/box/syndie_kit/stunmine/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/deployablemine/stun(src)

/obj/item/storage/box/syndie_kit/heavymine/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/deployablemine/heavy(src)

/obj/item/storage/box/syndie_kit/plasmafiremine/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/deployablemine/plasma(src)

/obj/item/storage/box/syndie_kit/sleepymine/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/deployablemine/sleepy(src)

/obj/item/storage/box/syndie_kit/thievesgloves/PopulateContents()
	new /obj/item/clothing/gloves/chameleon/thiefgloves(src)
	new /obj/item/screwdriver(src)
	new /obj/item/multitool(src)
	new /obj/item/crowbar(src)

/obj/item/storage/box/syndie_kit/trackingimplants/PopulateContents()
	new /obj/item/implanter/stealthimplanter/tracking(src)
	for(var/i in 1 to 5)
		new /obj/item/implantcase/tracking/syndicate(src)

/obj/item/storage/box/syndie_kit/syndiekeys/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/encryptionkey/syndicate(src)

/obj/item/storage/box/syndie_kit/launchpadcamerabundle/PopulateContents()
	new /obj/item/stack/sheet/iron/ten(src)
	new /obj/item/stack/sheet/iron/five(src)
	for(var/i in 1 to 4)
		new /obj/item/stack/sheet/glass(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/circuitboard/computer/launchpad_console(src)
	new /obj/item/circuitboard/machine/launchpad(src)
	new /obj/item/circuitboard/computer/advanced_camera(src)
	new /obj/item/stock_parts/servo/femto(src)
	new /obj/item/stack/ore/bluespace_crystal(src)
	new /obj/item/wrench(src)
	new /obj/item/screwdriver(src)
	new /obj/item/multitool(src)

/obj/item/storage/box/syndie_kit/spininverters/PopulateContents()
	new /obj/item/swapper(src)
	new /obj/item/swapper(src)

/obj/item/storage/box/syndie_kit/syndifulton/PopulateContents()
	new /obj/item/book/granter/crafting_recipe/syndifultons(src)
	for(var/i in 1 to 2)
		new /obj/item/extraction_pack/non_contractor(src)
	for(var/i in 1 to 2)
		new /obj/item/fulton_core/syndicate(src)

/obj/item/storage/box/syndie_kit/restore_nanite_kit/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/hypospray/medipen/restorationnaniteinjector(src)

/obj/item/storage/bag/chemistry/syndimedipens/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/combatmedicine(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/cardiaccs(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/bloodlosscs(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/lifesupportcs(src)

/obj/item/storage/bag/chemistry/syndimedipens/deluxe/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/hypospray/medipen/combatmedicine(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/cardiaccs(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/bloodlosscs(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/lifesupportcs(src)

/obj/item/storage/box/syndie_kit/chefchemicals/PopulateContents()
	new /obj/item/reagent_containers/cup/bottle/fentanyl(src)
	new /obj/item/reagent_containers/cup/bottle/fentanyl(src)
	new /obj/item/reagent_containers/cup/bottle/cyanide(src)
	new /obj/item/reagent_containers/cup/bottle/cyanide(src)
	new /obj/item/reagent_containers/cup/bottle/coniine(src)
	new /obj/item/reagent_containers/cup/bottle/coniine(src)
	new /obj/item/reagent_containers/cup/bottle/amanitin(src)
	new /obj/item/reagent_containers/cup/bottle/amanitin(src)

/obj/item/storage/bag/plants/syndie
	name = "plant bag"

/obj/item/storage/bag/plants/syndie/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 100
	atom_storage.max_slots = 100
	atom_storage.set_holdable(list(
		/obj/item/food/grown,
		/obj/item/graft,
		/obj/item/grown,
		/obj/item/food/honeycomb,
		/obj/item/seeds,
	))

/obj/item/storage/bag/plants/syndie/PopulateContents()
	new /obj/item/food/grown/nettle/death(src)
	new /obj/item/food/grown/berries/poison(src)
	new /obj/item/food/grown/berries/death(src)
	new /obj/item/food/grown/cannabis/death(src)
	new /obj/item/food/grown/banana/mime(src)
	new /obj/item/food/grown/banana/bluespace(src)
	new /obj/item/food/grown/firelemon(src)
	new /obj/item/food/grown/bungofruit(src)
	new /obj/item/food/grown/mushroom/angel(src)
	new /obj/item/food/grown/tomato/killer(src)
	new /obj/item/seeds/replicapod(src)

/obj/item/storage/bag/plants/bluespace
	name = "plant bag"

/obj/item/storage/bag/plants/bluespace/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 999
	atom_storage.max_slots = 999
	atom_storage.set_holdable(list(
		/obj/item/food/grown,
		/obj/item/graft,
		/obj/item/grown,
		/obj/item/food/honeycomb,
		/obj/item/seeds,
	))

/obj/item/storage/box/syndie_kit/two_freedom_implant_bundle/PopulateContents()
	new /obj/item/implanter/freedom(src)
	new /obj/item/implanter/freedom(src)

/obj/item/storage/box/syndie_kit/syndie_relief_bundle/PopulateContents()
	new /obj/item/stack/telecrystal/five(src)
	new /obj/item/stack/telecrystal/five(src)

/obj/item/storage/box/syndie_kit/bluespace_crystal_arti_bundle/PopulateContents()
	for(var/i in 1 to 20)
		new /obj/item/stack/ore/bluespace_crystal/artificial(src)

/obj/item/storage/box/syndie_kit/escapist_bundle/PopulateContents()
	new /obj/item/storage/box/syndie_kit/chameleon(src)
	new /obj/item/card/id/advanced/chameleon(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/clothing/glasses/thermal/syndi(src)
	new /obj/item/implanter/uplink(src)
	new /obj/item/pen/edagger(src)
	for(var/i in 1 to 4)
		new /obj/item/grenade/c4(src)

/obj/item/storage/backpack/duffelbag/clown/cream_pie/syndicate/PopulateContents()
	for(var/i in 1 to 20)
		new /obj/item/food/pie/cream(src)

/obj/item/storage/box/syndie_kit/holy_healing_bundle/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/cup/bottle/omnizine(src)
	new /obj/item/reagent_containers/cup/bottle/mutagen(src)

/obj/item/storage/box/syndie_kit/burning_extract_bundle/PopulateContents()
	new /obj/item/slimecross/burning/yellow(src)
	new /obj/item/slimecross/burning/metal(src)
	new /obj/item/slimecross/burning/gold(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/syringe(src)
	var/list/types = subtypesof(/obj/item/slimecross/burning/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/charged_extract_bundle/PopulateContents()
	new /obj/item/slimecross/charged/darkblue(src)
	new /obj/item/slimecross/charged/red(src)
	new /obj/item/slimecross/charged/green(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/syringe(src)
	var/list/types = subtypesof(/obj/item/slimecross/charged/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/chilling_extract_bundle/PopulateContents()
	new /obj/item/slimecross/chilling/metal(src)
	new /obj/item/slimecross/chilling/darkblue(src)
	new /obj/item/slimecross/chilling/bluespace(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/syringe(src)
	var/list/types = subtypesof(/obj/item/slimecross/chilling/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/consuming_extract_bundle/PopulateContents()
	new /obj/item/slimecross/consuming/purple(src)
	new /obj/item/slimecross/consuming/metal(src)
	new /obj/item/slimecross/consuming/oil(src)
	var/list/types = subtypesof(/obj/item/slimecross/consuming/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/industrial_extract_bundle/PopulateContents()
	new /obj/item/slimecross/industrial/purple(src)
	new /obj/item/slimecross/industrial/gold(src)
	new /obj/item/slimecross/industrial/pink(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/syringe(src)
	var/list/types = subtypesof(/obj/item/slimecross/industrial/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/regenerative_extract_bundle/PopulateContents()
	new /obj/item/slimecross/regenerative/purple(src)
	new /obj/item/slimecross/regenerative/sepia(src)
	new /obj/item/slimecross/regenerative/adamantine(src)
	var/list/types = subtypesof(/obj/item/slimecross/regenerative/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/stabilized_extract_bundle/PopulateContents()
	new /obj/item/slimecross/stabilized/purple(src)
	new /obj/item/slimecross/stabilized/bluespace(src)
	new /obj/item/slimecross/stabilized/adamantine(src)
	var/list/types = subtypesof(/obj/item/slimecross/stabilized/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/clown_trolling_security_bundle/PopulateContents()
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/glasses/sunglasses(src)

/obj/item/storage/box/syndie_kit/clown_stun_resist_bundle/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/cup/bottle/probital(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/cup/bottle/modafinil(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/cup/bottle/methamphetamine(src)

/obj/item/storage/box/syndie_kit/syndicate_virus_box/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/reagent_containers/cup/bottle/random_virus(src)
	new /obj/item/reagent_containers/cup/bottle/flu_virion(src)
	new /obj/item/reagent_containers/cup/bottle/cold(src)
	new /obj/item/reagent_containers/cup/bottle/fake_gbs(src)
	new /obj/item/reagent_containers/cup/bottle/magnitis(src)
	new /obj/item/reagent_containers/cup/bottle/pierrot_throat(src)
	new /obj/item/reagent_containers/cup/bottle/brainrot(src)
	new /obj/item/reagent_containers/cup/bottle/anxiety(src)
	new /obj/item/reagent_containers/cup/bottle/beesease(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/storage/box/beakers(src)
	new /obj/item/reagent_containers/cup/bottle/mutagen(src)


/obj/item/storage/box/syndie_kit/manifold_injector_bundle
	name = "Bundle of HMS Injectors"

/obj/item/storage/box/syndie_kit/manifold_injector_bundle/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/hypospray/medipen/manifoldinjector(src)


/obj/item/storage/box/syndie_kit/syndie_hypnotism_bundle/PopulateContents()
	new /obj/item/assembly/flash/hypnotic(src)
	new /obj/item/grenade/hypnotic(src)
	for(var/i in 1 to 5)
		new /obj/item/grenade/chem_grenade/mindbreaker(src)


/obj/item/storage/box/syndie_kit/lathe_supply_package
	name = "Lathe Supply Package"

/obj/item/storage/box/syndie_kit/lathe_supply_package/PopulateContents()
	new /obj/item/circuitboard/machine/autolathe(src)
	new /obj/item/circuitboard/machine/protolathe(src)
	for(var/i in 1 to 5)
		new /obj/item/stock_parts/matter_bin/bluespace(src)
	for(var/i in 1 to 3)
		new /obj/item/stock_parts/servo/femto(src)
	new /obj/item/stack/sheet/glass(src)
	new /obj/item/stack/sheet/iron/ten(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)


/obj/item/storage/box/syndie_kit/nocturine_deluxe/PopulateContents()
	new /obj/item/pen/sleepy(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/cup/bottle/nocturine/full(src)

/obj/item/storage/box/syndie_kit/helpful_barkeep_drinks/PopulateContents()
	new /obj/item/reagent_containers/cup/beaker/large/doctor_delight(src)
	new /obj/item/reagent_containers/cup/beaker/large/grey_bull(src)
	new /obj/item/reagent_containers/cup/beaker/large/cuba_libre(src)
	new /obj/item/reagent_containers/cup/beaker/large/screwdrivercocktail(src)
	new /obj/item/reagent_containers/cup/beaker/large/alexander(src)
	new /obj/item/reagent_containers/cup/beaker/large/bastion_bourbon(src)
	new /obj/item/reagent_containers/cup/beaker/large/bloody_mary(src)
	new /obj/item/reagent_containers/cup/beaker/large/brave_bull(src)
	new /obj/item/reagent_containers/cup/beaker/large/changelingsting(src)
	new /obj/item/reagent_containers/cup/beaker/large/demonsblood(src)
	new /obj/item/reagent_containers/cup/beaker/large/devilskiss(src)
	new /obj/item/reagent_containers/cup/beaker/large/hearty_punch(src)
	new /obj/item/reagent_containers/cup/beaker/large/the_juice(src)
	new /obj/item/reagent_containers/cup/beaker/large/neurotoxin(src)
	new /obj/item/reagent_containers/cup/beaker/large/turbo(src)

/obj/item/storage/box/syndie_kit/janitor_acidnade_bundle/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/grenade/chem_grenade/highacidfoam(src)
	new /obj/item/screwdriver(src)
	new /obj/item/wirecutters(src)
	for(var/i in 1 to 5)
		new /obj/item/assembly/prox_sensor(src)
	for(var/i in 1 to 6)
		new /obj/item/assembly/signaler(src)

/obj/item/storage/box/syndie_kit/janitor_bloodnade_bundle/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/grenade/chem_grenade/bloodyfoam(src)
	new /obj/item/screwdriver(src)
	new /obj/item/wirecutters(src)

/obj/item/storage/box/syndie_kit/bluespace_bodybag_bundle/PopulateContents()
	new /obj/item/bodybag/bluespace(src)
	new /obj/item/bodybag/bluespace(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/reagent_containers/cup/bottle/nocturine/full(src)


/obj/item/storage/box/syndie_kit/n2o_nade_bundle/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/chem_grenade/nofoam(src)

/obj/item/storage/box/syndie_kit/chemistry_machine_bundle/PopulateContents()
	new /obj/item/circuitboard/machine/chem_dispenser(src)
	new /obj/item/circuitboard/machine/chem_heater(src)
	new /obj/item/circuitboard/machine/chem_master(src)
	new /obj/item/circuitboard/machine/reagentgrinder(src)
	new /obj/item/stack/sheet/iron/twenty(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/stock_parts/micro_laser/quadultra(src)
	new /obj/item/stock_parts/capacitor/quadratic(src)
	for(var/i in 1 to 3)
		new /obj/item/stock_parts/servo/femto(src)
	for(var/i in 1 to 3)
		new /obj/item/stock_parts/matter_bin/bluespace(src)
	new /obj/item/stock_parts/power_store/cell/high(src)
	for(var/i in 1 to 3)
		new /obj/item/stack/sheet/glass(src)
	new /obj/item/reagent_containers/cup/beaker(src)
	new /obj/item/reagent_containers/cup/beaker(src)
	new /obj/item/wrench(src)
	new /obj/item/screwdriver(src)

/obj/item/storage/box/syndie_kit/xenobio_starter_kit/PopulateContents()
	new /obj/item/slimecross/industrial/grey(src)
	new /obj/item/reagent_containers/cup/bottle/plasma(src)
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/storage/box/monkeycubes(src)
	new /obj/item/storage/box/monkeycubes(src)

/obj/item/storage/box/syndie_kit/syndisauce/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/condiment/pack/syndicate(src)

/obj/item/storage/box/syndie_kit/killertomato/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/food/grown/tomato/killer(src)
	new /obj/item/seeds/tomato/killer(src)

/obj/item/storage/box/syndie_kit/stimulant_kit/PopulateContents()
	var/list/item_list = list(
		/obj/item/reagent_containers/hypospray/medipen/methamphetamine,
		/obj/item/reagent_containers/hypospray/medipen/stimulants,
		/obj/item/reagent_containers/hypospray/medipen/experistimulants,
		/obj/item/reagent_containers/hypospray/medipen/donkcostim,
		/obj/item/reagent_containers/hypospray/medipen/hyperzine,
		/obj/item/reagent_containers/hypospray/medipen/juggernaut
	)

	for(var/i in 1 to 5)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/syndiefirearmauth/PopulateContents()
	new /obj/item/implanter/weapons_auth(src)

/obj/item/storage/box/syndie_kit/adrenalineimplant/PopulateContents()
	new /obj/item/implanter/adrenalin(src)

/obj/item/storage/box/syndie_kit/regen_implant_box/PopulateContents()
	new /obj/item/autosurgeon/syndicate/reviver/hidden(src)
	new /obj/item/autosurgeon/syndicate/reviver/hidden(src)
	new /obj/item/autosurgeon/syndicate/reviver/hidden(src)

/obj/item/storage/box/syndie_kit/cybertoolsets/PopulateContents()
	new /obj/item/autosurgeon/syndicate/toolset/hidden/single_use(src)
	new /obj/item/autosurgeon/syndicate/surgery/hidden/single_use(src)

/obj/item/storage/box/syndie_kit/cyberlifesupport/PopulateContents()
	new /obj/item/autosurgeon/syndicate/nutrimentplus/hidden/single_use(src)
	new /obj/item/autosurgeon/syndicate/breathing_tube/hidden/single_use(src)

/obj/item/storage/box/syndie_kit/waspimplant/PopulateContents()
	new /obj/item/implanter/wasps(src)

/obj/item/storage/box/syndie_kit/waspimplantmacro/PopulateContents()
	new /obj/item/implanter/wasps/macro(src)

/obj/item/storage/box/syndie_kit/teslaimplant/PopulateContents()
	new /obj/item/implanter/tesla(src)

/obj/item/storage/box/syndie_kit/teslaimplantmacro/PopulateContents()
	new /obj/item/implanter/tesla/macro(src)

/obj/item/storage/box/syndie_kit/chem_storage_implant_bundle/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/implantcase/syndiechem(src)
	new /obj/item/implanter(src)
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/cup/beaker(src)

/obj/item/storage/box/syndie_kit/chem_storage_implant/PopulateContents()
	new /obj/item/implantcase/syndiechem(src)
	new /obj/item/implanter(src)
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/cup/beaker(src)

/obj/item/storage/box/syndie_kit/krav_maga/PopulateContents()
	new /obj/item/implanter/krav_maga(src)

/obj/item/storage/box/syndie_kit/emp_shield/PopulateContents()
	new /obj/item/implanter/empshield(src)

/obj/item/storage/box/syndie_kit/riggedglowsticks/PopulateContents()
	var/list/types = subtypesof(/obj/item/flashlight/syndirig/glowstick/)
	for(var/i in 1 to 6)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/syndie_kit/riggedplushies/PopulateContents()
	var/list/item_list = list(
		/obj/item/deployablemine/explosive/mothplushie,
		/obj/item/deployablemine/explosive/lizardplushie,
		/obj/item/deployablemine/explosive/carpplushie,
		/obj/item/deployablemine/explosive/bubbleplush,
		/obj/item/deployablemine/explosive/plushvar,
		/obj/item/deployablemine/explosive/narplush,
		/obj/item/deployablemine/explosive/nukeplushie,
		/obj/item/deployablemine/explosive/slimeplushie
	)

	for(var/i in 1 to 6)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/piratekit
	name = "Pirate Kit"

/obj/item/storage/box/syndie_kit/piratekit/PopulateContents()
	new /obj/item/gun/ballistic/handcannon/syndicate(src)
	for(var/i in 1 to 4)
		new /obj/item/ammo_casing/caseless/cannonball(src)
	new /obj/item/book/granter/crafting_recipe/syndipiratemanual(src)

/obj/item/storage/box/syndie_kit/riggedglitterbombs
	name = "Box of Explosive Glitterbombs"

/obj/item/storage/box/syndie_kit/riggedglitterbombs/PopulateContents()
	var/list/item_list = list(
		/obj/item/grenade/chem_grenade/pyro/explosive/pinkglitter,
		/obj/item/grenade/chem_grenade/pyro/explosive/blueglitter,
		/obj/item/grenade/chem_grenade/pyro/explosive/whiteglitter
	)

	for(var/i in 1 to 5)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/boxed_dehydrated_carp/PopulateContents()
	for(var/i in 1 to 8)
		new /obj/item/toy/plush/carpplushie/dehy_carp(src)

/obj/item/storage/box/syndie_kit/stealthmicrobomb/PopulateContents()
	new /obj/item/implanter/stealthimplanter/explosive(src)

/obj/item/storage/box/syndie_kit/goloudbundle
	name = "NT-Annihilation 'Go Loud' Kit"

/obj/item/storage/box/syndie_kit/goloudbundle/PopulateContents()
	new /obj/item/stack/telecrystal/five(src)
	new /obj/item/stack/telecrystal/five(src)
	new /obj/item/stack/telecrystal/five(src)
	new /obj/item/pen/edagger(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)

/obj/item/storage/box/syndie_kit/smugglednades/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/mail/traitor/mail_strike(src)

/obj/item/storage/box/syndie_kit/xeno_organ_kit/PopulateContents()
	new /obj/item/organ/internal/alien/plasmavessel(src)
	new /obj/item/organ/internal/alien/resinspinner(src)
	new /obj/item/organ/internal/alien/acid(src)

/obj/item/storage/box/syndie_kit/construction_bundle/PopulateContents()
	new /obj/item/stack/sheet/iron/fifty(src)
	new /obj/item/stack/sheet/iron/fifty(src)
	new /obj/item/stack/sheet/glass/fifty(src)
	new /obj/item/stack/sheet/glass/fifty(src)
	new /obj/item/stack/sheet/plasteel/fifty(src)
	new /obj/item/stack/sheet/plasteel/fifty(src)

/obj/item/storage/box/syndie_kit/syndie_inducer_bundle/PopulateContents()
	new /obj/item/inducer/syndicate(src)
	for(var/i in 1 to 3)
		new /obj/item/stock_parts/power_store/cell/hyper(src)
	new /obj/item/screwdriver(src)

/obj/item/storage/backpack/duffelbag/syndie/operativeclothes/PopulateContents()
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/under/syndicate/skirt(src)

/obj/item/storage/box/syndie_kit/synditoykit
	name = "syndicate snack box"
	desc = "A single cardboard box designed to hold various snacks. Loved by syndicate agents everywhere."
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "nukietoy"

/obj/item/storage/box/syndie_kit/synditoykit/PopulateContents()
	new /obj/item/reagent_containers/cup/soda_cans/robust_nukie(src)
	new /obj/item/food/syndicake(src)

	var/list/foodtypes = subtypesof(/obj/item/food/)
	for(var/i in 1 to 4)
		var/foodtype = pick(foodtypes)
		new foodtype(src)

	var/list/drinktypes = (subtypesof(/obj/item/reagent_containers/cup/glass/bottle/) | subtypesof(/obj/item/reagent_containers/cup/soda_cans/))
	for(var/i in 1 to 1)
		var/drinktype = pick(drinktypes)
		new drinktype(src)

/obj/item/storage/box/syndie_kit/scramimplant/PopulateContents()
	new /obj/item/implanter/scram(src)

/obj/item/storage/box/syndie_kit/throwingknives
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "knives"

/obj/item/storage/box/syndie_kit/throwingknives/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/knife/throwing(src)

/obj/item/storage/box/syndie_kit/modsuitmodbundle
	name = "MODsuit module box"

/obj/item/storage/box/syndie_kit/modsuitmodbundle/PopulateContents()
	var/list/item_list = list(
		/obj/item/mod/module/visor/thermal,
		/obj/item/mod/module/visor/night,
		/obj/item/mod/module/chameleon,
		/obj/item/mod/module/plate_compression,
		/obj/item/mod/module/noslip,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/stealth/wraith,
		/obj/item/mod/module/flamethrower,
		///obj/item/mod/module/springlock/disguised, // Probably best to leave this one out.
		/obj/item/mod/module/synditeleporter,
		/obj/item/mod/module/antigrav,
		/obj/item/mod/module/power_kick/syndicate,
		/obj/item/mod/module/demoralizer,
		/obj/item/mod/module/welding/camera_vision,
		/obj/item/mod/module/rad_protection,
		/obj/item/mod/module/storage/bluespace,
		/obj/item/mod/module/mouthhole, // I'm keeping this one cuz it's nice to have.
		/obj/item/mod/module/emp_shield/pulse,
		/obj/item/mod/module/dispenser/mirage,
		/obj/item/mod/module/dispenser/frag,
		/obj/item/mod/module/joint_torsion/syndicate,
		/obj/item/mod/module/recycler/donk,
		/obj/item/mod/module/recycler/ammobox/c9mm,
		/obj/item/mod/module/recycler/ammobox/c45,
		/obj/item/mod/module/recycler/ammobox/a357,
		/obj/item/mod/module/recycler/ammobox/c10mm,
		/obj/item/mod/module/recycler/ammobox/m50,
		/obj/item/mod/module/stealth/syndicate,
		/obj/item/mod/module/hacker/electricpalm,
		/obj/item/mod/module/energy_net/syndicate,
		/obj/item/mod/module/adrenaline_boost/syndicate,
		/obj/item/mod/module/pepper_shoulders, // Not illegal, but i'm keeping it anyways.
		/obj/item/mod/module/projectile_dampener/syndicate,
		/obj/item/mod/module/active_sonar/syndicate,
		/obj/item/mod/module/shooting_assistant,
		/obj/item/mod/module/shove_blocker, // Not illegal, but i'm keeping it anyways.
		/obj/item/mod/module/death_sphere
	)

	for(var/i in 1 to 5)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/sniperammo_bundle
	name = ".50 BMG magazine box"
	desc = "A box full of .50 BMG magazines."

/obj/item/storage/box/syndie_kit/sniperammo_bundle/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/ammo_box/magazine/sniper_rounds(src)

/obj/item/storage/box/syndie_kit/collarbombs

/obj/item/storage/box/syndie_kit/collarbombs/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/clothing/neck/collar_bomb(src)
	new /obj/item/storage/box/syndie_kit/signaler(src)

/obj/item/storage/box/syndie_kit/drugpeddler
	name = "drug peddler kit"
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "druggie"

/obj/item/storage/box/syndie_kit/drugpeddler/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)

/obj/item/storage/box/syndie_kit/drugpeddler/PopulateContents()
	var/list/item_list = list(
		/obj/item/food/drug/moon_rock,
		/obj/item/food/drug/saturnx,
		/obj/item/reagent_containers/cup/blastoff_ampoule,
		/obj/item/reagent_containers/hypospray/medipen/morphine,
		/obj/item/reagent_containers/hypospray/medipen/pumpup,
		/obj/item/reagent_containers/pill/stimulant,
		/obj/item/reagent_containers/pill/zoom,
		/obj/item/reagent_containers/pill/happy,
		/obj/item/reagent_containers/pill/lsd,
		/obj/item/reagent_containers/pill/aranesp,
		/obj/item/reagent_containers/syringe/contraband/krokodil,
		/obj/item/reagent_containers/syringe/contraband/methamphetamine,
		/obj/item/reagent_containers/syringe/contraband/bath_salts,
		/obj/item/reagent_containers/syringe/contraband/fentanyl
	)

	for(var/i in 1 to 12)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/syndie_kit/chemicalsynth
	name = "chemical synthesis kit"
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "chemicals"

/obj/item/storage/box/syndie_kit/chemicalsynth/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)

/obj/item/storage/box/syndie_kit/chemicalsynth/PopulateContents()
	new /obj/item/reagent_containers/cup/beaker(src)
	new /obj/item/reagent_containers/cup/beaker(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/clothing/glasses/science/night(src)
	new /obj/item/reagent_containers/cup/tube/vestine(src)
	new /obj/item/reagent_containers/cup/tube/vestine(src)
	new /obj/item/reagent_containers/cup/tube(src)
	new /obj/item/reagent_containers/syringe/contraband/stimulants(src)


/obj/item/storage/box/syndie_kit/observe
	name = "observation kit"
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "observe"

/obj/item/storage/box/syndie_kit/observe/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)

/obj/item/storage/box/syndie_kit/observe/PopulateContents()
	new /obj/item/clothing/glasses/hud/medsechud/disguised(src)
	new /obj/item/implanter/stealthimplanter(src)

	var/datum/deathrattle_group/group = new

	var/implants = list()
	for(var/j in 1 to 3)
		var/obj/item/implantcase/deathrattle/case = new (src)
		implants += case.imp

	for(var/i in implants)
		group.register(i)
	desc += " The implants are registered to the \"[group.name]\" group."

	new /obj/item/implantcase/biosig/syndicate(src)
	new /obj/item/implantcase/biosig/syndicate(src)
	new /obj/item/implantcase/biosig/syndicate(src)
	new /obj/item/computer_disk/syndicate/observe(src)

/obj/item/storage/box/syndie_kit/disruptor
	name = "electrical disruptor kit"
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "disruptor"

/obj/item/storage/box/syndie_kit/disruptor/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)

/obj/item/storage/box/syndie_kit/disruptor/PopulateContents()
	new /obj/item/gun/energy/recharge/fisher(src)
	new /obj/item/grenade/empgrenade(src)
	new /obj/item/grenade/empgrenade(src)
	new /obj/item/implanter/emp(src)
	new /obj/item/implanter/tesla(src)
	new /obj/item/implanter/empshield(src)


/obj/item/storage/box/syndie_kit/romerol_plus/PopulateContents()
	new /obj/item/reagent_containers/cup/bottle/romerol(src)
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/dropper(src)

/obj/item/storage/box/syndie_kit/battle_royale_plus
	name = "rumble royale broadcast kit"
	desc = "Contains everything you need to host the galaxy's greatest show; Rumble Royale."

/obj/item/storage/box/syndie_kit/battle_royale_plus/PopulateContents()
	var/obj/item/royale_implanter/implanter = new(src)
	var/obj/item/royale_remote/remote = new(src)
	remote.link_implanter(implanter)
	new /obj/item/storage/box/itempack/sleeppen(src)
	new /obj/item/reagent_containers/cup/bottle/nocturine(src)

/obj/item/storage/box/syndie_kit/battlecruiser_plus
	name = "battlecruiser kit"

/obj/item/storage/box/syndie_kit/battlecruiser_plus/PopulateContents()
	new /obj/item/card/emag/battlecruiser(src)
	new /obj/item/storage/belt/military/assault/fisher(src)
	new /obj/item/encryptionkey/syndicate(src)

/obj/item/storage/box/syndie_kit/malf_plus
	name = "malf ai kit"

/obj/item/storage/box/syndie_kit/malf_plus/PopulateContents()
	new /obj/item/ai_module/malf(src)
	new /obj/item/encryptionkey/binary(src)

/obj/item/storage/box/syndie_kit/no_escape_plus
	name = "no escape kit"

/obj/item/storage/box/syndie_kit/no_escape_plus/PopulateContents()
	new /obj/item/sbeacondrop/no_escape(src)
	new /obj/item/inducer/syndicate(src)
	new /obj/item/wrench(src)
	new /obj/item/desynchronizer(src)

/obj/item/storage/box/syndie_kit/meteor_shield_plus
	name = "meteor shield hijacker kit"

/obj/item/storage/box/syndie_kit/meteor_shield_plus/PopulateContents()
	new /obj/item/card/emag/meteor_shield_recalibrator(src)
	new /obj/item/storage/box/syndie_kit/space(src)
	for(var/i in 1 to 11)
		new /obj/item/sbeacondrop/meteor_shield(src)

/obj/item/storage/box/syndie_kit/destabilizing_crystal_plus
	name = "crystal destabilizer kit"

/obj/item/storage/box/syndie_kit/destabilizing_crystal_plus/PopulateContents()
	new /obj/item/destabilizing_crystal(src)
	new /obj/item/clothing/shoes/magboots/syndie(src)
