// Base Keys

/datum/uplink_item/base_keys/gene_key
	name = "Syndicate Genetics Laboratory Access Card"
	desc = "For some Operatives, you enjoy tampering and experimentation with the laws of nature a little too much. \
		For those scientifically inclined, a special Authorization Key can be instantly delivered to your location. \
		Experiment with your genetics, gain superpowers, tamper with BCI technology, and inflict both upon your foes! \
		Comes with some useful equipment as well."
	item = /obj/item/keycard/syndicate_gene
	purchasable_from = UPLINK_CLOWN_OPS | UPLINK_NUKE_OPS

/datum/uplink_item/base_keys/nanite_key
	name = "Syndicate Nanite Laboratory Access Card"
	desc = "Some of our folks at Cybersun Industries recently shipped over some over their Nanite Technology to your base. \
		With this Authorization Key, you may have early access to the equipment to cause nanite havoc upon the crew, or support your team \
		using specialized robotic technology. Comes with many programs pre-downloaded! Get creative!"
	item = /obj/item/keycard/syndicate_nanite
	purchasable_from = UPLINK_CLOWN_OPS | UPLINK_NUKE_OPS

/datum/uplink_item/base_keys/armory_key
	name = "Syndicate Armory Access Card"
	desc = "Can't get enough fire power? Just declared war and need to arm yourself to the teeth? Feel like going in guns blazing? \
		For those with an unsatiated bloodlust, a special Authorization Key can be instantly delivered to your location. \
		Utilize the Armory within Firebase Balthazord to your heart's content, and make sure to send us the video footage!"
	item = /obj/item/keycard/syndicate_armory
	purchasable_from = UPLINK_NUKE_OPS
	cost = 100 // Contains sooooo many guns and ammo. More than enough to arm an entire team.

// Support

/datum/uplink_item/reinforcements/syndicat
	name = "SyndiCat Teleporter"
	desc = "Call in a handy cat equipped with an explosive implant. Explodes when seriously injured. \
			Can bite painfully and comes equipped with a syndicate cat hardsuit for space walks."
	item = /obj/item/antag_spawner/nuke_ops/syndicat
	cost = 6
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/penetratorturret
	name = "Disposable Penetrator Turret"
	desc = "A beacon which is used to send over a single high-end ballistic turret loaded with penetrator rounds. \
			A favorite among operatives who need decent deterrents for any particular area... or for replacing the turrets aboard your space cruiser."
	item = /obj/item/sbeacondrop/penetratorturret
	cost = 30 // Really strong with operatives nearby, damn near shuts down any offensive against the ops.
	cant_discount = TRUE // Letting people get infinite discounts by chance would absolutely suck ass.

// ~~ China-Lake Bundle ~~ (The one and ONLY.) Also has a 35 TC price tag for how destructive it is.

/datum/uplink_item/weapon_kits/extreme_cost
	cost = 35
	surplus = 10
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/weapon_kits/extreme_cost/chinalake
	name = "China Lake Case (???)"
	desc = "A classic grenade launcher favored for it's incredible destructive capabilities and decisive battles. \
			The launcher comes fully loaded with blast grenades with several blast grenades to spare, and two FRAG grenades for extra-powerful shots."
	item = /obj/item/storage/toolbox/guncase/chinalake
	relevant_child_items = list(
		/datum/uplink_item/ammo_nuclear/basic/blastnade,
		/datum/uplink_item/ammo_nuclear/basic/fragnade,
	)

/datum/uplink_item/ammo_nuclear/basic/blastnade
	name = "Blast Grenade Casing"
	desc = "A 40mm Grenade Round specifically designed to be fired from a China-Lake Grenade Launcher."
	item = /obj/item/ammo_casing/caseless/chinalake/blast
	cost = 3

/datum/uplink_item/ammo_nuclear/basic/fragnade
	name = "Frag Grenade Casing"
	desc = "A 40mm Grenade Round specifically designed to be fired from a China-Lake Grenade Launcher. \
			Highly explosive, stay clear when firing."
	item = /obj/item/ammo_casing/caseless/chinalake/frag
	cost = 5

// ~~ Tommy-Gun Bundle ~~

/datum/uplink_item/weapon_kits/high_cost/tommygun
	name = "Tommy Gun Case (Moderate)"
	desc = "A fully-loaded classical Thompson SMG with a 50-round .45 drum magazine. \
			This deadly weapon fires exceptionally quickly with deadly accuracy. Comes with two extra magazines."
	item = /obj/item/storage/toolbox/guncase/tommygun
	cost = 20
	relevant_child_items = list(
		/datum/uplink_item/ammo/tommygun,
	)

