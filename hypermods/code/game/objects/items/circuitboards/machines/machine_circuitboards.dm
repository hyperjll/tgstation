/obj/item/circuitboard/machine/pacman/super
	name = "SUPERPACMAN-type Generator"
	icon_state = "engineering"
	build_path = /obj/machinery/power/port_gen/pacman/super

/obj/item/circuitboard/machine/pacman/mrs
	name = "MRSPACMAN-type Generator"
	build_path = /obj/machinery/power/port_gen/pacman/mrs


/obj/item/circuitboard/machine/chem_dispenser/psych
	name = "Drug Dispenser"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/chem_dispenser/psych
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/servo = 1,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/power_store/cell = 1)
	def_components = list(/obj/item/stock_parts/power_store/cell = /obj/item/stock_parts/power_store/cell/high)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/power_exporter
	name = "Power Exporter"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/exporter
	req_components = list(
		/datum/stock_part/capacitor = 1)
	needs_anchored = FALSE


/obj/item/circuitboard/machine/rdserver/master
	name = "R&D Server"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/server // Haha, get trolled.
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/scanning_module = 1,
	)


/obj/item/circuitboard/machine/quantum_server/prisoner
	name = "Torment Nexus Server"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/quantum_server/prisoner

/obj/item/circuitboard/machine/netpod/prisoner
	name = "Torment Nexus Netpod"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/netpod/prisoner

/obj/item/circuitboard/computer/quantum_console/prisoner
	name = "Torment Nexus Console"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/quantum_console/prisoner
