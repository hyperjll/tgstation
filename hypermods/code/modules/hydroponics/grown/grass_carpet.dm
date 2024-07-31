/obj/item/seeds/grass/golden
	name = "goldengrass seed pack"
	desc = "These seeds grow into a strangely non-metallic yellow grass."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-goldgrass"
	species = "goldengrass"
	plantname = "Goldengrass"
	product = /obj/item/food/grown/grass/gold
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing.dmi'
	icon_grow = "goldengrass-grow"
	icon_dead = "grass-dead"
	mutatelist = list()
	genes = list(/datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/glow/yellow)
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.02, /datum/reagent/medicine/earthsblood = 0.05)

/obj/item/food/grown/grass/gold
	seed = /obj/item/seeds/grass/golden
	name = "golden grass"
	desc = "Sparkly and non-metallic yellow grass."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "goldengrassclump"
	filling_color = "#ffd700"
// Haha, i'm lazy. :(
/obj/item/food/grown/grass/gold/attack_self(mob/user)
	to_chat(user, span_notice("The grass loses it's golden color as you prepare the astroturf."))
	var/grassAmt = 1 + round(seed.potency * tile_coefficient) // The grass we're holding
	for(var/obj/item/food/grown/grass/gold/G in user.loc) // The grass on the floor
		if(G.type != type)
			continue
		grassAmt += 1 + round(G.seed.potency * tile_coefficient)
		qdel(G)
	new stacktype(user.drop_location(), grassAmt)
	qdel(src)
