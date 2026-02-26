/**
 * # Grenade Compartment Component
 *
 * Contains a single grenade within the component, which can then be primed via signals.
 * Requires a BCI shell or a Circuit Implant.
 */

/obj/item/circuit_component/grenade_storage
	display_name = "Grenade Primer"
	desc = "A component that can store a single chemical grenade and prime them for detonation through circuit signals."
	category = "Entity"

	required_shells = list(/obj/item/organ/cyberimp/bci, /obj/item/implant)

	var/datum/port/input/prime
	var/datum/port/output/primed

	var/obj/item/shell_item

/obj/item/circuit_component/grenade_storage/Initialize(mapload)
	. = ..()
	create_storage(storage_type = /datum/storage/bci_gs)

/obj/item/circuit_component/grenade_storage/populate_ports()
	. = ..()
	prime = add_input_port("Prime", PORT_TYPE_SIGNAL, trigger = PROC_REF(trigger_grenade))
	primed = add_output_port("Primed", PORT_TYPE_SIGNAL)

/obj/item/circuit_component/grenade_storage/proc/get_mob()
	if(istype(shell_item, /obj/item/organ/cyberimp/bci))
		var/obj/item/organ/cyberimp/bci/shell_bci = shell_item
		return shell_bci.owner
	if(istype(shell_item, /obj/item/implant))
		var/obj/item/implant/shell_implant = shell_item
		return shell_implant.imp_in

/obj/item/circuit_component/grenade_storage/proc/trigger_grenade()
	CIRCUIT_TRIGGER
	var/mob/living/our_mob = get_mob()
	if(!istype(our_mob))
		return
	for(var/obj/item/grenade/stored_grenade in src.get_all_contents())
		if(!stored_grenade)
			return
		stored_grenade.arm_grenade(our_mob, msg = FALSE)
		primed.set_output(COMPONENT_SIGNAL)

/obj/item/circuit_component/grenade_storage/register_shell(atom/movable/shell)
	. = ..()
	if(is_type_in_list(shell, required_shells))
		shell_item = shell

/obj/item/circuit_component/grenade_storage/unregister_shell(atom/movable/shell)
	. = ..()
	shell_item = null
