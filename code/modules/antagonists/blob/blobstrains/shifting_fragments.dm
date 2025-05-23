//does brute damage, shifts away when damaged
/datum/blobstrain/reagent/shifting_fragments
	name = "Shifting Fragments"
	description = "will do medium brute damage."
	effectdesc = "will also cause blob parts to shift away when attacked. Takes 20% less brute and burn damage."
	analyzerdescdamage = "Does medium brute damage."
	analyzerdesceffect = "When attacked, may shift away from the attacker. Takes 20% less brute and burn damage."
	color = "#C8963C"
	complementary_color = "#3C6EC8"
	reagent = /datum/reagent/blob/shifting_fragments

/datum/blobstrain/reagent/shifting_fragments/expand_reaction(obj/structure/blob/B, obj/structure/blob/newB, turf/T, mob/eye/blob/O)
	if(istype(B, /obj/structure/blob/normal) || (istype(B, /obj/structure/blob/shield)))
		newB.forceMove(get_turf(B))
		B.forceMove(T)

/datum/blobstrain/reagent/shifting_fragments/damage_reaction(obj/structure/blob/B, damage, damage_type, damage_flag)
	if((damage_flag == MELEE || damage_flag == BULLET || damage_flag == LASER) && damage > 0 && B.get_integrity() - damage > 0 && prob(60-damage))
		var/list/blobstopick = list()
		for(var/obj/structure/blob/OB in orange(1, B))
			if((istype(OB, /obj/structure/blob/normal) || (istype(OB, /obj/structure/blob/shield) && prob(25))) && OB.overmind && OB.overmind.blobstrain.type == B.overmind.blobstrain.type)
				blobstopick += OB //as long as the blob picked is valid; ie, a normal or shield blob that has the same chemical as we do, we can swap with it
		if(blobstopick.len)
			var/obj/structure/blob/targeted = pick(blobstopick) //randomize the blob chosen, because otherwise it'd tend to the lower left
			var/turf/T = get_turf(targeted)
			targeted.forceMove(get_turf(B))
			B.forceMove(T) //swap the blobs
	if(damage_type == BRUTE)
		return damage * 0.8
	if(damage_type == BURN)
		return damage * 0.8
	return ..()

/datum/reagent/blob/shifting_fragments
	name = "Shifting Fragments"
	color = "#C8963C"

/datum/reagent/blob/shifting_fragments/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message, touch_protection, mob/eye/blob/overmind)
	. = ..()
	reac_volume = return_mob_expose_reac_volume(exposed_mob, methods, reac_volume, show_message, touch_protection, overmind)
	exposed_mob.apply_damage(0.7*reac_volume, BRUTE, wound_bonus=CANT_WOUND)
