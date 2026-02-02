/obj/machinery/deployable_turret/gatling
	name = "gatling gun turret"
	desc = "A heavy caliber 7mm machine gun commonly used by Syndicate forces, used by Syndicate elitiests to mow-down the competition."
	icon_state = "hmg"
	max_integrity = 300
	projectile_type = /obj/projectile/bullet/a7mm
	anchored = TRUE
	number_of_shots = 4
	cooldown_duration = 1 SECONDS
	rate_of_fire = 2
	firesound = 'sound/items/weapons/gun/l6/shot.ogg'
	overheatsound = 'sound/items/weapons/gun/l6/l6_rack.ogg'
	can_be_undeployed = TRUE
	spawned_on_undeploy = /obj/item/deployable_turret_folded/gatling
