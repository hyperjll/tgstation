/obj/item/storage/briefcase/soul_contractor

/obj/item/storage/briefcase/soul_contractor/attack_self(mob/user)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_DEVILISH))
		var/choice = tgui_input_list(user, "Do you wish to expend some of your life force to create another contract?", "Make another contract?", list("Yes", "No"))
		if(choice == "Yes")
			var/mob/living/our_user = user
			our_user.maxHealth -= 10
			var/obj/item/soul_contract/Newitem = new
			if(!our_user.put_in_inactive_hand(Newitem))
				Newitem.forceMove(our_user.drop_location())

/obj/item/storage/briefcase/soul_contractor/PopulateContents()
	new /obj/item/soul_contract(src)
	new /obj/item/soul_contract(src)
	new /obj/item/soul_contract(src)
	new /obj/item/pen/red(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/red(src)
	new /obj/item/paper/fluff/satan(src)

/obj/item/paper/fluff/satan
	name = "Paper-'Soul Stealing 101'"
	color = "#FF0000"
	default_raw_text = {"<center><b>SO YOU WANT TO BROKER SOULS?</b></center><ul>
	<li>Step One: Grab a complimentary extra-sharp pen and your infernal contract of choice from the provided briefcase.</li>
	<li>Step Two: Present your contract to your victim in a safe, isolated manner. Wouldn't want them ratting you out, would we? Be sure to inquire what bargain they'd like struck!</li>
	<li>Step Three: Let your contract be signed by the victim in question! Be sure to give them what they want!</li></ul>
	<b>As you collect more souls, you'll be given some of their essence to keep you alive and likely a small bonus depending on the deal you've struck.</li>
	<b>You can expend part of your own essence, making you more vulnerable, to forge more infernal contracts, provided you still have your briefcase.</li>
	<b>To do so, use the briefcase in-hand to choose whether or not you'd like more infernal contracts.</li>
	<b><li>Oh, and if you do a REALLY good job, we may just reward you for your great service. Just trust your old pal Nick on this one.</li></b>"}

/obj/item/soul_contract
	name = "infernal contract"
	desc = "A blank sheet of paper that's gone missing from hell."
	icon = 'icons/obj/service/bureaucracy.dmi'
	icon_state = "paper"
	inhand_icon_state = "paper"
	worn_icon_state = "paper"
	color = "#FF0000"
	w_class = WEIGHT_CLASS_TINY
	throw_range = 1
	throw_speed = 1
	drop_sound = 'sound/items/handling/paper_drop.ogg'
	pickup_sound = 'sound/items/handling/paper_pickup.ogg'
	custom_materials = list(/datum/material/paper = HALF_SHEET_MATERIAL_AMOUNT / 2)
	resistance_flags = FIRE_PROOF //Only makes sense since it's from hell.
	var/list/possible_powers = list(
		"wealth",
		"immortality",
		"chaos",
		"extra lives",
		"eternal youth",
		"vengeance",
		"perfect health",
		"status",
		"protection",
		"ultimate power",
		"syndicate allegiance",
	)
	/// The power chosen above.
	var/power_to_give = null
	/// Who initially made this contract?
	var/mob/living/contract_maker = null
	/// How many times can we use this contract?
	var/uses = 1

/obj/item/soul_contract/examine(mob/user)
	. = ..()
	if(!isnull(power_to_give))
		. += "This contract promises to bestow upon whomever signs it [power_to_give], and some other stuff you can't be bothered to read."

/obj/item/soul_contract/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/pen))
		to_chat(user, span_notice("You'll need a pen if you intend to do anything productive with this."))
		return

	if(istype(I, /obj/item/pen/invisible))
		to_chat(user, span_danger("Don't you dare."))
		return

	if(!HAS_TRAIT(user, TRAIT_DEVILISH) && isnull(power_to_give)) // We haven't made the contract yet
		to_chat(user, span_notice("No matter how much you attempt to modify to contract, your writing never applies."))
		return

	if(isnull(power_to_give))
		var/selected_power = tgui_input_list(user, "What do you wish to offer in exchange for one's soul?", "Your Offer.", possible_powers)

		if(!selected_power) // Didn't select a power, cancel.
			to_chat(user, span_notice("But you refrained..."))
			return

		power_to_give = selected_power
		contract_maker = user // just logging who made this contract for rewards later.
		icon_state = "paper_words"
		to_chat(user, span_notice("You forge the contract to grant the signee [power_to_give] in exchange for their soul."))
		return

	if(!HAS_TRAIT(user, TRAIT_DEVILISH) && HAS_TRAIT(user, TRAIT_NO_SOUL)) // Contract was made, but your potential buyer has nothing to offer.
		to_chat(user, span_notice("You've got no soul to give in exchange!"))
		return

	if(!HAS_TRAIT(user, TRAIT_DEVILISH) && HAS_TRAIT(user, TRAIT_SOUL_SOLD)) // Contract was made, but your potential buyer has nothing to offer.
		to_chat(user, span_notice("Your soul has already been sold!"))
		return

	if(HAS_TRAIT(user, TRAIT_DEVILISH) && !isnull(power_to_give)) // Contracts been made, but we're... trying to sign it ourselves?
		to_chat(user, span_danger("You already work for me. I refuse to make any deals with you."))
		return

	var/trade_offer = tgui_alert(user, "Sell your soul for [power_to_give]? This cannot be undone.", "Soul Ownership Contract", list("Yes", "No"))
	if(trade_offer == "No")
		to_chat(user, span_notice("But you refrained..."))
		return
	else
		fulfillBargain(I, user)
		return

