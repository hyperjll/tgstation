/obj/item/pai_card/syndicate
	desc = "Downloads personal AI assistants to accompany its owner or others. Equipped with specialized hardware and potential for decent support."
	icon = 'hypermods/icons/obj/aicards.dmi'
	icon_state = "spai"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	name = "personal AI device"
	resistance_flags = FIRE_PROOF | ACID_PROOF | INDESTRUCTIBLE
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	worn_icon_state = "electronic"
	screen_image = /datum/pai_screen_image_syndicate/off
	syndicate = TRUE

/obj/item/pai_card/syndicate/Initialize(mapload)
	. = ..()
	update_appearance()
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF)

/obj/item/pai_card/syndicate/update_overlays()
	. = ..()
	. += image(icon = screen_image.icon, icon_state = screen_image.icon_state)
	if(pai?.hacking_cable)
		. += "[initial(icon_state)]-connector"

/**
 * Downloads a candidate from the list and removes them from SSpai.candidates
 *
 * @param {string} ckey The ckey of the candidate to download
 *
 * @returns {boolean} - TRUE if the candidate was downloaded, FALSE if not
 */
/obj/item/pai_card/syndicate/download_candidate(mob/user, ckey)
	if(pai)
		return FALSE
	var/datum/pai_candidate/candidate = SSpai.candidates[ckey]
	if(!candidate?.check_ready())
		balloon_alert(user, "download interrupted")
		return FALSE
	var/mob/living/silicon/pai/syndicate/new_pai = new(src)
	new_pai.name = candidate.name || pick(GLOB.ninja_names)
	new_pai.real_name = new_pai.name
	new_pai.key = candidate.ckey
	set_personality(new_pai)
	SSpai.candidates -= ckey
	return TRUE

/**
 * Pings ghosts to announce that someone is requesting a pAI
 *
 * @param {mob} user - The user who is requesting a pAI
 *
 * @returns {boolean} - TRUE if the pAI was requested, FALSE if not
 */
/obj/item/pai_card/syndicate/find_pai(mob/user)
	if(pai)
		return FALSE
	if(!(GLOB.ghost_role_flags & GHOSTROLE_SILICONS))
		balloon_alert(user, "unavailable: blacklisted")
		return FALSE
	if(request_spam)
		balloon_alert(user, "request sent too recently")
		return FALSE
	request_spam = TRUE
	playsound(src, 'sound/machines/ping.ogg', 20, TRUE)
	balloon_alert(user, "pAI assistance requested")
	var/mutable_appearance/alert_overlay = mutable_appearance('hypermods/icons/obj/aicards.dmi', "spai")

	notify_ghosts(
		"[user.real_name] is requesting a pAI companion! Use the pAI button to submit yourself as one.",
		source = user,
		header = "pAI Request!",
		alert_overlay = alert_overlay,
		notify_flags = NOTIFY_CATEGORY_NOFLASH,
		ignore_key = POLL_IGNORE_PAI,
	)

	addtimer(VARSET_CALLBACK(src, request_spam, FALSE), PAI_SPAM_TIME, TIMER_UNIQUE|TIMER_DELETE_ME)
	return TRUE

/**
 * Sets the personality on the current pai_card
 *
 * @param {silicon/pai} downloaded - The new pAI to load into the card.
 */
/obj/item/pai_card/syndicate/set_personality(mob/living/silicon/pai/downloaded)
	if(pai)
		return FALSE
	pai = downloaded
	RegisterSignal(pai, COMSIG_QDELETING, PROC_REF(on_pai_del))
	screen_image = /datum/pai_screen_image_syndicate/neutral
	update_appearance()
	playsound(src, 'sound/effects/pai_boot.ogg', 50, TRUE, -1)
	audible_message("[src] plays a cheerful startup noise!")
	return TRUE
