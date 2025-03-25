/obj/item/sharpener/syndicate
	name = "whetstone"
	icon = 'hypermods/icons/obj/service/kitchen.dmi'
	icon_state = "s_sharpener"
	desc = "A suspicious block that makes things sharp."
	force = 5
	///Amount of uses the whetstone has. Set to -1 for functionally infinite uses.
	uses = 6
	///How much force the whetstone can add to an item.
	increment = 5
	///Maximum force sharpening items with the whetstone can result in
	max = 30
	///The prefix a whetstone applies when an item is sharpened with it
	prefix = "sharpened"
	///If TRUE, the whetstone will only sharpen already sharp items
	requires_sharpness = FALSE
