/obj/item/organ/cyberimp/arm/toolkit/gun/laser/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/gun/laser/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/gun/taser/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/gun/taser/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/toolset/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/toolset/syndicate/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/esword/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/medibeam/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/flash/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/baton/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/combat/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/surgery/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/surgery/syndicate/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/surgery/emagged/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/surgery/emagged/syndicate/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/strongarm/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/strongarm/syndicate/l
	zone = BODY_ZONE_L_ARM

#define DOAFTER_SOURCE_BUSTER_INTERACTION "buster interaction"

/obj/item/organ/cyberimp/arm/toolkit/buster
	name = "\proper Buster Arm implant"
	desc = "When implanted, this cybernetic implant will enhance the muscles and bones of the arm to deliver incredibly powerful punches."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "busterarm_implant"

	zone = BODY_ZONE_R_ARM
	slot = ORGAN_SLOT_RIGHT_ARM_MUSCLE

	valid_zones = list(
		BODY_ZONE_R_ARM = ORGAN_SLOT_RIGHT_ARM_MUSCLE,
		BODY_ZONE_L_ARM = ORGAN_SLOT_LEFT_ARM_MUSCLE,
	)

	actions_types = list()
	items_to_create = list(/obj/item/gun/magic/hook/buster)

	/// The amount of damage the implant adds to the lower punching force of our arm.
	var/lower_punch_damage = 2
	/// The amount of damage the implant adds to the upper punching force of our arm.
	var/upper_punch_damage = 10
	/// The amount of punch effectiveness (AKA accuracy and crit potential) the implant adds to our arm
	var/punch_effectiveness_added = 20
	/// How much extra damage does our implant allow the implanted while grabbing someone and they are unable to break the grapple?
	var/bonus_grab_damage = 25
	///Biotypes we apply an additional amount of damage too
	var/biotype_bonus_targets = MOB_BEAST | MOB_SPECIAL | MOB_MINING
	///Extra damage dealt to our targeted mobs
	var/biotype_bonus_damage = 20
	///IF true, the throw attack will not smash people into walls
	var/non_harmful_throw = TRUE
	///How far away your attack will throw your oponent
	var/attack_throw_range = 6
	///Minimum throw power of the attack
	var/throw_power_min = 1
	///Maximum throw power of the attack
	var/throw_power_max = 4
	///How long will the implant malfunction if it is EMP'd
	var/emp_base_duration = 30 SECONDS
	///How long before we get another slam punch; consider that these usually come in pairs of two
	var/slam_cooldown_duration = 5 SECONDS
	///Tracks how soon we can perform another slam attack
	COOLDOWN_DECLARE(slam_cooldown)

/obj/item/organ/cyberimp/arm/toolkit/buster/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/buster)

/obj/item/organ/cyberimp/arm/toolkit/buster/on_mob_insert(mob/living/carbon/arm_owner)
	. = ..()
	if(ishuman(arm_owner)) //Sorry, only humans
		RegisterSignal(arm_owner, COMSIG_LIVING_EARLY_UNARMED_ATTACK, PROC_REF(on_attack_hand))

/obj/item/organ/cyberimp/arm/toolkit/on_mob_remove(mob/living/carbon/arm_owner)
	. = ..()
	UnregisterSignal(arm_owner, COMSIG_LIVING_EARLY_UNARMED_ATTACK)

/obj/item/organ/cyberimp/arm/toolkit/buster/emp_act(severity)
	. = ..()
	if((organ_flags & ORGAN_FAILING) || . & EMP_PROTECT_SELF)
		return
	owner.balloon_alert(owner, "your arm spasms wildly!")
	organ_flags |= ORGAN_FAILING
	addtimer(CALLBACK(src, PROC_REF(reboot)), 90 / severity)

/obj/item/organ/cyberimp/arm/toolkit/buster/proc/reboot()
	organ_flags &= ~ORGAN_FAILING
	owner.balloon_alert(owner, "your arm stops spasming!")

