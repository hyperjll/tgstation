/**
 * Callback for the effect remover component to handle neutralizing heretic influences.
 */
/obj/item/anomaly_neutralizer/proc/on_influence_neutralized(obj/effect/anomaly/target, mob/living/user)
	var/obj/machinery/announcement_system/announcement_system = get_announcement_system()
	if (!isnull(announcement_system))
		announcement_system.broadcast("Your department has gained a lump sum of research points for the neutralization of an REDACTED anomaly.", list(RADIO_CHANNEL_SCIENCE), TRUE)
	var/datum/techweb/station_techweb = locate(/datum/techweb/science) in SSresearch.techwebs
	if(station_techweb)
		station_techweb.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = 40))

	on_use(target, user)
