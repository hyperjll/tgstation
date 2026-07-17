/**
 * Basically, the shielded component, but it's assigned to the actual thing, rather than an item granting a shield to something else.
 */

/datum/component/limited_shield
	dupe_mode = COMPONENT_DUPE_UNIQUE
	/// The person currently shielded by us
	var/mob/living/shielded_mob
	/// How many charges we can have max, and how many we start with
	var/max_charges
	/// How many charges we currently have
	var/current_charges
	/// How long we have to avoid being hit to replenish charges. If set to 0, we never recharge lost charges
	var/recharge_start_delay = 20 SECONDS
	/// Once we go unhit long enough to recharge, we replenish charges this often. The floor is effectively 1 second, AKA how often SSdcs processes
	var/charge_increment_delay = 1 SECONDS
	/// How many charges we recover on each charge increment
	var/charge_recovery = 1
	/// What .dmi we're pulling the shield icon from
	var/shield_icon_file = 'icons/effects/effects.dmi'
	/// What icon is used when someone has a functional shield up
	var/shield_icon = "shield-old"
	/// Do we still shield if we're being held in-hand? If FALSE, it needs to be equipped to a slot to work
	var/shield_inhand = FALSE
	/// Should the shield lose charges equal to the damage dealt by a hit?
	var/lose_multiple_charges = FALSE
	/// Should the shield's alpha change to show its remaining charge
	var/show_charge_as_alpha = FALSE
	/// The shield can block OVERWHELMING_ATTACK, which is mostly used by mech melee attacks.
	var/can_block_overwhelming = FALSE

	/// The cooldown tracking when we were last hit
	COOLDOWN_DECLARE(recently_hit_cd)
	/// The cooldown tracking when we last replenished a charge
	COOLDOWN_DECLARE(charge_add_cd)
	/// A callback for the sparks/message that play when a charge is used, see [/datum/component/shielded/proc/default_run_hit_callback]
	var/datum/callback/on_hit_effects

/datum/component/limited_shield/Initialize(max_charges = 3, recharge_start_delay = 20 SECONDS, charge_increment_delay = 1 SECONDS, charge_recovery = 1, lose_multiple_charges = FALSE, show_charge_as_alpha = FALSE, can_block_overwhelming = FALSE, starting_charges = null, shield_icon_file = 'icons/effects/effects.dmi', shield_icon = "shield-old", shield_inhand = FALSE, run_hit_callback)
	if(!ismob(parent) || max_charges <= 0)
		return COMPONENT_INCOMPATIBLE

	src.max_charges = max_charges
	src.recharge_start_delay = recharge_start_delay
	src.charge_increment_delay = charge_increment_delay
	src.charge_recovery = charge_recovery
	src.lose_multiple_charges = lose_multiple_charges
	src.show_charge_as_alpha = show_charge_as_alpha
	src.can_block_overwhelming = can_block_overwhelming
	src.shield_icon_file = shield_icon_file
	src.shield_icon = shield_icon
	src.shield_inhand = shield_inhand
	src.on_hit_effects = run_hit_callback || CALLBACK(src, PROC_REF(default_run_hit_callback))
	if(isnull(starting_charges))
		current_charges = max_charges
	else
		current_charges = starting_charges
	if(recharge_start_delay)
		START_PROCESSING(SSdcs, src)

/datum/component/limited_shield/Destroy(force)
	if(shielded_mob)
		shield_icon = "broken"
		UnregisterSignal(shielded_mob, COMSIG_ATOM_UPDATE_OVERLAYS)
		shielded_mob.update_appearance(UPDATE_ICON)
		shielded_mob = null
	on_hit_effects = null
	return ..()

/datum/component/limited_shield/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_HIT_REACT, PROC_REF(on_hit_react))
	var/atom/shield = parent
	if(ismob(shield))
		var/mob/holder = shield
		set_shielded_mob(holder)

/datum/component/limited_shield/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_ITEM_HIT_REACT))
	var/atom/shield = parent
	if(shield == shielded_mob)
		lost_shielded_mob(src, shielded_mob)

// Handle recharging, if we want to
/datum/component/limited_shield/process(seconds_per_tick)
	if(current_charges >= max_charges)
		STOP_PROCESSING(SSdcs, src)
		return

	if(!COOLDOWN_FINISHED(src, recently_hit_cd))
		return
	if(!COOLDOWN_FINISHED(src, charge_add_cd))
		return

	var/mob/mob_parent = parent
	COOLDOWN_START(src, charge_add_cd, charge_increment_delay)
	adjust_charge(charge_recovery) // set the number of charges to current + recovery per increment, clamped from zero to max_charges
	playsound(mob_parent, 'sound/effects/magic/charge.ogg', 50, TRUE)
	if(current_charges == max_charges)
		playsound(mob_parent, 'sound/machines/ding.ogg', 50, TRUE)

