/obj/item/melee/baton/donkbat
	name = "toy baseball bat"
	desc = "A colorful foam baseball bat. The label on the handle reads Donksoft. Feels...heavy."
	icon = 'hypermods/icons/obj/weapons/bat.dmi'
	icon_state = "baseball_bat_donk"
	inhand_icon_state = "baseball_bat_donk"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	force = 10
	stamina_damage = 40
	hitsound = 'hypermods/sound/weapons/bat_hit.ogg'
	on_stun_sound = 'hypermods/sound/weapons/bat_hit.ogg' // Grass grows, birds fly, sun shines, and brudda, i hurt people.
	on_stun_volume = 75

/obj/item/melee/baton/donkbat/toy
	force = 0
	stamina_damage = 4
	knockdown_time = 0 SECONDS


/obj/item/melee/baton/telescopic/sleep_baton
	name = "Incapacitation Baton"
	desc = "A compact, specialised baton once assigned to Syndicate contractors until being scrapped. The micro-injectors along the end will quickly inject knock-out drugs into targets."
	icon = 'icons/obj/weapons/baton.dmi'
	icon_state = "contractor_baton"
	worn_icon_state = "contractor_baton"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NONE
	force = 5
	stamina_damage = 45
	cooldown = 30 SECONDS
	affect_cyborg = FALSE
	on_stun_sound = 'sound/items/weapons/contractor_baton/contractorbatonhit.ogg'

	on_inhand_icon_state = "contractor_baton_on"
	on_sound = 'sound/items/weapons/contractorbatonextend.ogg'
	active_force = 16

/obj/item/melee/baton/telescopic/sleep_baton/additional_effects_non_cyborg(mob/living/target, mob/living/user)
	target.set_jitter_if_lower(20 SECONDS)
	target.set_stutter_if_lower(20 SECONDS)
	target.reagents.add_reagent(/datum/reagent/toxin/sodium_thiopental, 10)


/obj/item/melee/baton/security/antaglocked
	name = "stun baton"
	security_lock = TRUE

/obj/item/melee/baton/security/antaglocked/examine(mob/user)
	. = ..()
	if(security_lock)
		. += "This stun baton has a A.N.T.A.G Locker installed."

/obj/item/melee/baton/security/antaglocked/dropped()
	if(active)
		turn_off()

/obj/item/melee/baton/security/antaglocked/emag_act()
	if(security_lock)
		playsound(src, SFX_SPARKS, 15, TRUE)
		if(active)
			turn_off()
		security_lock = FALSE

/obj/item/antaglocker
	name = "A.N.T.A.G Lock"
	desc = "The Anti-Non-Trained-Assignee-Gate (or ANTAG) is an electronic upgrade for NT's stun baton design and various security equipment. \
			It connects directly to Nanotrasen's Security Database to verify the neural patterns of the user to prevent unauthorized usage of various equipment."
	icon = 'hypermods/icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "antaglocker"
	custom_price = PAYCHECK_COMMAND * 8


/datum/baton_skin
	var/name = "Baton Skin Name"
	var/author = "Author Name"
	var/rarity = 100 // the likelyhood of this skin being rolled
	var/icon = 'hypermods/icons/obj/weapons/baton.dmi'
	var/icon_state = "" // The icon state in baton.dmi for the skin
	var/rarity_name = "Greytide"
	var/rarity_hex = "baton_common"

/datum/baton_skin/camo
	name = "camo"
	author = "Dragonfruits"
	rarity = 100
	icon_state = "Camo"
	rarity_name = "Greytide"
	rarity_hex = "baton_common"

/datum/baton_skin/water
	name = "water"
	author = "Dragonfruits"
	rarity = 75
	icon_state = "Water"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"

/datum/baton_skin/carpscale
	name = "carpscale"
	author = "Dragonfruits"
	rarity = 75
	icon_state = "Carpscale"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"

