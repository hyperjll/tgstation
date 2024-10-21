/obj/item/encryptionkey/universal
	name = "universal encryption key"
	icon = 'hypermods/icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "uni_cypherkey"
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_CENTCOM = 1, RADIO_CHANNEL_SYNDICATE = 1)
	special_channels = RADIO_SPECIAL_SYNDIE
	greyscale_config = null // This is the ONE key that has a unique design that doesn't use grayscale, sorry future coders.
	greyscale_colors = null // But, hey. You have access to sprites, maybe you'll change that.

/obj/item/encryptionkey/universal/Initialize(mapload) // This is to add the centcom channel, believe me, i tried other ways and this was all i could find to do this.
	special_channels |= RADIO_SPECIAL_CENTCOM
