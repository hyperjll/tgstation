/obj/item/computer_disk/security/full
	name = "security officer data disk"
	desc = "Removable disk used to download security-related tablet apps."
	icon_state = "datadisk9"
	starting_programs = list(
		/datum/computer_file/program/records/security,
		/datum/computer_file/program/crew_manifest,
		/datum/computer_file/program/secureye,
	)

/obj/item/computer_disk/security/secureye
	name = "secureye data disk"
	desc = "Removable disk used to download a camera-network program onto tablets in case of a network outage."
	icon_state = "datadisk9"
	starting_programs = list(
		/datum/computer_file/program/secureye,
	)
