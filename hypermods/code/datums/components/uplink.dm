/datum/component/uplink/nanotrasen
	name = "nanotrasen uplink"

/datum/component/uplink/nanotrasen/Initialize(
	owner,
	lockable = TRUE,
	enabled = FALSE,
	uplink_flag = UPLINK_NANOTRASEN,
	starting_tc = TELECRYSTALS_DEFAULT,
	has_progression = FALSE,
	datum/uplink_handler/uplink_handler_override,
)

	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, COMSIG_ATOM_ATTACKBY, PROC_REF(OnAttackBy))
	RegisterSignal(parent, COMSIG_ITEM_ATTACK_SELF, PROC_REF(interact))
	if(istype(parent, /obj/item/implant))
		RegisterSignal(parent, COMSIG_IMPLANT_ACTIVATED, PROC_REF(implant_activation))
		RegisterSignal(parent, COMSIG_IMPLANT_IMPLANTING, PROC_REF(implanting))
		RegisterSignal(parent, COMSIG_IMPLANT_OTHER, PROC_REF(old_implant))
		RegisterSignal(parent, COMSIG_IMPLANT_EXISTING_UPLINK, PROC_REF(new_implant))
	else if(istype(parent, /obj/item/modular_computer))
		RegisterSignal(parent, COMSIG_TABLET_CHANGE_ID, PROC_REF(new_ringtone))
		RegisterSignal(parent, COMSIG_TABLET_CHECK_DETONATE, PROC_REF(check_detonate))
	else if(istype(parent, /obj/item/radio))
		RegisterSignal(parent, COMSIG_RADIO_NEW_MESSAGE, PROC_REF(new_message))
	else if(istype(parent, /obj/item/pen))
		RegisterSignal(parent, COMSIG_PEN_ROTATED, PROC_REF(pen_rotation))
	else if(istype(parent, /obj/item/uplink/replacement))
		RegisterSignal(parent, COMSIG_MOVABLE_HEAR, PROC_REF(on_heard))

	if(owner)
		src.owner = owner
		LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
		if(GLOB.uplink_purchase_logs_by_key[owner])
			purchase_log = GLOB.uplink_purchase_logs_by_key[owner]
		else
			purchase_log = new(owner, src)
		RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	src.lockable = lockable
	src.active = enabled
	if(!uplink_handler_override)
		uplink_handler = new()
		uplink_handler.has_objectives = FALSE
		uplink_handler.uplink_flag = uplink_flag
		uplink_handler.telecrystals = starting_tc
		uplink_handler.has_progression = has_progression
		uplink_handler.purchase_log = purchase_log
	else
		uplink_handler = uplink_handler_override
	RegisterSignal(uplink_handler, COMSIG_UPLINK_HANDLER_ON_UPDATE, PROC_REF(handle_uplink_handler_update))
	RegisterSignal(uplink_handler, COMSIG_UPLINK_HANDLER_REPLACEMENT_ORDERED, PROC_REF(handle_uplink_replaced))
	if(!lockable)
		active = TRUE
		locked = FALSE

	previous_attempts = list()

/datum/component/uplink/nanotrasen/load_tc(mob/user, obj/item/stack/ore/bluespace_crystal/refined/nt/telecrystals, silent = FALSE)
	if(!silent)
		to_chat(user, span_notice("You slot [telecrystals] into [parent] and charge its internal uplink."))
	var/amt = telecrystals.amount
	uplink_handler.add_telecrystals(amt)
	telecrystals.use(amt)
	log_uplink("[key_name(user)] loaded [amt] telecrystals into [parent]'s uplink")
