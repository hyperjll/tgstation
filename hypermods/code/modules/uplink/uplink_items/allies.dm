/datum/uplink_item/reinforcements/dehy_carp
	name = "Dehydrated Space Carp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp
	cost = 1

/datum/uplink_item/reinforcements/guardian
	name = "Holoparasites"
	desc = "Though capable of near sorcerous feats via use of hardlight holograms and nanomachines, they require an \
			organic host as a home base and source of fuel. Holoparasites come in various types and share damage with their host."
	progression_minimum = 30 MINUTES
	item = /obj/item/guardian_creator/tech
	cost = 18
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	restricted = TRUE
	refundable = TRUE

/datum/uplink_item/reinforcements/hypnotic_flash
	name = "Hypnotic Flash"
	desc = "A modified flash able to hypnotize targets. If the target is not in a mentally vulnerable state, it will only confuse and pacify them temporarily."
	item = /obj/item/assembly/flash/hypnotic
	cost = 7

/datum/uplink_item/reinforcements/hypnotic_grenade
	name = "Hypnotic Grenade"
	desc = "A modified flashbang grenade able to hypnotize targets. The sound portion of the flashbang causes hallucinations, and will allow the flash to induce a hypnotic trance to viewers."
	item = /obj/item/grenade/hypnotic
	cost = 12


/datum/uplink_item/reinforcements/megadehydratedcarp
	name = "Dehydrated Megacarp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life mega space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp/mega
	cost = 2
	surplus = 10

/datum/uplink_item/reinforcements/syndicubes
	name = "Box of Syndicate Cubes"
	desc = "A box containing 5 simple lifeform producing cubes, when water is applied, human-like lifeforms will spring forth and will attack everyone nearby. \
			Syndicates produced have limited intelligence and may not be able to identify undercover agents. They are armed however."
	item = /obj/item/storage/box/monkeycubes/syndicate/syndis
	cost = 5
	surplus = 10
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/reinforcements/spongecapsules
	name = "Syndicate Sponge Capsules"
	desc = "After extensive research into monkey cubes and gold slime extracts, the xenobiologists at the Tiger Coop managed to combine them \
			into one all-in-one package. Simply place a capsule where you need your monster party and spray with water. Each capsule will \
			bring forth 2 random beasts to maul random bystanders. Comes with SIX sponge capsules. Monsters may or may not attack you."
	item = /obj/item/storage/box/spongecapsules
	cost = 7
	surplus = 10
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/reinforcements/cyborgrescue
	name = "Rescue Cyborg Module"
	desc = "An illegal module which grants a cyborg of choice fulton equipment. \
			Very useful for quick escapes for both you and your silicon companion. \
			Will also hack their software to reveal hidden modules. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/illegalrescue
	cost = 10
	surplus = 10
	progression_minimum = 15 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/reinforcements/cyborgweapons
	name = "Weapon Cyborg Module"
	desc = "An illegal module capable of granting a cyborg a Viper pistol with the necessary hardware \
			needed to print more ammunition on the fly. Also grants the cyborg of choice an energy dagger \
			and hacks their software to reveal hidden modules. Exceptionally effective for mass murder. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/illegalweapons
	cost = 8
	surplus = 0
	progression_minimum = 30 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/reinforcements/cyborgmartyr
	name = "Martyr Cyborg Module"
	desc = "Reveals a high-yielding explosive which was installed into the cyborg upon it's creation. \
			This allows a cyborg to self-destruct with greater power and possibly take out other people for good. \
			Will also hack their software to reveal hidden modules. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/martyr
	cost = 4
	surplus = 10
	progression_minimum = 20 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS
