/obj/item/storage/medkit/emergency/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medbriefcase"
	inhand_icon_state = "medkit-emergency"

/obj/item/storage/medkit/emergency/alt/examine(mob/user)
	. = ..()
	. += "[src]'s 'manufactured date' is illegible."

/obj/item/storage/medkit/emergency/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/stack/medical/bruise_pack = 1,
		/obj/item/stack/medical/suture/emergency = 1,
		/obj/item/stack/medical/mesh = 1,
		/obj/item/stack/medical/ointment = 1,
		/obj/item/stack/medical/bloodpack = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
		/obj/item/healthanalyzer/simple = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/regular/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit"

/obj/item/storage/medkit/regular/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/stack/medical/suture = 1,
		/obj/item/stack/medical/mesh = 1,
		/obj/item/reagent_containers/hypospray/medipen = 2,
		/obj/item/reagent_containers/medigel/libital = 1,
		/obj/item/reagent_containers/medigel/aiuri = 1,
		/obj/item/storage/pill_bottle/multiver/less = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/fire/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_burn"
	inhand_icon_state = "medkit-ointment"

/obj/item/storage/medkit/fire/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/mender/burn = 1,
		/obj/item/stack/medical/mesh = 1,
		/obj/item/stack/medical/aloe = 1,
		/obj/item/reagent_containers/medigel/aiuri = 1,
		/obj/item/reagent_containers/medigel/silver_sulfadiazine = 1,
		/obj/item/reagent_containers/hypospray/medipen/kelotane = 1,
		/obj/item/reagent_containers/hypospray/medipen/dermaline = 1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/toxin/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_toxin"
	inhand_icon_state = "medkit-toxin"

/obj/item/storage/medkit/toxin/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/mender/toxin = 1,
		/obj/item/storage/pill_bottle/multiver/less = 1,
		/obj/item/reagent_containers/hypospray/medipen/dylovene = 2,
		/obj/item/reagent_containers/hypospray/medipen/hyronalin = 1,
		/obj/item/reagent_containers/hypospray/medipen/arithrazine = 1,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/o2/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_o2"
	inhand_icon_state = "medkit-o2"

/obj/item/storage/medkit/o2/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/mender/oxy = 1,
		/obj/item/storage/pill_bottle/dexalin = 1,
		/obj/item/reagent_containers/hypospray/medipen = 1,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 1,
		/obj/item/reagent_containers/pill/tranex = 2,
		/obj/item/storage/pill_bottle/coagulant = 1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/brute/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_brute"
	inhand_icon_state = "medkit-brute"

/obj/item/storage/medkit/brute/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/mender/brute = 1,
		/obj/item/stack/medical/bruise_pack = 1,
		/obj/item/stack/medical/suture = 1,
		/obj/item/storage/pill_bottle/painkillers = 1,
		/obj/item/reagent_containers/medigel/libital = 1,
		/obj/item/reagent_containers/medigel/styptic_powder = 1,
		/obj/item/reagent_containers/hypospray/medipen/bicaridine = 1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/advanced/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_advanced"
	inhand_icon_state = "medkit-advanced"

/obj/item/storage/medkit/advanced/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/mender/all = 1,
		/obj/item/stack/medical/suture/medicated = 1,
		/obj/item/stack/medical/mesh/advanced = 1,
		/obj/item/reagent_containers/medigel/synthflesh/big = 2,
		/obj/item/reagent_containers/hypospray/medipen/atropine = 1,
		/obj/item/storage/pill_bottle/penacid = 1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/coroner/alt
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "compact_coronerkit"
	inhand_icon_state = "coronerkit"

/obj/item/storage/medkit/coroner/alt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 1,
		/obj/item/bodybag = 1,
		/obj/item/surgical_drapes = 1,
		/obj/item/scalpel/cruel = 1,
		/obj/item/hemostat/cruel = 1,
		/obj/item/cautery/cruel = 1,
		/obj/item/retractor/cruel = 1,
		/obj/item/circular_saw = 1,
		/obj/item/organ/cyberimp/chest/reviver = 1,
	)
	generate_items_inside(items_inside,src)


