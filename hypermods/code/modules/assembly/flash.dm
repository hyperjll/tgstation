/obj/item/assembly/flash/lantern
	name = "suspicious lantern"
	desc = "A suspicious looking lantern."
	icon = 'icons/obj/devices/lighting.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/mining_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/mining_righthand.dmi'
	icon_state = "syndilantern"
	inhand_icon_state = "syndilantern"
	flashing_overlay = "syndilantern-on"
	worn_icon_state = "flashlight"
	pickup_sound = null
	drop_sound = null
	burnout_resistance = 1
	cooldown = 5 SECONDS

/obj/item/assembly/flash/handheld/upgraded
	name = "security flash"
	desc = "A powerful and versatile flashbulb device, with applications ranging from disorienting attackers to acting as visual receptors in robot production. This one has extended range and a more powerful bulb."
	icon = 'hypermods/icons/obj/devices/flash.dmi'
	icon_state = "secflash"
	flashing_overlay = "secflash-f"
	burnout_resistance = 0.3
	aoerange = 5
	aoeconfusiondur = 8 SECONDS
