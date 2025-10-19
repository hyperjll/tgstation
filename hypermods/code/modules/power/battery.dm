/obj/item/stock_parts/power_store/battery/emproof
	name = "\improper EMP-proof cell"
	desc = "An EMP-proof cell."
	icon = 'hypermods/icons/obj/machines/cell_charger.dmi'
	icon_state = "icellbig"
	maxcharge = STANDARD_CELL_CHARGE * 0.5

/obj/item/stock_parts/power_store/battery/emproof/Initialize(mapload)
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF)
	return ..()

/obj/item/stock_parts/power_store/battery/emproof/empty
	empty = TRUE

/obj/item/stock_parts/power_store/battery/emproof/corrupt()
	return
