/obj/item/flashlight/syndirig/glowstick
	name = "glowstick"
	desc = "A military-grade glowstick."
	custom_price = 10
	w_class = WEIGHT_CLASS_SMALL
	light_range = 4
	color = LIGHT_COLOR_GREEN
	icon_state = "glowstick"
	inhand_icon_state = "glowstick"
	grind_results = list(/datum/reagent/phenol = 15, /datum/reagent/hydrogen = 10, /datum/reagent/oxygen = 5, /datum/reagent/gunpowder = 20)
	var/fuel = 0

/obj/item/flashlight/syndirig/glowstick/Initialize(mapload)
	fuel = rand(100, 600)
	light_color = color

	. = ..()

/obj/item/flashlight/syndirig/glowstick/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/flashlight/syndirig/glowstick/process(delta_time)
	fuel = max(fuel -= delta_time, 0)
	if(fuel <=  0)
		turn_off()
		STOP_PROCESSING(SSobj, src)
		update_appearance(UPDATE_ICON)

/obj/item/flashlight/syndirig/glowstick/proc/turn_off()
	light_on = FALSE
	update_appearance(UPDATE_ICON)

/obj/item/flashlight/syndirig/glowstick/update_icon(updates=ALL)
	. = ..()
	if(fuel <= 0)
		set_light_on(FALSE)
	else if(light_on)
		set_light_on(TRUE)

/obj/item/flashlight/syndirig/glowstick/update_overlays()
	. = ..()
	if(light_on)
		var/mutable_appearance/glowstick_overlay = mutable_appearance(icon, "glowstick-glow")
		glowstick_overlay.color = color
		. += glowstick_overlay

/obj/item/flashlight/syndirig/glowstick/update_icon_state()
	. = ..()
	inhand_icon_state = "glowstick" //item state
	if(fuel <= 0)
		icon_state = "glowstick-empty"
	else if(light_on)
		inhand_icon_state = "glowstick-on" //item state
	else
		icon_state = "glowstick"

/obj/item/flashlight/syndirig/glowstick/attack_self(mob/user)
	if(fuel <= 0)
		to_chat(user, span_notice("[src] is spent."))
		return
	if(light_on)
		to_chat(user, span_notice("[src] is already lit."))
		return

	. = ..()
	if(.)
		user.visible_message(span_notice("[user] cracks and shakes [src]."), span_notice("You crack and shake [src], turning it on!"))
		START_PROCESSING(SSobj, src)

/obj/item/flashlight/syndirig/glowstick/suicide_act(mob/living/carbon/human/user)
	if(!fuel)
		user.visible_message(span_suicide("[user] is trying to squirt [src]'s fluids into [user.p_their()] eyes... but it's empty!"))
		return SHAME
	var/obj/item/organ/eyes/eyeballs = user.get_organ_slot(ORGAN_SLOT_EYES)
	if(!eyeballs)
		user.visible_message(span_suicide("[user] is trying to squirt [src]'s fluids into [user.p_their()] eyes... but [user.p_they()] don't have any!"))
		return SHAME
	user.visible_message(span_suicide("[user] is squirting [src]'s fluids into [user.p_their()] eyes! It looks like [user.p_theyre()] trying to commit suicide!"))
	fuel = 0
	return (FIRELOSS)

/obj/item/flashlight/syndirig/glowstick/turn_off()
	light_on = FALSE
	explosion(src, 0, 2, 3, 4)
	qdel(src)

/obj/item/flashlight/syndirig/glowstick/red
	name = "red glowstick"
	color = LIGHT_COLOR_INTENSE_RED

/obj/item/flashlight/syndirig/glowstick/blue
	name = "blue glowstick"
	color = LIGHT_COLOR_BLUE

/obj/item/flashlight/syndirig/glowstick/cyan
	name = "cyan glowstick"
	color = LIGHT_COLOR_CYAN

/obj/item/flashlight/syndirig/glowstick/orange
	name = "orange glowstick"
	color = LIGHT_COLOR_ORANGE

/obj/item/flashlight/syndirig/glowstick/yellow
	name = "yellow glowstick"
	color = LIGHT_COLOR_BRIGHT_YELLOW

/obj/item/flashlight/syndirig/glowstick/purple
	name = "purple glowstick"
	color = LIGHT_COLOR_PURPLE


/obj/item/flashlight/flare/lethal
	on_damage = 20

/obj/item/flashlight/flare/lethal/attack(mob/living/carbon/victim, mob/living/carbon/user)
	if(!isliving(victim))
		return ..()

	if(light_on)
		victim.adjust_fire_stacks(1)
		victim.ignite_mob()

	if(light_on && victim.ignite_mob())
		message_admins("[ADMIN_LOOKUPFLW(user)] set [key_name_admin(victim)] on fire with [src] at [AREACOORD(user)]")
		user.log_message("set [key_name(victim)] on fire with [src]", LOG_ATTACK)

	return ..()
