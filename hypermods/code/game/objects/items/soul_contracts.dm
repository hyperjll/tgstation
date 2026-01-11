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
		"syndicate allegiance",
		"extra lives",
		"eternal youth",
	)
	var/power_to_give = null
	var/mob/living/contract_maker = null

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

	ADD_TRAIT(user, TRAIT_SOUL_SOLD, SOUL_CONTRACT_TRAIT)
	to_chat(user, span_notice("As you finish signing the contract, you feel a part of yourself be shackled by invisible chains..."))
	playsound(src.loc, 'hypermods/sound/effects/magebook_used.ogg', 80, TRUE)
	playsound(src.loc, 'sound/effects/chemistry/ahaha.ogg', 30, TRUE)

	contract_maker.maxHealth += 10
	to_chat(contract_maker, span_danger("A contract granting [power_to_give] has been signed by [user]. A part of their essence has been bestowed upon you as thanks."))

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
	if(power_to_give == "syndicate allegiance")
		makeSyndicate(I, user)
		return
	if(power_to_give == "extra lives")
		grantExtraLives(I, user)
		return
	if(power_to_give == "eternal youth")
		grantEternalYouth(I, user)
		return

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

	qdel(src)

/obj/item/soul_contract/proc/grantImmortality(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	ADD_TRAIT(our_signee, TRAIT_NODEATH, SOUL_CONTRACT_TRAIT)
	ADD_TRAIT(our_signee, TRAIT_NOCRITDAMAGE, SOUL_CONTRACT_TRAIT) // Not going to be permanently stuck in crit by that alone.
	our_signee.apply_status_effect(/datum/status_effect/immortality_regen)
	to_chat(user, span_notice("You feel your very being compress inward, while you may be more frail, you can no longer die by most means!"))
	our_signee.maxHealth -= 25

	qdel(src)

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

	qdel(src)

/obj/item/soul_contract/proc/makeSyndicate(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	var/obj/item/stack/telecrystal/twenty/Newitem = new
	if(!our_signee.put_in_active_hand(Newitem))
		Newitem.forceMove(our_signee.drop_location())

	our_signee.mind.add_antag_datum(/datum/antagonist/traitor/infiltrator/sleeper_agent)

	qdel(src)

/obj/item/soul_contract/proc/grantExtraLives(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.apply_status_effect(/datum/status_effect/extra_lives/three)

	qdel(src)

/obj/item/soul_contract/proc/grantEternalYouth(obj/item/I, mob/user)
	var/mob/living/carbon/human/our_signee = user

	our_signee.apply_status_effect(/datum/status_effect/eternal_youth)

	qdel(src)