// ~~ Dual-Pistol Bundle ~~

/datum/uplink_item/weapon_kits/low_cost/pistols
	name = "Dual-Pistol Case (Hard)"
	desc = "A case containing a Viper and a Cobra. Also contained within are 2 10mm magazines and 2 .45 caseless magazines. \
			For all you pistol lovers out there."
	item = /obj/item/storage/toolbox/guncase/pistols
	cost = 11 // Bit of even pricing between low and med cost
	relevant_child_items = list(
		/datum/uplink_item/ammo/pistol10mm,
		/datum/uplink_item/ammo/pistol10mm/ap,
		/datum/uplink_item/ammo/pistol10mm/hp,
		/datum/uplink_item/ammo/pistol10mm/fire,
		/datum/uplink_item/ammo/pistol10mm/random,
		/datum/uplink_item/ammo/pistol10mm/cs,
		/datum/uplink_item/ammo/pistol10mm/emp,
		/datum/uplink_item/ammo/pistol10mm/sleepy,
		/datum/uplink_item/ammo/pistol10mm/bleedout,
		/datum/uplink_item/ammo/pistol10mm/rad,
		/datum/uplink_item/ammo/pistol10mm/fragment,
		/datum/uplink_item/ammo_restock/ammo10mmbox,
		/datum/uplink_item/ammo/handgun45,
		/datum/uplink_item/ammo/handgun45/ap,
		/datum/uplink_item/ammo/handgun45/hp,
		/datum/uplink_item/ammo/handgun45/inc,
		/datum/uplink_item/ammo/handgun45/random,
		/datum/uplink_item/ammo/handgun45/cs,
		/datum/uplink_item/ammo/handgun45/emp,
		/datum/uplink_item/ammo/handgun45/sp,
		/datum/uplink_item/ammo/handgun45/venom,
		/datum/uplink_item/ammo/handgun45/pacify,
		/datum/uplink_item/ammo/handgun45/delay,
		/datum/uplink_item/ammo/handgun45/tranq,
		/datum/uplink_item/ammo_restock/ammo45box,
	)

// ~~ Elemental-Pistol Bundle ~~

/datum/uplink_item/weapon_kits/medium_cost/elementals
	name = "Elemental Pistol Case (Hard)"
	desc = "A case containing two specialized energy handcannons of both hot and cold variety. \
			Both handcannons recharge automatically and produce additional... results when used against hot or cold targets. \
			Also contained within are 2 stimpacks, and an armored jumpsuit to sweeten the deal."
	item = /obj/item/storage/toolbox/guncase/elementalguns

// ~~ M-546 Osprey ~~

/datum/uplink_item/weapon_kits/extreme_cost/minigun
	name = "M-546 Osprey Case (Easy to Moderate)"
	desc = "A single back-mounted M-546 Osprey minigun setup capable of firing 7mm rounds at a rapid pace. \
			Though it eventually overheats, you'll never have to worry about running out of ammunition thanks to the \
			in-built 7mm manufactury within the ammo storage compartment. Comes with a Medical Variety Pack for increased survivability."
	item = /obj/item/storage/toolbox/guncase/minigun

// Explosives and Grenades
// ~~ Grenades ~~

/datum/uplink_item/explosive_tools/military_grade
	cost = 15
	surplus = 35
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosive_tools/military_grade/x4
	name = "Composition X-4"
	desc = "Similar to C4, but with a stronger blast that is directional instead of circular. X-4 can be placed on a solid surface, such as a wall or window, \
		and it will blast through the wall, injuring anything on the opposite side, while being safer to the user. For when you want a controlled explosion that \
		leaves a wider, deeper, hole."
	item = /obj/item/grenade/c4/x4
	cost = 2

/datum/uplink_item/explosive_tools/military_grade/c4bag
	name = "Bag of C-4 explosives"
	desc = "Because sometimes quantity is quality. Contains 10 C-4 plastic explosives."
	item = /obj/item/storage/backpack/duffelbag/syndie/c4
	cost = 5 // 50% discount!

/datum/uplink_item/explosive_tools/military_grade/x4bag
	name = "Bag of X-4 explosives"
	desc = "For when you didn't bring the bunker buster to your latest operation. Contains 10 X-4 shaped plastic explosives."
	item = /obj/item/storage/backpack/duffelbag/syndie/x4
	cost = 10 // 50% discount!

