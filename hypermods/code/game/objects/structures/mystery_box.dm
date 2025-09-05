/obj/item/baton_key
	name = "baton key"
	desc = "Thank you for purchasing a Baton Case Key! You can get crates from the Torment Nexus in Security. No refunds. All sales final. Uncrate responsibly."
	icon = 'hypermods/icons/obj/weapons/baton.dmi'
	icon_state = "casecard(tm)"
	var/being_used = FALSE // no opening multiple crates at once for you, thief

/obj/structure/mystery_box/baton_crate
	name = "baton crate"
	desc = "Only opens with a Baton Case Key from Cargo. Buy one today for 249 credits for a chance at an incredibly rare and unique Baton! \
	Fun for all ages in sectors of space where gambling regulations are unenforced!"
	icon = 'hypermods/icons/obj/storage/crates.dmi'
	icon_state = "case"
	box_item = /obj/effect/abstract/mystery_box_item/baton_crate
	open_on_attackhand = FALSE
	expires = FALSE
	anchored = FALSE
	max_integrity = 250
	damage_deflection = 15
	play_sounds = FALSE

/obj/structure/mystery_box/baton_crate/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(istype(attacking_item, /obj/item/baton_key))
		var/obj/item/baton_key/key = attacking_item
		if(key.being_used)
			return
		key.being_used = TRUE
		playsound(src, 'sound/effects/doorcreaky.ogg', 80, FALSE, -1)
		Shake(3, 0, 0.5 SECONDS)
		if(do_after(user, 3.75 SECONDS, src))
			qdel(attacking_item)
			anchored = TRUE
			Shake(3, 0, 0.5 SECONDS)
			playsound(src, 'hypermods/sound/effects/mysterybox/baton_crate_open.ogg', 80, FALSE, -1)
			activate(user)
		else
			Shake(3, 0, 0.5 SECONDS)
			key.being_used = FALSE

/obj/structure/mystery_box/baton_crate/grant_weapon(mob/living/user)
	user.visible_message(span_notice("[user] takes [presented_item] from [src]."), span_notice("You take [presented_item] from [src]."), vision_distance = COMBAT_MESSAGE_RANGE)
	user.put_in_hands(presented_item.selected_item_final)
	QDEL_NULL(presented_item)
	visible_message("[src] breaks down.")
	deconstruct(disassembled = FALSE)

/obj/structure/mystery_box/baton_crate/generate_valid_types()
	valid_types = subtypesof(/datum/baton_model)


/obj/effect/abstract/mystery_box_item/baton_crate
	name = "Mystery Baton"
	desc = "Ninety-nine percent of unboxers quit before they win a factory new donut sturambit."
	hype_light_color = COLOR_SECURITY_RED
	icon = 'icons/obj/weapons/baton.dmi'
	icon_state = "stunbaton"
	choosing_duration = 9.6 SECONDS
	spawn_rays = FALSE
	var/datum/baton_model/baton_model
	var/list/possible_models = list()

/obj/effect/abstract/mystery_box_item/baton_crate/Initialize(mapload)
	. = ..()
	if(!length(possible_models))
		for(var/datum/baton_model/model as anything in subtypesof(/datum/baton_model))
			possible_models += list(initial(model.type) = initial(model.rarity))

/obj/effect/abstract/mystery_box_item/baton_crate/update_random_icon(new_item_type)
	baton_model = pick_weight(possible_models)
	var/icon/possible_baton = icon('icons/obj/weapons/baton.dmi', initial(baton_model.icon_state))
	possible_baton.Blend("#000000", ICON_MULTIPLY)
	icon = possible_baton
	icon_state = ""
	playsound(src, 'hypermods/sound/effects/mysterybox/baton_crate_scroll.ogg', 80, FALSE, -1)

/obj/effect/abstract/mystery_box_item/baton_crate/present_item()
	var/obj/item/melee/baton/security/skin/selected_item = new /obj/item/melee/baton/security/skin(src, baton_model)
	name = selected_item.name
	desc = selected_item.desc
	icon = selected_item.icon
	icon_state = "stunbaton"
	selected_item_final = selected_item
	var/highest_rarity_found
	if(selected_item.chosen_model.rarity_hex == "baton_common" || selected_item.chosen_skin.rarity_hex == "baton_common")
		highest_rarity_found = "baton_common"
	if(selected_item.chosen_model.rarity_hex == "baton_uncommon" || selected_item.chosen_skin.rarity_hex == "baton_uncommon")
		highest_rarity_found = "baton_uncommon"
	if(selected_item.chosen_model.rarity_hex == "baton_rare" || selected_item.chosen_skin.rarity_hex == "baton_rare")
		highest_rarity_found = "baton_rare"
	if(selected_item.chosen_model.rarity_hex == "baton_mythical" || selected_item.chosen_skin.rarity_hex == "baton_mythical")
		highest_rarity_found = "baton_mythical"
	if(selected_item.chosen_model.rarity_hex == "baton_legendary" || selected_item.chosen_skin.rarity_hex == "baton_legendary")
		highest_rarity_found = "baton_legendary"
	if(selected_item.chosen_model.rarity_hex == "baton_ancient" || selected_item.chosen_skin.rarity_hex == "baton_ancient")
		highest_rarity_found = "baton_ancient"
	switch(highest_rarity_found)
		if("baton_common")
			playsound(src, 'hypermods/sound/effects/mysterybox/common.ogg', 80, FALSE, -1) // too lame for hype rays
		if("baton_uncommon")
			playsound(src, 'hypermods/sound/effects/mysterybox/uncommon.ogg', 80, FALSE, -1)
			add_filter("weapon_rays", 3, list("type" = "rays", "size" = 14, "color" = "#6597e2"))
			add_filter("ready_outline", 2, list("type" = "outline", "color" = "#6597e2", "size" = 0.2))
		if("baton_rare")
			playsound(src, 'hypermods/sound/effects/mysterybox/rare.ogg', 80, FALSE, -1)
			add_filter("weapon_rays", 3, list("type" = "rays", "size" = 14, "color" = "#4b69ce"))
			add_filter("ready_outline", 2, list("type" = "outline", "color" = "#4b69ce", "size" = 0.2))
		if("baton_mythical")
			playsound(src, 'hypermods/sound/effects/mysterybox/mythical.ogg', 80, FALSE, -1)
			add_filter("weapon_rays", 3, list("type" = "rays", "size" = 28, "color" = "#8847ff"))
			add_filter("ready_outline", 2, list("type" = "outline", "color" = "#8847ff", "size" = 0.2))
		if("baton_legendary")
			playsound(src, 'hypermods/sound/effects/mysterybox/legendary.ogg', 80, FALSE, -1)
			add_filter("weapon_rays", 3, list("type" = "rays", "size" = 28, "color" = "#d42de6"))
			add_filter("ready_outline", 2, list("type" = "outline", "color" = hype_light_color, "size" = 0.2))
		if("baton_ancient")
			playsound(src, 'hypermods/sound/effects/mysterybox/ancient.ogg', 80, FALSE, -1)
			add_filter("weapon_rays", 3, list("type" = "rays", "size" = 42, "color" = "#eb4c4c"))
			add_filter("ready_outline", 2, list("type" = "outline", "color" = "#eb4c4c", "size" = 0.2))
	parent_box.present_weapon()
	claimable = TRUE
