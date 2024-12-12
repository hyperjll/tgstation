/obj/projectile/energy/bolt/wasp //ebow bolts
	name = "wasp egg"
	icon_state = "cbbolt"
	damage = 10
	damage_type = TOX
	stamina = 20
	eyeblur = 0 SECONDS
	knockdown = 10
	slur = 0 SECONDS

/obj/projectile/energy/bolt/wasp/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	var/bee_turf = get_turf(src)
	if(!bee_turf)
		return

	if(prob(90))
		new /mob/living/basic/bee(bee_turf)
	else
		new /mob/living/basic/bee/toxin(bee_turf)
