#define PCANNON_FIREALL 1
#define PCANNON_FILO 2
#define PCANNON_FIFO 3
///Defines for the pressure strength of the cannon
#define LOW_PRESSURE 1
#define MID_PRESSURE 2
#define HIGH_PRESSURE 3

/obj/item/pneumatic_cannon/paperplane
	name = "flaming paper plane dispenser"
	desc = "A small, easily concealable toy cannon. It fires paper, and lights it."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "paper_rifle"
	force = 10
	gasPerThrow = 0
	checktank = FALSE
	range_multiplier = 3
	fire_mode = PCANNON_FIFO
	throw_amount = 1
	maxWeightClass = 30 // 30 planes
	needs_air = FALSE
	clumsyCheck = FALSE
	var/static/list/ammo_typecache = typecacheof(/obj/item/paperplane/syndicate/mod)

/obj/item/pneumatic_cannon/paperplane/throw_item(turf/target, atom/movable/AM, mob/user)
	if(!istype(AM))
		return FALSE
	loadedItems -= AM
	if(isitem(AM))
		var/obj/item/I = AM
		loadedWeightClass -= I.w_class
	else
		loadedWeightClass--
	AM.forceMove(get_turf(src))
	AM.throw_at(target, pressure_setting * 10 * range_multiplier, pressure_setting * 2, user, spin_item)
	AM.fire_act(1000, 100)
	return TRUE

/obj/item/pneumatic_cannon/paperplane/Initialize(mapload)
	. = ..()
	allowed_typecache = ammo_typecache

/obj/item/pneumatic_cannon/paperplane/selfcharge
	automatic = TRUE
	selfcharge = TRUE
	charge_type = /obj/item/paperplane/syndicate/mod
	maxWeightClass = 10 // 10 planes

/obj/item/paperplane/syndicate/mod
	desc = "Paper, masterfully folded in the shape of a plane."
	throwforce = 8
	hit_probability = 20

#undef PCANNON_FIREALL
#undef PCANNON_FILO
#undef PCANNON_FIFO
#undef LOW_PRESSURE
#undef MID_PRESSURE
#undef HIGH_PRESSURE
