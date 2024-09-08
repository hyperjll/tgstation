/obj/effect/mine/stun/heavy
	name = "sledgehammer stun mine"
	stun_time = 20 SECONDS

/obj/effect/mine/explosive/mothplushie
	name = "moth plushie"
	desc = "An adorable mothperson plushy. It's a huggable bug!"
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "moffplush"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/lizardplushie
	name = "lizard plushie"
	desc = "An adorable stuffed toy that resembles a lizardperson."
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "plushie_lizard"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/carpplushie
	name = "space carp plushie"
	desc = "An adorable stuffed toy that resembles a space carp."
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "carpplush"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/bubbleplush
	name = "\improper Bubblegum plushie"
	desc = "The friendly red demon that gives good miners gifts."
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "bubbleplush"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/plushvar
	name = "\improper Ratvar plushie"
	desc = "An adorable plushie of the clockwork justiciar himself with new and improved spring arm action."
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "plushvar"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/narplush
	name = "\improper Nar'sie plushie"
	desc = "A small stuffed doll of the elder goddess Nar'sie. Who thought this was a good children's toy?"
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "narplush"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/nukeplushie
	name = "operative plushie"
	desc = "A stuffed toy that resembles a syndicate nuclear operative. The tag claims operatives to be purely fictitious."
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "plushie_nuke"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/slimeplushie
	name = "slime plushie"
	desc = "An adorable stuffed toy that resembles a slime. It is practically just a hacky sack."
	icon = 'icons/obj/toys/plushes.dmi'
	icon_state = "plushie_slime"
	alpha = 255
	range_devastation = 0
	range_heavy = 0
	range_light = 4
	range_flash = 8

/obj/effect/mine/explosive/fakeian
	name = "Ian"
	desc = "It's the HoP's beloved corgi."
	icon = 'icons/mob/simple/pets.dmi'
	icon_state = "old_corgi"
	alpha = 255
	range_devastation = 2
	range_heavy = 4
	range_light = 8
	range_flash = 16

/obj/effect/mine/explosive/wetfloor
	name = "wet floor sign"
	desc = "Caution! Wet Floor!"
	icon = 'icons/obj/clothing/suits/utility.dmi'
	icon_state = "caution"
	alpha = 255
	range_devastation = 0
	range_heavy = 1
	range_light = 8
	range_flash = 12


/obj/effect/mine/radio
	name = "radio mine"
	desc = "It's a mime which transmits some kind of message over an encrypted radio channel when stepped on."
	alpha = 55
	var/obj/item/radio/radio
	var/encryptionkey = /obj/item/encryptionkey/headset_cent
	var/channel = RADIO_CHANNEL_CENTCOM
	mineusechance = 0

/obj/effect/mine/radio/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new encryptionkey // Should broadcast exclusively on the centcom channel.
	radio.listening = FALSE
	radio.recalculateChannels()

/obj/effect/mine/radio/Destroy()
	QDEL_NULL(radio)
	return ..()

/obj/effect/mine/radio/mineEffect(mob/victim)
	var/name = victim.mind ? victim.mind.name : victim.real_name
	var/area = get_area_name(get_turf(victim))

	// What is to be said.
	var/message = "[name] has triggered a radio mine at [area]."

	radio.talk_into(src, message, channel)
	return

/obj/effect/mine/radio/security
	name = "security radio mine"
	encryptionkey = /obj/item/encryptionkey/headset_sec // Security channel only?
	channel = RADIO_CHANNEL_SECURITY
