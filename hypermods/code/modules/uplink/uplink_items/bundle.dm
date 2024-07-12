//All bundles and telecrystals
/datum/uplink_category/bundle
	name = "Bundles"
	weight = 14

/datum/uplink_item/bundles_tc/goloudbundle
	name = "NT-Annihilation 'Go Loud' Kit"
	desc = "For any reason, if you find stealth to be an unviable strategy, we'll understand. Be warned that claiming this kit WILL ALERT EVERYONE TO YOUR TRAITOROUS NATURE. \
			We're ready to provide an additional 15 Telecrystals, an energy dagger, and an atropine autoinjector to ensure you'll have the gear to go loud and get your objectives done."
	item = /obj/item/storage/box/syndie_kit/goloudbundle
	cost = 0
	surplus = 0
	limited_stock = 1
	cant_discount = TRUE
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS | UPLINK_SPY)
	var/loud_kit = /obj/item/storage/box/syndie_kit/goloudbundle
	var/base_buyer_name

/datum/uplink_item/bundles_tc/goloudbundle/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/item/storage/box/syndie_kit/goloudbundle/loudkit = new loud_kit()
	if(!istype(loudkit))
		CRASH("uplink produced the wrong item instead of the go loud kit.")

	if(user.has_dna()) // Make sure that disguises won't prevent people from circumventing this.
		base_buyer_name = user.real_name
		priority_announce("We've just detected an encrypted signal originating from [base_buyer_name], that has resulted in a pod being sent to the station containing what we believe to be a large influx of illegal redspace technology. We believe this to be a massive security issue and we highly advise all security personnel to be on high alert. [base_buyer_name] should be arrested and detained ALIVE as their capture could be valuable to us, though high-ranking officers may provide new directives as normal.", "Cental Command - HIGH PRIORITY ALERT", 'sound/misc/notice1.ogg')

	podspawn(list(
		"target" = get_turf(user),
		"style" = STYLE_SYNDICATE,
		"spawn" = loudkit,
	))
	return source //For log icon
