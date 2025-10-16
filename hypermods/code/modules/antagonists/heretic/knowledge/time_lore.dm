/datum/heretic_knowledge_tree_column/time
	route = PATH_TIME
	ui_bgr = "node_time"
	complexity = "Easy"
	complexity_color = COLOR_GREEN
	icon = list(
		"icon" = 'hypermods/icons/obj/weapons/khopesh.dmi',
		"state" = "time_blade",
		"frame" = 1,
		"dir" = SOUTH,
		"moving" = FALSE,
	)
	description = list(
		"The Path of Time revolves around the heretic's age, mobility and self-recovery against single opponents.",
		"Picking the Path of Ash first is recommended as this path can be complicated if you are new to Heretic, but this path can be an alternative to Ash's hit-and-run playstyle.",
	)
	pros = list(
		"Perhaps the best mobility out of all heretic paths.",
		"Great self-recovery of all damage types.",
		"Long-term harassment of particularly pesky foes will steadily turn in your favor.",
		"High potential should multiple heretics follow this path.",
		"Mansus grasp, mark and robes all restore your youth.",
		"High stun resistance.",
	)
	cons = list(
		"Has little damaging offensive or defensive spells.",
		"Casting spells will drain your youth, which can lead to significant health problems.",
		"Spell crowd-control is greatly limited.",
		"The Clockwork Cloak offers little utility outside of passively restoring your youth.",
	)
	tips = list(
		"Your Mansus Grasp steals the youth of your target and heals you slightly, and activation of it's mark will steal more.",
		"Your Clockwork Cloak will slowly restore your Youth. Maintaining your Youth is essential to casting spells without side-effects.",
		"Your Skip Time spell allows you to teleport instantly to anywhere in sight. Be wary that using Deja Vu and then attempting to Skip Time to flee is counter-productive.",
		"Using Deja Vu before picking a fight or using it just out-of-sight of pursuers will often get you out of dangerous situations.",
		"Eldritch Echoes can often take potential foes out long after you've engaged them or prevent them from re-entering a fight fearing the inevitable unavoidable damage may ruin what chances they have against you.",
		"Your Spells will grant you a freakish amount of mobility, and Haste will allow you to cut-down on spending them too soon, be sure to acquire it ASAP.",
		"Your Targeted Time Stop spell is great for stopping possible pursuers in their tracks, but be warned that you aren't currently immune to time stop effects yourself!",
		"Your ascension grants you a large AoE Time Stop Ability to finally cover your lack of combat spells weakness, and anyone who gets close to you will be permanently cursed with rapid aging.",
	)

	start = /datum/heretic_knowledge/limited_amount/starting/base_time
	knowledge_tier1 = /datum/heretic_knowledge/spell/time_skip
	guaranteed_side_tier1 = /datum/heretic_knowledge/spell/slow
	knowledge_tier2 = /datum/heretic_knowledge/spell/deja_vu
	guaranteed_side_tier2 = /datum/heretic_knowledge/curse/age
	robes = /datum/heretic_knowledge/armor/time
	knowledge_tier3 = /datum/heretic_knowledge/haste
	guaranteed_side_tier3 = /datum/heretic_knowledge/spell/eldritch_echoes
	blade = /datum/heretic_knowledge/blade_upgrade/time
	knowledge_tier4 = /datum/heretic_knowledge/spell/target_time_stop
	ascension = /datum/heretic_knowledge/ultimate/time_final

/datum/heretic_knowledge/limited_amount/starting/base_time
	name = "Passage of Time"
	desc = "Opens up the Path of Time to you. \
		Allows you to transmute a knife and a timer into a Time Blade. \
		You can only create two at a time."
	gain_text = "The Time Lords stand idly. Watching all from their ivory towers, until i decided to investigate why."
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/item/assembly/timer = 1,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/time)
	research_tree_icon_path = 'hypermods/icons/obj/weapons/khopesh.dmi'
	research_tree_icon_state = "time_blade"
	mark_type = /datum/status_effect/eldritch/time
	eldritch_passive = /datum/status_effect/heretic_passive/time

