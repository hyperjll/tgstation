/obj/item/organ/internal/cyberimp/arm/gun/laser/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/gun/laser/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/gun/taser/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/gun/taser/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/toolset/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/toolset/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/esword/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/medibeam/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/flash/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/baton/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/combat/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/surgery/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/surgery/emagged/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/strongarm/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/strongarm/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/strongarm/buster
	name = "\proper Buster Arm implant"
	desc = "When implanted, this cybernetic implant will enhance the muscles and bones of the arm to deliver incredibly powerful punches."
	icon_state = "muscle_implant"

	zone = BODY_ZONE_R_ARM
	slot = ORGAN_SLOT_RIGHT_ARM_MUSCLE

	right_arm_organ_slot = ORGAN_SLOT_RIGHT_ARM_MUSCLE
	left_arm_organ_slot = ORGAN_SLOT_LEFT_ARM_MUSCLE

	actions_types = list()
	items_to_create = list(/obj/item/gun/magic/hook/buster)

	///The amount of damage the implant adds to our unarmed attacks.
	punch_damage = 20
	///IF true, the throw attack will not smash people into walls
	non_harmful_throw = FALSE
	///How far away your attack will throw your oponent
	attack_throw_range = 6
	///Minimum throw power of the attack
	throw_power_min = 1
	///Maximum throw power of the attack
	throw_power_max = 4
	///How long will the implant malfunction if it is EMP'd
	emp_base_duration = 30 SECONDS

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/on_mob_insert(mob/living/carbon/arm_owner)
	. = ..()
	if(ishuman(arm_owner)) //Sorry, only humans
		RegisterSignal(arm_owner, COMSIG_LIVING_EARLY_UNARMED_ATTACK, PROC_REF(on_attack_hand))

/obj/item/organ/internal/cyberimp/arm/strongarm/on_mob_remove(mob/living/carbon/arm_owner)
	. = ..()
	UnregisterSignal(arm_owner, COMSIG_LIVING_EARLY_UNARMED_ATTACK)

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/emp_act(severity)
	. = ..()
	if((organ_flags & ORGAN_FAILING) || . & EMP_PROTECT_SELF)
		return
	owner.balloon_alert(owner, "your arm spasms wildly!")
	organ_flags |= ORGAN_FAILING
	addtimer(CALLBACK(src, PROC_REF(reboot)), 90 / severity)

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/reboot()
	organ_flags &= ~ORGAN_FAILING
	owner.balloon_alert(owner, "your arm stops spasming!")

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/on_attack_hand(mob/living/carbon/human/source, atom/target, proximity, modifiers, override = TRUE)
	SIGNAL_HANDLER

	if(source.get_active_hand() != hand || !proximity)
		return NONE
	if(!source.combat_mode || LAZYACCESS(modifiers, RIGHT_CLICK))
		return NONE
	if(!isliving(target))
		return NONE
	var/datum/dna/dna = source.has_dna()
	if(dna?.check_mutation(/datum/mutation/human/hulk)) //NO HULK
		return NONE
	if(!source.can_unarmed_attack())
		return COMPONENT_SKIP_ATTACK

	var/mob/living/living_target = target
	source.changeNext_move(CLICK_CD_MELEE)
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

	if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(human_target.check_block(source, punch_damage, "[source]'s' [picked_hit_type]"))
			source.do_attack_animation(target)
			playsound(living_target.loc, 'sound/weapons/punchmiss.ogg', 25, TRUE, -1)
			log_combat(source, target, "attempted to [picked_hit_type]", "muscle implant")
			return COMPONENT_CANCEL_ATTACK_CHAIN

	var/potential_damage = punch_damage
	var/obj/item/bodypart/attacking_bodypart = hand
	potential_damage += rand(attacking_bodypart.unarmed_damage_low, attacking_bodypart.unarmed_damage_high)

	source.do_attack_animation(target, ATTACK_EFFECT_SMASH)
	playsound(living_target.loc, 'sound/weapons/punch1.ogg', 25, TRUE, -1)

	var/target_zone = living_target.get_random_valid_zone(source.zone_selected)
	var/armor_block = living_target.run_armor_check(target_zone, MELEE, armour_penetration = attacking_bodypart.unarmed_effectiveness)
	living_target.apply_damage(potential_damage, attacking_bodypart.attack_type, target_zone, armor_block)
	living_target.apply_damage(potential_damage*1.5, STAMINA, target_zone, armor_block)

	if(source.body_position != LYING_DOWN) //Throw them if we are standing
		var/atom/throw_target = get_edge_target_turf(living_target, source.dir)
		living_target.throw_at(throw_target, attack_throw_range, rand(throw_power_min,throw_power_max), source, gentle = non_harmful_throw)

	living_target.visible_message(
		span_danger("[source] [picked_hit_type]ed [living_target]!"),
		span_userdanger("You're [picked_hit_type]ed by [source]!"),
		span_hear("You hear a sickening sound of flesh hitting flesh!"),
		COMBAT_MESSAGE_RANGE,
		source,
	)

	to_chat(source, span_danger("You [picked_hit_type] [target]!"))

	log_combat(source, target, "[picked_hit_type]ed", "muscle implant")

	return COMPONENT_CANCEL_ATTACK_CHAIN

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/strongarm/buster/syndicate/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/signaler
	name = "arm-concealed signaler"
	desc = "An illegal cybernetic implant that can produce and conceal a signaling device."
	items_to_create = list(/obj/item/assembly/signaler)

/obj/item/organ/internal/cyberimp/arm/signaler/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN


/obj/item/organ/internal/cyberimp/arm/syndie_mantis
	name = "G.O.R.L.E.X. mantis blade implant"
	desc = "Modernized mantis blades designed and coined by Tiger operatives. Energy actuators makes the blade a much deadlier weapon."
	items_to_create = list(/obj/item/mantis/blade/syndicate)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/syndie_mantis/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/syndie_hammer
	name = "Vxtvul Hammer implant"
	desc = "A folded Vxtvul Hammer designed to be incorporated into preterni chassis. Surgery can permit it to fit in other organic bodies."
	items_to_create = list(/obj/item/melee/vxtvulhammer)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/nt_mantis
	name = "H.E.P.H.A.E.S.T.U.S. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. Wielding two will let you double-attack."
	items_to_create = list(/obj/item/mantis/blade/NT)

/obj/item/organ/internal/cyberimp/arm/nt_mantis/l
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/makarov_implant
	name = "Makarov implant"
	desc = "A modified version of the Makarov pistol placed inside of the forearm to allow for easy concealment."
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/m1911_implant
	name = "M1911 implant"
	desc = "A modified version of the M1911 pistol placed inside of the forearm to allow for easy concealment."
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/m1911/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/deagle_implant
	name = "Desert Eagle implant"
	desc = "A modified version of the Desert Eagle placed inside of the forearm to allow for easy concealment."
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/deagle/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/viper_implant
	name = "Viper implant"
	desc = "A modified version of the Viper pistol placed inside of the forearm to allow for easy concealment."
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/viper/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/arm/cobra_implant
	name = "Cobra implant"
	desc = "A modified version of the Cobra pistol placed inside of the forearm to allow for easy concealment."
	items_to_create = list(/obj/item/gun/ballistic/automatic/pistol/cobra/implant)
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
