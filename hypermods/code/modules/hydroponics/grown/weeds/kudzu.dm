// A very special plant, deserving its own file.

/obj/item/seeds/tendons
	name = "tendons seed pack"
	desc = "These seeds grow into a mass of flesh and blood."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-tendons"
	plant_icon_offset = 2
	species = "tendons"
	plantname = "Tendons"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing.dmi'
	icon_harvest = "tendons-harvest"
	icon_grow = "tendons-grow"
	icon_dead = "tendons-dead"
	product = /obj/item/food/grown/tendons
	genes = list(/datum/plant_gene/trait/plant_type/weed_hardy)
	lifespan = 20
	endurance = 10
	yield = 4
	instability = 0
	growthstages = 4
	rarity = 30
	var/list/mutations = list()
	reagents_add = list(/datum/reagent/medicine/c2/synthflesh = 0.1, /datum/reagent/consumable/nutriment = 0.02)
	graft_gene = /datum/plant_gene/trait/plant_type/weed_hardy

/obj/item/seeds/tendons/Copy()
	var/obj/item/seeds/tendons/S = ..()
	S.mutations = mutations.Copy()
	return S

/obj/item/seeds/tendons/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] swallows the pack of kudzu seeds! It looks like [user.p_theyre()] trying to commit suicide!"))
	plant(user)
	return BRUTELOSS

/obj/item/seeds/tendons/proc/plant(mob/user)
	if(isspaceturf(user.loc))
		return
	if(!isturf(user.loc))
		to_chat(user, span_warning("You need more space to plant [src]."))
		return FALSE
	if(locate(/obj/structure/spacetendons) in user.loc)
		to_chat(user, span_warning("There is too much tendons here to plant [src]."))
		return FALSE
	to_chat(user, span_notice("You plant [src]."))
	message_admins("Tendons planted by [ADMIN_LOOKUPFLW(user)] at [ADMIN_VERBOSEJMP(user)]")
	investigate_log("was planted by [key_name(user)] at [AREACOORD(user)]", INVESTIGATE_BOTANY)
	new /datum/spacetendons_controller(get_turf(user), mutations, potency, production)
	qdel(src)

/obj/item/seeds/tendons/attack_self(mob/user)
	user.visible_message(span_danger("[user] begins throwing seeds on the ground..."))
	if(do_after(user, 5 SECONDS, target = user.drop_location(), progress = TRUE))
		plant(user)
		to_chat(user, span_notice("You plant the kudzu. You monster."))

/obj/item/seeds/tendons/get_unique_analyzer_text()
	var/kudzu_mutations = ""
	var/output_message = ""
	for(var/datum/spacetendon_mutation/SM in mutations)
		kudzu_mutations += "[(kudzu_mutations == "") ? "" : ", "][SM.name]"
	output_message += "Plant Mutations: [(kudzu_mutations == "") ? "None." : "[kudzu_mutations]."]"
	return output_message

/obj/item/seeds/tendons/on_chem_reaction(datum/reagents/reagents)
	var/list/temp_mut_list = list()

	if(reagents.has_reagent(/datum/reagent/space_cleaner/sterilizine, 5))
		for(var/datum/spacetendon_mutation/SM in mutations)
			if(SM.quality == NEGATIVE)
				temp_mut_list += SM
		if(prob(20) && temp_mut_list.len)
			mutations.Remove(pick(temp_mut_list))
		temp_mut_list.Cut()

	if(reagents.has_reagent(/datum/reagent/fuel, 5))
		for(var/datum/spacetendon_mutation/SM in mutations)
			if(SM.quality == POSITIVE)
				temp_mut_list += SM
		if(prob(20) && temp_mut_list.len)
			mutations.Remove(pick(temp_mut_list))
		temp_mut_list.Cut()

	if(reagents.has_reagent(/datum/reagent/phenol, 5))
		for(var/datum/spacetendon_mutation/SM in mutations)
			if(SM.quality == MINOR_NEGATIVE)
				temp_mut_list += SM
		if(prob(20) && temp_mut_list.len)
			mutations.Remove(pick(temp_mut_list))
		temp_mut_list.Cut()

	if(reagents.has_reagent(/datum/reagent/blood, 15))
		adjust_production(rand(15, -5))

	if(reagents.has_reagent(/datum/reagent/toxin/amatoxin, 5))
		adjust_production(rand(5, -15))

	if(reagents.has_reagent(/datum/reagent/toxin/plasma, 5))
		adjust_potency(rand(5, -15))

	if(reagents.has_reagent(/datum/reagent/water/holywater, 10))
		adjust_potency(rand(15, -5))


/obj/item/food/grown/tendons
	seed = /obj/item/seeds/tendons
	name = "tendons"
	desc = "A slice of an invasive species with flesh-like vines that rapidly creep and wrap around whatever they contact. \
			The tendons feed on the blood of those it cuts."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "tendonslice"
	foodtypes = VEGETABLES | GROSS
	tastes = list("meat" = 1)
	wine_power = 0
