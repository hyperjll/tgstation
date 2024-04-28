/obj/item/stock_parts/cell/selfcharge
	name = "self-charging power cell"
	var/self_recharge = TRUE
	var/replenish_amt = STANDARD_CELL_RATE * 0.125
	var/replenish_rate = 10 SECONDS

/obj/item/stock_parts/cell/selfcharge/Initialize(mapload, override_maxcharge)
	. = ..()
	START_PROCESSING(SSobj, src)
	create_reagents(5, INJECTABLE | DRAINABLE)
	if (override_maxcharge)
		maxcharge = override_maxcharge
	rating = max(round(maxcharge / (STANDARD_CELL_CHARGE * 10), 1), 1)
	if(!charge)
		charge = maxcharge
	if(empty)
		charge = 0
	if(ratingdesc)
		desc += " This one has a rating of [display_energy(maxcharge)][prob(10) ? ", and you should not swallow it" : ""]." //joke works better if it's not on every cell
	update_appearance()

/obj/item/stock_parts/cell/selfcharge/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/stock_parts/cell/selfcharge/process(delta_time)
	sleep(replenish_rate)
	if(self_recharge)
		give(replenish_amt)
	else
		return PROCESS_KILL


/obj/item/stock_parts/cell/selfcharge/high
	name = "self-charging high-capacity power cell"
	icon_state = "hcell"
	maxcharge = STANDARD_CELL_CHARGE * 10
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.6)
	chargerate = STANDARD_CELL_RATE * 0.75

/obj/item/stock_parts/cell/selfcharge/high/empty
	empty = TRUE

/obj/item/stock_parts/cell/selfcharge/super
	name = "self-charging super-capacity power cell"
	icon_state = "scell"
	maxcharge = STANDARD_CELL_CHARGE * 20
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT * 3)
	chargerate = STANDARD_CELL_RATE

/obj/item/stock_parts/cell/selfcharge/super/empty
	empty = TRUE

/obj/item/stock_parts/cell/selfcharge/hyper
	name = "self-charging hyper-capacity power cell"
	icon_state = "hpcell"
	maxcharge = STANDARD_CELL_CHARGE * 30
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT * 4)
	chargerate = STANDARD_CELL_RATE * 1.5

/obj/item/stock_parts/cell/selfcharge/hyper/empty
	empty = TRUE

/obj/item/stock_parts/cell/selfcharge/bluespace
	name = "self-charging bluespace power cell"
	desc = "A rechargeable transdimensional power cell."
	icon_state = "bscell"
	maxcharge = STANDARD_CELL_CHARGE * 40
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*6)
	chargerate = STANDARD_CELL_RATE * 2

/obj/item/stock_parts/cell/selfcharge/bluespace/empty
	empty = TRUE