/datum/baton_skin/durathread
	name = "durathread"
	author = "Dragonfruits"
	rarity = 75
	icon_state = "Durathread"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"

/datum/baton_skin/blood
	name = "blood"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "Blood"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/ornate
	name = "ornate"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "Ornate"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/donut
	name = "donut"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "Donut"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/lodsemone
	name = "lodesemone"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "Lodesemone"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/nanotrasen
	name = "Nanotrasen"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "NT"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/syndicate
	name = "Syndicate"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "Syndie"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/killer
	name = "killer tomato"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "Killer"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_skin/bluespace
	name = "bluespace"
	author = "Dragonfruits"
	rarity = 10
	icon_state = "Bluespace"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"

/datum/baton_skin/fade
	name = "fade"
	author = "Dragonfruits"
	rarity = 10
	icon_state = "Fade"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"

/datum/baton_skin/toolbox
	name = "toolbox"
	author = "Dragonfruits"
	rarity = 10
	icon_state = "Toolbox"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"

/datum/baton_skin/pneumatic
	name = "pneumatic"
	author = "Dragonfruits"
	rarity = 10
	icon_state = "Pneumatic"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"

/datum/baton_skin/donut
	name = "donut"
	author = "Dragonfruits"
	rarity = 5
	icon_state = "Donut"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/datum/baton_skin/plasma
	name = "plasma"
	author = "Dragonfruits"
	rarity = 5
	icon_state = "Plasma"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/datum/baton_skin/oldspess
	name = "spess"
	author = "Dragonfruits"
	rarity = 5
	icon_state = "Oldspess"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/datum/baton_skin/supermatter
	name = "supermatter"
	author = "Dragonfruits"
	rarity = 5
	icon_state = "Supermatter"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/datum/baton_skin/super_ultra_rare_all_blue_sprinkles_blue_gem_donuts
	name = "SUPER ULTRA RARE ALL BLUE SPRINKLES BLUE GEM DONUTS"
	author = "Dragonfruits"
	rarity = 1
	icon_state = "SUPER ULTRA RARE ALL BLUE SPRINKLES BLUE GEM DONUTS"
	rarity_name = "HoS's Own"
	rarity_hex = "baton_ancient"

/datum/baton_model
	var/name = "Baton Model Name"
	var/author = "Author Name"
	var/desc = "Baton Description Goes Here"
	var/rarity = 100 // the likelyhood of this skin being rolled
	var/icon = 'hypermods/icons/obj/weapons/baton.dmi'
	var/icon_state = "" // The icon state in baton.dmi for the skin
	var/rarity_name = "Greytide"
	var/rarity_hex = "baton_common"
	var/uses_active = FALSE // Does this baton have a different shape when active? Used for skin rendering.
	var/uses_shock_overlay = FALSE

/datum/baton_model/stun_baton
	name = "stun baton"
	author = "/tg/station development team"
	desc = "The classic, tried and true Stun Baton. Security forces have been using this model for decades. If it ain't broke, don't fix it."
	rarity = 100
	icon_state = "stunbaton"
	rarity_name = "Greytide"
	rarity_hex = "baton_common"

/datum/baton_model/classic_baton
	name = "classic baton"
	author = "/tg/station development team"
	desc = "A take on the classic wooden truncheon baton, but electrified to really hammer the point home."
	rarity = 75
	icon_state = "classic_baton_skin"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"

/datum/baton_model/telebaton
	name = "telebaton"
	author = "/tg/station development team"
	desc = "A collapsable telebaton, upgraded with electricity. Think heads of staff are spiffy with their telebatons? Now you can enjoy one too!"
	rarity = 75
	icon_state = "telebaton_skin"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"
	uses_active = TRUE

/datum/baton_model/blackjack_baton
	name = "blackjack baton"
	author = "INFRARED_BARON"
	desc = "A blackjack baton. Great for knocking out thieves, castle guards, and unobservant security officers."
	rarity = 75
	icon_state = "blackjack_baton"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"