/datum/uplink_item/explosive_tools/military_grade/emp
	name = "Syndicate EMP Bomb"
	desc = "A variation of the syndicate bomb designed to produce a large EMP effect."
	item = /obj/item/sbeacondrop/emp
	cost = 6

/datum/uplink_item/explosive_tools/military_grade/emp/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		cost *= 2

/datum/uplink_item/explosive_tools/military_grade/syndicate_bomb
	name = "Syndicate Bomb"
	desc = "The Syndicate bomb is a fearsome device capable of massive destruction. It has an adjustable timer, \
		with a minimum of %MIN_BOMB_TIMER seconds, and can be bolted to the floor with a wrench to prevent \
		movement. The bomb is bulky and cannot be moved; upon ordering this item, a smaller beacon will be \
		transported to you that will teleport the actual bomb to it upon activation. Note that this bomb can \
		be defused, and some crew may attempt to do so. \
		The bomb core can be pried out and manually detonated with other explosives."
	item = /obj/item/sbeacondrop/bomb
	cost = 8
	purchasable_from = UPLINK_ALL_SYNDIE_OPS // just making sure.

/datum/uplink_item/explosive_tools/military_grade/syndicate_bomb/New()
	. = ..()
	desc = replacetext(desc, "%MIN_BOMB_TIMER", SYNDIEBOMB_MIN_TIMER_SECONDS)

// ~~ Mechs ~~

/datum/uplink_item/mech/savannah_ivanov
	name = "Savannah-Ivanov Exosuit"
	desc = "An insanely overbulked mecha that handily crushes single-pilot opponents. The only real 'drawback' is that it requires TWO operators. \
			Features high integrity, medium-grade defense, and an innate leap ability allowing you to crush people nearby and destroy the environment. \
			Those in the gunner seat can shoot aerial missiles directly onto targets. Doesn't come with any additional equipment."
	item = /obj/vehicle/sealed/mecha/savannah_ivanov
	cost = 75

/datum/uplink_item/mech/laser_shots
	name = "CH-PS \"Immolator\" laser"
	desc = "An energy arm-mounted rifle that fires lethal energy shots."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser
	cost = 8

/datum/uplink_item/mech/tesla_cannon
	name = "MKI Tesla Cannon"
	desc = "An energy cannon that fires bolts of condensed electricity. Allows for some decent crowd-control."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/energy/tesla
	cost = 8

/datum/uplink_item/mech/repair_droid
	name = "Exosuit Repair Droid"
	desc = "A single repair droid to install into any mech of choice, allowing for automatic self-repair at the cost of the mech's internal power source."
	item = /obj/item/mecha_parts/mecha_equipment/repair_droid
	cost = 8

// Stealthy Tools



// Modsuits



// Devices

/datum/uplink_item/device_tools/syndie_rcd
	name = "Syndicate Rapid-Construction-Device"
	desc = "Based on a Nanotrasen model, this powerful tool can repair or destroy structures very quickly. Holds 1000 matter. Can be recharged much like a regular RCD."
	item = /obj/item/construction/rcd/syndicate
	cost = 15
	purchasable_from = UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
	relevant_child_items = list(
		/datum/uplink_item/ammo/syndie_rcd_ammo,
	)

/datum/uplink_item/device_tools/syndie_arcd
	name = "Syndicate Advanced Rapid-Construction-Device"
	desc = "Based on a prototype Nanotrasen model, this powerful tool can repair or destroy structures very quickly from a distance! Holds 1000 matter. Can be recharged much like a regular RCD."
	item = /obj/item/construction/rcd/syndicate/ranged
	cost = 30
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
	relevant_child_items = list(
		/datum/uplink_item/ammo/syndie_rcd_ammo,
	)

/datum/uplink_item/device_tools/syndie_forcefields
	name = "Syndicate Forcefield Generator"
	desc = "Manufactured by Cybersun Industries, this powerful tool projects impassable walls of pure energy for a lengthy time. Forcefields can only sustain so much damage before dispersing. \
			Can project up to 6 forcefields at any time and will only be sustained should the projector be nearby. Perfect for holding off the hordes."
	item = /obj/item/forcefield_projector/syndicate
	cost = 12
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

// Ammo

