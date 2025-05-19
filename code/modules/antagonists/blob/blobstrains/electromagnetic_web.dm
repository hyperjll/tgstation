//does burn damage and EMPs, slightly fragile
/datum/blobstrain/reagent/electromagnetic_web
	name = "Electromagnetic Web"
	color = "#83ECEC"
	complementary_color = "#EC8383"
	description = "will do high burn damage and EMP targets, and can electrocute targets."
	effectdesc = "will also take massively increased damage and release an EMP when killed via burns, tesla zaps when killed via brute force. Conducts electricity."
	analyzerdescdamage = "Does low burn damage, EMPs targets, and electrocutes targets."
	analyzerdesceffect = "Is fragile to all types of damage, but takes massive damage from brute. In addition, releases a small EMP or tesla shock when killed. Also conducts electricty."
	reagent = /datum/reagent/blob/electromagnetic_web
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_MOB_STUN
	var/zap_range = 7
	var/zap_power = 30000

/datum/blobstrain/reagent/electromagnetic_web/damage_reaction(obj/structure/blob/B, damage, damage_type, damage_flag)
	if(damage_type == BRUTE) // take full brute, divide by the multiplier to get full value
		return damage / B.brute_resist
	return damage * 1.25 //a laser will do 25 damage, which will kill any normal blob

/datum/blobstrain/reagent/electromagnetic_web/on_sporedeath(mob/living/spore)
	var/turf/teslaturf = get_turf(spore)
	tesla_zap(teslaturf, zap_range, zap_power, zap_flags)

/datum/blobstrain/reagent/electromagnetic_web/death_reaction(obj/structure/blob/B, damage_flag)
	if(damage_flag == BULLET || damage_flag == LASER)
		empulse(B.loc, 1, 5) //less than screen range, so you can stand out of range to avoid it
	else if(damage_flag == MELEE)
		if(prob(20))
			tesla_zap(B.loc, zap_range, zap_power, zap_flags)

/datum/blobstrain/reagent/electromagnetic_web/tesla_reaction(obj/structure/blob/B, power)
	return FALSE

/datum/reagent/blob/electromagnetic_web
	name = "Electromagnetic Web"
	taste_description = "pop rocks"
	color = "#83ECEC"

/datum/reagent/blob/electromagnetic_web/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message, touch_protection, mob/eye/blob/overmind)
	. = ..()
	reac_volume = return_mob_expose_reac_volume(exposed_mob, methods, reac_volume, show_message, touch_protection, overmind)
	if(prob(reac_volume*2))
		exposed_mob.emp_act(EMP_LIGHT)
	if(prob(reac_volume))
		exposed_mob.electrocute_act(rand(2, 8), "EMP blob reagent in their body", 1, SHOCK_NOGLOVES)
	if(exposed_mob)
		exposed_mob.apply_damage(reac_volume, BURN, wound_bonus=CANT_WOUND)