/obj/item/organ/cyberimp/arm/toolkit/buster/proc/on_attack_hand(mob/living/carbon/human/source, atom/target, proximity, modifiers, override = TRUE)
	SIGNAL_HANDLER

	if(source.get_active_hand() != hand || !proximity)
		return NONE
	if(!source.combat_mode || LAZYACCESS(modifiers, RIGHT_CLICK))
		return NONE
	if(!isliving(target))
		return NONE
	if(HAS_TRAIT(source, TRAIT_HULK)) //NO HULK
		return NONE
	if(!COOLDOWN_FINISHED(src, slam_cooldown) && ishuman(target))
		return NONE
	if(!source.can_unarmed_attack())
		return COMPONENT_SKIP_ATTACK

	var/mob/living/living_target = target
	var/picked_hit_type = pick("punch", "smash", "pummel", "bash", "slam")

	if(organ_flags & ORGAN_FAILING)
		if(source.body_position != LYING_DOWN && living_target != source && prob(50))
			to_chat(source, span_danger("You try to [picked_hit_type] [living_target], but lose your balance and fall!"))
			source.Knockdown(3 SECONDS)
			source.forceMove(get_turf(living_target))
		else
			to_chat(source, span_danger("Your muscles spasm!"))
			source.Paralyze(1 SECONDS)
		return COMPONENT_CANCEL_ATTACK_CHAIN

	var/ground_bounce = FALSE // funny flavor. if you hit someone who's floored you slam them into the ground, breaking tiles
	var/turf/target_turf = get_turf(living_target)

	/* Damage calculations operate on the same math used in /datum/species/proc/harm():
	* Unarmed damage is randomized between an upper and lower value.
	* The lower value is determined by taking the damage value from the limb, and then increasing that value based on athletics level (min upper value)
	* The upper value is determiend by taking the damage value from the limb, and then seeing if we have the strength trait, providing extra damage.
	* The end result is that the more investment into athletics, the more precise the damage is, without necessarily increasing the potential damage.
	*/

	// Our attacking limb
	var/obj/item/bodypart/attacking_bodypart = hand
	// The upper damage, calculated first as it will be used to cap our potential lower damage.
	var/potential_upper_damage = attacking_bodypart.unarmed_damage_high + (HAS_TRAIT(source, TRAIT_STRENGTH) ? 2 : 0)
	// The lower damage, which is capped by potential_upper_damage
	var/potential_lower_damage = min(attacking_bodypart.unarmed_damage_low + (source.mind?.get_skill_level(/datum/skill/athletics) || 0), potential_upper_damage)
	// Finally, we determine the actual damage roll.
	var/potential_damage = rand(potential_lower_damage, potential_upper_damage)
	// This value is used to determine armour penetration.
	var/potential_effectiveness = attacking_bodypart.unarmed_effectiveness
	// This is a damage and penetration multiplier if our target is grabbed when we deliver our punch.
	var/potential_pummel_bonus = attacking_bodypart.unarmed_pummeling_bonus

	if(living_target.pulledby && living_target.pulledby.grab_state >= GRAB_AGGRESSIVE) // get pummeled idiot
		potential_damage *= potential_pummel_bonus
		potential_effectiveness *= potential_pummel_bonus
		if(living_target.body_position == LYING_DOWN)
			ground_bounce = TRUE

	var/is_correct_biotype = living_target.mob_biotypes & biotype_bonus_targets
	if(biotype_bonus_targets && is_correct_biotype) //If we are punching one of our special biotype targets, increase the damage floor by a factor of two.
		potential_damage += biotype_bonus_damage

	if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(human_target.check_block(source, potential_damage, "[source]'s' [picked_hit_type]"))
			source.do_attack_animation(target)
			playsound(living_target.loc, 'sound/items/weapons/punchmiss.ogg', 25, TRUE, -1)
			log_combat(source, target, "attempted to [picked_hit_type]", "muscle implant")
			return COMPONENT_CANCEL_ATTACK_CHAIN

	source.do_attack_animation(target, ATTACK_EFFECT_SMASH)
	playsound(living_target.loc, 'sound/items/weapons/punch1.ogg', 25, TRUE, -1)

	// Some mobs gib when killed, so we're logging early. At this point, we're definitely hitting, so...
	living_target.visible_message(
		span_danger("[source] [picked_hit_type]ed [living_target][ground_bounce ? " into [target_turf]" : ""]!"),
		span_userdanger("You're [picked_hit_type]ed by [source][ground_bounce ? " into [target_turf]" : ""]!"),
		span_hear("You hear a sickening sound of flesh hitting flesh!"),
		COMBAT_MESSAGE_RANGE,
		source,
	)

	to_chat(source, span_danger("You [picked_hit_type] [target][ground_bounce ? " into [target_turf]" : ""]!"))

	log_combat(source, target, "[picked_hit_type]ed", "muscle implant")

	if(ishuman(target))
		COOLDOWN_START(src, slam_cooldown, slam_cooldown_duration)

	var/target_zone = living_target.get_random_valid_zone(source.zone_selected)
	var/armor_block = living_target.run_armor_check(target_zone, MELEE, armour_penetration = potential_effectiveness)
	living_target.apply_damage(potential_damage * 2, attacking_bodypart.attack_type, target_zone, armor_block)

	if(source.body_position != LYING_DOWN && !QDELETED(living_target)) //Throw them if we are standing and we didn't somehow just completely obliterate the target
		var/atom/throw_target = get_edge_target_turf(living_target, source.dir)
		living_target.throw_at(throw_target, attack_throw_range, rand(throw_power_min,throw_power_max), source, gentle = non_harmful_throw)
		if(ground_bounce)
			if(isfloorturf(target_turf))
				var/turf/open/floor/crunched = target_turf
				crunched.crush() // crunch
	else if (ground_bounce) // Just in case our target mob somehow evaporated during this process, we still leave an obliterated tile in their wake
		if(isfloorturf(target_turf))
			var/turf/open/floor/crunched = target_turf
			crunched.crush() // again, crunch

	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/status_effect/organ_set_bonus/buster
	id = "organ_set_bonus_buster"
	organs_needed = 2
	bonus_activate_text = span_notice("Your improved arms allow you to open airlocks by force with your bare hands!")
	bonus_deactivate_text = span_notice("You can no longer force open airlocks with your bare hands.")
	required_biotype = NONE

