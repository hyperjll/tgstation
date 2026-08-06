/datum/crafting_recipe/speed_shoes
	name = "Speed Shoes"
	reqs = list(
		/obj/item/speed_shoes_inert = 1,
		/obj/item/assembly/signaler/anomaly/flux = 1,
	)
	result = /obj/item/clothing/shoes/anom_speed_shoes
	category = CAT_CLOTHING

/datum/crafting_recipe/lifeforce_signet
	name = "Lifeforce Signet"
	reqs = list(
		/obj/item/lifeforce_signet_inert = 1,
		/obj/item/assembly/signaler/anomaly/ectoplasm = 1,
	)
	result = /obj/item/clothing/neck/necklace/lifeforce_signet
	category = CAT_CLOTHING

/datum/crafting_recipe/nerd_suit
	name = "Anomalous D.O.T.A Suit"
	reqs = list(
		/obj/item/clothing/suit/armor/nerd/no_anom = 1,
		/obj/item/assembly/signaler/anomaly/bioscrambler = 1,
	)
	result = /obj/item/clothing/suit/armor/nerd
	category = CAT_CLOTHING
