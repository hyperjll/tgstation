/obj/item/storage/medkit/medical_variety_pack
	name = "\improper Medical Variety Pack"
	desc = "It's a bluespace medical kit, it's capable of holding far more medical supplies than normal."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_bluespace"

/obj/item/storage/medkit/medical_variety_pack/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	if(prob(50))
		new /obj/item/storage/medkit/fire(src)
	if(prob(50))
		new /obj/item/storage/medkit/toxin(src)
	if(prob(50))
		new /obj/item/storage/medkit/o2(src)
	if(prob(50))
		new /obj/item/storage/medkit/brute(src)
	if(prob(35))
		new /obj/item/storage/medkit/advanced(src)

/obj/item/storage/medkit/deluxe_medical_variety_pack
	name = "\improper Deluxe Medical Variety Pack"
	desc = "It's a bluespace medical kit, it's capable of holding far more medical supplies than normal."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_bluespace2"

/obj/item/storage/medkit/deluxe_medical_variety_pack/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/medkit/fire(src)
	new /obj/item/storage/medkit/toxin(src)
	new /obj/item/storage/medkit/o2(src)
	new /obj/item/storage/medkit/brute(src)
	if(prob(60))
		new /obj/item/storage/medkit/advanced(src)
	new /obj/item/reagent_containers/cup/bottle/omnizine(src)
	new /obj/item/storage/pill_bottle/iron(src)
	new /obj/item/storage/pill_bottle/mannitol(src)
	new /obj/item/storage/pill_bottle/mutadone(src)
	if(prob(60))
		new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	if(prob(60))
		new /obj/item/reagent_containers/hypospray/medipen/oxandrolone(src)
	if(prob(60))
		new /obj/item/reagent_containers/hypospray/medipen/salbutamol(src)
	if(prob(60))
		new /obj/item/reagent_containers/hypospray/medipen/atropine(src)
	new /obj/item/reagent_containers/hypospray/medipen/blood_loss(src)

/obj/item/storage/medkit/emergency/combatmedipens/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/hypospray/medipen/combatmedicine(src)

/obj/item/storage/medkit/medipenkit
	name = "\improper Medipen Kit"
	desc = "It's a medical kit designed to contain medipens of various kinds."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medipenkit"

/obj/item/storage/medkit/medipenkit/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/arithrazine(src)
	new /obj/item/reagent_containers/hypospray/medipen/hyronalin(src)
	new /obj/item/reagent_containers/hypospray/medipen/hyronalin(src)
	new /obj/item/reagent_containers/hypospray/medipen/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/medipen/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/medipen/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/dermaline(src)
	new /obj/item/reagent_containers/hypospray/medipen/dermaline(src)
	new /obj/item/reagent_containers/hypospray/medipen/dermaline(src)
	new /obj/item/reagent_containers/hypospray/medipen/oxandrolone(src)
	new /obj/item/reagent_containers/hypospray/medipen/penacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/penacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/salbutamol(src)
	new /obj/item/reagent_containers/hypospray/medipen/blood_loss(src)

/obj/item/storage/box/syndie_kit/syndiecigsdeluxepack/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/storage/fancy/cigarettes/cigpack_syndicate(src)
	new /obj/item/lighter(src)

/obj/item/storage/medkit/syndiecigsvarietypack
	name = "\improper Syndicate Variety Cigarettes"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "cigarettepacker"

/obj/item/storage/medkit/syndiecigsvarietypack/PopulateContents()
	new /obj/item/storage/fancy/cigarettes/robust_sal_acid(src)
	new /obj/item/storage/fancy/cigarettes/dromedary_oxandrolone(src)
	new /obj/item/storage/fancy/cigarettes/space_cigarette_pen_acid(src)
	new /obj/item/storage/fancy/cigarettes/uplift_salbutamol(src)

/obj/item/storage/medkit/syndiecigsvarietypackdeluxe
	name = "\improper Syndicate Variety Cigarettes Deluxe Edition"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "cigarettepacker2"

/obj/item/storage/medkit/syndiecigsvarietypackdeluxe/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 10

/obj/item/storage/medkit/syndiecigsvarietypackdeluxe/PopulateContents()
	new /obj/item/storage/fancy/cigarettes/deluxe_antibrute_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_antiburn_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_antioxygen_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_antitoxin_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_speedup_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_cureall_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_sensory_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_strange_cigarette_pack(src)
	new /obj/item/storage/fancy/cigarettes/deluxe_slimey_cigarette_pack(src)
	new /obj/item/lighter(src)

/obj/item/storage/medkit/mutatekit
	name = "medical aid kit" // Mutation Toxin Kit
	icon = 'icons/obj/storage/medkit.dmi'
	icon_state = "medkit"

/obj/item/storage/medkit/mutatekit/PopulateContents()
	new /obj/item/reagent_containers/syringe/mutatehuman(src)
	new /obj/item/reagent_containers/syringe/mutateslime(src)
	new /obj/item/reagent_containers/syringe/mutatefelinid(src)
	new /obj/item/reagent_containers/syringe/mutatelizard(src)
	new /obj/item/reagent_containers/syringe/mutatefly(src)
	new /obj/item/reagent_containers/syringe/mutatemoth(src)
	new /obj/item/reagent_containers/syringe/mutatepod(src)
	new /obj/item/reagent_containers/syringe/mutateandroid(src)

/obj/item/storage/medkit/hypospray
	name = "hypospray kit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "hypospraykit"

/obj/item/storage/medkit/hypospray/PopulateContents()
	new /obj/item/reagent_containers/cup/bottle/libital(src)
	new /obj/item/reagent_containers/cup/bottle/sal_acid(src)
	new /obj/item/reagent_containers/cup/bottle/aiuri(src)
	new /obj/item/reagent_containers/cup/bottle/oxandrolone(src)
	new /obj/item/reagent_containers/cup/bottle/syriniver(src)
	new /obj/item/reagent_containers/cup/bottle/coagulant(src)
	new /obj/item/reagent_containers/cup/bottle/omnizine(src)
	new /obj/item/reagent_containers/cup/bottle/atropine(src)
	new /obj/item/reagent_containers/cup/bottle/stimulants(src)

/obj/item/storage/medkit/emergency/hyperzine/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/hypospray/medipen/hyperzinemicro(src)
