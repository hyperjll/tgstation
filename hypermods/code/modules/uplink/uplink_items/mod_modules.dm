/datum/uplink_category/mod_modules
	name = "MODsuit Modules"
	weight = 10

/datum/uplink_item/mod_modules
	category = /datum/uplink_category/mod_modules


/datum/uplink_item/mod_modules/thermal
	name = "MODsuit Thermal Visor Module"
	desc = "A visor for a MODsuit. Lets you see living beings through walls."
	item = /obj/item/mod/module/visor/thermal
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/night
	name = "MODsuit Night Visor Module"
	desc = "A visor for a MODsuit. Lets you see clearer in the dark."
	item = /obj/item/mod/module/visor/night
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/chameleon
	name = "MODsuit Chameleon Module"
	desc = "A MODsuit module that lets the suit disguise itself as other objects."
	item = /obj/item/mod/module/chameleon
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/plate_compression
	name = "MODsuit Plate Compression Module"
	desc = "A MODsuit module that lets the suit compress into a smaller size. Not compatible with storage modules or the Infiltrator MODsuit."
	item = /obj/item/mod/module/plate_compression
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/noslip
	name = "MODsuit Anti-Slip Module"
	desc = "A MODsuit module preventing the user from slipping on water."
	item = /obj/item/mod/module/noslip
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/shock_absorber
	name = "MODsuit Shock-Absorber Module"
	desc = "A MODsuit module preventing the user from getting knocked down by batons."
	item = /obj/item/mod/module/shock_absorber
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/modsuit/Wraith
	name = "MODsuit wraith cloaking module"
	desc = "A MODsuit module that grants to the user Optical camouflage and the ability to overload light sources to recharge suit power."
	item = /obj/item/mod/module/stealth/wraith
	cost = 3
	purchasable_from = ~UPLINK_SPY


/datum/uplink_item/mod_modules/dnanoremove
	name = "MODsuit Non-Removable DNA-Lock"
	desc = "The gold-standard of privatizing MODsuits, this one has a one-time latching mechanism which prevents it from being removed \
			after it's installation, preventing people from bypassing the lock whether by removal or via a cryptographic sequencer. \
			The memory of your DNA can still be removed via EMP's, however."
	item = /obj/item/mod/module/dna_lock/noremove
	purchasable_from = ~UPLINK_SPY
	cost = 2

/datum/uplink_item/mod_modules/flamethrower
	name = "MODsuit Flamethrower Module"
	desc = "A MODsuit module which comes equipped with a electrical flamethrower that uses the MODsuit's battery as a fuel source."
	item = /obj/item/mod/module/flamethrower
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS || UPLINK_SPY)
	cost = 4

/datum/uplink_item/mod_modules/springlock
	name = "Disguised MODsuit Springlock Module"
	desc = "A MODsuit Springlock module disguised as a DNA lock module, it technically does nothing on it's own. \
			Insert into a MODsuit and wait for an unsuspecting victim to splash liquids upon. \
			We highly recommend you don't use this yourself, there's no benefits in doing so."
	item = /obj/item/mod/module/springlock/disguised
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS || UPLINK_SPY)
	cost = 2

/datum/uplink_item/mod_modules/synditeleporter
	name = "MODsuit Teleportation Module"
	desc = "A MODsuit module which utilizes experimental teleportation technology allowing the user to teleport short distances. \
			Cannot teleport to places not visible to the user, has a long cooldown and a five second wind-up."
	item = /obj/item/mod/module/synditeleporter
	cost = 4
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/syndiantigrav
	name = "MODsuit Anti-Gravity Module"
	desc = "A MODsuit module which utilizes the same technology of our Advanced Blood-Red Magboots. \
			Allows the user to become weightless on demand, allowing jetpack usage indoors."
	item = /obj/item/mod/module/antigrav
	cost = 4
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/power_kick
	name = "MODsuit Power Kick Module"
	desc = "A MODsuit module with a high-power myomer to generate an incredible amount of energy, transferred into the power of a kick."
	item = /obj/item/mod/module/power_kick/syndicate
	cost = 3
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/demoralizer
	name = "MODsuit Demoralizer Module"
	desc = "A MODsuit module iconic for it's use in our Infiltrator MODsuits. \
			It greatly diminishes the mood of all nearby save for the user."
	item = /obj/item/mod/module/demoralizer
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS || UPLINK_SPY) // Probably best not to demoralize your own team.
	cost = 3

