/obj/machinery/bluespace_wave
	name = "bluespace wave generator"
	desc = "An almost insidious generator producing a low humming noise and various sparks of electricity."
	icon = 'icons/obj/machines/shield_generator.dmi'
	icon_state = "shield_wall_gen_on"
	// Current time
	var/charge_amt = 0
	// Max time before teleports
	var/charge_max = 180

/obj/machinery/bluespace_wave/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/machinery/bluespace_wave/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/machinery/bluespace_wave/process(delta_time)
	charge_amt++
	if(charge_amt >= charge_max)
		warp_everyone()

/obj/machinery/bluespace_wave/proc/warp_everyone(mob/user)
	charge_amt = 0
	for(var/mob/living/carbon/C in range(30, get_turf(src)))
		do_teleport(C, get_turf(src), 30, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE)
