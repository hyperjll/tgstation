/obj/item/magicbook
	name = "magic book"
	desc = "You shouldn't see this."
	icon = 'hypermods/icons/obj/service/library.dmi'
	icon_state ="book"
	worn_icon_state = "book"
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL  //upped to three because books are, y'know, pretty big. (and you could hide them inside eachother recursively forever)
	attack_verb_continuous = list("bashes", "whacks", "educates")
	attack_verb_simple = list("bash", "whack", "educate")
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'
	var/use_sound = 'hypermods/sound/items/bookopen.ogg'
	var/uses = 1
	var/usetime = 1.5 SECONDS

/obj/item/magicbook/attack_self(mob/user)
	to_chat(user, span_notice("You flip open the [src] and begin scouring it's contents..."))
	playsound(src, use_sound, 50, TRUE)
	if(do_after(user, usetime, user) && !QDELETED(src))
		playsound(src, drop_sound, 50, TRUE)
		do_effect(user)

/obj/item/magicbook/proc/do_effect(mob/user)
	uses -= 1
	if(!uses)
		qdel(src)
		to_chat(user, span_notice("The [src] vanishes within your hands, it's power expended..."))
		return

/obj/item/magicbook/slimes
	name = "Slime Encyclopedia"
	desc = "An encyclopedia documenting all known slime subspecies, and the possible remedies their cores can provide. \
			Has the potential to invoke the existances of live slimes of a random subspecies near the user."
	icon_state ="slimes"
	use_sound = 'hypermods/sound/items/bookopenlong.ogg'
	usetime = 3 SECONDS
	uses = 3

/obj/item/magicbook/slimes/do_effect(mob/user)
	var/turf/T = get_turf(user)

	for(var/i in 1 to 2 + rand(1,2))
		var/mob/living/basic/slime/random/random_slime = new (T)
		random_slime.visible_message(span_danger("After reading the book, [random_slime] emerges from it!"))
		for(var/j in 1 to rand(1, 3))
			step(random_slime, pick(NORTH,SOUTH,EAST,WEST))
	playsound(T, 'sound/effects/phasein.ogg', 100, TRUE)
	..()

/obj/item/magicbook/food
	name = "Culinary Dreams"
	desc = "A book with a rather hard cover, a quick peer into the book's contents reveals eerily life-like foodstuffs. \
			Has the potential to conjure random ready-to-eat foods directly to the user."
	icon_state ="food"
	uses = 5

/obj/item/magicbook/food/do_effect(mob/user)
	playsound(get_turf(user), 'sound/effects/phasein.ogg', 100, TRUE)
	sleep(0.25 SECONDS) // small sound delay to prevent multiple sound effects from layering ontop of each other.
	var/food_type = get_random_food()
	var/obj/item/food/food_item = new food_type
	if(!user.put_in_active_hand(food_item))
		food_item.forceMove(user.drop_location())
		playsound(user, 'sound/effects/splat.ogg', 50, TRUE)
		food_item.visible_message(span_danger("Before you can even read what's within it, [food_item] suddenly pops out from the book and onto the floor!"))
	else
		food_item.visible_message(span_danger("Before you can even read what's within it, [food_item] suddenly pops out from the book, and into your hand!"))

	..()