/datum/heretic_knowledge/limited_amount/starting/base_time/on_mansus_grasp(mob/living/source, mob/living/target)
	. = ..()

	if(!istype(target, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/human_target = target
	var/mob/living/carbon/human/heretic = source
	var/ageamount = (rand(1, 2))

	to_chat(human_target, span_danger("A bright green light encases your body as your life is drained!"))
	human_target.age += ageamount

	if(heretic.age > 18)
		heretic.age -= ageamount

	heretic.adjustBruteLoss(-3)
	heretic.adjustFireLoss(-3)
	heretic.adjustToxLoss(-3)
	heretic.adjustOxyLoss(-3)

	if(!human_target.has_status_effect(/datum/status_effect/rapidaging/lesser))
		human_target.apply_status_effect(/datum/status_effect/rapidaging/lesser)

/datum/heretic_knowledge/limited_amount/starting/base_time/trigger_mark(mob/living/source, mob/living/target)
	. = ..()
	if(!.)
		return

	if(!istype(target, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/human_target = target
	var/mob/living/carbon/human/heretic = source

	to_chat(human_target, span_danger("Your body reels as your youth is drained!"))
	human_target.age += 5

	if(heretic.age > 18)
		heretic.age -= 5

	if(!human_target.has_status_effect(/datum/status_effect/rapidaging/lesser))
		human_target.apply_status_effect(/datum/status_effect/rapidaging/lesser)


/datum/heretic_knowledge/spell/time_skip
	name = "Skip Time"
	desc = "Grants you Skip Time, a long-range spell that lets you skip the passage of time, \
		manuvering past any obstacles to your destination.  Requires a focus to use. \
		Eventually, all obstacles are either moved, destroyed or opened, after all."
	gain_text = "They took an interest in me, noting the path i chose. \
			They pointed to a place i couldn't fathom. A place i couldn't reach."
	action_to_add = /datum/action/cooldown/spell/pointed/skip_time
	cost = 2


/datum/heretic_knowledge/spell/deja_vu
	name = "Deja Vu"
	desc = "You mark a place in time and space and return to it after 10 seconds. \
		When this occurs, you reverse all damage (and healing) taken at great cost to your youth. Requires a focus to use."
	gain_text = "And before i knew it, i was back where i was before. \
			Knowledge remained, but their attention did not."
	action_to_add = /datum/action/cooldown/spell/deja_vu
	cost = 2


/datum/heretic_knowledge/armor/time
	desc = "Allows you to transmute a table (or a suit), a mask and a timer to create a clockwork cloak. \
		It passively restores the wearer's youth, and slightly speeds up the wearer's movement. \
		Acts as a focus while hooded."
	gain_text = "Upon the Ivory Marble I sought shelter and lingered. \
			But when I went and left, that which is left behind sought shelter in you."
	result_atoms = list(/obj/item/clothing/suit/hooded/cultrobes/eldritch/time)
	research_tree_icon_state = "time_armor"
	required_atoms = list(
		list(/obj/structure/table, /obj/item/clothing/suit) = 1,
		/obj/item/clothing/mask = 1,
		/obj/item/assembly/timer = 1,
	)


/datum/heretic_knowledge/haste
	name = "Eternal Haste"
	desc = "You are permanently hastened, you perform all progress bar actions 50% faster and move 15% faster. \
		You'll purge toxins from your body automatically, and will burn through your calories quicker."
	gain_text = "My heart beats faster, i feel time slip away as i walk these planes."
	cost = 2
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "haste"

/datum/heretic_knowledge/haste/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.apply_status_effect(/datum/status_effect/haste)

/datum/heretic_knowledge/haste/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.remove_status_effect(/datum/status_effect/haste)


/datum/heretic_knowledge/blade_upgrade/time
	name = "Time Siphon"
	desc = "Your time blade now removes 2 damage of each type from you and bestows it \
		upon your victim, this only works on non-simple and non-silicon based targets."
	gain_text = "I felt my hands grip tightly, my chest burrowed. \
			I had to do something. But i did not know what."
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "blade_upgrade_time"

/datum/heretic_knowledge/blade_upgrade/time/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(source == target)
		return

	if(!istype(target, /mob/living/carbon/human))
		return

	if(source.getBruteLoss())
		target.adjustBruteLoss(2)
		source.adjustBruteLoss(-2)

	if(source.getFireLoss())
		target.adjustFireLoss(2)
		source.adjustFireLoss(-2)

	if(source.getToxLoss())
		target.adjustToxLoss(2)
		source.adjustToxLoss(-2)

	if(source.getOxyLoss())
		target.adjustOxyLoss(2)
		source.adjustOxyLoss(-2)


/datum/heretic_knowledge/spell/target_time_stop
	name = "Targeted Time Stop"
	desc = "A long-range spell that causes briefly stops time around a target. \
		You aren't rendered immune to this time-stop effect."
	gain_text = "Before I could leave them, one turned and pointed toward me, stopping me in place with great force. \
		What words they spoke before I could move again, hadn't met my ears."
	action_to_add = /datum/action/cooldown/spell/pointed/target_time_stop
	cost = 2
	is_final_knowledge = TRUE


/datum/heretic_knowledge/ultimate/time_final
	name = "AT THE END OF ALL"
	desc = "The ascension ritual of the Path of Time. \
		Transmute three corpses that have been aged past 50 years to ascend. \
		When completed, your 'Time Mends All' regenerates thrice as quickly and grants total stun \
		immunity. You may stop time in a large radius for 10 seconds once every 2 minutes. \
		All heathens nearby will be cursed permanently, those who are cursed will age rapidly."
	gain_text = "And now i stand a shepherd with no herd, the end approaches while they sleep. \
			Even if i told them now, it'd be of no use, they'd forget in the next moment. \
			But with your help? We can remind them together. \
			So, rise! Lord of Time! YOUR ASCENSION AWAITS."
	ascension_achievement = /datum/award/achievement/misc/time_ascension
	announcement_text = "%SPOOKY% Witness the end of days, for the Lord of Time, %NAME% has ascended! Let all be reminded of what's to come! %SPOOKY%"
	announcement_sound = 'hypermods/sound/music/antag/heretic/ascend_time.ogg'
	/// A static list of all traits we apply on ascension.
	var/static/list/traits_to_apply = list(
		TRAIT_TIME_STOP_IMMUNE,
	)

/datum/heretic_knowledge/ultimate/time_final/is_valid_sacrifice(mob/living/carbon/human/sacrifice)
	. = ..()
	if(!.)
		return

	if(sacrifice.age >= 50)
		return TRUE
	return FALSE

/datum/heretic_knowledge/ultimate/time_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()

	var/datum/action/cooldown/spell/timestop_super/time_spell = new(user.mind)
	time_spell.Grant(user)

	if(length(traits_to_apply))
		user.add_traits(traits_to_apply, MAGIC_TRAIT)

	RegisterSignal(user, COMSIG_LIVING_LIFE, PROC_REF(on_life))

/datum/heretic_knowledge/ultimate/time_final/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	UnregisterSignal(human_user, COMSIG_LIVING_LIFE)

/datum/heretic_knowledge/ultimate/time_final/proc/on_life(mob/living/user, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	for(var/atom/thing_in_range as anything in range(10, user))
		if(iscarbon(thing_in_range))
			if(thing_in_range != user)
				var/mob/living/carbon/close_carbon = thing_in_range
				if(!close_carbon.has_status_effect(/datum/status_effect/rapidaging))
					close_carbon.apply_status_effect(/datum/status_effect/rapidaging)
