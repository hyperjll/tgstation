/datum/outfit/syndicate_satellite
	name = "Syndicate Satellite Agent"
	id = /obj/item/card/id/advanced/chameleon
	id_trim = /datum/id_trim/chameleon/operative
	uniform = /obj/item/clothing/under/syndicate
	back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/syndicate/alt
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	shoes = /obj/item/clothing/shoes/combat

	implants = list(/obj/item/implant/area_restricted_duster/syndicate_satellite)

/datum/outfit/syndicate_satellite/post_equip(mob/living/carbon/human/H)
	H.add_faction(ROLE_SYNDICATE)

/obj/effect/mob_spawn/ghost_role/human/syndicate/satellite
	name = "Syndicate Satellite Agent"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	prompt_name = "a syndicate satellite agent"
	you_are_text = "You are a syndicate satellite agent."
	flavour_text = "You have awoken from your cryogenic slumber in response to a call issued by a syndicate agent in need. Man the satellite and assist agents in need."
	important_text = "Do NOT leave the satellite at all costs. Defend it from potential invaders."
	outfit = /datum/outfit/syndicate_satellite
	spawner_job_path = /datum/job/syndicate_satellite_agent
	allow_custom_character = ALL
