/datum/uplink_category/mobility
	name = "Mobility"
	weight = 14

/datum/uplink_item/mobility
	category = /datum/uplink_category/mobility


/datum/uplink_item/mobility/doorjack
	name = "Airlock Authentication Override Card"
	desc = "A specialized cryptographic sequencer specifically designed to override station airlock access codes. \
			After hacking a certain number of airlocks, the device will require some time to recharge."
	item = /obj/item/card/emag/doorjack
	cost = 3

/datum/uplink_item/mobility/briefcase_launchpad
	name = "Briefcase Launchpad"
	desc = "A briefcase containing a launchpad, a device able to teleport items and people to and from targets up to eight tiles away from the briefcase. \
			Also includes a remote control, disguised as an ordinary folder. Touch the briefcase with the remote to link it."
	surplus = 0
	item = /obj/item/storage/briefcase/launchpad
	cost = 6

/datum/uplink_item/mobility/syndicate_teleporter
	name = "Experimental Syndicate Teleporter"
	desc = "A handheld device that teleports the user 4-8 meters forward. \
			Beware, teleporting into a wall will trigger a parallel emergency teleport; \
			however if that fails, you may need to be stitched back together. \
			Comes with 4 charges, recharges randomly. Warranty null and void if exposed to an electromagnetic pulse."
	item = /obj/item/storage/box/syndie_kit/syndicate_teleporter
	cost = 8

/datum/uplink_item/mobility/dangerous_horse
	name = "Boxed Syndicate Pony"
	desc = "A box containing a special breed of horse scientifically engineered by our best geneticists, now in cube form! \
			This horse can survive in the vacuum of space, doesn't require air to breathe, and is quite robust in combat. \
			Also comes with an apple for taming purposes, and a sentience potion which only works on our horses. \
			Despite it's survivability in space, it's not capable of space-traversal. For God's sake, don't make apple pie!"
	item = /obj/item/storage/box/syndicate/horse_box
	cost = 10


/datum/uplink_item/mobility/airshoes
	name = "Air Shoes"
	desc = "Popular in underground racing rings, these shoes come with built-in jets, allowing the user to reach high speeds in short bursts. \
			Users should keep in mind that despite being superior to Jump Shoes, these will not protect you from high-speed impacts."
	item = /obj/item/clothing/shoes/bhop/airshoes
	cost = 4
	surplus = 35

/datum/uplink_item/mobility/magboots
	name = "Advanced Blood-Red Magboots"
	desc = "A pair of magnetic boots with a Syndicate paintjob that assist with freer movement in space or on-station \
			especially during gravitational generator failures. These reverse-engineered prototypes of Nanotrasen's \
			'Advanced Magboots' won't slow you down in simulated-gravity environments much like the standard issue variety. \
			Additionally, these magboots may invert gravity upon the wearer, allowing for jetpack usage."
	item = /obj/item/clothing/shoes/magboots/syndie/advanced
	cost = 6

/datum/uplink_item/mobility/mdrive
	name = "Mirage Drive"
	desc = "An experimental device created as a byproduct of research into faster than light travel. Utilizing magnetic coils, the mirage drive is able to generate \
			kinetic energy and use it in a way that moves the user to their destination at a speed comparable to teleportation, so long as an unobstructed path between the \
			user and the target exists. Can also be used to deliver rapid-fire attacks onto targets you pass through."
	item = /obj/item/mdrive
	cost = 12

/datum/uplink_item/mobility/angelcoolboy
	name = "Angelic Potion"
	desc = "After many failed attempts, the syndicate has reverse engineered an angel potion smuggled off of the lava planet V-227. \
			Those who drink the contents of the bottle provided will immediately sprout wings capable of sustained flight. Wings may vary in appearance."
	cost = 2
	surplus = 10
	item = /obj/item/reagent_containers/cup/bottle/potion/flight/syndicate

/datum/uplink_item/mobility/jetpack
	name = "Smuggled Jetpack"
	desc = "A blue jetpack smuggled from NT's suppliers. It's been pre-filled with oxygen."
	item = /obj/item/tank/jetpack/oxygen
	cost = 2
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/mobility/advlaunchcamerasetup
	name = "Launchpad & Camera Setup Bundle"
	desc = "A box utilizing bluespace technology, it contains everything you'd require to setup a launchpad and advanced camera monitor. \
			Thank our smugglers in advance. Does not come with any power setup. If you'd prefer a mobile setup, try our briefcase launchpad."
	item = /obj/item/storage/box/syndie_kit/launchpadcamerabundle
	cost = 8
	surplus = 15

/datum/uplink_item/mobility/portalgun
	name = "Bluespace Wormhole Projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams capable of ripping holes within the fabric of space-time. \
			Shoot once for a blue portal, and alt-fire for a orange portal. Entities may pass through one portal to emerge from the other. \
			Portals will collapse and disappear eventually on their own, and portals may be created through windows."
	item = /obj/item/gun/energy/wormhole_projector/core_inserted
	cost = 5
	surplus = 18

/datum/uplink_item/mobility/spininverters
	name = "Quantum Spin Inverters"
	desc = "An experimental device that is able to swap the locations of two entities by switching their particles' spin values. Must be linked to another device to function."
	item = /obj/item/storage/box/syndie_kit/spininverters
	cost = 2
	surplus = 20

/datum/uplink_item/mobility/syndicate_fulton
	name = "Syndicate Fulton Package"
	desc = "A box containing two fulton packs that can be used anywhere, and two beacons for those fultons. \
			The fulton packs can be used anywhere, and the beacons can only be discovered via our packs. \
			Beacons are completely invisible. Comes with a manual to make more."
	item = /obj/item/storage/box/syndie_kit/syndifulton
	cost = 6
	surplus = 30

/datum/uplink_item/mobility/syndiway
	name = "Syndicate Segway"
	desc = "A segway with a syndicate paintjob designed for fast-paced action and mobility. \
			It's been reinforced with titanium plating to ensure your ride isn't so easily disabled. \
			Of course, it comes with the keys. The segway cannot be used without gravity, for obvious reasons."
	item = /obj/item/key/syndicate
	cost = 10
	surplus = 0 // Doesn't function with surplus crates
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/the_ride = /obj/vehicle/ridden/syndiway

/datum/uplink_item/mobility/syndiway/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	..() // Make sure the keys are given.
	var/obj/vehicle/ridden/syndiway/your_ride = new the_ride()
	if(!istype(your_ride))
		CRASH("uplink produced the wrong item instead of the syndicate segway.")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = your_ride,
	))
	return source //For log icon
