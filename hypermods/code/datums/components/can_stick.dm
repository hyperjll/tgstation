/datum/component/can_stick
	/// Reference to our "sticky" atom.
	var/atom/movable/our_stickable

/datum/component/can_stick/Initialize()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	our_stickable = parent

/datum/component/can_stick/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_PRE_ATTACK, PROC_REF(attempt_to_stick))

/datum/component/can_stick/proc/attempt_to_stick(datum/source, atom/target, mob/user, list/modifiers)
	SIGNAL_HANDLER

	if(ismob(target))
		return NONE

	var/px = text2num(LAZYACCESS(modifiers, ICON_X))
	var/py = text2num(LAZYACCESS(modifiers, ICON_Y))

	if(isnull(px) || isnull(py))
		return NONE

	user.do_attack_animation(target, used_item = our_stickable)
	target.AddComponent(/datum/component/sticker, our_stickable, get_dir(target, our_stickable), px, py)
	return ITEM_INTERACT_SUCCESS
