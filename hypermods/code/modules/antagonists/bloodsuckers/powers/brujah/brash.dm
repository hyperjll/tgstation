/************************************************************************/
/*								BRASH									*/
/************************************************************************/

/// A Brujah exclusive ability that acts as an enhanced version of "Brawn"
/// 'bloodcost' and 'cooldown_time' vary depending on what the power is used for.
/// Lots of code has been copied over from Brawn wherever inheritance might prove insufficient.
/// Comments from copied code have been removed (they can still be found in their original location.)

/datum/action/cooldown/bloodsucker/targeted/brawn/brash
	name = "Brash"
	desc = "Break most structures apart with overwhelming force. Cooldown and cost vary depending on the object broken."
	button_icon_state = "power_strength_brujah"
	power_explanation = "Brash:\n\
		This is an enhanced version of a regular (non-Brujah) vampire's \"Brawn\" ability.\n\
		Use on a person to send them flying. Use while restrained, grabbed, or trapped in a locker to break free.\n\
		Punching a cyborg will temporarily disable it in addition to usual damage. \n\
		At level 2 this ability will allow you to break through unbolted airlocks. \n\
		At level 3 this ability will allow you to break through bolted airlocks. \n\
		At level 4 this ability will allow you to break through normal walls and windows. \n\
		At level 5 this ability will allow you to break through reinforced walls and windows. \n\
		Higher levels will increase this ability's damage and knockdown."
	purchase_flags = BRUJAH_DEFAULT_POWER
	power_flags = BP_AM_VERY_DYNAMIC_COOLDOWN
	bloodcost = null		  // Set on use
	cooldown_time = 1 SECONDS // Same as above
	damage_coefficient = 1.625

/datum/action/cooldown/bloodsucker/targeted/brawn/brash/ActivatePower(trigger_flags)
	if(break_restraints())
		cooldown_time = 5 SECONDS
		bloodcost = 10
		power_activated_sucessfully()
		return FALSE
	if(level_current >= 1 && escape_puller())
		cooldown_time = 7.5 SECONDS
		bloodcost = 20
		power_activated_sucessfully()
		return FALSE
	return ..()

/// Hit an atom, set bloodcost, set cooldown time, play a sound, and deconstruct the atom
/// with this one convenient proc!
/datum/action/cooldown/bloodsucker/targeted/brawn/brash/proc/HitWithStyle(atom/target_atom, sound, vol as num, var/cost as num, var/cooldown)
	if(!isobj(target_atom))
		return
	var/obj/target_obj = target_atom
	owner.do_attack_animation(target_obj)
	bloodcost = cost
	cooldown_time = cooldown
	playsound(target_atom, sound, 75, TRUE)
	target_obj.deconstruct(FALSE)

/datum/action/cooldown/bloodsucker/targeted/brawn/brash/FireTargetedPower(atom/target_atom)
	. = ..()
	if(isliving(target_atom))
		bloodcost = 25
		cooldown_time = 10 SECONDS
		return

	if(iscloset(target_atom))
		bloodcost = 8
		cooldown_time = 7 SECONDS
		return

	if(isgirder(target_atom))
		var/obj/structure/girder/target_girder = target_atom
		HitWithStyle(target_girder, 'sound/effects/bang.ogg', 60, 10, 5 SECONDS)
		return

	if(isgrillie(target_atom))
		var/obj/structure/grille/target_grillie = target_atom
		HitWithStyle(target_grillie, 'sound/effects/grillehit.ogg', 50, 1, 0.5 SECONDS)
		return

	if(iswindow(target_atom) && level_current < 4)
		var/obj/structure/window/window = target_atom
		HitWithStyle(window, 'sound/effects/bang.ogg', 20, 15, 10 SECONDS)
		return
	else
		var/obj/structure/window/window = target_atom
		window.balloon_alert(owner, "you need more ranks!")
		return

	if(istable(target_atom))
		var/obj/structure/table/target_table = target_atom
		HitWithStyle(target_table, 'sound/effects/bang.ogg', 35, 10, 5 SECONDS)

	if(!iswallturf(target_atom))
		return
	if(level_current < 5)
		target_atom.balloon_alert(owner, "you need more ranks!")
		return
	if(isindestructiblewall(target_atom))
		target_atom.balloon_alert(owner, "this wall is indestructible!")
		return

	/// If we get past all of the if statements then it's almost certainly a wall at this point.
	rip_and_tear(owner, target_atom)

/// Copied over from '/datum/element/wall_tearer/proc/rip_and_tear' with appropriate adjustment.
/datum/action/cooldown/bloodsucker/targeted/brawn/brash/proc/rip_and_tear(mob/living/tearer, atom/target)
	var/tear_time = 0.75 SECONDS
	var/reinforced_multiplier = 5
	var/rip_time = (tear_time * reinforced_multiplier)

	var/turf/closed/wall/target_wall = target

	if(isreinforcedwallturf(target_wall))
		bloodcost = 40
		cooldown_time = 20 SECONDS
	else
		bloodcost = 20
		cooldown_time = 15 SECONDS

	while(iswallturf(target_wall))
		tearer.visible_message(span_warning("[tearer] viciously rips into [target_wall]!"))
		playsound(tearer, 'sound/machines/airlock/airlock_alien_prying.ogg', vol = 50, vary = TRUE, frequency = 2)
		target_wall.balloon_alert(tearer, "tearing...")

		if (!do_after(tearer, delay = rip_time, target = target_wall, interaction_key = "bloodsucker interaction"))
			tearer.balloon_alert(tearer, "interrupted!")
			return

		tearer.do_attack_animation(target_wall)
		target.AddComponent(/datum/component/torn_wall)
		tearer.UnarmedAttack(target_wall, proximity_flag = TRUE)

/// TODO: check if switch statements work with istype()
/// and maybe refactor 'CheckValidTarget()'/'CheckCanTarget()' entirely
/datum/action/cooldown/bloodsucker/targeted/brawn/brash/CheckValidTarget(atom/A)
	if(A == owner)
		return FALSE
	if(INDESTRUCTIBLE in A.resistance_flags)
		return FALSE
	if(isliving(A))
		return TRUE
	if(isdoor(A))
		return TRUE
	if(istable(A) || istableframe(A))
		return TRUE
	if(iscloset(A))
		return TRUE
	if(isgirder(A))
		return TRUE
	if(isgrillie(A))
		return TRUE
	if(((iswallturf(A) && !isindestructiblewall(A))) || iswindow(A))
		return TRUE
	return FALSE
