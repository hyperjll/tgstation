/// Turns the user into a thief, hiding looting notifications and doubling the time it takes to strip people.
/obj/item/book/granter/thievery
	starting_title = "The Art of Thievery"
	starting_author = "Anonymous"
	name = "The Art of Thievery"
	desc = "A manual describing ancient pickpocketing techniques passed down through generations of crooks and pickpockets alike."
	icon = 'hypermods/icons/obj/service/library.dmi'
	icon_state ="thievery"
	remarks = list(
		"Misdirection and misadventure...",
		"Tip-toeing helps... how exactly?",
		"...one must develop nimble fingers...",
		"Don't bother checking, just pinch and go...",
		"...patience wins the race...",
		"The fucks' a 'Dexterity' stat?",
	)
	uses = 1

/obj/item/book/granter/thievery/can_learn(mob/living/user)
	if (!isliving(user))
		return
	if (HAS_TRAIT(user, TRAIT_THIEF))
		to_chat(user, span_warning("You're already capable of great thievery!"))
		return
	return TRUE

/obj/item/book/granter/thievery/recoil(mob/living/user)
	to_chat(user, span_warning("You can't bring yourself to stoop to such lows..."))

/obj/item/book/granter/thievery/on_reading_finished(mob/living/user)
	..()
	to_chat(user, span_notice("You've learned how to pickpocket people stealthily!"))
	ADD_TRAIT(user, TRAIT_THIEF, "thief-book")
	if(!uses)
		qdel(src)
