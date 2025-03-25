/obj/item/storage/fancy/donut_box/deadly
	spawn_type = /obj/item/food/donut/deadly

// Trick Cigarettes

/obj/item/storage/fancy/cigarettes/trick_cigs
	spawn_type = /obj/item/cigarette/syndicate/explosive

// Dermal Hardening Cigarettes

/obj/item/storage/fancy/cigarettes/dermal_harden
	name = "\improper Robust packet"
	desc = "Smoked by the robust."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/dermalharden

/obj/item/storage/fancy/cigarettes/dermal_harden/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/dermalharden(src)

// Special healing cigarettes

/obj/item/storage/fancy/cigarettes/space_cigarette_pen_acid
	name = "\improper Space Cigarettes packet"
	desc = "The most popular brand of cigarettes, sponsors of the Space Olympics. On the back it advertises to be the only brand that can be smoked in the vaccum of space."
	icon_state = "cig"
	base_icon_state = "cig"
	spawn_type = /obj/item/cigarette/syndicate/space_cigarette_pen_acid

/obj/item/storage/fancy/cigarettes/space_cigarette_pen_acid/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/space_cigarette_pen_acid(src)

/obj/item/storage/fancy/cigarettes/dromedary_oxandrolone
	name = "\improper DromedaryCo packet"
	desc = "A packet of six imported DromedaryCo cancer sticks. A label on the packaging reads, \"Wouldn't a slow death make a change?\""
	icon_state = "dromedary"
	base_icon_state = "dromedary"
	spawn_type = /obj/item/cigarette/syndicate/dromedary_oxandrolone

/obj/item/storage/fancy/cigarettes/dromedary_oxandrolone/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/dromedary_oxandrolone(src)

/obj/item/storage/fancy/cigarettes/uplift_salbutamol
	name = "\improper Uplift Smooth packet"
	desc = "Your favorite brand, now menthol flavored."
	icon_state = "uplift"
	base_icon_state = "uplift"
	spawn_type = /obj/item/cigarette/syndicate/uplift_salbutamol

/obj/item/storage/fancy/cigarettes/uplift_salbutamol/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/uplift_salbutamol(src)

/obj/item/storage/fancy/cigarettes/robust_sal_acid
	name = "\improper Robust packet"
	desc = "Smoked by the robust."
	icon_state = "robust"
	base_icon_state = "robust"
	spawn_type = /obj/item/cigarette/syndicate/robust_sal_acid

/obj/item/storage/fancy/cigarettes/robust_sal_acid/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/robust_sal_acid(src)

/obj/item/storage/fancy/cigarettes/deluxe_antibrute_cigarette_pack
	name = "\improper Deluxe Anti-Brute Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms for Brute damage."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_antibrute_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_antibrute_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_antibrute_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_antiburn_cigarette_pack
	name = "\improper Deluxe Anti-Burn Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms for Burn damage."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_antiburn_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_antiburn_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_antiburn_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_antioxygen_cigarette_pack
	name = "\improper Deluxe Anti-Aspyxiation Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms for Oxygen damage."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_antioxygen_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_antioxygen_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_antioxygen_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_antitoxin_cigarette_pack
	name = "\improper Deluxe Anti-Toxin Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms for Toxin damage."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_antitoxin_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_antitoxin_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_antitoxin_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_speedup_cigarette_pack
	name = "\improper Deluxe Speed-Up Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of narcotics that will boost your speed... for a price."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_speedup_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_speedup_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_speedup_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_cureall_cigarette_pack
	name = "\improper Deluxe Cure-All Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms of damage."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_cureall_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_cureall_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_cureall_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_sensory_cigarette_pack
	name = "\improper Deluxe Sensory-Repair Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms for Sensory damage."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_sensory_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_sensory_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_sensory_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_strange_cigarette_pack
	name = "\improper Deluxe Strange Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain a strange combination of chemicals. Only an experienced smoker will know how to make use of this."
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_strange_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_strange_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_strange_cigarette_pack(src)

/obj/item/storage/fancy/cigarettes/deluxe_slimey_cigarette_pack
	name = "\improper Deluxe Slimey Cigarette Packet"
	desc = "These cigarettes are contained within a golden packet, upon close inspection, you can see multiple brand stickers layered upon one another. \
	These cigarettes take roughly a minute to smoke, and contain loads of healing medicines to deal with all forms for damage. The omnizine has been replaced with something else?"
	icon_state = "robustg"
	base_icon_state = "robustg"
	spawn_type = /obj/item/cigarette/syndicate/deluxe_slimey_cigarette_pack

/obj/item/storage/fancy/cigarettes/deluxe_slimey_cigarette_pack/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cigarette/syndicate/deluxe_slimey_cigarette_pack(src)
