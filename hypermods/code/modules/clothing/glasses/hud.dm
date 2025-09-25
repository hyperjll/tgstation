/obj/item/clothing/glasses/hud/health/prescription
	name = "prescription health scanner HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_MEDICAL_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/health/night/prescription
	name = "prescription night vision health scanner HUD"
	desc = "An advanced medical heads-up display that allows doctors to find patients in complete darkness. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_MEDICAL_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/hud/health/meson/prescription
	name = "prescription meson health scanner HUD"
	desc = "A medical heads-up display that comes with an optical meson scanner. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_MEDICAL_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/hud/health/sunglasses/prescription
	name = "prescription medical HUDSunglasses"
	desc = "Sunglasses with a medical HUD. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_MEDICAL_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/hud/diagnostic/prescription
	name = "prescription diagnostic HUD"
	desc = "A heads-up display capable of analyzing the integrity and status of robotics and exosuits. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_DIAGNOSTIC_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/diagnostic/night/prescription
	name = "prescription night vision diagnostic HUD"
	desc = "A robotics diagnostic HUD fitted with a light amplifier. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_DIAGNOSTIC_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/prescription
	name = "prescription diagnostic sunglasses"
	desc = "Sunglasses with a diagnostic HUD. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_DIAGNOSTIC_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/rd
	name = "scientific diagnostic sunglasses"
	desc = "Sunglasses with a diagnostic HUD and allow the wearer to recognize various chemical compounds with only a glance."
	clothing_traits = list(TRAIT_DIAGNOSTIC_HUD, TRAIT_REAGENT_SCANNER, TRAIT_RESEARCH_SCANNER)
	custom_premium_price = 800

/obj/item/clothing/glasses/hud/security/prescription
	name = "prescription security HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status and security records. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_SECURITY_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/security/sunglasses/prescription
	name = "prescription security HUDSunglasses"
	desc = "Sunglasses with a security HUD. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_SECURITY_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/hud/security/night/prescription
	name = "prescription night vision security HUD"
	desc = "An advanced heads-up display which provides ID data and vision in complete darkness. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_SECURITY_HUD, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/meson/prescription
	name = "prescription optical meson scanner"
	desc = "Used by engineering and mining staff to see basic structural and terrain layouts through walls, regardless of lighting conditions. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 200

/obj/item/clothing/glasses/meson/night/prescription
	name = "prescription night vision meson scanner"
	desc = "An optical meson scanner fitted with an amplified visible light spectrum overlay, providing greater visual clarity in darkness. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/meson/sunglasses
	name = "meson sunglasses"
	desc = "Sunglasses that also function as a meson scanner."
	icon = 'hypermods/icons/obj/clothing/glasses.dmi'
	icon_state = "sunhudmeson"
	worn_icon = 'hypermods/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/meson/sunglasses/prescription
	name = "prescription meson sunglasses"
	desc = "Sunglasses that also function as a meson scanner. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/science/prescription
	name = "prescription science goggles"
	desc = "A pair of snazzy goggles used to protect against chemical spills. Fitted with an analyzer for scanning items and reagents. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 200

/obj/item/clothing/glasses/science/night/prescription
	name = "prescription night vision science goggles"
	desc = "A pair of snazzy goggles used to protect against chemical spills that happen in complete darkness. Fitted with an analyzer for scanning items and reagents. Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500

/obj/item/clothing/glasses/night/prescription
	name = "prescription night vision goggles"
	desc = "You can totally see in the dark now! Fitted specifically for the near-sighted."
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_NEARSIGHTED_CORRECTED)
	custom_premium_price = 500


/obj/item/clothing/glasses/universal
	name = "universal hud goggles"
	desc = "An all-in-one for purposes unknown."
	icon_state = "nvgmeson"
	inhand_icon_state = "nvgmeson"
	glass_colour_type = FALSE
	vision_flags = SEE_TURFS
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_MADNESS_IMMUNE, TRAIT_NEARSIGHTED_CORRECTED)
	var/list/hudlist = list(DATA_HUD_MEDICAL_ADVANCED, DATA_HUD_DIAGNOSTIC, DATA_HUD_SECURITY_ADVANCED)
	actions_types = list(/datum/action/item_action/chameleon/change/glasses/no_preset)

/obj/item/clothing/glasses/universal/equipped(mob/user, slot)
	. = ..()
	if(!(slot & ITEM_SLOT_EYES))
		return
	if(ishuman(user))
		for(var/hud in hudlist)
			var/datum/atom_hud/our_hud = GLOB.huds[hud]
			our_hud.show_to(user)
		user.add_traits(list(TRAIT_MEDICAL_HUD, TRAIT_SECURITY_HUD), GLASSES_TRAIT)

/obj/item/clothing/glasses/universal/dropped(mob/user)
	. = ..()
	user.remove_traits(list(TRAIT_MEDICAL_HUD, TRAIT_SECURITY_HUD), GLASSES_TRAIT)
	if(ishuman(user))
		for(var/hud in hudlist)
			var/datum/atom_hud/our_hud = GLOB.huds[hud]
			our_hud.hide_from(user)

/obj/item/clothing/glasses/universal/antiflash
	name = "universal hud goggles"
	desc = "An all-in-one for purposes unknown."
	icon_state = "nvgmeson"
	inhand_icon_state = "nvgmeson"
	flags_cover = GLASSESCOVERSEYES
	flash_protect = FLASH_PROTECTION_WELDER
	lighting_cutoff = LIGHTING_CUTOFF_HIGH
	glass_colour_type = FALSE
	vision_flags = SEE_TURFS
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_MADNESS_IMMUNE)
	hudlist = list(DATA_HUD_MEDICAL_ADVANCED, DATA_HUD_DIAGNOSTIC, DATA_HUD_SECURITY_ADVANCED)
	actions_types = list(/datum/action/item_action/chameleon/change/glasses/no_preset)

/obj/item/clothing/glasses/hud/medsechud/disguised
	name = "sunglasses"
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Enhanced shielding blocks flashes."
	icon_state = "sun"
	inhand_icon_state = "sunglasses"
	flags_cover = GLASSESCOVERSEYES
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED, TRAIT_MEDICAL_HUD, TRAIT_SECURITY_HUD)
