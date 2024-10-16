/obj/item/storage/box/firingpins/dna_noremove
	name = "box of dna firing pins"
	desc = "A box full of dna firing pins, to allow newly-developed firearms to operate while maintaing private ownership. The pins inside cannot be removed."
	illustration = "firingpin"

/obj/item/storage/box/firingpins/dna_noremove/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/dna/noremove(src)

/obj/item/storage/box/firingpins/traitor_noremove
	name = "box of syndicate firing pins"
	desc = "A box full of syndicate firing pins, they check for a certain implant before firing. These pins cannot be removed."
	illustration = "firingpin"

/obj/item/storage/box/firingpins/traitor_noremove/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/implant/pindicate/noremove(src)

/obj/item/storage/box/firingpins/paywall/noremove
	name = "box of paywall firing pins"
	desc = "A box full of paywall firing pins, to allow newly-developed firearms to operate behind a custom-set paywall. These pins cannot be removed."
	illustration = "firingpin"

/obj/item/storage/box/firingpins/paywall/noremove/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/paywall/noremove(src)