/obj/item/soul_contract/proc/fulfillBargain(obj/item/I, mob/user)
	if(!user) // Something fucked up happened.
		return

	/// This little chunk down here gets the proc for whatever reward we're granting the user.
	if(power_to_give == "wealth")
		grantGreatWealth(I, user)
		return
	if(power_to_give == "immortality")
		grantImmortality(I, user)
		return
	if(power_to_give == "chaos")
		causeChaos(I, user)
		return
	if(power_to_give == "extra lives")
		grantExtraLives(I, user)
		return
	if(power_to_give == "eternal youth")
		grantEternalYouth(I, user)
		return
	if(power_to_give == "vengeance")
		deliverVengeance(I, user)
		return
	if(power_to_give == "perfect health")
		grantPerfectHealth(I, user)
		return
	if(power_to_give == "status")
		grantCaptaincy(I, user)
		return
	if(power_to_give == "protection")
		grantProtection(I, user)
		return
	if(power_to_give == "ultimate power")
		grantUltimatePower(I, user)
		return
	if(power_to_give == "syndicate allegiance")
		makeSyndicate(I, user)
		return

/obj/item/soul_contract/proc/afterWishEffects(obj/item/I, mob/user)
	ADD_TRAIT(user, TRAIT_SOUL_SOLD, SOUL_CONTRACT_TRAIT)
	to_chat(user, span_notice("As you finish signing the contract, you feel a part of yourself be shackled by invisible chains..."))
	playsound(src.loc, 'hypermods/sound/effects/magebook_used.ogg', 80, TRUE)
	playsound(src.loc, 'sound/effects/chemistry/ahaha.ogg', 30, TRUE)

	if(contract_maker) // Just in case the guy got gibbed or smth before we signed it.
		contract_maker.maxHealth += 10
		to_chat(contract_maker, span_danger("A contract granting [power_to_give] has been signed by [user]. A part of their essence has been bestowed upon you as thanks."))

	uses--
	if(uses <= 0)
		qdel(src)