/datum/status_effect/organ_set_bonus/buster/enable_bonus(obj/item/organ/inserted_organ)
	. = ..()
	if(!.)
		return
	owner.AddElement(/datum/element/door_pryer, pry_time = 3 SECONDS, interaction_key = DOAFTER_SOURCE_BUSTER_INTERACTION)

/datum/status_effect/organ_set_bonus/buster/disable_bonus(obj/item/organ/removed_organ)
	. = ..()
	owner.RemoveElement(/datum/element/door_pryer, pry_time = 3 SECONDS, interaction_key = DOAFTER_SOURCE_BUSTER_INTERACTION)

#undef DOAFTER_SOURCE_BUSTER_INTERACTION

/obj/item/organ/cyberimp/arm/toolkit/buster/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/buster/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/buster/syndicate/l
	zone = BODY_ZONE_L_ARM


/obj/item/organ/cyberimp/arm/toolkit/signaler
	name = "arm-concealed signaler"
	desc = "An illegal cybernetic implant that can produce and conceal a signaling device."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-toolkit"
	items_to_create = list(/obj/item/assembly/signaler)

/obj/item/organ/cyberimp/arm/toolkit/signaler/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null


/obj/item/organ/cyberimp/arm/toolkit/syndie_mantis
	name = "G.O.R.L.E.X. mantis blade implant"
	desc = "Modernized mantis blades designed and coined by Tiger operatives. Energy actuators makes the blade a much deadlier weapon."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "syndie_mantis"
	items_to_create = list(/obj/item/mantis/blade/syndicate)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/syndie_mantis/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/syndie_hammer
	name = "Vxtvul Hammer implant"
	desc = "A folded Vxtvul Hammer designed to be incorporated into preterni chassis. Surgery can permit it to fit in other organic bodies."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-weaponkit"
	items_to_create = list(/obj/item/melee/vxtvulhammer)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/nt_mantis
	name = "H.E.P.H.A.E.S.T.U.S. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. Wielding two will let you double-attack."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "mantis"
	items_to_create = list(/obj/item/mantis/blade/NT)

/obj/item/organ/cyberimp/arm/toolkit/nt_mantis/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/gun/makarov_implant
	name = "Makarov implant"
	desc = "A modified version of the Makarov pistol placed inside of the forearm to allow for easy concealment."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-gunkit"
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/gun/m1911_implant
	name = "M1911 implant"
	desc = "A modified version of the M1911 pistol placed inside of the forearm to allow for easy concealment."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-gunkit"
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/m1911/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/gun/deagle_implant
	name = "Desert Eagle implant"
	desc = "A modified version of the Desert Eagle placed inside of the forearm to allow for easy concealment."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-gunkit"
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/deagle/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/gun/viper_implant
	name = "Viper implant"
	desc = "A modified version of the Viper pistol placed inside of the forearm to allow for easy concealment."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-gunkit"
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/viper/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/arm/toolkit/gun/cobra_implant
	name = "Cobra implant"
	desc = "A modified version of the Cobra pistol placed inside of the forearm to allow for easy concealment."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "implant-gunkit"
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/cobra/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null
