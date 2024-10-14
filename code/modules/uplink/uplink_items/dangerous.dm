//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Ranged Weapons"
	weight = 26

/datum/uplink_item/dangerous
	category = /datum/uplink_category/dangerous

/datum/uplink_item/dangerous/foampistol
	name = "Toy Pistol with Riot Darts"
	desc = "An innocent-looking toy pistol designed to fire foam darts. Comes loaded with riot-grade \
			darts effective at incapacitating a target."
	item = /obj/item/gun/ballistic/automatic/pistol/toy/riot
	cost = 2
	surplus = 10
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/dangerous/pistol
	name = "Makarov Pistol"
	desc = "A small, easily concealable handgun that uses 9mm auto rounds in 8-round magazines and is compatible \
			with suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol
	cost = 7
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/throwingweapons
	name = "Box of Throwing Weapons"
	desc = "A box of shurikens and reinforced bolas from ancient Earth martial arts. They are highly effective \
			throwing weapons. The bolas can knock a target down and the shurikens will embed into limbs."
	item = /obj/item/storage/box/syndie_kit/throwing_weapons
	cost = 3
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/dangerous/revolver
	name = "Syndicate Revolver"
	desc = "Waffle Co.'s modernized Syndicate revolver. Utilizes bluespace technology to have 12 chambers specifically designed to fire brutal rounds of .357 Magnum."
	item = /obj/item/gun/ballistic/revolver/syndicate
	cost = 13
	surplus = 50
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS //nukies get their own version
