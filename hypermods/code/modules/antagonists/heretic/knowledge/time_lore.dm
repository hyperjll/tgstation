/**
 * # The path of Time.
 *
 * Goes as follows:
 *
 * Passage of Time
 * Grasp of Time
 * Skip Time
 * > Sidepaths:
 *   Slow
 *   Fire Shark
 *
 * Mark of Time
 * Ritual of Knowledge
 * Time Mends All
 * > Sidepaths:
 *   Curse of Age
 * Deja Vu
 * > Sidepaths:
 *   Eldritch Echoes
 *   Space Phase
 *
 * Time Siphon
 * Eternal Haste
 * > Sidepaths:
 *   Cursed Flames
 *   Eldritch Coin
 *
 * At The End Of All
 */

/datum/heretic_knowledge_tree_column/main/time
	neighbour_type_left = /datum/heretic_knowledge_tree_column/cosmic_to_time
	neighbour_type_right = /datum/heretic_knowledge_tree_column/time_to_ash

	route = PATH_TIME
	ui_bgr = "node_time"

	start = /datum/heretic_knowledge/limited_amount/starting/base_time
	grasp = /datum/heretic_knowledge/time_grasp
	tier1 = /datum/heretic_knowledge/spell/time_skip
	mark = /datum/heretic_knowledge/mark/time_mark
	ritual_of_knowledge = /datum/heretic_knowledge/knowledge_ritual/time
	unique_ability = /datum/heretic_knowledge/time_mends_all
	tier2 = /datum/heretic_knowledge/spell/deja_vu
	blade = /datum/heretic_knowledge/blade_upgrade/time
	tier3 =	 /datum/heretic_knowledge/haste
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


/datum/heretic_knowledge/time_grasp
	name = "Grasp of Time"
	desc = "Your Mansus Grasp will steal 1-2 years of youth from your target, and slightly heal all damage types for you."
	gain_text = "At first, they studied me as they do all."
	cost = 1
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "grasp_time"

/datum/heretic_knowledge/time_grasp/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	RegisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK, PROC_REF(on_mansus_grasp))

/datum/heretic_knowledge/time_grasp/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	UnregisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK)

