/*
 * Syndicate Incendiary Axe
 */

/obj/item/fireaxe/firey
	icon = 'icons/obj/weapons/fireaxe.dmi'
	icon_state = "fireaxe0"
	base_icon_state = "fireaxe"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	wound_bonus = -15
	bare_wound_bonus = 20
	/// Can the axe ignite it's target?
	var/ignite_target = TRUE

/obj/item/fireaxe/firey/attack(mob/living/carbon/victim, mob/living/carbon/user)
	if(ignite_target)
		victim.adjust_fire_stacks(1)
		victim.ignite_mob()

	if(!isliving(victim))
		return ..()

	return ..()

/*
 * Energy Fire Axe
 */

/obj/item/fireaxe/energy
	name = "energy fire axe"
	desc = "A massive, two handed, energy-based hardlight axe capable of cutting through solid metal. 'Glory to atmosia' is carved on the side of the handle."
	icon = 'hypermods/icons/obj/weapons/fireaxe.dmi'
	icon_state = "energy-fireaxe0"
	base_icon_state = "energy-fireaxe"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/axes_righthand.dmi'
	demolition_mod = 4 // DESTROY
	armour_penetration = 50 // Probably doesn't care much for armor given how it can destroy solid metal structures
	block_chance = 50 // Big handle and large flat energy blade, good for blocking things
	heat = 1800 // It's a FIRE axe
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = "swing_hit"
	light_system = OVERLAY_LIGHT
	light_range = 6 //This is NOT a stealthy weapon
	light_color = "#ff4800" //red-orange
	light_on = FALSE
	sharpness = NONE
	resistance_flags = FIRE_PROOF | ACID_PROOF

	force_wielded = 25

	var/w_class_on = WEIGHT_CLASS_BULKY

/obj/item/fireaxe/energy/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_wielded = force_wielded, \
		icon_wielded = "[base_icon_state]1", \
		wieldsound = 'sound/items/weapons/saberon.ogg', \
		unwieldsound = 'sound/items/weapons/saberoff.ogg', \
		wield_callback = CALLBACK(src, PROC_REF(on_wield)), \
		unwield_callback = CALLBACK(src, PROC_REF(on_unwield)), \
	)

/obj/item/fireaxe/energy/proc/on_wield(obj/item/source, mob/living/carbon/user)
	w_class = w_class_on
	sharpness = SHARP_EDGED
	hitsound = 'sound/items/weapons/blade1.ogg'
	START_PROCESSING(SSobj, src)
	set_light_on(TRUE)

/obj/item/fireaxe/energy/proc/on_unwield(obj/item/source, mob/living/carbon/user)
	w_class = initial(w_class)
	sharpness = initial(sharpness)
	hitsound = "swing_hit"
	STOP_PROCESSING(SSobj, src)
	set_light_on(FALSE)

/obj/item/fireaxe/energy/attack(mob/living/M, mob/living/user)
	..()
	M.ignite_mob() // Ignites you if you're flammable

/obj/item/fireaxe/energy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text, final_block_chance, damage, attack_type)
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return 0 // large energy blade can only block stuff if it's actually on
	return ..()

/obj/item/fireaxe/energy/ignition_effect(atom/A, mob/user)
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return "[user] tries to light [A] with [src] while it's off. Nothing happens."
	playsound(loc, hitsound, get_clamped_volume(), 1, -1)
	return "[user] casually raises [src] up to [user.p_their()] face and lights [A]. Hot damn."

/obj/item/fireaxe/energy/process()
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		STOP_PROCESSING(SSobj, src)
		return PROCESS_KILL
	open_flame(heat)

/*
 * Syndicate Lightning Axe
 */

/obj/item/fireaxe/electric
	icon = 'icons/obj/weapons/fireaxe.dmi'
	icon_state = "fireaxe0"
	base_icon_state = "fireaxe"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	wound_bonus = -15
	bare_wound_bonus = 20
	/// Can the axe shock it's target?
	var/electrocute = TRUE

/obj/item/fireaxe/electric/attack(mob/living/carbon/victim, mob/living/carbon/user)
	if(electrocute || HAS_TRAIT(src, TRAIT_WIELDED))
		shock(victim)

	if(!isliving(victim))
		return ..()

	return ..()

/obj/item/fireaxe/electric/proc/shock(mob/living/target)
	if(prob(20))
		target.Stun(1 SECONDS)
		target.Knockdown(5 SECONDS)
		var/datum/effect_system/lightning_spread/s = new /datum/effect_system/lightning_spread
		s.set_up(5, 1, target.loc)
		s.start()
		target.visible_message(span_danger("[target.name] is shocked by [src]!"), \
			span_userdanger("You feel a powerful shock course through your body!"), \
			span_hear("You hear a loud electrical crackle!"))