/obj/item/storage/medkit/medical_variety_pack
	name = "\improper Medical Variety Pack"
	desc = "It's a bluespace medical kit, it's capable of holding far more medical supplies than normal."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_tactical"
	custom_price = PAYCHECK_COMMAND * 5
	custom_premium_price = PAYCHECK_COMMAND * 8

/obj/item/storage/medkit/medical_variety_pack/PopulateContents()
	if(prob(90))
		new /obj/item/storage/medkit/regular(src)
	else
		new /obj/item/storage/medkit/expanded/regular(src)
	if(prob(50))
		if(prob(90))
			new /obj/item/storage/medkit/fire(src)
		else
			new /obj/item/storage/medkit/expanded/fire(src)
	if(prob(50))
		if(prob(90))
			new /obj/item/storage/medkit/toxin(src)
		else
			new /obj/item/storage/medkit/expanded/toxin(src)
	if(prob(50))
		if(prob(90))
			new /obj/item/storage/medkit/o2(src)
		else
			new /obj/item/storage/medkit/expanded/o2(src)
	if(prob(50))
		if(prob(90))
			new /obj/item/storage/medkit/brute(src)
		else
			new /obj/item/storage/medkit/expanded/brute(src)
	if(prob(35))
		if(prob(90))
			new /obj/item/storage/medkit/advanced(src)
		else
			new /obj/item/storage/medkit/expanded/advanced(src)

/obj/item/storage/medkit/deluxe_medical_variety_pack
	name = "\improper Deluxe Medical Variety Pack"
	desc = "It's a bluespace medical kit, it's capable of holding far more medical supplies than normal."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_bluespace"
	custom_price = PAYCHECK_COMMAND * 15
	custom_premium_price = PAYCHECK_COMMAND * 20

/obj/item/storage/medkit/deluxe_medical_variety_pack/PopulateContents()
	if(prob(90))
		new /obj/item/storage/medkit/regular(src)
	else
		new /obj/item/storage/medkit/expanded/regular(src)
	if(prob(90))
		new /obj/item/storage/medkit/fire(src)
	else
		new /obj/item/storage/medkit/expanded/fire(src)
	if(prob(90))
		new /obj/item/storage/medkit/toxin(src)
	else
		new /obj/item/storage/medkit/expanded/toxin(src)
	if(prob(90))
		new /obj/item/storage/medkit/o2(src)
	else
		new /obj/item/storage/medkit/expanded/o2(src)
	if(prob(90))
		new /obj/item/storage/medkit/brute(src)
	else
		new /obj/item/storage/medkit/expanded/brute(src)
	if(prob(60))
		if(prob(90))
			new /obj/item/storage/medkit/advanced(src)
		else
			new /obj/item/storage/medkit/expanded/advanced(src)
	new /obj/item/reagent_containers/cup/bottle/omnizine(src)
	new /obj/item/storage/pill_bottle/iron(src)
	new /obj/item/storage/pill_bottle/mannitol(src)
	new /obj/item/storage/pill_bottle/mutadone(src)

/obj/item/storage/medkit/emergency/combatmedipens/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/hypospray/medipen/combatmedicine(src)

/obj/item/storage/medkit/medipenkit
	name = "\improper Medipen Kit"
	desc = "It's a medical kit designed to contain medipens of various kinds."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medipenkit"

/obj/item/storage/medkit/medipenkit/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/medipen/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/medipen/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/kelotane(src)
	new /obj/item/reagent_containers/hypospray/medipen/kelotane(src)
	new /obj/item/reagent_containers/hypospray/medipen/kelotane(src)
	new /obj/item/reagent_containers/hypospray/medipen/oxandrolone(src)
	new /obj/item/reagent_containers/hypospray/medipen/arithrazine(src)
	new /obj/item/reagent_containers/hypospray/medipen/hyronalin(src)
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


/obj/item/storage/medkit/expanded
	name = "\improper expanded medkit"
	desc = "It's an expanded medical kit, it's capable of holding far more medical supplies than normal."
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_bluespace"
	custom_price = PAYCHECK_COMMAND * 8
	custom_premium_price = PAYCHECK_COMMAND * 10

/obj/item/storage/medkit/expanded/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 14
	atom_storage.max_total_storage = 28

/obj/item/storage/medkit/expanded/regular
	name = "expanded medkit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_exp_regular"

