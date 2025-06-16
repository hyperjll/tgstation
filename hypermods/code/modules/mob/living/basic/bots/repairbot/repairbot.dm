/mob/living/basic/bot/repairbot/start_equipped/Initialize(mapload)
	. = ..()
	our_iron = new(src, our_iron::max_amount)
	our_glass = new(src, our_glass::max_amount)
