/obj/item/implant/biosig
	name = "biosignaller implant"
	desc = "Monitors host vital signs and transmits an encrypted radio message upon death."
	actions_types = null
	verb_say = "broadcasts"
	var/obj/item/radio/radio
	var/encryptionkey = /obj/item/encryptionkey/universal
	var/channel = RADIO_CHANNEL_COMMON

/obj/item/implant/biosig/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new encryptionkey
	radio.listening = FALSE
	radio.recalculateChannels()

/obj/item/implant/biosig/activate(cause)
	if(!imp_in)
		return FALSE

	// Location.
	var/area/turf = get_area(imp_in)
	// Name of implant user.
	var/mobname = imp_in.name
	// What is to be said.
	var/message = "DEATH ALERT: [mobname]'s lifesig//N&#@$¤#§>..." // Default message for unexpected causes.
	if(cause == "death")
		message = "DEATH ALERT: [mobname]'s lifesigns ceased in [turf.name]! Please retrieve their corpse and revive them."


	name = "[mobname]'s Biosignaller"
	radio.talk_into(src, message, channel)

/obj/item/implant/biosig/proc/on_mob_death(mob/living/L, gibbed)
	if(gibbed)
		activate("gibbed") // Will use default message.
	else
		activate("death")

/obj/item/implant/biosig/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(on_mob_death))

/obj/item/implant/biosig/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_DEATH)

/obj/item/implant/biosig/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>Biosignaller Implant<BR>
		<b>Life:</b>Until death<BR>
		<b>Important Notes:</b>Broadcasts a message to radio listeners over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    <b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a blue, EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosig
	name = "implanter (biosignaller)"
	imp_type = /obj/item/implant/biosig

/obj/item/implantcase/biosig
	name = "Implant Case - 'Biosignaller'"
	desc = "A glass case containing a biosignaller implant."
	imp_type = /obj/item/implant/biosig
