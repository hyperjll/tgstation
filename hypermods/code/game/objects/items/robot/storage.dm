/obj/item/borg/apparatus/universal
	name = "universal apparatus"
	desc = "A unique apparatus for carrying pretty much anything."
	icon_state = "borg_stack_apparatus"
	storable = list(
		/obj/item,
	)

/obj/item/borg/apparatus/universal/Initialize(mapload)
	update_appearance()
	return ..()

/obj/item/borg/apparatus/universal/update_overlays()
	. = ..()
	var/mutable_appearance/arm = mutable_appearance(icon, "borg_stack_apparatus_arm1")
	if(stored)
		stored.pixel_x = 0
		stored.pixel_y = 0
		arm.icon_state = "borg_stack_apparatus_arm2"
		var/mutable_appearance/stored_copy = new /mutable_appearance(stored)
		var/underscore = findtext(stored_copy.icon_state, "_")
		if(underscore)
			stored_copy.icon_state = initial(stored.icon_state) //how we use the icon_state of single sheets, even with full stacks
		stored_copy.layer = FLOAT_LAYER
		stored_copy.plane = FLOAT_PLANE
		. += stored_copy
	. += arm

/obj/item/borg/apparatus/universal/examine()
	. = ..()
	if(stored)
		. += "The apparatus currently has [stored] secured."
	. += span_notice(" <i>Alt-click</i> will drop a selected amount of [stored] should it stack. ")