/datum/uplink_item/ammo_nuclear/special/smgvenom
	name = ".45 Venom SMG Magazine (C-20r)"
	desc = "An additional 24-round .45 magazine suitable for use with the C-20r submachine gun. \
			These bullets inject the victim with 4 units of Venom in addition to doing regular damage."
	item = /obj/item/ammo_box/magazine/smgm45/venom

/datum/uplink_item/ammo_nuclear/special/smgpacify
	name = ".45 Pacification SMG Magazine (C-20r)"
	desc = "An additional 24-round .45 magazine suitable for use with the C-20r submachine gun. \
			These bullets infuse Pax within the victim, inhibiting violence within them for atleast 10 seconds per bullet. \
			Allows for the one-sided fights."
	item = /obj/item/ammo_box/magazine/smgm45/pacify
	cost = 6

/datum/uplink_item/ammo_nuclear/special/smgdelay
	name = ".45 Delayed SMG Magazine (C-20r)"
	desc = "An additional 24-round .45 magazine suitable for use with the C-20r submachine gun. \
			These bullets infused a delayed toxin within the host. A single bullet is worth 60 toxin damage."
	item = /obj/item/ammo_box/magazine/smgm45/delay
	cost = 6

/datum/uplink_item/ammo_nuclear/special/smgtranq
	name = ".45 Tranquilizer SMG Magazine (C-20r)"
	desc = "An additional 24-round .45 magazine suitable for use with the C-20r submachine gun. \
			These bullets inject a heavy-duty tranquilizer which weakens targets. Multiple shots can leave targets momentarily paralyzed."
	item = /obj/item/ammo_box/magazine/smgm45/tranq
	cost = 6

/datum/uplink_item/ammo_nuclear/special/shocker40mm
	name = "40mm SH Grenade Box (M-90gl)"
	desc = "A box of 40mm SH grenades for use with the M-90gl's under-barrel grenade launcher. \
			These explode AND electrocute everyone nearby."
	item = /obj/item/ammo_box/a40mm/shocker
	cost = 7

/datum/uplink_item/ammo_nuclear/special/spread40mm
	name = "40mm SP Grenade Box (M-90gl)"
	desc = "A box of 40mm SP grenades for use with the M-90gl's under-barrel grenade launcher. \
			Each grenade fires a wide spread of equally explosive grenades."
	item = /obj/item/ammo_box/a40mm/spread
	cost = 6

/datum/uplink_item/ammo_nuclear/special/sucking40mm
	name = "40mm SU Grenade Box (M-90gl)"
	desc = "A box of 40mm SU grenades for use with the M-90gl's under-barrel grenade launcher. \
			Each grenade creates a short-lived gravitational vortex after exploding. \
			Stay clear while firing."
	item = /obj/item/ammo_box/a40mm/sucking
	cost = 6

/datum/uplink_item/ammo_nuclear/special/nuke40mm
	name = "40mm SL Grenade Box (M-90gl)"
	desc = "A box of 40mm SL grenades for use with the M-90gl's under-barrel grenade launcher. \
			These grenades travel extremely slowly, but are EXTREMELY explosive. \
			They're effectively air-mines."
	item = /obj/item/ammo_box/a40mm/nuke
	cost = 10

/datum/uplink_item/ammo/syndie_rcd_ammo
	name = "Syndicate Rapid-Construction-Device Ammo"
	desc = "A highly compressed package of solid matter for recharging a Rapid-Construction-Device. Holds 1000 matter in total."
	item = /obj/item/rcd_ammo/syndicate
	cost = 5
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

// Medical

/datum/uplink_item/medical/syndie_medibeam
	name = "Medical Beam Gun"
	desc = "A wonder of Syndicate engineering, the Medbeam gun, or Medi-Gun enables a medic to keep his fellow \
			operatives in the fight, even while under fire. Don't cross the streams!"
	item = /obj/item/gun/medbeam
	cost = 12
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/medicalreagentgun
	name = "Medical Reagent Gun"
	desc = "A wonder of Syndicate engineering, this reagent gun does little damage on impact, but it will inject a compound of various healing chemicals. \
			It's filled with a 400u concoction specifically designed to get your fellow operatives back on their feet in a pinch. \
			The gun shoots 40u each shot, and will inevitably run out of chemicals. You may refill it with whatever you desire. Synthesises syringes automatically."
	item = /obj/item/gun/medicalreagentgun
	cost = 15
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/hypospray_kit
	name = "Syndicate Combat Hypospray Kit"
	desc = "An medical kit containing a wide variety of bottles containing \"perfectly legal chemicals\" to treat combatants. \
			Pair with one of our Gorlex Hypospray's for optimal application."
	item = /obj/item/storage/medkit/hypospray
	cost = 4
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/medbeam_uber
	name = "Augmented Medbeam Gun"
	desc = "An augmented version of the classic Medbeam Gun that we picked up off the corpse of a german scientist. \
			It has an invulnerability mode that can be activated for a few seconds after healing for a long while. \
			This one comes uncharged, so be sure to give it a whirl before getting into combat."
	item = /obj/item/gun/medbeam/uber
	cost = 25
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

