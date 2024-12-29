// Mostly just other voucher sets, the mining console gets all subtypes of /datum/voucher_set for item sets. So, we gotta start from scratch.

/datum/s_voucher_set
	/// Name of the set
	var/name
	/// Description of the set
	var/description
	/// Icon of the set
	var/icon
	/// Icon state of the set
	var/icon_state
	/// List of items contained in the set
	var/list/set_items = list()

/datum/s_voucher_set/silicon_friends_kit
	name = "Silicon Friends Kit"
	description = "Contains THREE syndicate silicon support beacons, as well as three \
			Martyr, Rescue, and Weapon Cyborg Modules! Come on, grab your friends!"
	icon = 'icons/obj/devices/voice.dmi'
	icon_state = "nukietalkie"
	set_items = list(
		/obj/item/antag_spawner/loadout/syndiborg,
		/obj/item/antag_spawner/loadout/syndiborg,
		/obj/item/antag_spawner/loadout/syndiborg,
		/obj/item/borg/upgrade/illegalweapons,
		/obj/item/borg/upgrade/illegalweapons,
		/obj/item/borg/upgrade/illegalweapons,
		/obj/item/borg/upgrade/martyr,
		/obj/item/borg/upgrade/martyr,
		/obj/item/borg/upgrade/martyr,
		/obj/item/borg/upgrade/illegalrescue,
		/obj/item/borg/upgrade/illegalrescue,
		/obj/item/borg/upgrade/illegalrescue,
		)

/datum/s_voucher_set/catwalker_kit
	name = "Cat-Walker Kit"
	description = "Contains TEN Syndicat Beacons! This shall be a night to remember! \
			It even comes with two changeling extract medipens in case of accidental self-bombings."
	icon = 'hypermods/icons/mob/simple/pets.dmi'
	icon_state = "syndicat"
	set_items = list(
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/antag_spawner/nuke_ops/syndicat,
		/obj/item/reagent_containers/hypospray/medipen/limborganregen,
		/obj/item/reagent_containers/hypospray/medipen/limborganregen,
		)

/datum/s_voucher_set/recon_kit
	name = "Recon Kit"
	description = "The essentials to make sure you gather the proper intelligence on the opposition. \
			Comes with a pair of X-Ray goggles, Binoculars, a Binary Translator, a Briefcase Launchpad, \
			an Overwatch Agent requester and more!"
	icon = 'icons/obj/devices/tool.dmi'
	icon_state = "binoculars"
	set_items = list(
		/obj/item/clothing/glasses/thermal/xray,
		/obj/item/storage/briefcase/launchpad,
		/obj/item/binoculars,
		/obj/item/encryptionkey/binary,
		/obj/item/flashlight/emp,
		/obj/item/antag_spawner/nuke_ops/overwatch,
		/obj/item/grenade/frag,
		/obj/item/grenade/frag,
		)

/datum/s_voucher_set/engineer_gaming
	name = "Engineer Gaming"
	description = "Makin' bacon. Embrace your inner space texan and make your claim with automated sentry guns today! \
			Contains 5 disposable sentry guns disguised as toolboxes."
	icon = 'icons/obj/storage/toolbox.dmi'
	icon_state = "red"
	set_items = list(
		/obj/item/storage/toolbox/emergency/turret/nukie,
		/obj/item/storage/toolbox/emergency/turret/nukie,
		/obj/item/storage/toolbox/emergency/turret/nukie,
		/obj/item/storage/toolbox/emergency/turret/nukie,
		/obj/item/storage/toolbox/emergency/turret/nukie,
		)
