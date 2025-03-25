/datum/uplink_category/explosives
	name = "Explosive Weapons"
	weight = 23

/datum/uplink_item/explosives
	category = /datum/uplink_category/explosives


/datum/uplink_item/explosives/smoke
	name = "Smoke Grenades"
	desc = "A box that contains five smoke grenades. Useful for vanishing and ninja fans with katana."
	item = /obj/item/storage/box/syndie_kit/smoke
	cost = 2

/datum/uplink_item/explosives/syndicate_minibomb
	name = "Syndicate Minibomb"
	desc = "The minibomb is a grenade with a five-second fuse. Upon detonation, it will create a small hull breach \
			in addition to dealing high amounts of damage to nearby personnel."
	progression_minimum = 30 MINUTES
	item = /obj/item/grenade/syndieminibomb
	cost = 6
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/explosives/cat
	name = "Feral cat grenade"
	desc = "This grenade is filled with 5 feral cats in stasis. Upon activation, the feral cats are awoken and unleashed unto unlucky bystanders. WARNING: The cats are not trained to discern friend from foe!"
	cost = 5
	item = /obj/item/grenade/spawnergrenade/cat
	surplus = 30
