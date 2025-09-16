/// Under/Jumpsuit Slot Items (Deletes overrided items)
/datum/loadout_category/under
	category_name = "Jumpsuit"
	category_ui_icon = FA_ICON_RUNNING
	type_to_generate = /datum/loadout_item/under
	tab_order = 1

/datum/loadout_item/under
	abstract_type = /datum/loadout_item/under

/datum/loadout_item/under/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	outfit.uniform = item_path


/datum/loadout_item/under/slacks
	name = "Slacks"
	item_path = /obj/item/clothing/under/pants/slacks

/datum/loadout_item/under/shorts
	name = "Shorts"
	item_path = /obj/item/clothing/under/shorts

/datum/loadout_item/under/jeans
	name = "Jeans"
	item_path = /obj/item/clothing/under/pants/jeans

/datum/loadout_item/under/jeanshorts
	name = "Jeanshorts"
	item_path = /obj/item/clothing/under/shorts/jeanshorts

/datum/loadout_item/under/buttondownslacks
	name = "Buttondown Slacks"
	item_path = /obj/item/clothing/under/costume/buttondown/slacks

/datum/loadout_item/under/buttondownshorts
	name = "Buttondown Shorts"
	item_path = /obj/item/clothing/under/costume/buttondown/shorts

/datum/loadout_item/under/buttondownskirt
	name = "Buttondown Skirt"
	item_path = /obj/item/clothing/under/costume/buttondown/skirt

/datum/loadout_item/under/sundress
	name = "Sundress"
	item_path = /obj/item/clothing/under/dress/sundress

/datum/loadout_item/under/tango
	name = "Tango"
	item_path = /obj/item/clothing/under/dress/tango

/datum/loadout_item/under/plaid
	name = "Plaid"
	item_path = /obj/item/clothing/under/dress/skirt/plaid

/datum/loadout_item/under/turtleskirt
	name = "Turtleskirt"
	item_path = /obj/item/clothing/under/dress/skirt/turtleskirt

/datum/loadout_item/under/overalls
	name = "Overalls"
	item_path = /obj/item/clothing/under/misc/overalls

/datum/loadout_item/under/camo
	name = "Camo"
	item_path = /obj/item/clothing/under/pants/camo

/datum/loadout_item/under/track
	name = "Track"
	item_path = /obj/item/clothing/under/pants/track

/datum/loadout_item/under/kilt
	name = "Kilt"
	item_path = /obj/item/clothing/under/costume/kilt

/datum/loadout_item/under/dressstriped
	name = "Striped Dress"
	item_path = /obj/item/clothing/under/dress/striped

/datum/loadout_item/under/sailor
	name = "Sailor Dress"
	item_path = /obj/item/clothing/under/dress/sailor

/datum/loadout_item/under/eveninggown
	name = "Evening Gown"
	item_path = /obj/item/clothing/under/dress/eveninggown

/datum/loadout_item/under/pjblue
	name = "PJ's (Blue)"
	item_path = /obj/item/clothing/under/misc/pj/blue

/datum/loadout_item/under/pjred
	name = "PJ's (Red)"
	item_path = /obj/item/clothing/under/misc/pj/red

/datum/loadout_item/under/skirt
	name = "Skirt"
	item_path = /obj/item/clothing/under/dress/skirt

/datum/loadout_item/under/football_suit
	name = "Football Suit"
	item_path = /obj/item/clothing/under/costume/football_suit

/datum/loadout_item/under/ethereal_tunic
	name = "Ethereal Tunic"
	item_path = /obj/item/clothing/under/ethereal_tunic

/datum/loadout_item/under/yukata
	name = "Yukata"
	item_path = /obj/item/clothing/under/costume/yukata

/datum/loadout_item/under/yukatagreen
	name = "Green Yukata"
	item_path = /obj/item/clothing/under/costume/yukata/green

/datum/loadout_item/under/yukatawhite
	name = "White Yukata"
	item_path = /obj/item/clothing/under/costume/yukata/white

/datum/loadout_item/under/kimono
	name = "Kimono"
	item_path = /obj/item/clothing/under/costume/kimono

/datum/loadout_item/under/kimonored
	name = "Red Kimono"
	item_path = /obj/item/clothing/under/costume/kimono/red

/datum/loadout_item/under/kimonopurple
	name = "Purple Kimono"
	item_path = /obj/item/clothing/under/costume/kimono/purple

/datum/loadout_item/under/kimonoblue
	name = "Blue Kimono"
	item_path = /obj/item/clothing/under/costume/kimono/blue

/datum/loadout_item/under/yuri
	name = "Yuri"
	item_path = /obj/item/clothing/under/costume/yuri

/datum/loadout_item/under/dutch
	name = "Dutch"
	item_path = /obj/item/clothing/under/costume/dutch

/datum/loadout_item/under/osi
	name = "Osi"
	item_path = /obj/item/clothing/under/costume/osi
