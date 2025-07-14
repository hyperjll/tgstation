/obj/item/implant/weapons_auth
	name = "firearms authentication implant"
	desc = "Lets you shoot your guns."
	icon_state = "auth"
	actions_types = null

/obj/item/implant/weapons_auth/get_data()
	return "<b>Implant Specifications:</b><BR> \
		<b>Name:</b> Firearms Authentication Implant<BR> \
		<b>Life:</b> 4 hours after death of host<BR> \
		<b>Implant Details:</b> <BR> \
		<b>Function:</b> Allows operation of implant-locked weaponry, preventing equipment from falling into enemy hands."

/obj/item/implant/emp
	name = "\improper EMP implant"
	desc = "Triggers an EMP."
	icon_state = "emp"
	uses = 3
	var/maxuses = 3
	var/rechargetime = 5 MINUTES
	var/deleteonnouses = FALSE
	var/recharging = FALSE

/obj/item/implant/emp/activate()
	. = ..()
	if(!uses)
		var/mob/living/carbon/carbon_imp_in = imp_in
		balloon_alert(carbon_imp_in, "no charge!")
		return

	uses--
	empulse(imp_in, 3, 5)

	if(!uses && deleteonnouses)
		var/mob/living/carbon/carbon_imp_in = imp_in
		addtimer(CALLBACK(carbon_imp_in, TYPE_PROC_REF(/atom, balloon_alert), carbon_imp_in, "implant degraded!"), 1 SECONDS)
		qdel(src)

	if((maxuses > uses) && !recharging)
		recharging = TRUE
		addtimer(CALLBACK(src, PROC_REF(restore_charge)), rechargetime)

/obj/item/implant/emp/proc/restore_charge(mob/living/carbon/implanted_in)
	if(maxuses > uses)
		uses++
		var/mob/living/carbon/carbon_imp_in = imp_in
		balloon_alert(carbon_imp_in, "emp implant: [uses] uses left!")
		addtimer(CALLBACK(src, PROC_REF(restore_charge)), rechargetime) // keep charging till you can't
	else
		recharging = FALSE

/obj/item/implanter/emp
	name = "implanter (EMP)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/emp

/obj/item/implant/smoke
	name = "smoke implant"
	desc = "Releases a plume of smoke."
	icon_state = "smoke"
	uses = 3

/obj/item/implant/smoke/activate()
	. = ..()
	uses--
	var/datum/effect_system/fluid_spread/smoke/bad/smoke = new
	smoke.set_up(6, holder = imp_in, location = imp_in)
	smoke.start()
	if(!uses)
		qdel(src)

/obj/item/implanter/smoke
	name = "implanter (Smoke)"
	imp_type = /obj/item/implant/smoke

/obj/item/implant/radio
	name = "internal radio implant"
	var/obj/item/radio/radio
	var/radio_key
	var/subspace_transmission = FALSE
	icon = 'icons/obj/devices/voice.dmi'
	icon_state = "walkietalkie"

/obj/item/implant/radio/activate()
	. = ..()
	// needs to be GLOB.deep_inventory_state otherwise it won't open
	radio.ui_interact(usr, state = GLOB.deep_inventory_state)

/obj/item/implant/radio/Initialize(mapload)
	. = ..()

	radio = new(src)
	// almost like an internal headset, but without the
	// "must be in ears to hear" restriction.
	radio.name = "internal radio"
	radio.subspace_transmission = subspace_transmission
	radio.canhear_range = 0
	if(radio_key)
		radio.keyslot = new radio_key
	radio.recalculateChannels()

/obj/item/implant/radio/Destroy()
	QDEL_NULL(radio)
	return ..()

/obj/item/implant/radio/mining
	radio_key = /obj/item/encryptionkey/headset_cargo

/obj/item/implant/radio/syndicate
	desc = "Are you there God? It's me, Syndicate Comms Agent."
	radio_key = /obj/item/encryptionkey/syndicate
	subspace_transmission = TRUE

/obj/item/implant/radio/slime
	name = "slime radio"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "adamantine_resonator"
	radio_key = /obj/item/encryptionkey/headset_sci
	subspace_transmission = TRUE

/obj/item/implant/radio/get_data()
	return "<b>Implant Specifications:</b><BR> \
		<b>Name:</b> Internal Radio Implant<BR> \
		<b>Life:</b> 24 hours<BR> \
		<b>Implant Details:</b> Allows user to use an internal radio, useful if user expects equipment loss, or cannot equip conventional radios."

/obj/item/implanter/radio
	name = "implanter (internal radio)"
	imp_type = /obj/item/implant/radio

/obj/item/implanter/radio/syndicate
	name = "implanter (internal syndicate radio)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/radio/syndicate
