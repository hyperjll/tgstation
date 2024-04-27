/obj/item/ammo_casing/chembudget
	name = "shoddy dart synthesiser"
	desc = "A high-power spring, linked to an energy-based piercing dart synthesiser. It's of rather poor quality."
	projectile_type = /obj/projectile/bullet/dart/piercing
	firing_effect_type = null

/obj/item/ammo_casing/chembudget/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!loaded_projectile)
		return
	if(istype(loc, /obj/item/gun/chembudget))
		var/obj/item/gun/chembudget/CG = loc
		if(CG.syringes_left <= 0)
			return
		CG.reagents.trans_to(loaded_projectile, 15, transferred_by = user)
		loaded_projectile.name = "piercing chemical dart"
		CG.syringes_left--
	return ..()

/obj/item/ammo_casing/toxicreagentgun
	name = "syndicate toxic dart synthesiser"
	desc = "A high-power spring, linked to an energy-based dart synthesiser."
	projectile_type = /obj/projectile/bullet/dart/piercing
	firing_effect_type = null

/obj/item/ammo_casing/toxicreagentgun/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!loaded_projectile)
		return
	if(istype(loc, /obj/item/gun/toxicreagentgun))
		var/obj/item/gun/toxicreagentgun/CG = loc
		if(CG.syringes_left <= 0)
			return
		CG.reagents.trans_to(loaded_projectile, 40, transferred_by = user)
		loaded_projectile.name = "piercing chemical dart"
		CG.syringes_left--
	return ..()

/obj/item/ammo_casing/explosivereagentgun
	name = "syndicate explosive dart synthesiser"
	desc = "A high-power spring, linked to an energy-based dart synthesiser."
	projectile_type = /obj/projectile/bullet/dart/piercing
	firing_effect_type = null

/obj/item/ammo_casing/explosivereagentgun/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!loaded_projectile)
		return
	if(istype(loc, /obj/item/gun/explosivereagentgun))
		var/obj/item/gun/explosivereagentgun/CG = loc
		if(CG.syringes_left <= 0)
			return
		CG.reagents.trans_to(loaded_projectile, 50, transferred_by = user)
		loaded_projectile.name = "piercing chemical dart"
		CG.syringes_left--
	return ..()

/obj/item/ammo_casing/medicalreagentgun
	name = "syndicate medical dart synthesiser"
	desc = "A high-power spring, linked to an energy-based dart synthesiser."
	projectile_type = /obj/projectile/bullet/dart/piercing
	firing_effect_type = null

/obj/item/ammo_casing/medicalreagentgun/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!loaded_projectile)
		return
	if(istype(loc, /obj/item/gun/medicalreagentgun))
		var/obj/item/gun/medicalreagentgun/CG = loc
		if(CG.syringes_left <= 0)
			return
		CG.reagents.trans_to(loaded_projectile, 40, transferred_by = user)
		loaded_projectile.name = "piercing chemical dart"
		CG.syringes_left--
	return ..()
