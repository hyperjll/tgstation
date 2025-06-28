//not technically a mob but ehh, close enough
/datum/species/golem/clockwork
	name = "Clockwork Golem"
	id = SPECIES_GOLEM_CLOCKWORK
	inherent_traits = list(
		TRAIT_GENELESS,
		TRAIT_LAVA_IMMUNE,
		TRAIT_NEVER_WOUNDED,
		TRAIT_NOBLOOD,
		TRAIT_NOBREATH,
		TRAIT_NODISMEMBER,
		TRAIT_NOFIRE,
		TRAIT_NO_AUGMENTS,
		TRAIT_NO_DNA_COPY,
		TRAIT_NO_PLASMA_TRANSFORM,
		TRAIT_NO_UNDERWEAR,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_SNOWSTORM_IMMUNE, // Shared with plasma river... but I guess if you can survive a plasma river a blizzard isn't a big deal
		TRAIT_UNHUSKABLE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTHEAT,
		TRAIT_ASHSTORM_IMMUNE,
		TRAIT_FASTER_SLAB_INVOKE,
	)
	meat = /obj/item/stack/sheet/bronze
	fixed_mut_color = rgb(190, 135, 0)
	//info_text = "As a <span class='bigbrass'>Clockwork Golem</span>, most scriptures will take less time for you to invoke. You are also faster then most golems."
	//prefix = "Clockwork"
	examine_limb_id = SPECIES_GOLEM
	//armor = 70
