/obj/item/disk/design_disk/illegal_payloads
	name = "illegal payload design disk"

/obj/item/disk/design_disk/illegal_payloads/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/hepayload
	blueprints += new /datum/design/rdpayload
	blueprints += new /datum/design/emppayload

/obj/item/disk/design_disk/illegal_9mm
	name = "illegal 9mm ammo design disk"

/obj/item/disk/design_disk/illegal_9mm/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/m9mm_mag
	blueprints += new /datum/design/m9mm_mag_ap
	blueprints += new /datum/design/m9mm_mag_hp
	blueprints += new /datum/design/m9mm_mag_inc
	blueprints += new /datum/design/m9mm_mag_emp
	blueprints += new /datum/design/m9mm_mag_sp
	blueprints += new /datum/design/m9mm_mag_cryo
	blueprints += new /datum/design/m9mm_mag_richochet
	blueprints += new /datum/design/m9mm_mag_bomb
	blueprints += new /datum/design/m9mm_mag_sonic
	blueprints += new /datum/design/m9mm_mag_mutate

/obj/item/disk/design_disk/illegal_45
	name = "illegal .45 ammo design disk"

/obj/item/disk/design_disk/illegal_45/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/m45_mag
	blueprints += new /datum/design/m45_mag_ap
	blueprints += new /datum/design/m45_mag_hp
	blueprints += new /datum/design/m45_mag_inc
	blueprints += new /datum/design/m45_mag_emp
	blueprints += new /datum/design/m45_mag_sp
	blueprints += new /datum/design/m45_mag_venom
	blueprints += new /datum/design/m45_mag_pacify
	blueprints += new /datum/design/m45_mag_delay
	blueprints += new /datum/design/m45_mag_tranq

/obj/item/disk/design_disk/illegal_10mm
	name = "illegal 10mm ammo design disk"

/obj/item/disk/design_disk/illegal_10mm/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/m10mm_mag
	blueprints += new /datum/design/m10mm_mag_ap
	blueprints += new /datum/design/m10mm_mag_hp
	blueprints += new /datum/design/m10mm_mag_inc
	blueprints += new /datum/design/m10mm_mag_emp
	blueprints += new /datum/design/m10mm_mag_sp
	blueprints += new /datum/design/m10mm_mag_bleed
	blueprints += new /datum/design/m10mm_mag_rad
	blueprints += new /datum/design/m10mm_mag_frag

/obj/item/disk/design_disk/illegal_357
	name = "illegal .357 ammo design disk"

/obj/item/disk/design_disk/illegal_357/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/c357_sl
	blueprints += new /datum/design/c357_sl_if
	blueprints += new /datum/design/c357_sl_nc
	blueprints += new /datum/design/c357_sl_ms
	blueprints += new /datum/design/c357_sl_hp
	blueprints += new /datum/design/c357_sl_ws
	blueprints += new /datum/design/c357_sl_bounce
	blueprints += new /datum/design/c357_sl_dum
	blueprints += new /datum/design/c357_sl_trac
	blueprints += new /datum/design/c357_sl_hot
	blueprints += new /datum/design/c357_sl_ice

/obj/item/disk/design_disk/illegal_50
	name = "illegal .50 ammo design disk"

/obj/item/disk/design_disk/illegal_50/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/m50_mag
	blueprints += new /datum/design/m50_mag_ap
	blueprints += new /datum/design/m50_mag_hp
	blueprints += new /datum/design/m50_mag_inc
	blueprints += new /datum/design/m50_mag_emp
	blueprints += new /datum/design/m50_mag_hi
	blueprints += new /datum/design/m50_mag_demo
	blueprints += new /datum/design/m50_mag_rod
	blueprints += new /datum/design/m50_mag_bomb
	blueprints += new /datum/design/m50_mag_rep


/**
/obj/item/disk/design_disk/
	name = " design disk"

/obj/item/disk/design_disk//Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/
	blueprints += new /datum/design/
**/
