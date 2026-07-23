// Ballistic Arrows



// Toy Arrows

/obj/item/ammo_casing/arrow/toy
	name = "toy arrow"
	desc = "A plastic arrow with a blunt tip covered in velcro to allow it to stick to whoever it hits."
	projectile_type = /obj/projectile/bullet/arrow/toy
	force = 0
	throwforce = 0
	sharpness = NONE
	embed_type = /datum/embedding/toy_arrow

/datum/embedding/toy_arrow
	embed_chance = 100
	fall_chance = 0
	jostle_chance = 0
	pain_stam_pct = 0
	pain_mult = 0
	jostle_pain_mult = 0
	rip_time = 0.5 SECONDS

/obj/projectile/bullet/arrow/toy //Toy arrow with velcro tip that safely embeds into target
	name = "toy arrow"
	damage = 0

/obj/projectile/bullet/arrow/toy/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(!iscarbon(target))
		return
	var/mob/living/carbon/carbon_mob = target
	carbon_mob.adjust_stamina_loss(25)

/obj/item/ammo_casing/arrow/toy/energy
	name = "toy energy bolt"
	desc = "A deceiving arrow that looks to be lethal, but is a velcro-tipped toy. For use with toy bows."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "arrow_energy"
	base_icon_state = "arrow_energy"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "arrow_toy_energy"
	projectile_type = /obj/projectile/bullet/arrow/toy/energy

/obj/projectile/bullet/arrow/toy/energy
	name = "toy energy bolt"
	icon_state = "arrow_energy"

/obj/item/ammo_casing/arrow/toy/disabler
	name = "toy disabler bolt"
	desc = "A toy arrow that looks like a disabler bolt fabricated from a hardlight bow. Tipped with velcro to allow it to stick to targets."
	icon_state = "arrow_disable"
	base_icon_state = "arrow_disable"
	inhand_icon_state = "arrow_toy_disable"
	projectile_type = /obj/projectile/bullet/arrow/toy/disabler

/obj/projectile/bullet/arrow/toy/disabler
	name = "toy disabler bolt"
	icon_state = "arrow_disable"

/obj/item/ammo_casing/arrow/toy/pulse
	name = "toy pulse bolt"
	desc = "A plastic, fake arrow that looks like a pulse bolt. A velcro head lets it stick to targets."
	icon_state = "arrow_pulse"
	base_icon_state = "arrow_pulse"
	inhand_icon_state = "arrow_toy_pulse"
	projectile_type = /obj/projectile/bullet/arrow/toy/pulse

/obj/projectile/bullet/arrow/toy/pulse
	name = "toy pulse bolt"
	icon_state = "arrow_pulse"

/obj/item/ammo_casing/arrow/toy/xray
	name = "toy X-ray bolt"
	desc = "A plastic arrow with a blunt tip covered in velcro to allow it to stick to whoever it hits. This one is made to resemble a X-ray bolt from a hardlight bow."
	icon_state = "arrow_xray"
	base_icon_state = "arrow_xray"
	inhand_icon_state = "arrow_toy_xray"
	projectile_type = /obj/projectile/bullet/arrow/toy/xray

/obj/projectile/bullet/arrow/toy/xray
	name = "toy X-ray bolt"
	icon_state = "arrow_xray"

/obj/item/ammo_casing/arrow/toy/shock
	name = "toy shock bolt"
	desc = "A plastic arrow with a blunt tip covered in velcro to allow it to stick to whoever it hits. This one is made to resemble a shock bolt from a hardlight bow."
	icon_state = "arrow_shock"
	base_icon_state = "arrow_shock"
	inhand_icon_state = "arrow_toy_shock"
	projectile_type = /obj/projectile/bullet/arrow/toy/shock

/obj/projectile/bullet/arrow/toy/shock
	name = "toy shock bolt"
	icon_state = "arrow_shock"

// Energy Arrows

/obj/item/ammo_casing/arrow/energy
	name = "energy bolt"
	desc = "An arrow made from hardlight. This one burns the victim."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "arrow_energy"
	base_icon_state = "arrow_energy"
	item_flags = DROPDEL
	projectile_type = /obj/projectile/energy/arrow
	reusable = FALSE

/obj/projectile/energy/arrow //Hardlight projectile. Significantly more robust than a standard laser. Capable of hardening in target's flesh
	name = "energy bolt"
	icon = 'hypermods/icons/obj/weapons/guns/projectiles.dmi'
	icon_state = "arrow_energy"
	damage = 40
	wound_bonus = -60
	speed = 0.6

/obj/projectile/energy/arrow/on_hit(atom/target, blocked = FALSE, pierce_hit)
	if(istype(target, /obj/structure/blob))
		damage = damage / 2
	return ..()

