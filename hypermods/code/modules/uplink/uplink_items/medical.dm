/datum/uplink_category/medical
	name = "Medical"
	weight = 7

/datum/uplink_item/medical
	category = /datum/uplink_category/medical
	surplus = 0


/datum/uplink_item/medical/medical_variety_pack
	name = "Medical Variety Pack"
	desc = "A bluespace-compressed medkit containing one first aid kit and potentially some variety first aid kits such as brute and toxin."
	item = /obj/item/storage/medkit/medical_variety_pack
	cost = 2
	surplus = 35
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/deluxe_medical_variety_pack
	name = "Deluxe Medical Variety Pack"
	desc = "A bluespace-compressed medkit containing one of each variety of first aid kits. Contains some bottles of liquid medicines, pill bottles and and potentially medipens."
	item = /obj/item/storage/medkit/deluxe_medical_variety_pack
	cost = 5
	surplus = 30
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/surgerybag
	name = "Syndicate Surgery Duffel Bag"
	desc = "The Syndicate surgery duffel bag is a toolkit containing all surgery tools, surgical drapes, \
			a Syndicate brand MMI, a straitjacket, and a muzzle."
	item = /obj/item/storage/backpack/duffelbag/syndie/surgery
	cost = 3
	surplus = 66

/datum/uplink_item/medical/changelingextract
	name = "Changeling Extract"
	desc = "A medipen containing a highly complex regenerative chemical donated to us by the Tiger Cooperative Fanatics. \
			Upon it's application, the user will near-instanteously regrow all of their limbs and organs."
	item = /obj/item/reagent_containers/hypospray/medipen/limborganregen
	cost = 4
	surplus = 10
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/medipenkit
	name = "Medipen Kit"
	desc = "A bluespace-compressed medkit containing multiple medicinal medipens filled with various reagents. Useful in a pinch."
	item = /obj/item/storage/medkit/medipenkit
	cost = 2
	surplus = 35

/datum/uplink_item/medical/combatmedipen
	name = "Combat Medipens"
	desc = "Three medipens loaded with 25 units of Omnizine and 5 units of Tranexamic Acid. Useful in a pinch."
	item = /obj/item/storage/medkit/emergency/combatmedipens
	cost = 3
	surplus = 40
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/combistimpack
	name = "Chemical Combi-Stimpack Bag"
	desc = "A bag containing one combat medipen loaded with 25 units of Omnizine and 5 units of Tranexamic Acid. \
			Two cardiac combi-stimpacks loaded with epinephrine and saline-glucose solution, \
			Two bloodloss combi-stimpacks loaded with filgrastim and proconvertin, and \
			Two lifesupport combi-stimpacks loaded with salbutamol and mannitol. \
			Each combi-stimpack is 25 units of each chemical with 10 doses."
	item = /obj/item/storage/bag/chemistry/syndimedipens
	cost = 3
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/combistimpackdeluxe
	name = "Deluxe Combi-Stimpack Bag"
	desc = "A bag containing three medipens loaded with 25 units of Omnizine and 5 units of Tranexamic Acid. \
			Two cardiac combi-stimpacks loaded with epinephrine and saline-glucose solution, \
			Two bloodloss combi-stimpacks loaded with filgrastim and proconvertin, and \
			Two lifesupport combi-stimpacks loaded with salbutamol and mannitol. \
			Each combi-stimpack is 25 units of each chemical with 10 doses."
	item = /obj/item/storage/bag/chemistry/syndimedipens/deluxe
	cost = 6
	surplus = 15
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/restorationnaniteinjector
	name = "Restoration Nanite Injector"
	desc = "A single medipen loaded with 20u's of one of our most effective medical nanite strands to date. \
			It's capable of mending a large amount of damage of all types quickly, and mending many of your essential organs back together."
	item = /obj/item/reagent_containers/hypospray/medipen/restorationnaniteinjector
	cost = 3
	surplus = 60
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/restore_nanite_kit
	name = "Restoration Nanite kit"
	desc = "A box containing 5 restoration nanite auto-injectors, when injected, they quickly heal the patients wounds \
			and mend many of their essential organs back together. More than enough for the whole squad in case of emergencies."
	item = /obj/item/storage/box/syndie_kit/restore_nanite_kit
	cost = 12
	surplus = 10
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/medical/miraclesyringe
	name = "Miracle Syringe"
	desc = "Contains 5 units of nearly every effective medicine we could muster, included within are \
			bicaridine, dermaline, anti-toxin, omnizine, healing nanites, antihol, sanguirite, iron, and potassium iodide."
	item = /obj/item/reagent_containers/syringe/bluespace/miracle
	cost = 1
	surplus = 50

