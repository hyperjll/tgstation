/obj/machinery/quantum_server/prisoner
	name = "torment nexus"
	desc = "The backbone of the Torment Nexus, purchased from a failed startup that wanted to revolutionize working remote, hastily repurposed for \
	re-educating crewmembers who can't stay within the lines at work via the latest and greatest in realistic working simulations."
	has_glitches = FALSE
	skip_requirements = TRUE
	bitrunning_network = BITRUNNER_DOMAIN_SECURITY
	bitrunning_id = BITRUNNER_DOMAIN_SECURITY
	broadcasting = TRUE // lets the Warden monitor them in their pod/lets the crew watch them work so they know punishment is real
	radio_channel_to_use = RADIO_CHANNEL_SECURITY
	circuit = /obj/item/circuitboard/machine/quantum_server/prisoner

/obj/machinery/quantum_server/prisoner/solo1
	name = "torment nexus #1"
	bitrunning_id = "solo_nexus_1"

/obj/machinery/quantum_server/prisoner/solo2
	name = "torment nexus #2"
	bitrunning_id = "solo_nexus_2"

/obj/machinery/quantum_server/prisoner/solo3
	name = "torment nexus #3"
	bitrunning_id = "solo_nexus_3"

/obj/machinery/quantum_server/prisoner/group
	name = "co-operative torment nexus"
	bitrunning_id = "coop_nexus"