/datum/baton_model/stun_paddle
	name = "stun paddle"
	author = "Dragonfruits"
	desc = "A large, flat paddle-baton. Developed for disciplining new officers during basic training, now used for disciplining assistants!"
	rarity = 50
	icon_state = "stun paddle"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_model/double_stun_baton
	name = "double-headed stun baton"
	author = "Dragonfruits"
	desc = "A double-headed stun baton. Fend off two assailants at once with this ingenious upgrade to the standard baton! After all, two officers are better than one."
	rarity = 50
	icon_state = "double stunbaton"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_model/baseball_bat
	name = "baseball bat-on"
	author = "/tg/station development team"
	desc = "A baseball bat-on. Who's on first, what's on second, greytider's on third!"
	rarity = 50
	icon_state = "baseball_bat"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_model/cat_baton
	name = "stun caton"
	author = "INFRARED_BARON"
	desc = "A stun caton. Built in poor taste as part of Nanotrasen's apology campaign to victims of the 2560 Cloning Incident, colloquially known as \"felinids\"."
	rarity = 50
	icon_state = "cat_baton"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_model/floppy_baton
	name = "floppy baton"
	author = "INFRARED_BARON"
	desc = "A rubberized floppy baton. This model went out of print years ago after the ill-fated attempt to make a baton that could be swung around a corner."
	rarity = 50
	icon_state = "floppy_baton"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_model/mace_baton
	name = "mace baton"
	author = "INFRARED_BARON"
	desc = "A mace baton. Favored by inquisition-qualified officers for smiting evildoers. A tag on the bottom says it's officially approved by the Chaplain."
	rarity = 50
	icon_state = "mace_baton"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_model/contractor_baton
	name = "contractor baton"
	author = "/tg/station development team"
	desc = "A collapsable electrified contractor baton. Any resemblance to the Syndicate Contractor Baton is purely coincidental. This is a wholly original product."
	rarity = 25
	icon_state = "contractor_baton_skin"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"
	uses_active = TRUE
	uses_shock_overlay = TRUE

/datum/baton_model/stunsword
	name = "stun sword"
	author = "NecromancerAnne"
	desc = "A stun sword. Great for detaining space dragons! Warranty void if used on a space dragon."
	rarity = 25
	icon_state = "stunsword"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"
	uses_active = TRUE

/datum/baton_model/butterfly_baton
	name = "butterfly baton"
	author = "Dragonfruits"
	desc = "A butterfly baton. Do all kinds of cool tricks, stun yourself by accident, say the baton is defective."
	rarity = 25
	icon_state = "butterfly baton"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"
	uses_active = TRUE

/datum/baton_model/flip_baton
	name = "flip baton"
	author = "Dragonfruits"
	desc = "A flip baton. Banned in five sectors for being too dangerous."
	rarity = 25
	icon_state = "flip baton"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"
	uses_active = TRUE

/datum/baton_model/stun_lance
	name = "stun lance"
	author = "Fury McFlurry"
	desc = "A stun lance. Great for jousting from SecWays!"
	rarity = 25
	icon_state = "shocklance"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"
	uses_shock_overlay = TRUE

/datum/baton_model/sturambit
	name = "sturambit"
	author = "Dragonfruits"
	desc = "A sturambit. One of the rarest models of baton. Brag about it to your friends!"
	rarity = 25
	icon_state = "sturambit"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/datum/baton_model/whip_baton
	name = "stun whip"
	author = "INFRARED_BARON"
	desc = "A stun whip. Used during the crusade against bloodsuckers and haemophilic entities, and is why they're extinct in the Spinward."
	rarity = 25
	icon_state = "whip_baton"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/datum/baton_model/stunbaton_4407
	name = "ancient stun baton"
	author = "Goonstation development team"
	desc = "Wow! Where'd you find this relic?"
	rarity = 1
	icon_state = "stunbaton_4407"
	rarity_name = "HoS's Own"
	rarity_hex = "baton_ancient"

