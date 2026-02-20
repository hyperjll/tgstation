/datum/design/board/sleeper
	name = "Sleeper Board"
	desc = "The circuit board for a sleeper."
	id = "sleeper"
	build_path = /obj/item/circuitboard/machine/sleeper
	category = list(
		RND_CATEGORY_MACHINE
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/board/experimental_cloner
	name = "Experimental Cloner Board"
	desc = "The circuit board for a cloning machine."
	id = "experimental_cloner"
	build_path = /obj/item/circuitboard/machine/experimental_cloner
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/board/experimental_cloner_scanner
	name = "Cloner Scanner Board"
	desc = "The circuit board for a cloning machine scanner."
	id = "experimental_cloner_scanner"
	build_path = /obj/item/circuitboard/machine/experimental_cloner_scanner
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL


/datum/design/board/byteforge_sec
	name = "Byteforge Board"
	desc = "Allows for the construction of circuit boards used to build a Byteforge."
	id = "byteforge_sec"
	build_path = /obj/item/circuitboard/machine/byteforge
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_MACHINE_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/board/tn_netpod
	name = "Torment Nexus Netpod Board"
	desc = "The circuit board for a netpod used in Torment Nexus systems."
	id = "tn_netpod"
	build_path = /obj/item/circuitboard/machine/netpod/prisoner
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/board/tn_quantum_server
	name = "Torment Nexus Server Board"
	desc = "A machine board required to make a Torment Nexus Server, a critical machine for any Torment Nexus setup."
	id = "tn_quantum_server"
	build_path = /obj/item/circuitboard/machine/quantum_server/prisoner
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/board/tn_quantum_console
	name = "Torment Nexus Console Board"
	desc = "Allows for the construction of circuit boards used to build a Torment Nexus Console."
	id = "tn_quantum_console"
	build_path = /obj/item/circuitboard/computer/quantum_console/prisoner
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_MACHINE_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