/datum/uplink_item/medical/eternalomnizine
	name = "Eternal Flask of Omnizine"
	desc = "A bottle that's only glass-like in appearance. The container itself harbors redspace technology \
			that will fill the container slowly over time with Omnizine for a maximum of 50 units."
	item = /obj/item/reagent_containers/cup/bottle/eternal/omnizine
	cost = 6
	surplus = 25
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/mutationkit
	name = "Mutation Toxin Kit"
	desc = "A kit containing 8 syringes each filled with 15 units of a different mutation toxin. \
			Excellent for mulligan tactics or if you intend to benefit from a particular race's biology."
	item = /obj/item/storage/medkit/mutatekit
	cost = 4
	surplus = 35

/datum/uplink_item/medical/resurrector
	name = "Resurrector Nanite Serum"
	desc = "A single-use autoinjector which dispenses nanites designed and capable of restoring a corpse back to life very quickly. Has no effect on a living person. \
			You'll likely be using this to bring your fellow agents back from the grave. THE REAGENTS WITHIN WILL NOT REPAIR THE CORPSE -- SURGERY WILL BE REQUIRED."
	item = /obj/item/reagent_containers/hypospray/medipen/resurrector
	cost = 2
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/syndihealvirus
	name = "Syndicate Augmented Healing Virus"
	desc = "A autoinjector filled with 5 units of blood. However, within that 5 units of blood contains our most powerful healing virus ever concieved. \
			Symptoms include: Nocturnal Regeneration, Tissue Hydration, Starlight Condensation, Plasma Fixation, Radioactive Resonance and Self-Respiration. \
			Not guaranteed to work if used directly on silicon-based humanoids but may persist through mutation."
	item = /obj/item/reagent_containers/hypospray/medipen/syndicatevirus
	cost = 8
	surplus = 5
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/syndihealvirusnukie
	name = "Syndicate Augmented Healing Virus"
	desc = "A autoinjector filled with 5 units of blood. However, within that 5 units of blood contains our most powerful healing virus ever concieved. \
			Symptoms include: Nocturnal Regeneration, Tissue Hydration, Starlight Condensation, Plasma Fixation, Radioactive Resonance and Self-Respiration. \
			Not guaranteed to work if used directly on silicon-based humanoids but may persist through mutation."
	item = /obj/item/reagent_containers/hypospray/medipen/syndicatevirus
	cost = 15
	surplus = 0
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/hackedhypo
	name = "Hacked Hypospray"
	desc = "A DeForest Medical brand hypospray, we've hacked the electronics for you -- disabling it's reagent dispensement limiter. \
			This hypospray is capable of injecting or spraying reagents in 30 unit amounts. \
			The hypospray's design was also modified to hold more reagents than normal."
	item = /obj/item/reagent_containers/hypospray/hacked
	cost = 4
	surplus = 40
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY) // The gorlex hypo is the better version for this, spies should be forced to earn it. Why? Cuz' it's funny (and cool seeing as how tots cant get it)
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/gorlexhypo
	name = "Gorlex Hypospray"
	desc = "A Gorlex Marauders brand hypospray as manufactured by Vahlen Pharmaceuticals, it's features include an expanded reagent container, the ability to dispense reagents quickly, \
			and comes filled with various healing chemicals. Has a diamond-tipped needle to penetrate armor."
	item = /obj/item/reagent_containers/hypospray/gorlex
	cost = 8
	surplus = 0
	purchasable_from = (UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/medical/evilmeds
	name = "Box of Premium Medicine"
	desc = "A Interdyne Pharmaceutics sponsored medicine package, containing 180 units of the following: \
			Omnizine, Salicylic Acid, Oxandrolone, Pentetic Acid, Atropine, Salbutamol, and Rezadone. \
			You won't be running out of medicine any time soon. Pairs well with a Hypospray."
	item = /obj/item/storage/box/evilmeds
	cost = 12
	surplus = 0
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS)