/obj/item/storage/medkit/expanded/regular/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze = 1,
		/obj/item/stack/medical/bloodpack = 2,
		/obj/item/stack/medical/suture/medicated = 2,
		/obj/item/stack/medical/mesh/advanced = 2,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/stack/sticky_tape/surgical = 1,
		/obj/item/reagent_containers/hypospray/medipen = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 1,
		/obj/item/storage/pill_bottle/multiver/less = 1,
		/obj/item/storage/pill_bottle/painkillers = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/expanded/brute
	name = "expanded brute trauma treatment kit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_exp_brute"

/obj/item/storage/medkit/expanded/brute/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/libital = 3,
		/obj/item/reagent_containers/pill/patch/styptic_powder = 3,
		/obj/item/storage/pill_bottle/probital = 1,
		/obj/item/storage/pill_bottle/bicaridine = 1,
		/obj/item/storage/pill_bottle/bicartranex = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 2,
		/obj/item/reagent_containers/hypospray/medipen/bicaridine = 1,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 2,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/expanded/fire
	name = "expanded burn trauma treatment kit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_exp_burn"

/obj/item/storage/medkit/expanded/fire/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/aiuri = 3,
		/obj/item/reagent_containers/pill/patch/silver_sulfadiazine = 3,
		/obj/item/reagent_containers/spray/hercuri = 2,
		/obj/item/reagent_containers/hypospray/medipen/dermaline = 1,
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 2,
		/obj/item/storage/pill_bottle/kelotane = 1,
		/obj/item/storage/pill_bottle/dermaline = 1,
		/obj/item/reagent_containers/medigel/synthflesh/big = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/expanded/toxin
	name = "expanded toxin trauma treatment kit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_exp_toxin"

/obj/item/storage/medkit/expanded/toxin/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/storage/pill_bottle/multiver/less = 1,
		/obj/item/reagent_containers/pill/patch/ondansetron = 2,
		/obj/item/reagent_containers/syringe/syriniver = 2,
		/obj/item/reagent_containers/cup/bottle/syriniver = 1,
		/obj/item/reagent_containers/cup/bottle/calomel = 1,
		/obj/item/reagent_containers/cup/bottle/higadrite = 1,
		/obj/item/storage/pill_bottle/potassiodide = 1,
		/obj/item/storage/pill_bottle/mutadone = 1,
		/obj/item/storage/pill_bottle/antitoxin = 1,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 2,
		/obj/item/reagent_containers/cup/beaker/large/formaldehyde = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/expanded/o2
	name = "expanded oxygen deprivation treatment kit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_exp_o2"

/obj/item/storage/medkit/expanded/o2/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/hypospray/medipen = 3,
		/obj/item/reagent_containers/syringe/convermol = 3,
		/obj/item/reagent_containers/cup/bottle/convermol = 1,
		/obj/item/reagent_containers/cup/bottle/inaprovaline = 1,
		/obj/item/reagent_containers/cup/bottle/salbutamol = 1,
		/obj/item/reagent_containers/cup/bottle/diphenhydramine = 1,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 2,
		/obj/item/storage/pill_bottle/tranex = 1,
		/obj/item/storage/pill_bottle/dexalinplus = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/expanded/advanced
	name = "expanded advanced first aid kit"
	icon = 'hypermods/icons/obj/storage/medkit.dmi'
	icon_state = "medkit_exp_advanced"
	custom_price = PAYCHECK_COMMAND * 15
	custom_premium_price = PAYCHECK_COMMAND * 20

/obj/item/storage/medkit/expanded/advanced/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/medigel/synthflesh/big = 4,
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
		/obj/item/reagent_containers/hypospray/medipen/penthrite/better = 2,
		/obj/item/reagent_containers/cup/bottle/oculine = 1,
		/obj/item/reagent_containers/cup/bottle/inacusiate = 1,
		/obj/item/reagent_containers/cup/bottle/methamphetamine = 1,
		/obj/item/storage/pill_bottle/tricordrazine = 1,
		/obj/item/storage/pill_bottle/tranex = 1,
		/obj/item/storage/pill_bottle/penacid = 1
	)
	generate_items_inside(items_inside,src)
