/datum/uplink_category/deception
	name = "Deception"
	weight = 17

/datum/uplink_item/deception
	category = /datum/uplink_category/deception


/datum/uplink_item/deception/cutouts
	name = "Adaptive Cardboard Cutouts"
	desc = "These cardboard cutouts are coated with a thin material that prevents discoloration and makes the images on them appear more lifelike. \
			This pack contains three as well as a crayon for changing their appearances."
	item = /obj/item/storage/box/syndie_kit/cutouts
	cost = 1
	surplus = 20

/datum/uplink_item/deception/fakenucleardisk
	name = "Decoy Nuclear Authentication Disk"
	desc = "It's just a normal disk. Visually it's identical to the real deal, but it won't hold up under closer scrutiny by the Captain. \
			Don't try to give this to us to complete your objective, we know better!"
	item = /obj/item/disk/nuclear/fake
	cost = 1
	surplus = 1
	uplink_item_flags = NONE

/datum/uplink_item/deception/frame
	name = "F.R.A.M.E. disk"
	desc = "When inserted into a tablet, this cartridge gives you five messenger viruses which \
			when used cause the targeted tablet to become a new uplink with zero TCs, and immediately become unlocked. \
			You will receive the unlock code upon activating the virus, and the new uplink may be charged with \
			telecrystals normally."
	item = /obj/item/computer_disk/virus/frame
	cost = 4
	restricted = TRUE
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/deception/frame/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	. = ..()
	var/obj/item/computer_disk/virus/frame/target = .
	if(!target)
		return
	target.current_progression = uplink_handler.progression_points

/datum/uplink_item/deception/failsafe
	name = "Failsafe Uplink Code"
	desc = "When entered the uplink will self-destruct immediately."
	item = ABSTRACT_UPLINK_ITEM
	cost = 1
	surplus = 0
	restricted = TRUE
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/deception/failsafe/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	var/datum/component/uplink/uplink = source.GetComponent(/datum/component/uplink)
	if(!uplink)
		return
	if(!uplink.unlock_note) //no note means it can't be locked (typically due to being an implant.)
		to_chat(user, span_warning("This device doesn't support code entry!"))
		return

	uplink.failsafe_code = uplink.generate_code()
	var/code = "[islist(uplink.failsafe_code) ? english_list(uplink.failsafe_code) : uplink.failsafe_code]"
	var/datum/antagonist/traitor/traitor_datum = user.mind?.has_antag_datum(/datum/antagonist/traitor)
	if(traitor_datum)
		traitor_datum.antag_memory += "<b>Uplink Failsafe Code:</b> [code]" + "<br>"
		traitor_datum.update_static_data_for_all_viewers()
	to_chat(user, span_warning("The new failsafe code for this uplink is now: [code].[traitor_datum ? " You may check your antagonist info to recall this." : null]"))
	return source //For log icon


/datum/uplink_item/deception/syndistache
	name = "Syndicate Moustache"
	desc = "A moustache to prevent people from recognizing you. Be sure to conceal your real identification card or it won't work. \
			The moustache provided is completely fire proof, and has minor protection technology installed to aid you should you be found out. \
			Also allows you to properly use internals, and even has a slot for smoking cigarettes. Comes with an in-built voice changer."
	item = /obj/item/clothing/mask/gas/fakemoustache/syndicate
	cost = 3
	surplus = 50

/datum/uplink_item/deception/voice_changer
	name = "Voice Changer"
	desc = "A mask with voice changing capabilities and chameleon technology, it'll change your voice automatically to match the appearance or ID you have. \
			Be sure to conceal your real identity or it won't work. Less blatantly obvious than our fake moustaches."
	item = /obj/item/clothing/mask/chameleon
	cost = 1
	surplus = 50

/datum/uplink_item/deception/conductivegloves
	name = "Conductive Gloves"
	desc = "A pair of super-conducting gloves which amplifies electrical shock effectiveness by 4x. \
			Fitted with our chameleon technology to ensure you can fool just about anyone."
	item = /obj/item/clothing/gloves/chameleon/conductive
	cost = 2
	surplus = 0 // Let's not fool the people who buy a surplus crate.
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/deception/radlights
	name = "Radioactive Lights"
	desc = "A box disguised as a replacement lights package, containing 6 light tubes and 6 light bulbs. \
			Light tubes and bulbs contained within are hazardous to life and will erratically pulse with radiation. \
			When properly installed into any light sources, the light tubes/bulbs within will burst with radiation when broken."
	item = /obj/item/storage/box/lights/mixed/radiation
	progression_minimum = 20 MINUTES
	cost = 4
	surplus = 15

/datum/uplink_item/deception/riggedstunbaton
	name = "Rigged Stun Baton"
	desc = "A syndicate minibomb cleverly disguised as one of Nanotrasen's stun batons often given to their security team. Perfect for tricking the security team into blowing themselves up and maybe other people too."
	item = /obj/item/disguisedgrenade/riggedstunbaton
	cost = 6
	surplus = 50
	purchasable_from = ~UPLINK_SERIOUS_OPS
	progression_minimum = 30 MINUTES

/datum/uplink_item/deception/tricktelecrystal
	name = "Trick Telecrystal"
	desc = "A poorly manufactured telecrystal that's become highly unstable, upon being inserted into an uplink OR when used to attack something \
			this telecrystal will violently explode dealing MASSIVE damage to both target and user. The explosion is always powerful enough to leave \
			a hull breach and likely gib the target or user if either one doesn't have any explosive protection. \
			Often used to fool other syndicate agents or scientific personnel into killing themselves."
	item = /obj/item/stack/telecrystal/trick
	cost = 5
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	progression_minimum = 30 MINUTES

/datum/uplink_item/deception/riggedcells
	name = "Box of Rigged Power Cells"
	desc = "A box containing six of our specialty-designed rigged power cells! \
			Each are designed to be as powerful as a bluespace power cell, but explode 60 seconds after their installation. \
			These cells explode in a more devastating manner than a normal rigged power cell."
	item = /obj/item/storage/box/syndie_kit/syndirigcells
	cost = 5
	surplus = 30
	progression_minimum = 20 MINUTES

/datum/uplink_item/deception/riggedlights
	name = "Box of Rigged Replacement Lights"
	desc = "A box containing approximately fourteen of our specialty-designed rigged lights! \
			Each release plasma when shattered, and after a full minute: explode to breach walls nearby. \
			Having an electrical storm blow out all the lights for you would probably get the shuttle called."
	item = /obj/item/storage/box/lights/mixed/syndirigged
	cost = 7
	surplus = 25
	progression_minimum = 20 MINUTES