// Implants

/datum/uplink_item/implants/nuclear/deniability/deluxe
	name = "Deluxe Tactical Deniability Implant"
	desc = "An implant injected into the brain, and later activated either manually or automatically upon entering critical condition. \
			Prevents collapsing from critical condition, but explodes after a full minute has passed."
	item = /obj/item/storage/box/syndie_kit/imp_deniability/deluxe
	cost = 10
	purchasable_from = UPLINK_SERIOUS_OPS | UPLINK_SPY

/datum/uplink_item/implants/nuclear/tenacity
	name = "Tenacity Implant"
	desc = "An implant injected into the brain, and later activated either manually or automatically upon entering critical condition. \
			Prevents the host from collapsing from critical condition, thanks to the folks at Interdyne for their extensive research for this one."
	item = /obj/item/storage/box/syndie_kit/imp_tenacity
	cost = 16
	purchasable_from = UPLINK_SERIOUS_OPS | UPLINK_SPY

/datum/uplink_item/surgical/reviverops
	name = "Superior Reviver Implant"
	desc = "This implant will attempt to revive and heal you if you lose consciousness, these superior versions have a drastically lowered cooldown than most. Comes with an autosurgeon. Incompatible with Regenerative Implants."
	item = /obj/item/autosurgeon/syndicate/reviver/fivemincap/hidden/single_use
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_NUKE_OPS

/datum/uplink_item/surgical/regenerativeops
	name = "Regenerative Implants"
	desc = "Three surgical implants that when inserted into the body will very slowly repair the host. Allowing for VERY slow recovery of all forms of damage. Incompatible with Reviver Implants."
	item = /obj/item/storage/box/syndie_kit/regen_implant_box
	cost = 10
	surplus = 0
	purchasable_from = UPLINK_NUKE_OPS

/datum/uplink_item/surgical/medibeam
	name = "Integrated Medical Beam Gun Implant"
	desc = "A complete, miniaturized medical healing beam gun straight from our factories, it'll fit perfectly within one of your arms to support your fellow operatives in the midst of battle. \
			Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/medibeam/hidden/single_use
	cost = 15
	surplus = 0
	purchasable_from = UPLINK_NUKE_OPS

// Conspicous weapons

/datum/uplink_item/dangerous/advchemsprayer
	name = "Bluespace Chemical Sprayer"
	desc = "One of our chemical sprayers that have been upgraded with our bluespace technology, unlike the regular version, this one can contain 1500 units of chemicals and shoot 50u's of it's contents forward for up to 5 meters ahead. \
			The sprayer comes loaded with 250's of: Sodium Thiopental, Coniine, Venom, Condensed Capsaicin, Initropidril, and Polonium."
	item = /obj/item/reagent_containers/spray/chemsprayer/adv
	surplus = 0
	cost = 25
	cant_discount = TRUE
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/gatling
	name = "Gatling Gun"
	desc = "A huge man-portable minigun chambering 7mm rounds. Makes up for its lack of mobility and discretion with sheer firepower. Has an internal drum of 7mm bullets, swift recovery from overheating and an endless supply of ammunition thanks to an internal autolathe printing rounds."
	item = /obj/item/deployable_turret_folded/gatling
	cost = 40

// Badass (meme items)



// Bundles

/datum/uplink_item/bundles_tc/requisition_token
	name = "Requisition Token"
	desc = "A special requisition token to use with the specialized equipment vendor on Firebase Balthazord. \
			That vendor contains a wide variety of special kits and equipment you likely won't find for purchase normally."
	item = /obj/item/syndicate_voucher
	cost = 40 // price varies depending on the kit selected
	limited_stock = 1 // don't want people getting a shitload of kits for cheap.
	purchasable_from = UPLINK_FIREBASE_OPS