/datum/baton_wear_n_tear
	var/name = "Wear Pattern"
	var/author = "Author Name"
	var/rarity = 100 // the likelyhood of this skin being rolled
	var/icon = 'hypermods/icons/obj/weapons/baton.dmi'
	var/icon_state = "" // The icon state in baton.dmi for the skin
	var/rarity_name = "Greytide"
	var/rarity_hex = "baton_common"

/datum/baton_wear_n_tear/robusted
	name = "robusted"
	author = "Dragonfruits"
	rarity = 75
	icon_state = "ROBUSTED"
	rarity_name = "Engineering-grade"
	rarity_hex = "baton_uncommon"

/datum/baton_wear_n_tear/space_tested
	name = "space-tested"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "SPACE TESTED"
	rarity_name = "ERT-spec"
	rarity_hex = "baton_rare"

/datum/baton_wear_n_tear/minimal_use
	name = "minimal use"
	author = "Dragonfruits"
	rarity = 50
	icon_state = "MINIMAL USE"
	rarity_name = "Deathsquad-issue"
	rarity_hex = "baton_mythical"

/datum/baton_wear_n_tear/factory_new
	name = "roundstart"
	author = "Dragonfruits"
	rarity = 25
	icon_state = "FACTORY NEW"
	rarity_name = "Robust"
	rarity_hex = "baton_legendary"

/obj/item/melee/baton/security/skin
	name = "debug baton"
	desc = "If you see this, ahelp."
	preload_cell_type = /obj/item/stock_parts/power_store/cell/high
	var/datum/baton_model/chosen_model
	var/datum/baton_skin/chosen_skin
	var/datum/baton_wear_n_tear/chosen_wear_n_tear
	var/list/possible_models = list()
	var/list/possible_skins = list()
	var/list/possible_wears = list()

/obj/item/melee/baton/security/skin/Initialize(mapload, datum/baton_model/model_to_use = null)
	. = ..()
	if(!length(possible_models))
		for(var/datum/baton_model/model as anything in subtypesof(/datum/baton_model))
			possible_models += list(initial(model.type) = initial(model.rarity))
	if(!length(possible_skins))
		for(var/datum/baton_skin/skin as anything in subtypesof(/datum/baton_skin))
			possible_skins += list(initial(skin.type) = initial(skin.rarity))
	if(!length(possible_wears))
		for(var/datum/baton_wear_n_tear/wear as anything in subtypesof(/datum/baton_wear_n_tear))
			possible_wears += list(initial(wear.type) = initial(wear.rarity))
	var/picked_model = model_to_use ? model_to_use : pick_weight(possible_models)
	var/picked_skin = pick_weight(possible_skins)
	var/picked_wear = pick_weight(possible_wears)
	chosen_model = new picked_model
	chosen_skin = new picked_skin
	chosen_wear_n_tear = new picked_wear
	name = "[chosen_wear_n_tear.name] [chosen_skin.name] [chosen_model.name]"
	desc = chosen_model.desc
	build_skin()
	update_appearance(UPDATE_ICON)

/obj/item/melee/baton/security/skin/get_name_chaser(mob/user, list/name_chaser)
	name_chaser += "Model Rarity: <span class = \"[chosen_model.rarity_hex]\">[chosen_model.rarity_name]</span>\n"
	name_chaser += "Skin Rarity: <span class = \"[chosen_skin.rarity_hex]\">[chosen_skin.rarity_name]</span>\n"
	name_chaser += "Wear Rarity: <span class = \"[chosen_wear_n_tear.rarity_hex]\">[chosen_wear_n_tear.rarity_name]</span>\n"
	name_chaser += "Model Author: [chosen_model.author]\n"
	name_chaser += "Skin Author: [chosen_skin.author]\n"
	name_chaser += "Wear Author: [chosen_wear_n_tear.author]\n"
	return name_chaser

