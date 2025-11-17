/obj/item/guardian_creator/chaplain
	name = "deck of holy tarot cards"
	desc = "A holy deck of tarot cards, harboring a healing spirit."
	theme = GUARDIAN_THEME_HOLY
	possible_guardians = list(
		/mob/living/basic/guardian/chaplain
	)

/obj/item/guardian_creator/chaplain/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, TRUE, FALSE, null, null, FALSE)
