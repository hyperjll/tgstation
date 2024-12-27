//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Ranged Weapons"
	weight = 26

/datum/uplink_item/dangerous
	category = /datum/uplink_category/dangerous

/datum/uplink_item/dangerous/foampistol
	name = "Donksoft Riot Pistol Case"
	desc = "A case containing an innocent-looking toy pistol designed to fire foam darts at higher than normal velocity. \
		Comes loaded with riot-grade darts effective at incapacitating a target, two spare magazines and a box of loose \
		riot darts. Perfect for nonlethal takedowns at range, as well as deniability. While not included in the kit, the \
		pistol is compatible with suppressors, which can be purchased separately."
	item = /obj/item/storage/toolbox/guncase/traitor/donksoft
	cost = 6
	surplus = 10
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/dangerous/pistol
	name = "Makarov Pistol Case"
	desc = "A weapon case containing an unknown variant of the Makarov pistol, along with two spare magazines and a box of loose 9mm ammunition. \
		Chambered in 9mm. Perfect for frequent skirmishes with security, as well as ensuring you have enough firepower to outlast the competition. \
		While not included in the kit, the pistol is compatible with suppressors, which can be purchased seperately."
	item = /obj/item/storage/toolbox/guncase/traitor
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
