/obj/item/reagent_containers/cup/soda_cans/mystery
	name = "Mystery Fizz"
	desc = "Delicious soda with the added flair of mystery flavor! Note, Fizzfazz Inc. not liable for any damages caused by drinking this product."
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "mysterysoda"
	var/static/list/descs = list("The entire label seems to just be a legal disclaimer.","The label reads off over 200 possible flavors."\
	, "The date on the cap reads off that the bottle expired a decade ago...")

/obj/item/reagent_containers/cup/soda_cans/mystery/Initialize(mapload)
	list_reagents = list(get_random_reagent_id() = 30)
	. = ..()
	if(prob(20))
		desc = pick(descs)


/obj/item/reagent_containers/cup/soda_cans/changelingsting
	name = "Changeling Sting"
	desc = "Not for the average joe."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "changelingsting"
	list_reagents = list(/datum/reagent/consumable/changelingsting = 50)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/devilskiss
	name = "Devil's Kiss"
	desc = "Guarenteed to taste like a blood trail."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "devilskiss"
	list_reagents = list(/datum/reagent/consumable/ethanol/devilskiss = 50)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/turbo
	name = "Turbo"
	desc = "Insert a sonic the hedgehog quote here."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "turbo"
	list_reagents = list(/datum/reagent/consumable/turbo = 50)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/hearty_punch
	name = "Hearty Punch"
	desc = "Best saved for when you're in a pinch."
	custom_price = 50
	custom_premium_price = 50
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "hearty_punch"
	list_reagents = list(/datum/reagent/consumable/hearty_punch = 50)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/robust_nukie
	name = "Robust Nukie Cola"
	desc = "Will make you FEEL like you're the bomb."
	custom_price = 200
	custom_premium_price = 200
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "nukie_cola"
	list_reagents = list(/datum/reagent/medicine/stimulants = 25, /datum/reagent/medicine/omnizine = 5, /datum/reagent/consumable/space_cola = 20)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/fireball
	name = "Fireball"
	desc = "The drink that let's you be the light of everyones lives."
	custom_price = 200
	custom_premium_price = 200
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "fireball"
	list_reagents = list(/datum/reagent/phlogiston = 15, /datum/reagent/medicine/kelotane = 10, /datum/reagent/medicine/dermaline = 10, /datum/reagent/medicine/leporazine = 10, /datum/reagent/consumable/space_cola = 5)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/fireworks
	name = "Firework Factory"
	desc = "Oh, this isn't just any soda, this is a BOMB. A BOMB SODA."
	custom_price = 300
	custom_premium_price = 300
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "fireworks"
	list_reagents = list(/datum/reagent/gunpowder = 20, /datum/reagent/phlogiston = 10, /datum/reagent/napalm = 10, /datum/reagent/consumable/space_cola = 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/mutate_fizz
	name = "Mutation Fizz"
	desc = "Feel like rerolling the dice?"
	custom_price = 200
	custom_premium_price = 200
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "mutate_fizz"
	list_reagents = list(/datum/reagent/consumable/space_cola = 40)
	var/extra_reagent = null
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/mutate_fizz/Initialize(mapload)
	. = ..()
	extra_reagent = pick(/datum/reagent/mutationtoxin, /datum/reagent/mutationtoxin/classic, /datum/reagent/mutationtoxin/felinid, /datum/reagent/mutationtoxin/lizard, /datum/reagent/mutationtoxin/fly, /datum/reagent/mutationtoxin/moth, /datum/reagent/mutationtoxin/pod, /datum/reagent/mutationtoxin/jelly, /datum/reagent/mutationtoxin/android, /datum/reagent/mutationtoxin/abductor, /datum/reagent/mutationtoxin/skeleton, /datum/reagent/mutationtoxin/plasma)
	reagents.add_reagent(extra_reagent, 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/aged_soda
	name = "Aged Soda"
	desc = "CAUTION: Soda may or may not be expired -- check expiration date carefully."
	custom_price = 150
	custom_premium_price = 150
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "aged_soda"
	list_reagents = list(/datum/reagent/consumable/old_timer = 10, /datum/reagent/medicine/bicaridine = 7.5, /datum/reagent/medicine/dermaline = 7.5, /datum/reagent/medicine/antitoxin = 7.5, /datum/reagent/medicine/dexalinplus = 7.5, /datum/reagent/consumable/space_cola = 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/antidote
	name = "Antidote"
	desc = "The cure for ALL of societies ills."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "antidote"
	list_reagents = list(/datum/reagent/medicine/dylovene = 15, /datum/reagent/medicine/antitoxin = 15, /datum/reagent/medicine/potass_iodide = 10, /datum/reagent/consumable/space_cola = 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/space_walker
	name = "Space Walker"
	desc = "This is Ground Control to Major Tongue..."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "space_walker"
	list_reagents = list(/datum/reagent/medicine/barozine = 20, /datum/reagent/medicine/leporazine = 20, /datum/reagent/consumable/space_cola = 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/anti_water
	name = "Anti-Water"
	desc = "This is the kind of drink you'd tell your kids not to drink while you slurp it in their faces!"
	custom_price = 150
	custom_premium_price = 150
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "anti_water"
	list_reagents = list(/datum/reagent/medicine/antiwater = 10, /datum/reagent/consumable/space_cola = 40)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/nano_pop
	name = "Nanolytic Pop"
	desc = "For legal reasons, any nanites found within are foreign entities and are in no-way affiliated nor condoned by our company."
	custom_price = 200
	custom_premium_price = 200
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "nano_pop"
	list_reagents = list(/datum/reagent/medicine/healingnanites = 5, /datum/reagent/medicine/dermalnanites = 10, /datum/reagent/consumable/space_cola = 35)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/ice_e
	name = "ICE-E Sodapop"
	desc = "Touted as the most frosty soda of all -- You don't even need to refridgerate it!"
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "ice_e"
	list_reagents = list(/datum/reagent/inverse/cryostylane = 30, /datum/reagent/medicine/cryoxadone = 10, /datum/reagent/consumable/space_cola = 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/simple_times
	name = "Simple Times"
	desc = "Would you like me to cut back to three weeks earlier -- when you were ALIVE?"
	custom_price = 125
	custom_premium_price = 125
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "simple_times"
	list_reagents = list(/datum/reagent/consumable/old_timer = 5, /datum/reagent/medicine/tricordrazine = 20, /datum/reagent/consumable/space_cola = 25)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/chocolate_sips
	name = "Chocolate Sips"
	desc = "The sweetest cola around, guarenteed to cure disgust in those who taste just a sip."
	custom_price = 65
	custom_premium_price = 65
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "chocolate_sips"
	list_reagents = list(/datum/reagent/consumable/choccyshake = 30, /datum/reagent/consumable/space_cola = 20)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/honey_med
	name = "Honeyed Medicine"
	desc = "A spoonful of sugar goes a long way."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "honey_med"
	list_reagents = list(/datum/reagent/consumable/honey = 20, /datum/reagent/medicine/tricordrazine = 10, /datum/reagent/consumable/space_cola = 20)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/unstable_vortex
	name = "Unstable Vortex"
	desc = "Soda junkies beware: You're in for a scare!"
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "unstable_vortex"
	list_reagents = list(/datum/reagent/bluespace = 20, /datum/reagent/consumable/space_cola = 30)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/clown_juice
	name = "Clown Juice"
	desc = "It is for -- and does EXACTLY what you might think it does."
	custom_price = 250
	custom_premium_price = 250
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "clown_juice"
	list_reagents = list(/datum/reagent/medicine/clownenhancer = 6, /datum/reagent/consumable/banana = 14, /datum/reagent/consumable/space_cola = 30)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/gold_soda
	name = "Golden Soda"
	desc = "Often priced unreasonably high for it's high mineral count."
	custom_price = 300
	custom_premium_price = 300
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "gold_soda"
	list_reagents = list(/datum/reagent/medicine/enchantedgold = 10, /datum/reagent/gold = 20, /datum/reagent/consumable/space_cola = 20)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/sleepy_time
	name = "Sleepy Time"
	desc = "Dream of a better future."
	custom_price = 80
	custom_premium_price = 80
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "sleepy_time"
	list_reagents = list(/datum/reagent/toxin/sodium_thiopental = 20, /datum/reagent/consumable/between_the_sheets = 20, /datum/reagent/consumable/space_cola = 10)
	volume = 50

/obj/item/reagent_containers/cup/soda_cans/nocturnal
	name = "Nocturnal Drunkard"
	desc = "We'll keep you awake, or we'll die trying."
	custom_price = 100
	custom_premium_price = 100
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "nocturnal"
	list_reagents = list(/datum/reagent/toxin/nocturine = 5, /datum/reagent/medicine/c2/probital = 30, /datum/reagent/medicine/modafinil = 10, /datum/reagent/consumable/space_cola = 5)
	volume = 50


/obj/item/reagent_containers/cup/glass/coffee/syndicate
	name = "syndicate latte"
	desc = "A syndicate-branded hot beverage, satisfaction guaranteed."
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "syndi_latte"
	base_icon_state = "syndi_latte"
	list_reagents = list(/datum/reagent/medicine/omnizine = 25, /datum/reagent/consumable/coffee = 25)
	resistance_flags = FREEZE_PROOF
	isGlass = FALSE
	volume = 50
	custom_price = 150
	custom_premium_price = 150

/obj/item/reagent_containers/cup/glass/coffee/nukie
	name = "robust nukie latte"
	desc = "A syndicate-branded hot beverage, a large illustration of a three-headed snake exists on one side of the cup, and on the other is a crude depiction of a 'Gorlex Marauder'."
	icon = 'hypermods/icons/obj/drinks/soda.dmi'
	icon_state = "nukie_latte"
	base_icon_state = "nukie_latte"
	list_reagents = list(/datum/reagent/medicine/stimulants = 25, /datum/reagent/consumable/coffee = 25)
	resistance_flags = FREEZE_PROOF
	isGlass = FALSE
	volume = 50
	custom_price = 200
	custom_premium_price = 200