/datum/heretic_knowledge/time_grasp/proc/on_mansus_grasp(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

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


/datum/heretic_knowledge/spell/time_skip
	name = "Skip Time"
	desc = "Grants you Skip Time, a long-range spell that lets you skip the passage of time, \
		manuvering past any obstacles to your destination.  Requires a focus to use. \
		Eventually, all obstacles are either moved, destroyed or opened, after all."
	gain_text = "They took an interest in me, noting the path i chose. \
			They pointed to a place i couldn't fathom. A place i couldn't reach."
	spell_to_add = /datum/action/cooldown/spell/pointed/skip_time
	cost = 1


/datum/heretic_knowledge/mark/time_mark
	name = "Mark of Time"
	desc = "Your Mansus Grasp now applies the Mark of Time. The mark is triggered from an \
		attack with your Time Blade. When triggered, you steal an additional 5 years of youth \
		from the target and gain a speed boost for a short time."
	gain_text = "Beyond the folds of space and time, something stirred yet. \
			Their eyes fixated upon it for a moment, but my eyes ceased to linger upon it."
	mark_type = /datum/status_effect/eldritch/time

/datum/heretic_knowledge/mark/time_mark/trigger_mark(mob/living/source, mob/living/target)
	. = ..()
	if(!.)
		return

	if(!istype(target, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/human_target = target
	var/mob/living/carbon/human/heretic = source

	if(!heretic.has_status_effect(/datum/status_effect/timemark))
		heretic.apply_status_effect(/datum/status_effect/timemark)

	to_chat(human_target, span_danger("Your body reels as your youth is drained!"))
	human_target.age += 5

	if(heretic.age > 18)
		heretic.age -= 5

	if(!human_target.has_status_effect(/datum/status_effect/rapidaging/lesser))
		human_target.apply_status_effect(/datum/status_effect/rapidaging/lesser)


/datum/heretic_knowledge/knowledge_ritual/time


/datum/heretic_knowledge/time_mends_all
	name = "Time Mends All"
	desc = "While injured, you slowly regenerate all damage types at the cost of your \
		youth. You gain 40% stun resistance, immunity to knockdown from \
		batons, and perform all progress bar actions 25% faster. \
		These effects only apply while you're under 50 years of age."
	gain_text = "My eyes lit up as i realized what my purpose was. \
			Beyond the folds of time, lies an ultimate goal. A purpose."
	cost = 1
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "timemendsall"

/datum/heretic_knowledge/time_mends_all/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.apply_status_effect(/datum/status_effect/timemendsall)

/datum/heretic_knowledge/time_mends_all/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.remove_status_effect(/datum/status_effect/timemendsall)


/datum/heretic_knowledge/spell/deja_vu
	name = "Deja Vu"
	desc = "You mark a place in time and space and return to it after 10 seconds. \
		When this occurs, you reverse all damage (and healing) taken at great cost to your youth."
	gain_text = "And before i knew it, i was back where i was before. Requires a focus to use. \
			Knowledge remained, but their attention did not."
	spell_to_add = /datum/action/cooldown/spell/deja_vu
	cost = 1


/datum/heretic_knowledge/blade_upgrade/time
	name = "Time Siphon"
	desc = "Your time blade now removes 2 damage of each type from you and bestows it \
		upon your attacker, this only works on non-simple and non-silicon based targets."
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


/datum/heretic_knowledge/haste
	name = "Eternal Haste"
	desc = "You are permanently hastened, you perform all progress bar actions 50% faster and move 15% faster. \
		You'll purge toxins from your body automatically, and will burn through your calories quicker."
	gain_text = "My eyes lit up as i realized what my purpose was. \
			Beyond the folds of time, lies an ultimate goal. A purpose."
	cost = 1
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "haste"

/datum/heretic_knowledge/haste/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.apply_status_effect(/datum/status_effect/haste)

/datum/heretic_knowledge/haste/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.remove_status_effect(/datum/status_effect/haste)


/datum/heretic_knowledge/ultimate/time_final
	name = "AT THE END OF ALL"
	desc = "The ascension ritual of the Path of Time. \
		Transmute three corpses that have been aged past 50 years to ascend. \
		When completed, your 'Time Mends All' regenerates thrice as quickly and grants total stun \
		immunity. You may stop time in a large radius for 20 seconds once every minute. \
		All heathens nearby will be cursed permanently, those who are cursed will age rapidly."
	gain_text = "And now i stand a shepherd with no herd, the end approaches while they sleep. \
			Even if i told them now, it'd be of no use, they'd forget in the next moment. \
			But with your help? We can remind them together. \
			So, rise! Lord of Time! YOUR ASCENSION AWAITS."
	ascension_achievement = /datum/award/achievement/misc/time_ascension
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
	priority_announce(
		text = "[generate_heretic_text()] Witness the end of days, for the Lord of Time, [user.real_name] has ascended! Let all be reminded of what's to come! [generate_heretic_text()]",
		title = "[generate_heretic_text()]",
		sound = 'hypermods/sound/music/antag/heretic/ascend_time.ogg',
		color_override = "grey",
	)

	var/datum/action/cooldown/spell/timestop_super/time_spell = new(user.mind)
	time_spell.Grant(user)

	if(length(traits_to_apply))
		user.add_traits(traits_to_apply, MAGIC_TRAIT)

	RegisterSignal(user, COMSIG_LIVING_LIFE, PROC_REF(on_life))

	var/mob/living/carbon/human_user = user
	human_user.remove_status_effect(/datum/status_effect/timemendsall) // Replacing this with a better version.
	sleep(1 SECONDS) // give it a delay so this shit doesn't bug out/delete each other.
	human_user.apply_status_effect(/datum/status_effect/timemendsall/ascension)

/datum/heretic_knowledge/ultimate/time_final/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	var/mob/living/carbon/human_user = user
	human_user.remove_status_effect(/datum/status_effect/timemendsall)
	human_user.remove_status_effect(/datum/status_effect/timemendsall/ascension)
	UnregisterSignal(human_user, COMSIG_LIVING_LIFE)

/datum/heretic_knowledge/ultimate/time_final/proc/on_life(mob/living/user, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	for(var/atom/thing_in_range as anything in range(10, user))
		if(iscarbon(thing_in_range))
			if(thing_in_range != user)
				var/mob/living/carbon/close_carbon = thing_in_range
				if(!close_carbon.has_status_effect(/datum/status_effect/rapidaging))
					close_carbon.apply_status_effect(/datum/status_effect/rapidaging)
