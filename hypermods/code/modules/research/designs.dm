/obj/item/disk/design_disk/illegal_payloads
	name = "illegal payload design disk"

/obj/item/disk/design_disk/illegal_payloads/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/hepayload
	blueprints += new /datum/design/rdpayload
	blueprints += new /datum/design/emppayload

/**
/obj/item/disk/design_disk/
	name = " design disk"

/obj/item/disk/design_disk//Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/
	blueprints += new /datum/design/
**/