/obj/item/melee/baton/security/skin/proc/build_skin()
	/* ORDER OF OPERATIONS
	   1. Take baton model chosen.
	   2. Use Mask against inactive baton to make inactive mask.
	   3. Use Mask against active baton to make active mask.
	   4. Take baton skin chosen.
	   5. Use Mask against skin to cut out skin from mask.
	   6. Take wear and tear.
	   7. Use wear and tear against skin to cut out damage from skin.
	   8. Blend finalized skin against inactive baton.
	   9. Blend finalized skin against active baton.
	   10. Set to variables on baton, used in update icon as overlay.
	   This should produce a nice looking skin on the baton that takes in the visual details of the baton, the skin, and the wear/tear.
	*/
	var/icon/base_baton_model = icon(chosen_model.icon, chosen_model.icon_state)
	var/icon/shock_overlay = icon(chosen_model.icon, "[chosen_model.icon_state]_shockoverlay")
	var/icon/base_active_baton_model = icon(chosen_model.icon, "[chosen_model.icon_state]_active")
	var/icon/base_nocell_baton_model = icon(chosen_model.icon, "[chosen_model.icon_state]_nocell")
	var/icon/base_baton_add = icon(chosen_model.icon, "[chosen_model.icon_state]_add")
	var/icon/base_active_baton_add = icon(chosen_model.icon, "[chosen_model.icon_state]_active_add")
	var/icon/base_nocell_baton_add = icon(chosen_model.icon, "[chosen_model.icon_state]_nocell_add")
	var/icon/base_baton_mult = icon(chosen_model.icon, "[chosen_model.icon_state]_mult")
	var/icon/base_active_baton_mult = icon(chosen_model.icon, "[chosen_model.icon_state]_active_mult")
	var/icon/base_nocell_baton_mult = icon(chosen_model.icon, "[chosen_model.icon_state]_nocell_mult")
	var/icon/baton_skin_icon = icon(chosen_model.icon, chosen_skin.icon_state)
	var/icon/baton_skin_active_icon = icon(chosen_model.icon, chosen_skin.icon_state)
	var/icon/baton_skin_nocell_icon = icon(chosen_model.icon, chosen_skin.icon_state)
	var/icon/wear_n_tear_icon = icon(chosen_model.icon, chosen_wear_n_tear.icon_state)

	baton_skin_icon.Blend(base_baton_mult, ICON_MULTIPLY)
	baton_skin_icon.Blend(base_baton_add, ICON_ADD)
	baton_skin_icon.Blend(wear_n_tear_icon, ICON_SUBTRACT)
	baton_skin_icon.Blend(base_baton_model, ICON_UNDERLAY)

	baton_skin_active_icon.Blend(base_active_baton_mult, ICON_MULTIPLY)
	baton_skin_active_icon.Blend(base_active_baton_add, ICON_ADD)
	baton_skin_active_icon.Blend(wear_n_tear_icon, ICON_SUBTRACT)
	baton_skin_active_icon.Blend(base_active_baton_model, ICON_UNDERLAY)
	if(chosen_model.uses_shock_overlay)
		baton_skin_active_icon.Blend(shock_overlay, ICON_OVERLAY)

	baton_skin_nocell_icon.Blend(base_nocell_baton_mult, ICON_MULTIPLY)
	baton_skin_nocell_icon.Blend(base_nocell_baton_add, ICON_ADD)
	baton_skin_nocell_icon.Blend(wear_n_tear_icon, ICON_SUBTRACT)
	baton_skin_nocell_icon.Blend(base_nocell_baton_model, ICON_UNDERLAY)

	var/icon/baton_skin = icon('icons/testing/greyscale_error.dmi', "")
	baton_skin.Insert(baton_skin_icon, "stunbaton")
	baton_skin.Insert(baton_skin_active_icon, "stunbaton_active")
	baton_skin.Insert(baton_skin_nocell_icon, "stunbaton_nocell")
	icon = baton_skin