/obj/item/soul_contract/proc/grantGreatWealth(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	var/obj/item/stack/spacecash/c100000/Newitem = new
	if(!our_signee.put_in_active_hand(Newitem))
		Newitem.forceMove(our_signee.drop_location())

	var/datum/bank_account/get_my_bank = our_signee.get_bank_account()

	if(!get_my_bank)
		var/obj/item/stack/spacecash/c100000/compensation = new
		if(!our_signee.put_in_active_hand(compensation))
			compensation.forceMove(our_signee.drop_location())
	else
		get_my_bank.payday_modifier *= 10

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantImmortality(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.add_traits(list(TRAIT_NODEATH, TRAIT_NOCRITDAMAGE, TRAIT_NO_OXYLOSS_PASSOUT, TRAIT_BOMBGIBIMMUNE), SOUL_CONTRACT_TRAIT)
	our_signee.apply_status_effect(/datum/status_effect/immortality_regen)
	to_chat(user, span_notice("You feel your very being compress inward, while you may be more frail, you can no longer die by most means!"))
	our_signee.maxHealth -= 25

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/causeChaos(obj/item/I, mob/user)
	var/new_lights = rand(1, 2)
	var/new_heavies = rand(0, 1)
	var/new_latejoins = rand(1, 2)

	SSdynamic.rulesets_to_spawn[LIGHT_MIDROUND] += new_lights
	SSdynamic.rulesets_to_spawn[HEAVY_MIDROUND] += new_heavies
	SSdynamic.rulesets_to_spawn[LATEJOIN] += new_latejoins

	var/random_event = pick(subtypesof(/datum/round_event_control))
	force_event(random_event, "a [src]")
	force_event(random_event, "a [src]")
	force_event(random_event, "a [src]")
	force_event(random_event, "a [src]")
	force_event(random_event, "a [src]")

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/makeSyndicate(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	var/obj/item/stack/telecrystal/twenty/Newitem = new
	if(!our_signee.put_in_active_hand(Newitem))
		Newitem.forceMove(our_signee.drop_location())

	our_signee.mind.add_antag_datum(/datum/antagonist/traitor/infiltrator/sleeper_agent)

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantExtraLives(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.apply_status_effect(/datum/status_effect/extra_lives/three)

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantEternalYouth(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.apply_status_effect(/datum/status_effect/eternal_youth)

	/// A few quirks commonly associated with the elderly.
	if(our_signee.has_quirk(/datum/quirk/badback))
		our_signee.remove_quirk(/datum/quirk/badback)
	if(our_signee.has_quirk(/datum/quirk/item_quirk/blindness))
		our_signee.remove_quirk(/datum/quirk/item_quirk/blindness)
	if(our_signee.has_quirk(/datum/quirk/item_quirk/deafness))
		our_signee.remove_quirk(/datum/quirk/item_quirk/deafness)

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/deliverVengeance(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user
	var/possible_targets = list()
	var/random_addict_quirks = list()

	for(var/mob/living/all_players as anything in GLOB.alive_player_list)
		possible_targets |= all_players

	var/mob/living/selected_target = tgui_input_list(our_signee, "Whom do you seek Vengeance upon?", "Target of Vengeance", possible_targets)
	if(!selected_target) // Didn't select someone.
		to_chat(our_signee, span_notice("But you refrained..."))
		return
	if(selected_target == our_signee) // Uh...
		to_chat(our_signee, span_notice("You can't seek Vengeance upon yourself, no matter how masochistic you may be."))
		return

	to_chat(selected_target, span_danger("You're suddenly assaulted by a barrage of invisible blows at a rate you couldn't possibly process or counter! A demonic voice then speaks into your dying mind: '[our_signee] sends their regards.'"))
	playsound(selected_target.loc, 'sound/effects/magic/demon_attack1.ogg', 50, TRUE)
	selected_target.emote("flip")
	selected_target.emote("spin")
	selected_target.apply_status_effect(/datum/status_effect/no_gravity)

	selected_target.take_overall_damage(brute = 300) // instant death for most people.

	selected_target.add_traits(list(TRAIT_CURSED), "vengence-wish") // bad luck

	for(var/type in subtypesof(/datum/quirk/item_quirk/addict)) // grab an addiction-based quirk
		random_addict_quirks |= type

	var/datum/quirk/item_quirk/addict/quirk_type = pick(random_addict_quirks) // pick one
	selected_target.add_quirk(quirk_type) // and give it to that mf

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantPerfectHealth(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user
	var/all_quirks_to_remove = list(
		/datum/quirk/badback,
		/datum/quirk/item_quirk/blindness,
		/datum/quirk/item_quirk/deafness,
		/datum/quirk/item_quirk/asthma,
		/datum/quirk/item_quirk/anosmia,
		/datum/quirk/blooddeficiency,
		/datum/quirk/item_quirk/chronic_illness,
		/datum/quirk/item_quirk/food_allergic,
		/datum/quirk/item_quirk/immunodeficiency,
		/datum/quirk/hemiplegic,
		/datum/quirk/item_quirk/brainproblems,
		/datum/quirk/insanity,
		/datum/quirk/mute,
		/datum/quirk/item_quirk/narcolepsy,
		/datum/quirk/item_quirk/nearsighted,
		/datum/quirk/paraplegic,
		/datum/quirk/prosopagnosia,
		/datum/quirk/prosthetic_limb,
		/datum/quirk/prosthetic_organ,
		/datum/quirk/quadruple_amputee,
		/datum/quirk/item_quirk/scarred_eye,
		/datum/quirk/tin_man,
		/datum/quirk/unstable,
		/datum/quirk/hunger_damage
	)
	// Full heal, and immunity to dismemberment, soft crit, critical condition damage, and a permanent spaceacillin effect.
	our_signee.revive(ADMIN_HEAL_ALL)
	our_signee.add_traits(list(TRAIT_NOCRITDAMAGE, TRAIT_NODISMEMBER, TRAIT_NOSOFTCRIT, TRAIT_VIRUS_RESISTANCE), "perfecthealth-wish")
	// It's a PERFECT health wish... It should remove certain debilitating quirks.

	for(var/datum/quirk/quirk_type as anything in all_quirks_to_remove)
		if(our_signee.has_quirk(quirk_type))
			our_signee.remove_quirk(quirk_type)

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantCaptaincy(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	var/equipment_loss_warning = tgui_alert(user, "Do you acknowledge the potential loss of everything you have equipped?", "Equipment Loss Warning", list("Yes", "No"))
	if(equipment_loss_warning == "No")
		to_chat(user, span_notice("But you refrained for now."))
		return

	message_admins("[key_name(our_signee)] has replaced the Captain")
	SEND_SOUND(world, sound('sound/effects/magic/timeparadox2.ogg'))

	for (var/mob/living/carbon/human/crewmate as anything in GLOB.human_list)
		if (!crewmate.mind)
			continue
		crewmate.Unconscious(5 SECONDS) // Everyone falls unconscious but not everyone gets told about a new captain
		if (crewmate == our_signee || IS_HUMAN_INVADER(crewmate))
			continue
		to_chat(crewmate, span_danger("The world goes black as screams of agony fill your ears.\n\
			Fire blazes within the confines of your mind as visions of tortured souls fill your eyes. \
			Sitting upon a mountain of writhing bodies, a bloodied throne of countless skulls sits... you snap back to reality. \n\
			Everything is just as it was and always has been. \n\n\
			A peculiar thought rises from the depths of your mind. \n\
			[span_hypnophrase("I'm so glad that [our_signee.real_name] is our legally appointed Captain!")] \n\
			For a moment, you feel like everything will be alright."))
		if (is_captain_job(crewmate.mind.assigned_role))
			crewmate.forceEquipOutfit(/datum/outfit/job/security)
			GLOB.manifest.modify(crewmate.real_name, JOB_SECURITY_OFFICER, JOB_SECURITY_OFFICER)

	our_signee.forceEquipOutfit(/datum/outfit/job/captain)
	GLOB.manifest.modify(our_signee.real_name, JOB_CAPTAIN, JOB_CAPTAIN)
	minor_announce("Captain [our_signee.real_name] on deck!")

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantProtection(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.apply_status_effect(/datum/status_effect/protection_wish)

	afterWishEffects(I, user)

/obj/item/soul_contract/proc/grantUltimatePower(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.dna.add_mutation(/datum/mutation/hulk/no_loss_on_crit/free, "ultimate-power-wish")
	our_signee.dna.add_mutation(/datum/mutation/strength/free, "ultimate-power-wish")
	our_signee.dna.add_mutation(/datum/mutation/laser_eyes/free, "ultimate-power-wish")
	our_signee.maxHealth += 25

	afterWishEffects(I, user)