/datum/component/limited_shield/proc/adjust_charge(change)
	current_charges = clamp(current_charges + change, 0, max_charges)
	if(shielded_mob)
		shielded_mob.update_appearance(UPDATE_ICON)

/datum/component/limited_shield/proc/lost_shielded_mob(datum/source, mob/user)
	SIGNAL_HANDLER

	if(shielded_mob)
		UnregisterSignal(shielded_mob, list(COMSIG_ATOM_UPDATE_OVERLAYS, COMSIG_QDELETING))
		shielded_mob.update_appearance(UPDATE_ICON)
		shielded_mob = null

/datum/component/limited_shield/proc/set_shielded_mob(mob/user)
	if(shielded_mob == user)
		return
	if(!isnull(shielded_mob))
		CRASH("[type] called set_shielded_mob with [user] but [shielded_mob] was already the shielded_mob!")

	shielded_mob = user
	RegisterSignal(shielded_mob, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(on_update_overlays))
	RegisterSignal(shielded_mob, COMSIG_QDELETING, PROC_REF(lost_shielded_mob))
	if(current_charges)
		shielded_mob.update_appearance(UPDATE_ICON)

/// Used to draw the shield overlay on the shielded_mob
/datum/component/limited_shield/proc/on_update_overlays(atom/parent_atom, list/overlays)
	SIGNAL_HANDLER

	var/mutable_appearance/shield_appearance = mutable_appearance(shield_icon_file, (current_charges > 0 ? shield_icon : "broken"), MOB_SHIELD_LAYER)
	if(show_charge_as_alpha)
		shield_appearance.alpha = (current_charges/max_charges)*255
	overlays += shield_appearance

/**
 * This proc fires when we're hit, and is responsible for checking if we're charged, then deducting one + returning that we're blocking if so.
 * It then runs the callback in [/datum/component/shielded/var/on_hit_effects] which handles the messages/sparks (so the visuals)
 */
/datum/component/limited_shield/proc/on_hit_react(datum/source, mob/living/carbon/human/owner, atom/movable/hitby, attack_text, final_block_chance, damage, attack_type, damage_type)
	SIGNAL_HANDLER

	COOLDOWN_START(src, recently_hit_cd, recharge_start_delay)

	//No owner? No block.
	if(isnull(owner))
		return

	//if our shielded_mob isn't the owner of the block, don't block
	if(owner != shielded_mob)
		return

	if(current_charges <= 0)
		return

	// if our shield is unable to block OVERWHELMING_ATTACK type attacks, we just let it pass.
	if(attack_type == OVERWHELMING_ATTACK && !can_block_overwhelming)
		return

	. = COMPONENT_HIT_REACTION_BLOCK

	var/charge_loss = 1 // how many charges do we lose

	if(lose_multiple_charges) // if the shield has health like damage we'll lose charges equal to the damage of the hit
		charge_loss = damage

	else if(damage < 3)
		charge_loss = 0

	else if(attack_type == OVERWHELMING_ATTACK && !lose_multiple_charges) // Always expend all charges when blocking an overwhelming attack unless we're using our shield like health.
		charge_loss = max_charges

	adjust_charge(-charge_loss)

	INVOKE_ASYNC(src, PROC_REF(actually_run_hit_callback), owner, attack_text, current_charges)

	if(!recharge_start_delay) // if recharge_start_delay is 0, we don't recharge
		return

	START_PROCESSING(SSdcs, src) // if we DO recharge, start processing so we can do that

/// The wrapper to invoke the on_hit callback, so we don't have to worry about blocking in the signal handler
/datum/component/limited_shield/proc/actually_run_hit_callback(mob/living/owner, attack_text, current_charges)
	on_hit_effects.Invoke(owner, attack_text, current_charges)

/// Default on_hit proc, since cult robes are stupid and have different descriptions/sparks
/datum/component/limited_shield/proc/default_run_hit_callback(mob/living/owner, attack_text, current_charges)
	do_sparks(2, TRUE, owner)
	owner.visible_message(span_danger("[owner]'s shields deflect [attack_text] in a shower of sparks!"))
	if(current_charges <= 0)
		owner.visible_message(span_warning("[owner]'s shield overloads!"))