/obj/item/ammo_casing/arrow/energy/disabler
	name = "disabler bolt"
	desc = "An arrow made from hardlight. This one stuns the victim in a non-lethal way."
	icon_state = "arrow_disable"
	base_icon_state = "arrow_disable"
	projectile_type = /obj/projectile/energy/arrow/disabler
	harmful = FALSE

/obj/projectile/energy/arrow/disabler //Hardlight projectile. Much more draining than a standard disabler. Needs to be competitive in DPS
	name = "disabler bolt"
	icon_state = "arrow_disable"
	light_color = LIGHT_COLOR_BLUE
	damage = 50
	damage_type = STAMINA

/obj/item/ammo_casing/arrow/energy/pulse
	name = "pulse bolt"
	desc = "An arrow made from hardlight. This one eliminates any obstructions it hits."
	icon_state = "arrow_pulse"
	base_icon_state = "arrow_pulse"
	projectile_type = /obj/projectile/energy/arrow/pulse

/obj/projectile/energy/arrow/pulse //Hardlight projectile. Woe to your enemies.
	name = "pulse bolt"
	icon_state = "arrow_pulse"
	light_color = LIGHT_COLOR_BLUE
	damage = 75

/obj/projectile/energy/arrow/pulse/on_hit(atom/target, blocked = FALSE, pierce_hit)
	. = ..()
	if (!QDELETED(target) && (isturf(target) || istype(target, /obj/structure/)))
		if(isobj(target))
			SSexplosions.med_mov_atom += target
		else
			SSexplosions.medturf += target

/obj/item/ammo_casing/arrow/energy/xray
	name = "X-ray bolt"
	desc = "An arrow made from hardlight. This one can pass through obstructions."
	icon_state = "arrow_xray"
	base_icon_state = "arrow_xray"
	projectile_type = /obj/projectile/energy/arrow/xray

/obj/projectile/energy/arrow/xray //Hardlight projectile. Weakened arrow capable of passing through material. Massive irradiation on hit.
	name = "X-ray bolt"
	icon_state = "arrow_xray"
	light_color = LIGHT_COLOR_GREEN
	damage_type = TOX
	damage = 30
	wound_bonus = -30
	range = 20
	pass_flags = PASSBLOB | PASSCLOSEDTURF | PASSDOORS | PASSFLAPS | PASSGLASS | PASSGRILLE | PASSMACHINE | PASSSTRUCTURE | PASSTABLE | PASSVEHICLE | PASSWINDOW // Will pass through all things except people, which it will hit.
	projectile_piercing = PASSMOB

/obj/item/ammo_casing/arrow/energy/shock
	name = "shock bolt"
	desc = "An arrow made from hardlight. This one shocks the victim with harmless energy capable of stunning them."
	icon_state = "arrow_shock"
	base_icon_state = "arrow_shock"
	projectile_type = /obj/projectile/energy/arrow/shock
	harmful = FALSE

/obj/projectile/energy/arrow/shock //Hardlight projectile. Replicable tasers are fair and balanced.
	name = "shock bolt"
	icon_state = "arrow_shock"
	light_color = LIGHT_COLOR_BRIGHT_YELLOW
	damage = 40 // To ensure it's not just disabler bolt 2.0, it's 10 damage short.
	damage_type = STAMINA

/obj/projectile/energy/arrow/shock/on_hit(atom/target, blocked = FALSE, pierce_hit)
	. = ..()
	if(!ismob(target) || blocked >= 100) //Fully blocked by mob or collided with dense object - burst into sparks!
		do_sparks(1, TRUE, src)
	else if(iscarbon(target))
		var/mob/living/carbon/carbon_mob = target
		carbon_mob.add_mood_event("tased", /datum/mood_event/tased)
		SEND_SIGNAL(carbon_mob, COMSIG_LIVING_MINOR_SHOCK) // Kinda the only real reason that makes this truly apart from disabler shots, it could fuck with nanites. Granted, mood debuff too.
		if(carbon_mob.dna && (carbon_mob.dna.check_mutation(/datum/mutation/hulk)))
			carbon_mob.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ), forced = "hulk")
		else if((carbon_mob.status_flags & CANKNOCKDOWN) && !HAS_TRAIT(carbon_mob, TRAIT_STUNIMMUNE))
			addtimer(CALLBACK(carbon_mob, TYPE_PROC_REF(/mob/living/carbon, do_jitter_animation), jitter), 5)
		if(istype(carbon_mob.get_organ_slot(ORGAN_SLOT_STOMACH), /obj/item/organ/stomach/ethereal))
			var/obj/item/organ/stomach/ethereal/ethereal_stomach = carbon_mob.get_organ_slot(ORGAN_SLOT_STOMACH)
			ethereal_stomach.adjust_charge(400)
			to_chat(carbon_mob, span_notice("You get charged by [src]."))
