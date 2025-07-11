/datum/uplink_item/role_restricted/gondola_donk_pocket_box
	name = "Gondola-Flavoured Donk Pockets"
	desc = "A box with 6 gondola pockets within it. Gondola pockets contain a chemical called Tranquility, which will inflict a disease upon consumption. \
			Those afflicted by this disease will inevitably turn into gondola's themselves. It's probably best you don't eat these."
	item = /obj/item/storage/box/donkpockets/donkpocketgondola
	cost = 4
	surplus = 7
	restricted_roles = list(JOB_COOK, JOB_CLOWN, JOB_MIME, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/chef_chem_bottles
	name = "Chef-Specialized Poisons Kit"
	desc = "A box containing two bottles of four types of deadly chemicals. As a chef, you ought to spike your food or drinks or find a different means of application. \
			Chemicals include: Fentanyl, Cyanide, Coniine, and Amanitin."
	item = /obj/item/storage/box/syndie_kit/chefchemicals
	cost = 5
	surplus = 12
	restricted_roles = list(JOB_COOK, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/suspicious_plant_bag
	name = "Assorted Plant Bag"
	desc = "A regular, nanotrasen approved plant bag from one of the vendors. It includes several mutated plant produce ready to use or be turned into seeds. \
			Included within are the: Death Nettle, Poison Berry, Death Berry, Deathweed, Mimana, Bluespace Banana, Combustible Lemon, Bungo Fruit, Destroying Angel, Killer Tomato, and a Replica Pod seed."
	item = /obj/item/storage/bag/plants/syndie
	cost = 5
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/bluespace_plant_bag
	name = "Bluespace Plant Bag"
	desc = "A regular, nanotrasen approved plant bag from one of the vendors. We've augmented the bag with bluespace technology, allowing for nearly infinite storage. \
			The bag however, still only accepts your typical plant bag items."
	item = /obj/item/storage/bag/plants/bluespace
	cost = 7
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Wouldn't be super useful for random spies.

/datum/uplink_item/role_restricted/eternal_mutagen
	name = "Eternal Flask of Unstable Mutagen"
	desc = "A bottle that's only glass-like in appearance. The container itself harbors redspace technology \
			that will fill the container slowly over time with Unstable Mutagen for a maximum of 50 units."
	item = /obj/item/reagent_containers/cup/bottle/eternal/mutagen
	cost = 1
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Also wouldn't be useful for non-botanist spies.
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/gatfruit_seed
	name = "Gatfruit Seed Packet"
	desc = "A single seed packet of the fabled Gatfruit. These seeds take a LONG time to grow, and start off fragile. \
			Gatfruit can be converted into a fully loaded Revolver that shoots reagent peas! \
			Be warned that leaving behind a trail of revolvers will likely let everyone know what's up!"
	item = /obj/item/seeds/gatfruit
	cost = 8
	surplus = 5
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/cherry_bomb_seed
	name = "Cherry Bomb Seed Packet"
	desc = "A single seed packet of Cherry Bombs. The cherries are HIGHLY explosive and cause massive damage. \
			You're gonna wanna keep your distance and ensure nobody nabs your harvest."
	item = /obj/item/seeds/cherry/bomb
	cost = 16
	surplus = 3
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Hell no.

/datum/uplink_item/role_restricted/bombanana_seed
	name = "Bombanana Seed Packet"
	desc = "A single seed packet of the clownly Bombanana. Bombanana's grown are about as effective as a syndicate minibomb. \
			Peel them to activate them. Bombs are identical to regular bananas."
	item = /obj/item/seeds/banana/bombanana
	cost = 20
	surplus = 1
	restricted_roles = list(JOB_BOTANIST, JOB_CLOWN, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Hell no.

/datum/uplink_item/role_restricted/kudzu_seed
	name = "Kudzu Seed Packet"
	desc = "A single seed packet of the Kudzu vine species. These seeds can be planted outside of a tray to cause havoc. \
			Giving kudzu a high amount of potency will make them even more devastating. Great for a massive distraction."
	item = /obj/item/seeds/kudzu
	cost = 3
	surplus = 15
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/floragun_syndicate
	name = "Disguised Laser Gun"
	desc = "A laser pistol with both stun and lethal capabilities, it's been disguised as a floral somatoray for easy concealment. \
			Also functions as a regular floral somatoray."
	item = /obj/item/gun/energy/floragun/syndicate
	cost = 8
	surplus = 5
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/syndie_relief_bundle
	name = "Syndicate Relief Package"
	desc = "Thanks for taking the fall for one of our other agents, as per your payment you may claim an additional 10 telecrystals at your leisure."
	item = /obj/item/storage/box/syndie_kit/syndie_relief_bundle
	cost = 0
	cant_discount = TRUE
	limited_stock = 1
	restricted_roles = list(JOB_PRISONER) // The only one the captain doesn't get.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Prisoner stuff shouldn't be given randomly as bounties. They're here to spice up prisoner rounds.

/datum/uplink_item/role_restricted/twoforone_freedom_implant
	name = "Two-For-One Freedom Implant Bundle"
	desc = "Two freedom implants for the price of one. Be sure to grant one to a friend -- if you find any."
	item = /obj/item/storage/box/syndie_kit/two_freedom_implant_bundle
	cost = 5
	limited_stock = 1
	restricted_roles = list(JOB_PRISONER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/microbomb_prisoner_implanter
	name = "Microbomb Implanter"
	desc = "Give me liberty or give me death. \
	       This microbomb implanter can be used at any time to commit suicide in style, it'll also destroy your items to prevent security from reclaiming anything TOO useful."
	item = /obj/item/storage/box/syndie_kit/imp_microbomb
	cost = 2
	surplus = 10
	limited_stock = 1
	restricted_roles = list(JOB_PRISONER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/bluespace_crystal_arti_bundle
	name = "Box of Artificial Bluespace Crystals"
	desc = "A cardboard box containing approximately 25 artificial bluespace crystals. Crush them in-hand to randomly teleport somewhere nearby."
	item = /obj/item/storage/box/syndie_kit/bluespace_crystal_arti_bundle
	cost = 1
	surplus = 25
	restricted_roles = list(JOB_PRISONER, JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST, JOB_ROBOTICIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/escapist_bundle
	name = "Escapist Bundle"
	desc = "Everything you'll need to escape and assume a new identity. Comes with a Chameleon Kit, Agent Card, Sleepy Pen, \
            Airlock Override Card, Thermal Imaging Glasses, Uplink Implant, Energy Dagger and 4 C4 charges."
	item = /obj/item/storage/box/syndie_kit/escapist_bundle
	cost = 20
	surplus = 1
	restricted_roles = list(JOB_PRISONER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/chemistry_machine_bundle
	name = "Supplementary Chemical Dispensery"
	desc = "Can't afford to work under supervision? We've got you covered. Purchasing this bundle includes all of the electronic boards \
			required for chemistry, and enough tier 4 parts to maximize your work. Doesn't come with it's own power-setup."
	item = /obj/item/storage/box/syndie_kit/chemistry_machine_bundle
	cost = 4
	surplus = 20
	restricted_roles = list(JOB_CHEMIST, JOB_PSYCHOLOGIST, JOB_CHIEF_MEDICAL_OFFICER, JOB_BARTENDER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Doesn't make much sense as a bounty.

/datum/uplink_item/role_restricted/xenobio_starter_kit
	name = "Xenobiology Kickstarter Bundle"
	desc = "A bundle that contains a industrial grey extract, a bottle of plasma, a syringe, and two monkey cube boxes. \
			For those agents who can't afford to spend 30 whole minutes doing basically nothing."
	item = /obj/item/storage/box/syndie_kit/xenobio_starter_kit
	cost = 3
	restricted_roles = list(JOB_SCIENTIST, JOB_RESEARCH_DIRECTOR, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Doesn't make sense as a bounty.

/datum/uplink_item/role_restricted/spare_null_rod
	name = "Spare Null Rod"
	desc = "A Null Rod that was smuggled out from various churches across the galaxy. \
			Just in case you lose yours, or if you plan on being super-extra prepared."
	item = /obj/item/nullrod
	cost = 15
	surplus = 10
	restricted_roles = list(JOB_CHAPLAIN, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Imagine having to steal the null rod to GET a null rod?

/datum/uplink_item/role_restricted/chem_storage_implant_bundle
	name = "Chemical Storage Implant Bundle"
	desc = "A bluespaced box containing roughly 5 chemical storage implant cases, an implanter, a syringe, and a beaker. You'll have to supply your own chemicals though. \
			To apply: inject chemicals (up to 100u) into the implant case using the syringe, then use the implanter to remove the implant and inject into target. Targets can only have one of these implants at any given time."
	item = /obj/item/storage/box/syndie_kit/chem_storage_implant_bundle
	cost = 3
	restricted_roles = list(JOB_CHEMIST, JOB_PSYCHOLOGIST, JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN)
	surplus = 10
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Makes the regular implant moot as a bounty.

/datum/uplink_item/role_restricted/chaplain_healing_bundle
	name = "Holy Healing Bundle"
	desc = "A box containing three bottles of Omnizine, 90u in total. Additionally, the bundle contains one bottle of Unstable Mutagen."
	item = /obj/item/storage/box/syndie_kit/holy_healing_bundle
	cost = 4
	surplus = 15
	restricted_roles = list(JOB_CHAPLAIN, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Makes little sense as a bounty.

/datum/uplink_item/role_restricted/burning_extract_bundle
	name = "Burning Slime Extract Bundle"
	desc = "A bundle that contains three useful burning extracts, courtesy of our xenobiologists. \
			Contains one Yellow, Metal, and Gold Burning Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/burning_extract_bundle
	cost = 3
	surplus = 30
	restricted_roles = list(JOB_SHAFT_MINER, JOB_PARAMEDIC, JOB_JANITOR, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/charged_extract_bundle
	name = "Charged Slime Extract Bundle"
	desc = "A bundle that contains three useful charged extracts, courtesy of our xenobiologists. \
			Contains one Dark Blue, Red, and Green Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/charged_extract_bundle
	cost = 5
	surplus = 30
	restricted_roles = list(JOB_ATMOSPHERIC_TECHNICIAN, JOB_PSYCHOLOGIST, JOB_CHAPLAIN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/regenerative_extract_bundle
	name = "Regenerative Slime Extract Bundle"
	desc = "A bundle that contains three useful regenerative extracts, courtesy of our xenobiologists. \
			Contains one Purple, Sepia, and Adamantine Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/regenerative_extract_bundle
	cost = 5
	surplus = 30
	restricted_roles = list(JOB_CURATOR, JOB_CORONER, JOB_LAWYER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/stabilized_extract_bundle
	name = "Stabilized Slime Extract Bundle"
	desc = "A bundle that contains three useful stabilized extracts, courtesy of our xenobiologists. \
			Contains one Purple, Bluespace, and Adamantine Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/stabilized_extract_bundle
	cost = 4
	surplus = 30
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_BOTANIST, JOB_ASSISTANT, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/industrial_extract_bundle
	name = "Industrial Slime Extract Bundle"
	desc = "A bundle that contains three useful industrial extracts, courtesy of our xenobiologists. \
			Contains one Purple, Gold, and Pink Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/industrial_extract_bundle
	cost = 6
	surplus = 30
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_CARGO_TECHNICIAN, JOB_BITRUNNER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/chilling_extract_bundle
	name = "Chilling Slime Extract Bundle"
	desc = "A bundle that contains three useful chilling extracts, courtesy of our xenobiologists. \
			Contains one Metal, Dark Blue, and Bluespace Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/chilling_extract_bundle
	cost = 4
	surplus = 30
	restricted_roles = list(JOB_CLOWN, JOB_MIME, JOB_GENETICIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/consuming_extract_bundle
	name = "Consuming Slime Extract Bundle"
	desc = "A bundle that contains three useful consuming extracts, courtesy of our xenobiologists. \
			Contains one Purple, Metal, and Oil Extract. Comes with 3 extra random extracts."
	item = /obj/item/storage/box/syndie_kit/consuming_extract_bundle
	cost = 3
	surplus = 30
	restricted_roles = list(JOB_COOK, JOB_BARTENDER, JOB_CAPTAIN) // Virologist was here.

/datum/uplink_item/role_restricted/clown_pie_bundle
	name = "Banana-Cream Pie Bundle"
	desc = "A duffelbag that's been stuffed to the brim with TWENTY banana-cream pies! Go nuts!"
	item = /obj/item/storage/backpack/duffelbag/clown/cream_pie/syndicate
	cost = 5
	surplus = 20
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/clown_trolling_security_bundle
	name = "The Make-Security-Upset Bundle"
	desc = "This bluespace box contains a wide variety of stolen NT security gear. Perfect for causing the entirety of the Security Department to hunt you down. \
			Included within are: 1 box of Flashbangs, 2 Energy Bola's, a can of Pepperspray, 2 Handcuffs, and 2 pairs of Sunglasses."
	item = /obj/item/storage/box/syndie_kit/clown_trolling_security_bundle
	cost = 8
	surplus = 5
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/clown_stun_resist_bundle
	name = "Stun Resistance Bundle"
	desc = "A box containing 3 bottles of Probital (Drink over 20u to Overdose), 2 bottles of Modafinil (Do not drink more than 10u at a time), and 3 bottles of Methamphetamine."
	item = /obj/item/storage/box/syndie_kit/clown_stun_resist_bundle
	cost = 7
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/curator_die_of_fate
	name = "Die of Fate"
	desc = "This die of fate can do MANY wonderous things, like completely destroying you on a roll of a natural 1, or promoting \
			you from one of our agents... to one of our MAGICAL agents. Be warned, possession of this item will piss off everyone at the wizard foundation."
	item = /obj/item/dice/d20/fate
	cost = 40
	surplus = 1
	restricted_roles = list(JOB_CURATOR, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Hell no.

/datum/uplink_item/role_restricted/syndicate_virus_box
	name = "Virus Box"
	desc = "That pesky Chief Medical Officer too paranoid to let you have a Virus Crate? Well, you can always purchase one from us. \
			This crate contains twelve different bottles of several viral samples, also includes seven beakers and syringes."
	item = /obj/item/storage/box/syndie_kit/syndicate_virus_box
	cost = 12
	surplus = 5
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CAPTAIN) // Virologist was here.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // HELL NO.

/datum/uplink_item/role_restricted/manifold_injector_bundle
	name = "Bundle of HMS Injectors"
	desc = "A box that contains SIX unused HMS Auto-injectors. More than enough to cripple the security team greatly."
	item = /obj/item/storage/box/syndie_kit/manifold_injector_bundle
	cost = 20
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN) // Virologist was here.

/datum/uplink_item/role_restricted/low_budget_chemgun
	name = "Low-Budget Reagent Dartgun"
	desc = "This reagent dartgun produces a single 15u piercing syringe automatically and draws from an internal 15u chemical container. You must fill the chemical container yourself."
	item = /obj/item/gun/chembudget
	cost = 3
	surplus = 50
	restricted_roles = list(JOB_COOK, JOB_MEDICAL_DOCTOR, JOB_CHEMIST, JOB_CHIEF_MEDICAL_OFFICER, JOB_SCIENTIST, JOB_CAPTAIN) // Virologist was here.
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndie_hypnotism_bundle
	name = "Hypnotism Bundle"
	desc = "A bundle containing a hypnotic flash, a hypnotic grenade, and 5 mindbreaker toxin smoke grenades."
	item = /obj/item/storage/box/syndie_kit/syndie_hypnotism_bundle
	cost = 10
	surplus = 10
	limited_stock = 1
	restricted_roles = list(JOB_PSYCHOLOGIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Just here to make psychologist traitors more interesting.

/datum/uplink_item/role_restricted/psychologist_xray_surgery
	name = "X-Ray Vision Implant"
	desc = "Allows unrestricted vision through walls, though light levels will still be in effect."
	item = /obj/item/autosurgeon/syndicate/xray_eyes/single_use
	cost = 15
	surplus = 10
	restricted_roles = list(JOB_PSYCHOLOGIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Hell no.

/datum/uplink_item/role_restricted/surplus
	name = "Syndicate Surplus Crate (25% off!)"
	desc = "A dusty crate from the back of the Syndicate warehouse. Rumored to contain a valuable assortment of items, \
			but you never know. Contents are sorted to always be worth 40 TC."
	item = /obj/structure/closet/crate
	cost = 15
	cant_discount = TRUE // Already discounted?
	restricted_roles = list(JOB_ASSISTANT, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Super-hell-no.
	stock_key = UPLINK_SHARED_STOCK_SURPLUS
	/// Value of items inside the crate in TC
	var/crate_tc_value = 40
	/// crate that will be used for the surplus crate
	var/crate_type = /obj/structure/closet/crate

/datum/uplink_item/role_restricted/surplus/proc/generate_possible_items(mob/user, datum/uplink_handler/handler)
	var/list/possible_items = list()

	// Ensure the surplus only category of items makes it in.
	var/list/surplus_only_items = subtypesof(/datum/uplink_item/surplusonly/)
	possible_items += surplus_only_items

	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/uplink_item = SStraitor.uplink_items_by_type[item_path]
		if(src == uplink_item || !uplink_item.item)
			continue
		if(!handler.check_if_restricted(uplink_item))
			continue
		if(!uplink_item.surplus)
			continue
		possible_items += uplink_item
	return possible_items

/// picks items from the list given to proc and generates a valid uplink item that is less or equal to the amount of TC it can spend
/datum/uplink_item/role_restricted/surplus/proc/pick_possible_item(list/possible_items, tc_budget, datum/uplink_handler/handler)
	var/datum/uplink_item/uplink_item = pick(possible_items)
	if(prob(100 - uplink_item.surplus))
		return null
	if(tc_budget < uplink_item.cost)
		return null
	return uplink_item

/// fills the crate that will be given to the traitor, edit this to change the crate and how the item is filled
/datum/uplink_item/role_restricted/surplus/proc/fill_crate(obj/structure/closet/crate/surplus_crate, list/possible_items, datum/uplink_handler/handler)
	var/tc_budget = crate_tc_value
	while(tc_budget)
		var/datum/uplink_item/uplink_item = pick_possible_item(possible_items, tc_budget, handler)
		if(!uplink_item)
			continue
		tc_budget -= uplink_item.cost
		new uplink_item.item(surplus_crate)

/// overwrites item spawning proc for surplus items to spawn an appropriate crate via a podspawn
/datum/uplink_item/role_restricted/surplus/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/structure/closet/crate/surplus_crate = new crate_type()
	if(!istype(surplus_crate))
		CRASH("crate_type is not a crate")
	var/list/possible_items = generate_possible_items(user, handler)

	fill_crate(surplus_crate, possible_items)

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = surplus_crate,
	))
	return source //For log icon


/datum/uplink_item/role_restricted/lathe_supply_package
	name = "Lathe Supply Package"
	desc = "A box containing electronic boards for both an autolathe and a protolathe. Also comes with the materials needed to assemble them."
	item = /obj/item/storage/box/syndie_kit/lathe_supply_package
	cost = 3
	restricted_roles = list(JOB_ASSISTANT, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Getting this as a bounty is a big fuck-you.

/datum/uplink_item/role_restricted/deluxe_bluespace_chameleon_backpack
	name = "Deluxe Bluespace Chameleon Backpack"
	desc = "A backpack fitted with both chameleon & bluespace technology. We've upgraded it especially for you, so it may contain more items than our normal variety."
	item = /obj/item/storage/backpack/bluespacechameleondeluxe
	cost = 6
	surplus = 10
	restricted_roles = list(JOB_ASSISTANT, JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/mime_basic_ability
	name = "Guide to Basic Mimery Series"
	desc = "The classical two part series on how to expand your mime skills. Allowing you to gain more than 1 basic mime ability."
	item = /obj/item/book/granter/action/spell/mime/mimery
	cost = 6
	restricted_roles = list(JOB_MIME, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Hell no.

/datum/uplink_item/role_restricted/mime_invis_backpack
	name = "Invisible Backpack"
	desc = "This backpack has been outfitted by our latest chameleon technology and now possesses unlimited invisibility! Even EMP's can't short it out!"
	item = /obj/item/storage/backpack/invisible
	cost = 4
	restricted_roles = list(JOB_MIME, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/helpful_barkeep_drinks
	name = "Beneficial Drinks Care Package"
	desc = "A box utilizing bluespace technology, we've stuffed it to the brim with useful drinks for yourself and any other agents you encounter. \
			Please be sure these drinks don't fall into enemy hands."
	item = /obj/item/storage/box/syndie_kit/helpful_barkeep_drinks
	cost = 8
	surplus = 10
	restricted_roles = list(JOB_BARTENDER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Eh, feels more substantial to have this only for barkeeps.

/datum/uplink_item/role_restricted/janitor_acidnade_bundle
	name = "Highly Acidic Foam Grenade Bundle"
	desc = "A box utilizing bluespace technology, it contains 10 acidic foam chemical grenades. \
			Also includes a Screwdriver, Wirecutter, 5 Proximity Sensors, and 6 Remote Signalers."
	item = /obj/item/storage/box/syndie_kit/janitor_acidnade_bundle
	cost = 6
	surplus = 15
	restricted_roles = list(JOB_JANITOR, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/janitor_bloodnade_bundle
	name = "Bloody Mess Grenade Bundle"
	desc = "A box utilizing bluespace technology, it contains 10 bloody mess chemical grenades. \
			These grenades will spread a bloody foam around, causing a massive mess. \
			We're not sure why you'd want this. Also includes a Screwdriver and Wirecutter."
	item = /obj/item/storage/box/syndie_kit/janitor_bloodnade_bundle
	cost = 2
	restricted_roles = list(JOB_JANITOR, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/bluespace_bodybag_bundle
	name = "Bluespace Body Bag Bundle"
	desc = "A box utilizing bluespace technology, within you'll find two bluespace bodybags, a bottle of nocturine, and a Sleepy Pen. Perfect for kidnappings."
	item = /obj/item/storage/box/syndie_kit/bluespace_bodybag_bundle
	cost = 8
	surplus = 10
	limited_stock = 1
	restricted_roles = list(JOB_CORONER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Getting this as a bounty is kinda a no-no. Makes certain steal-your-organ bounties a bit too ez.

/datum/uplink_item/role_restricted/bodybaginvis
	name = "Invisible Body Bag"
	desc = "A single, invisible body bag. It's chameleon technology is so advanced, it cannot be revealed -- even with EMP's. Try not to forget where you placed it. \
			Extremely useful as a portable hiding spot, evidence concealment, contraband stashes and more."
	item = /obj/item/bodybag/invis
	cost = 6
	restricted_roles = list(JOB_CORONER, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/powerlake
	name = "Power Lake"
	desc = "The Power Lake, otherwise known as the reverse power sink, is an advanced multi-dimensional generator capable of providing near limitless power supply thanks to interdimensional technology that harvests foreign energies from other universes. Unfortunately, this proved far too volatile for power generation. \
			The Power Lake will explode within minutes of activation due to heat generation. The explosion is far more devastating in comparison to one from a power sink."
	item = /obj/item/powerlake
	cost = 15
	surplus = 8
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_ATMOSPHERIC_TECHNICIAN, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
	wanted_item_result = /obj/item/gun/energy/xray

/datum/uplink_item/role_restricted/lethal_flare
	name = "Lethal Flare"
	desc = "A flare commonly provided to Nanotrasen's crew in case of lighting failure. It can be used as a weapon to deal decent Burn damage and light your target ablaze."
	item = /obj/item/flashlight/flare/lethal
	cost = 4
	surplus = 20
	progression_minimum = 5 MINUTES
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/electricaxe
	name = "Lightning Axe"
	desc = "A fire axe that's been augmented with electrical technology. In addition to being a fireaxe, it has a 20% chance to electrocute your victims, paralyzing and forcing them to remain grounded for a short time with every hit."
	item = /obj/item/fireaxe/electric
	cost = 12
	surplus = 5
	progression_minimum = 30 MINUTES
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/n2o_nade_bundle
	name = "Nitrous Oxide Grenade Bundle"
	desc = "A box utilizing bluespace technology, it contains 5 nitrous oxide foam chemical grenades. Useful for distractions or putting people to sleep."
	item = /obj/item/storage/box/syndie_kit/n2o_nade_bundle
	cost = 6
	surplus = 10
	restricted_roles = list(JOB_ATMOSPHERIC_TECHNICIAN, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/riggedtanksyndie
	name = "Rigged Oxygen Cannister"
	desc = "An oxygen canister that has been outfitted with explosives. Arm and throw, much like a grenade."
	item = /obj/item/disguisedgrenade/riggedtanksyndie
	cost = 4
	surplus = 20
	restricted_roles = list(JOB_ATMOSPHERIC_TECHNICIAN, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/lethaldosemedipen
	name = "Lethal Dosage Medipen"
	desc = "A medipen designed to look exactly like an Epinephrine Medipen. It contains a lethal dose of poison as well as some Epinephrine. Mostly poison, though."
	item = /obj/item/reagent_containers/hypospray/medipen/lethaldose
	cost = 3
	surplus = 20
	restricted_roles = list(JOB_PARAMEDIC, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/pacifymedipen
	name = "Pacification Medipen"
	desc = "A medipen loaded with 20u of Mute Toxin, Pax, and 5u of Tirizene. Allows for some one-sided fights."
	item = /obj/item/reagent_containers/hypospray/medipen/pacify
	cost = 4
	surplus = 30
	restricted_roles = list(JOB_PARAMEDIC, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/chemkillswitch
	name = "Chemical Kill-switch"
	desc = "A medipen loaded with a specialized nanite virus which is to be injected directly into your target's bloodstream. The nanites take roughly 5 minutes before activation. \
			Upon activation, the nanites will cause MASSIVE Toxin and Brute damage to the victim, guaranteeing the destruction of several organs and instant death for your victim. \
			If the nanites find themselves being cleared from the victim's bloodstream, they'll activate early for what may amount to significantly less damage overall."
	item = /obj/item/reagent_containers/hypospray/medipen/chemkillswitch
	cost = 8
	surplus = 10
	restricted_roles = list(JOB_PARAMEDIC, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/paramedic_defib
	name = "Combat Defibrillator"
	desc = "A blood-red portable defibrillator which can revive someone through thick armor. \
			Comes with an experimental self-charging battery, and can be utilized as a weapon to stun your foes while in combat. \
			Can be overcharged while in combat mode to invoke cardiac arrest in those you defibrillate."
	item = /obj/item/defibrillator/compact/combat/loaded
	cost = 12
	surplus = 15
	restricted_roles = list(JOB_PARAMEDIC, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/sacred_flames
	name = "Book of Sacred Flames"
	desc = "A strange, mystical book that mysteriously found it's way into one of our warehouses. \
			Those who read it's contents will be blessed with the ability to light themselves ablaze \
			and make everyone nearby increasingly flammable."
	item = /obj/item/book/granter/action/spell/sacredflame
	cost = 6
	surplus = 0
	restricted_roles = list(JOB_CHAPLAIN, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Doesn't make sense as a bounty.

/datum/uplink_item/role_restricted/inf_cash
	name = "Syndicate Counterfeiting Printer"
	desc = "One of our finest redspace-engineered counterfeit money printers, we've disguised it as a secure briefcase to avoid suspicion. \
			The briefcase will silently print and store 1000$ dollar bills over time to ensure you can take advantage of NT's lackluster cargo security. \
			It's also a bit more robust than our typical briefcases, just in case. Only prints money while in the hands of a syndicate agent and while unlocked."
	item = /obj/item/storage/briefcase/secure/cargonia
	cost = 6
	surplus = 10
	restricted_roles = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/anomaly_releaser
	name = "Anomaly Releaser"
	desc = "A medipen loaded with chemicals so confidental -- even WE can't afford to tell you what it is. \
			If injected into an anomaly core, the substance will cause the core to undergo mitosis, creating an anomaly based off the anomaly core. \
			The medipen can only be used once."
	item = /obj/item/anomaly_releaser
	cost = 2
	surplus = 35
	restricted_roles = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_SCIENTIST, JOB_RESEARCH_DIRECTOR, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/nadelauncher
	name = "Grenade Launcher"
	desc = "A somewhat bulky grenade launcher, it can prime and fire many different kinds of grenades INCLUDING chemical grenades. Can load three grenades at any time."
	item = /obj/item/gun/grenadelauncher
	cost = 6
	surplus = 25
	restricted_roles = list(JOB_CHEMIST, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/holynade
	name = "Holy Hand Grenade"
	desc = "The priest's patented special surprise, produces a decent explosion stronger than that of a potassium & water explosion. Makes a distinct sound when detonated."
	item = /obj/item/grenade/chem_grenade/holy
	cost = 5
	surplus = 45
	restricted_roles = list(JOB_CHAPLAIN, JOB_CAPTAIN)
	// I'll let this pass as a spy bounty to hopefully draw attention away from traitor chaplains.

/datum/uplink_item/role_restricted/syndivirusbuffer
	name = "S. Gene Culture Bottle"
	desc = "A culture bottle containing the pride and joy of our bio-weapon specialists, add this symptom to your virus to greatly increase it's potential."
	item = /obj/item/reagent_containers/cup/bottle/syndisymptombuffer
	cost = 8
	surplus = 0
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN) // Virologist was here.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Letting virus symptoms pass as spy bounties would be hellish. Both for the spy and for the crew.
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndivirusbufferstealth
	name = "STE. Gene Culture Bottle"
	desc = "A culture bottle containg a super-symptom often utilized by our bio-weapon specialists, add this symptom to your virus to greatly increase it's stealth and moderately boost it's other stats."
	item = /obj/item/reagent_containers/cup/bottle/syndisymptombuffer/stealth
	cost = 4
	surplus = 0
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN) // Virologist was here.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndivirusbufferresist
	name = "SRE. Gene Culture Bottle"
	desc = "A culture bottle containg a super-symptom often utilized by our bio-weapon specialists, add this symptom to your virus to greatly increase it's resistance and moderately boost it's other stats."
	item = /obj/item/reagent_containers/cup/bottle/syndisymptombuffer/resist
	cost = 4
	surplus = 0
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN) // Virologist was here.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndivirusbufferspeed
	name = "SPD. Gene Culture Bottle"
	desc = "A culture bottle containg a super-symptom often utilized by our bio-weapon specialists, add this symptom to your virus to greatly increase it's stage speed and moderately boost it's other stats."
	item = /obj/item/reagent_containers/cup/bottle/syndisymptombuffer/speed
	cost = 4
	surplus = 0
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN) // Virologist was here.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndivirusbuffertrans
	name = "STR. Gene Culture Bottle"
	desc = "A culture bottle containg a super-symptom often utilized by our bio-weapon specialists, add this symptom to your virus to greatly increase it's transmittability and moderately boost it's other stats."
	item = /obj/item/reagent_containers/cup/bottle/syndisymptombuffer/trans
	cost = 4
	surplus = 0
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHIEF_MEDICAL_OFFICER, JOB_CAPTAIN) // Virologist was here.
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndisauce
	name = "Box of Syndicate Sauce"
	desc = "A box with 6 sauce packets containing 10 units of Amanitin, a silent but deadly delayed poison."
	item = /obj/item/storage/box/syndie_kit/syndisauce
	cost = 1
	surplus = 7
	restricted_roles = list(JOB_COOK, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Doesn't make sense as a bounty.

/datum/uplink_item/role_restricted/red_chainsaw
	name = "Syndicate Chainsaw"
	desc = "A suspiciously red chainsaw fitted with sharpened blades, deals moderate damage when on. \
			Can be used to tear into people, and dismember them! An excellent demolition tool, and is super-effective against plant-like targets."
	item = /obj/item/chainsaw/botany/syndicate
	cost = 8
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndi_donkpockets
	name = "Syndicate Donk Pockets"
	desc = "A box of our finest donk pockets, they're filled with our specialized brand of methamphetamine."
	item = /obj/item/storage/box/donkpockets/donkpocketsyndi
	cost = 4
	restricted_roles = list(JOB_COOK, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/deadlydonuts
	name = "Box of Singulonuts"
	desc = "A box with six Waffle Co. brand Singulonuts. Banned in four sectors for their sheer calorie content. \
			Caution: Product known to the safety board of Nanotrasen to increase risks of stomach cancer and cause instant obesity. \ Disguised as a regular box of regular donuts."
	item = /obj/item/storage/fancy/donut_box/deadly
	cost = 3
	restricted_roles = list(JOB_COOK, JOB_ASSISTANT, JOB_CURATOR, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/chemical_art
	name = "Psychotic Brawl Notes"
	desc = "Notes taken from an experienced user of bath salts, written in their own blood. Reading it will \
			greatly randomize the effectiveness of your punches. Best when combined with several narcotics."
	item = /obj/item/book/granter/martial/psychotic_brawling
	cost = 10
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_CHEMIST, JOB_CHIEF_MEDICAL_OFFICER, JOB_PSYCHOLOGIST, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/gibtonite_refiner
	name = "Gibtonite Refiner"
	desc = "Looks and functions like an advanced mining scanner, but with the added functionality of one of our exclusive explosive charge manufacturing devices. \
			Use it on a defused gibtonite chunk to begin refining it into an explosive charge. Gibtonite charges are comparable to that of an X-4 Charge."
	cost = 7
	item = /obj/item/t_scanner/adv_mining_scanner/gibrefinery
	restricted_roles = list("Shaft Miner", JOB_QUARTERMASTER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/randomnadesviamail
	name = "Syndicate Grenade Mail"
	desc = "5 smuggled grenades we usually send through Nanotrasen's mail to hopefully aid our agents and cause chaos. \
			Due to an increase in security, we're willing to offload some directly to you via the uplink for a price."
	cost = 5
	surplus = 0
	limited_stock = 1
	item = /obj/item/storage/box/syndie_kit/smugglednades
	restricted_roles = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Doesn't make sense as a bounty.

/datum/uplink_item/role_restricted/explosiveletter
	name = "Explosive Letter"
	desc = "A single, unmarked letter filled with instant explosives. Can be modified to have someone's name and occupation."
	cost = 2
	surplus = 0
	item = /obj/item/mail/explosive
	restricted_roles = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/jestercard
	name = "Jestographic Sequencer"
	desc = "The jestographic sequencer, often referred to as the 'clownmag' or 'cmag' is a small card that inverts the access on any airlock or windoor it's used on. \
			Perfect for locking command out of their own departments and allowing everyone else inside. The effects only last for 30 seconds, has three charges that recharge over time. \
			Anyone in-the-know will likely just stash their ID's temporarily to bypass it's effects. Go Honking Crazy!"
	item = /obj/item/card/emag/doorjack/jester
	cost = 3 // A temporary doorjacker that also temporarily halts authorized personnel.
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/xeno_organ_kit
	name = "Xenomorph Organ Kit"
	desc = "A kit containing some organs that we've recovered from clearing out xenomorph hives. Contains a plasma vessel, a resin spinner, and an acid gland. \
			You'll either have to purchase an autosurgeon or have these surgically implanted by someone you can trust."
	cost = 10
	surplus = 0
	item = /obj/item/storage/box/syndie_kit/xeno_organ_kit
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_SCIENTIST, JOB_RESEARCH_DIRECTOR, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/curatorspellpage
	name = "Recovered Spellpage"
	desc = "A 'spell page' we've recovered from our various bouts against and with the Wizard Federation. \
			We hope your particular expertise can make sense of this chicken-scratch."
	item = /obj/item/book/granter/action/spellpage/curator
	cost = 8
	surplus = 0
	restricted_roles = list(JOB_CURATOR, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/curatorspellpagegreater
	name = "Recovered Spellbook"
	desc = "A spellbook we've recovered from our various bouts against and with the Wizard Federation. \
			Our arcane allies have emphasized that this book contains 'great power', but we can hardly make heads-or-tails about it. \
			According to them, you can learn one of: Sanguine Strike, Bind Soul, or Mind Swap from this book."
	item = /obj/item/book/granter/action/spellpage/curator/greater
	cost = 20
	surplus = 0
	restricted_roles = list(JOB_CURATOR, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/role_restricted/cerberus
	name = "Necronomicon"
	desc = "A book that is capable of summoning a demonic familiar, Cerberus. The demonic familiar isn't capable of much aside from biting your foes, of which, it bites HARD. \
			Cerberus is supposed to follow your commands and protect you in your time of need."
	item = /obj/item/antag_spawner/nanotrasen/cerberus
	cost = 4
	surplus = 10
	refundable = TRUE
	restricted_roles = list(JOB_CHAPLAIN, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/wetfloormine
	name = "Wet Floor Mine"
	desc = "A wet floor sign which detonates violently after someone foolishly steps over it. \
			Has a large but relatively weak explosive size."
	item = /obj/item/deployablemine/explosive/wetfloor
	cost = 5
	surplus = 0
	restricted_roles = list(JOB_JANITOR, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/engimodsuit
	name = "Syndicate Engineering MODsuit"
	desc = "A heavily modified engineering MODsuit often found on Nanotrasen-run stations. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with a Advanced Magnetic Stability module, a Meson Visor, and a Constructor module. \
			Has a unique Syndicate Rapid-Construction-Device (RCD) pre-installed."
	item = /obj/item/mod/control/pre_equipped/engineering/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/atmosmodsuit
	name = "Syndicate Atmospheric MODsuit"
	desc = "A heavily modified atmospheric MODsuit often found on Nanotrasen-run stations. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with a Advanced Magnetic Stability module, a Meson Visor, and a Constructor module. \
			Comes with a Reagent Mister, loaded with CLF3 for mass incendiary shenanigans."
	item = /obj/item/mod/control/pre_equipped/atmospheric/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_ATMOSPHERIC_TECHNICIAN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/cargomodsuit
	name = "Syndicate Loader MODsuit"
	desc = "A heavily modified loader MODsuit often found on Nanotrasen-run stations. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with a Disposals Connector and a unique Flaming Paper Rifle."
	item = /obj/item/mod/control/pre_equipped/loader/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_CAPTAIN) // QM doesn't have a unique MODsuit

/datum/uplink_item/role_restricted/minemodsuit
	name = "Syndicate Mining MODsuit"
	desc = "A heavily modified mining MODsuit often found on Nanotrasen-run stations. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with a free syndicate Death Sphere module, and a unique Wormhole Jaunter module."
	item = /obj/item/mod/control/pre_equipped/mining/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_SHAFT_MINER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/medicmodsuit
	name = "Syndicate Medical MODsuit"
	desc = "A heavily modified medical MODsuit often found on Nanotrasen-run stations. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with an Advanced Reagent Scanner, a empty Surgical Processor, a Medibeam module, \
			A Reverse-Medibeam module, and a unique Hypospray module."
	item = /obj/item/mod/control/pre_equipped/medical/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_MEDICAL_DOCTOR, JOB_CHEMIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/paramodsuit
	name = "Syndicate Emergency Medical MODsuit"
	desc = "A heavily modified emergency medical MODsuit often found on Nanotrasen-run stations. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with an Advanced Reagent Scanner, a semi-loaded Surgical Processor, a Medibeam module, \
			A Reverse-Medibeam module, and a unique Dart Gun module."
	item = /obj/item/mod/control/pre_equipped/emergency_medical/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_PARAMEDIC, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/clownmodsuit
	name = "Syndicate CosmoHONK MODsuit"
	desc = "A heavily modified Cosmohonk MODsuit rarely ever seen, and when its seen? It's in the hands of a clown. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. \
			Comes with an Anti-Slip module pre-installed for free. \
			Comes with TWO unique modules: the Explosive Balloon Blower module, and the Mega Bikehorn module."
	item = /obj/item/mod/control/pre_equipped/cosmohonk/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/scimodsuit
	name = "Syndicate PROTOTYPE MODsuit"
	desc = "A heavily modified Prototype MODsuit we've recovered from an abandoned station and have been studying. \
			Comes equipped with most of the modules in a syndicate MODsuit, save for EMP shielding. \
			Also doesn't come equipped with any additional armor plating. May or may not have hidden modules for tracking and recording data. \
			Features a Kinesis Beam module allowing for manipulation of most structures and objects. Can't manipulate living objects, though. \
			Also comes with a unique Tesla Coil module for close-shock electrocutions."
	item = /obj/item/mod/control/pre_equipped/prototype/traitor
	cost = 10
	surplus = 0
	progression_minimum = 15 MINUTES
	restricted_roles = list(JOB_SCIENTIST, JOB_ROBOTICIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/maneater_seed
	name = "Maneater Seed Packet"
	desc = "A single seed packet of Man-Eaters. The Man-Eaters are a uniquely powerful species capable of mass destruction on a wide scale. \
			After being shaken awake, they'll remain in place waiting for non-plant targets to get close for them to attack. \
			Man-Eaters are roughly twice as powerful as Killer Tomatoes, make sure you max their stats and give them perennial growth for maximum destruction."
	item = /obj/item/seeds/maneater
	cost = 10
	surplus = 5
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY // Hell no.

/datum/uplink_item/role_restricted/moonshine
	name = "Jug of Moonshine"
	desc = "A single 100 unit jug of moonshine. Moonshine is guaranteed to get people horribly drunk very quickly even in small amounts. \
			Unless they happen to be a Syndicate Agent of course, in which case our specialized brew will deteriorate into Omnizine."
	item = /obj/item/reagent_containers/cup/glass/bottle/moonshine/traitor
	cost = 2
	surplus = 0
	restricted_roles = list(JOB_BARTENDER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/boomboots
	name = "Boomboots"
	desc = "A pair of boots of unknown origin, it came into our possession after salvaging the cargo of a ruined escape pod. \
			When worn, these Boom Boots have a 10% chance with every step you take, \
			that a random machine within 12 tiles of you will blow up. "
	item = /obj/item/clothing/shoes/boomboots
	cost = 16
	surplus = 0
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/cyborg_factory
	name = "Cyborg Factory Base"
	desc = "A single survival capsule containing a miniaturized base of operations. \
			It contains various ammenities such as a miniature medical suite, a pharmacy, \
			a robotics lab, a teleporter hub, and finally: An Automatic Robotic Factory for quick \
			conversions of human personnel into silicon servants! Be warned that you'll probably have to \
			hack each cyborg produced yourself, flashes are provided, but you'll have to bring your own \
			means of cyborg subversion."
	item = /obj/item/survivalcapsule/cyborg_factory
	cost = 25
	surplus = 0
	restricted_roles = list(JOB_ROBOTICIST, JOB_RESEARCH_DIRECTOR, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/tearstache
	name = "Teachstache Grenade"
	desc = "A teargas grenade that launches sticky moustaches onto the face of anyone not wearing a clown or mime mask. The moustaches will \
		remain attached to the face of all targets for one minute, preventing the use of breath masks and other such devices."
	item = /obj/item/grenade/chem_grenade/teargas/moustache
	cost = 3
	surplus = 0
	restricted_roles = list(JOB_ASSISTANT, JOB_CLOWN, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/cursedclownmask
	name = "Cursed Clown Mask"
	desc = "A clown mask haunted by the souls of those who honked before. Only true clowns should attempt to wear this. It also functions like a gas mask. \
			Those unworthy of it's power are condemned temporarily to suffer for the next 3 minutes at minimum."
	item = /obj/item/clothing/mask/gas/clown_hat/cursed
	cost = 5
	surplus = 0
	restricted_roles = list(JOB_CLOWN, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/telegun
	name = "Teleporter Gun"
	desc = "Teleporter technology meets energy-based weaponry! After purchase, use in hand to select a tracking beacon to lock on to, \
			then fire at your target to teleport them to that destination! Works especially well for putting people directly into deathtraps. \
			throwing people into hazardous environments, or getting your pursuers off your ass! This gun does NOT self-charge. \
			Has a chance to be a wild teleport, sending the victim to a completely random location."
	item = /obj/item/gun/energy/teleport
	cost = 7
	surplus = 10
	restricted_roles = list(JOB_SCIENTIST, JOB_RESEARCH_DIRECTOR, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/hotbox
	name = "Hotbox Lighter"
	desc = "A zippo lighter with a suspicious paint job. Has an extended fuel capacity for extensive use. \
			This lighter may be used directly on grown foods (apples, pumpkins, etc) to directly convert the food into smoke! \
			The smoke created will contain the food's reagents. Internals are highly recommended if you intend to get 'creative'."
	item = /obj/item/lighter/hotbox
	cost = 2
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/waspbow
	name = "Wasp Crossbow"
	desc = "One of the Bee Liberation Front's augmented energy crossbows, they fire 4 wasp eggs in a wide pattern that deal minor toxin damage on hit. \
			Wasp eggs after impact turn into hostile bees to assault your foes! They also have a small chance to be given a random toxin strain! \
			Not sponsored nor endorsed by Dr. Bees."
	item = /obj/item/gun/energy/recharge/ebow/wasp
	cost = 12
	restricted_roles = list(JOB_BOTANIST, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/gibbingtrashcart
	name = "Trash Compactor"
	desc = "A seemingly ordinary trash cart, it's been provided with an inbuilt timer and infra-red sensor to detect humanoid lifeforms. \
			After closing a human or humanoid entity within, the timer begins a countdown from 1 minute before compacting all human/humanoid entities within. \
			Perfect for the destruction of any unwanted people! Be sure to clean up the mess it leaves behind."
	item = /obj/structure/closet/crate/trashcart/gibber
	cost = 9
	surplus = 0
	restricted_roles = list(JOB_JANITOR, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/grenadecasing
	name = "Chemical Grenade Casings"
	desc = "A box utilizing bluespace technology, it contains a wide variety of chemical grenade casings for the aspiring chemist. \
			Cables, tools and chemicals are NOT included."
	item = /obj/item/storage/box/nadecasings
	cost = 3
	surplus = 0
	restricted_roles = list(JOB_CHEMIST, JOB_SCIENTIST, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/crushmagboots
	name = "Crushing Magboots"
	desc = "A pair of extra-strength magboots that crush anyone you walk over while they're active."
	item = /obj/item/clothing/shoes/magboots/crushing
	cost = 8
	surplus = 0
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_ATMOSPHERIC_TECHNICIAN, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/the_honkrender
	name = "The Honkrender"
	desc = "An ancient artifact recovered from an ancient cave. Opens the way to the Dark Carnival temporarily. \
			Useful for... oh what the hell, you know you want too!"
	item = /obj/item/veilrender/honkrender
	cost = 8
	restricted = TRUE
	restricted_roles = list(JOB_CLOWN, JOB_CHAPLAIN, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/holocarp
	name = "Holocarp Parasites"
	desc = "Fishsticks prepared through ritualistic means in honor of the god Carp-sie, capable of binding a holocarp \
			to act as a servant and guardian to their host. You may have several holocarp's at once."
	item = /obj/item/guardian_creator/carp
	cost = 18
	surplus = 5
	progression_minimum = 30 MINUTES
	restricted = TRUE
	refundable = TRUE
	restricted_roles = list(JOB_COOK, JOB_CHAPLAIN, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/powergloves
	name = "Power Gloves"
	desc = "A pair of insulated gloves with onboard electronics capable of harnessing electricity from nearby power wires. \
			Harnessed electricity can be used to shock nearby people after a short delay. \
			Requires a decent amount of power to be running through the powernet, and you need to be standing atop of a power wire to use. \
			T-Analyzers are highly recommended."
	item = /obj/item/clothing/gloves/color/yellow/power_gloves
	cost = 8
	surplus = 10
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_ATMOSPHERIC_TECHNICIAN, JOB_CHIEF_ENGINEER, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/tunnel_khans
	name = "Tunnel Khans Scroll"
	desc = "An odd scroll written with gray crayon. It's really hard to read. We hope that your assistant mind can comprehend it better than us. \
			Teachs the Tunnel Arts to the reader, granting increased unarmed damage and boosting their overall physical physique. \
			You'll also gain some special unarmed combo moves to increase your unarmed effectiveness."
	cost = 13
	item = /obj/item/book/granter/martial/the_tunnel_arts
	restricted_roles = list(JOB_ASSISTANT, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
	wanted_item_result = /obj/item/gun/ballistic/automatic/pistol/deagle/gold

/datum/uplink_item/role_restricted/mining_points
	name = "Mining Points Card"
	desc = "A single mining point transfer card pre-loaded with one thousand mining points donated to us by previous agents. \
			We've heard that you can acquire some decent gear using these things and have opted to sell them to you, just in case."
	item = /obj/item/card/mining_point_card/thousand
	cost = 4
	surplus = 0
	restricted_roles = list(JOB_SHAFT_MINER, JOB_BITRUNNER, JOB_CAPTAIN)

/datum/uplink_item/role_restricted/tier4bitrunner
	name = "Tier 4 Bitrunner Gear Disk"
	desc = "We've been having a blast in virutal reality for a while and have developed this disk to give you plenty of firepower to really have some fun. \
			You may choose from disposable laser turrets, energy chainsaws, SPES shotguns, laser rifles, and even the fabled china lake! Even more fun toys included!."
	item = /obj/item/bitrunning_disk/item/tier4
	cost = 7
	surplus = 0
	restricted_roles = list(JOB_BITRUNNER, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/syndi_pka_gun
	name = "Experimental Proto-Kinetic Accelerator"
	desc = "A freeform self-charging PKA energy gun often used for mining, now with a black-and-red paintjob. \
			We've re-designed this energy gun after recovering it's blueprints from espionage missions on Nanotrasen stations \
			to allow for extensive modification. It's total 'mod capacity' is estimated to be precisely three-times as much as normal models."
	item = /obj/item/gun/energy/recharge/kinetic_accelerator/syndicate
	cost = 8
	surplus = 0
	restricted_roles = list(JOB_SHAFT_MINER, JOB_QUARTERMASTER, JOB_CAPTAIN)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/role_restricted/uty_reference
	name = "Deputy Justice Kit"
	desc = "A box containing a full wild west getup with all the bells and whistles. \
			Also comes with a holster and a genuine Wild Revolver with two speedloaders of .357 ammunition! \
			The Wild Revolver may be spun to change it's caliber, allowing it to use .357, .38, 9mm, 10mm, .45, and even 556 ammo types!"
	item = /obj/item/storage/box/syndie_kit/clover
	cost = 14
	surplus = 1 // Never give up on the dream, kid.
	progression_minimum = 30 MINUTES
	restricted_roles = list(JOB_LAWYER, JOB_CAPTAIN)
