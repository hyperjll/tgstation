/obj/projectile/energy/teleport
	name = "teleport blast"
	icon_state = "bluelaser"
	damage = 0
	var/target = null
	var/failchance = 5

/obj/projectile/energy/teleport/on_hit(atom/target, mob/user, blocked, pierce_hit)
	if(!target)
		return

	if(!can_teleport_notifies(target))
		return

	if((blocked != 100) && iscarbon(target))
		if(!target || prob(failchance)) //Just like portals!
			do_teleport(target, locate(rand(5, world.maxx - 5), rand(5, world.maxy -5), 3), 0)
		else
			var/turf/destination = get_turf(src.target) // Beacons and tracking implant might have been moved.
			if (destination)
				do_teleport(target, destination, 1) ///You will appear adjacent to the beacon
			else
				return

/obj/projectile/energy/teleport/proc/can_teleport_notifies(mob/user)
	var/turf/current_location = get_turf(user)
	var/area/current_area = current_location.loc
	if (!current_location || (current_area.area_flags & NOTELEPORT) || is_away_level(current_location.z) || !isturf(user.loc))
		to_chat(user, span_notice("The energy beam hits you, but nothing happens!"))
		return FALSE

	return TRUE