/datum/uplink_item/mod_modules/camera_blocker
	name = "MODsuit Camera Camoflauge Module"
	desc = "A MODsuit module developed for the Spider Clan. It protects the user from flashes, and prevents the \
			user from being tracked via cameras. It also prevents any forms of facial recognition."
	item = /obj/item/mod/module/welding/camera_vision
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/rad_protection
	name = "MODsuit Radiation Shielding Module"
	desc = "A MODsuit module often found within engineering-specific MODsuits. Useful in specific circumstances."
	item = /obj/item/mod/module/rad_protection
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/bluespacestorage
	name = "MODsuit Bluespace Storage Module"
	desc = "A MODsuit module developed by Nanotrasen and procured via expensive measures we'd rather not talk about. \
			Provides far better storage than normal syndicate storage MODsuit modules, and can even fit items of ANY size!"
	item = /obj/item/mod/module/storage/bluespace
	cost = 4
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/mouthhole
	name = "MODsuit Mouthhole Module"
	desc = "A MODsuit module which allows the user to both eat and drink with the MODsuit completely active. \
			Useful for saving time, and if your medicine is in pill/liquid form."
	item = /obj/item/mod/module/mouthhole
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/emp
	name = "MODsuit EMP Module"
	desc = "A MODsuit module based on the concept of a reverse EMP-shield. Activation of the module will instead produce a massive EMP. \
			It's recommended you have some form of EMP protection, most MODsuits have such a module pre-installed."
	item = /obj/item/mod/module/emp_shield/pulse
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/miragedispenser
	name = "MODsuit Mirage Grenade Dispenser Module"
	desc = "A MODsuit module with a miniaturized autolathe. Allows the user to trade massive amounts of the MODsuit's cell charge \
			in exchange for Mirage Grenades."
	item = /obj/item/mod/module/dispenser/mirage
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/fragdispenser
	name = "MODsuit Fragmentation Grenade Dispenser Module"
	desc = "A MODsuit module with a miniaturized autolathe. Allows the user to trade massive amounts of the MODsuit's cell charge \
			in exchange for Fragmentation Grenades."
	item = /obj/item/mod/module/dispenser/frag
	cost = 6
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/joint_torsion
	name = "MODsuit Joint Torsion Module"
	desc = "A MODsuit module which takes the concept of 'rubbing your socks on the carpet to produce electricity' to the maximum. \
			While installed, the simple act of moving around will feed the MODsuit's cell. Doesn't work without gravity."
	item = /obj/item/mod/module/joint_torsion/syndicate
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/recyclerdonk
	name = "MODsuit Riot Dart Recycler Module"
	desc = "A MODsuit module which collects leftover ammo casings (and garbage) before using it's \
			internal synthesizer to turn the collected materials into a box of riot darts."
	item = /obj/item/mod/module/recycler/donk
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/recyclerc9mm
	name = "MODsuit 9mm Recycler Module"
	desc = "A MODsuit module which collects leftover ammo casings (and garbage) before using it's \
			internal synthesizer to turn the collected materials into a box of 9mm ammunitions."
	item = /obj/item/mod/module/recycler/ammobox/c9mm
	cost = 4
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/recyclerc45
	name = "MODsuit .45 Recycler Module"
	desc = "A MODsuit module which collects leftover ammo casings (and garbage) before using it's \
			internal synthesizer to turn the collected materials into a box of .45 ammunitions."
	item = /obj/item/mod/module/recycler/ammobox/c45
	cost = 5
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/recyclera357
	name = "MODsuit .357 Recycler Module"
	desc = "A MODsuit module which collects leftover ammo casings (and garbage) before using it's \
			internal synthesizer to turn the collected materials into a box of .357 ammunitions."
	item = /obj/item/mod/module/recycler/ammobox/a357
	cost = 7
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/recyclerc10mm
	name = "MODsuit 10mm Recycler Module"
	desc = "A MODsuit module which collects leftover ammo casings (and garbage) before using it's \
			internal synthesizer to turn the collected materials into a box of 10mm ammunitions."
	item = /obj/item/mod/module/recycler/ammobox/c10mm
	cost = 5
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/recyclerm50
	name = "MODsuit 50ae Recycler Module"
	desc = "A MODsuit module which collects leftover ammo casings (and garbage) before using it's \
			internal synthesizer to turn the collected materials into a box of 50ae ammunitions."
	item = /obj/item/mod/module/recycler/ammobox/m50
	cost = 7
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/stealth
	name = "MODsuit Stealth Module"
	desc = "A MODsuit module capable of rendering both the MODsuit and user nearly invisible at the cost of draining the MODsuit's cell charge."
	item = /obj/item/mod/module/stealth/syndicate
	cost = 5 // The wraith module just came out and it's fucking 3 TC, granted, it's a bit more flimsy. This was previously 8 TC
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/electricpalm
	name = "MODsuit Electric Palm Module"
	desc = "A now discontinued MODsuit module orginally developed by the Spider Clan to give their operatives an edge in unarmed combat. \
			After installation, this module channels electricity straight from the MODsuit's cell straight into the palm of the user's hands, \
			allowing for quick electrically-induced stuns to unsuspecting enemies."
	item = /obj/item/mod/module/hacker/electricpalm
	cost = 3
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/energy_net
	name = "MODsuit Energy Net Module"
	desc = "A MODsuit module popularized by the Spider Clan's energy net technology, this modules shoots hardlight beams \
			which form hardlight webbing upon those it strikes, briefly incapacitating targets in a non-lethal manner."
	item = /obj/item/mod/module/energy_net/syndicate
	cost = 6
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/stimpackmod
	name = "MODsuit Stimpack Booster Module"
	desc = "A MODsuit module both developed and adopted widely by the Syndicate to mimic the Spider Clan's adrenaline booster module. \
			Contains a dosage of stimulants that are injected into the wearer upon their request, and can be 'restocked' should the module be provided a supply of Ephedrine."
	item = /obj/item/mod/module/adrenaline_boost/syndicate
	cost = 3
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/pepper_shoulders
	name = "MODsuit Pepper Defense Module"
	desc = "A MODsuit module with self-restocking canisters of pepper spray, \
			in the event you are attacked, this module will release a cloud of pepper spray upon your attacker."
	item = /obj/item/mod/module/pepper_shoulders
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/projectile_dampener
	name = "MODsuit Projectile Dampener Module"
	desc = "A MODsuit module which projects a personal field of energy that both slows and weakens projectiles nearby. \
			Perfect for self-defense against incoming gunfire, though using firearms against nearby enemies will likely prove ineffective."
	item = /obj/item/mod/module/projectile_dampener/syndicate
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/sonar
	name = "MODsuit Sonar Module"
	desc = "A MODsuit module which allows you to detect living creatures nearby using ancient technology. \
			Has a low cooldown, but can be effective on a budget."
	item = /obj/item/mod/module/active_sonar/syndicate
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/shooting_assistant
	name = "MODsuit Aim Assist Module"
	desc = "A MODsuit module that enhances the user's ability with firearms, with a couple drawbacks: \
			Has two modes: Stormtrooper mode, which features faster fire rates, but lower accuracy \
			and Sharpshooter mode which slows you down, but provides better accuracy and ricochets."
	item = /obj/item/mod/module/shooting_assistant
	cost = 2
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/shove_blocker
	name = "MODsuit Anti-Shove Module"
	desc = "A MODsuit module specifically designed to prevent knockdowns from being shoved into a wall. \
			Useful against the more 'robust' of the crew who rely on shove-stuns to dispose of their enemies."
	item = /obj/item/mod/module/shove_blocker
	cost = 1
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/mod_modules/samusreference
	name = "MODsuit Spherical Death Module"
	desc = "A MODsuit module which allows the user to compress both them and the MODsuit into a ball. \
			Spherical MODsuit's can cross over more hazards, can't be used in low pressure environments such as lavaland, and can't be used without gravity. \
			Allows the user to place bombs while rolling which can blow anyone and anything sky-high."
	item = /obj/item/mod/module/death_sphere
	cost = 6
	purchasable_from = ~UPLINK_SPY
