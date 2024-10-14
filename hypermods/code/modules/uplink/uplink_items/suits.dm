/datum/uplink_item/suits/carpsuit
	name = "Space Carp Hardsuit"
	desc = "An ordinary carp suit now with space-faring capabilities, operatives are still advised \
			to avoid the 'Space Dragon' specimen at all costs as this suit may not fool them."
	item = /obj/item/clothing/suit/hooded/carp_costume/spaceproof/syndi
	cost = 3
	surplus = 15

/datum/uplink_item/suits/scivilian
	name = "Civilian-Class Syndicate MODsuit"
	desc = "A civilian-grade blood-red MODsuit imported straight from the Sol system. \
			Comes with all the normal modules of our regular Syndicate MODsuits, and even have welding protection! \
			It's lightweight and freeform design allow for more modules to be installed, and doesn't slow the wearer down when active... \
			but it also doesn't feature any combat-oriented capabilities, and has little armor plating."
	item = /obj/item/mod/control/pre_equipped/civilian/traitor
	cost = 4
	surplus = 15

/datum/uplink_item/suits/interdyne // Finally, it's about time this damn modsuit got more use.
	name = "Interdyne Medical MODsuit"
	desc = "A highly prized medical MODsuit developed by both Interdyne Pharmaceutics and Cybersun Industries. \
			This MODsuit was specifically designed for quick kidnappings and on-the-go doctoring of all personnel, even those who are unwilling. \
			Features include: Space faring capabilities, a built-in health analyzer, combat defibrillator, injector, object space-only tether, and more! \
			It even comes with a preloaded surgical processor with most advanced surgical procedures as a bonus! Anything from wound tending to brainwashing is included! \
			While active, this suit can boost the wearer's motor ability leading to quicker movement. \
			Doesn't come with surgical tools."
	item = /obj/item/mod/control/pre_equipped/interdyne/traitor
	progression_minimum = 10 MINUTES
	cost = 18
	surplus = 5

/datum/uplink_item/suits/juggernaut
	name = "Cybersun Juggernaut MODsuit"
	desc = "A super heavy suit that, by the name implies, will make you a walking juggernaut. \
			Has the greatest defense out of all of our MODsuits, at the cost of speed. \
			While this MODsuit makes you nearly invincible to bullets, lasers, bombs or melee weapons, \
			you should still watch out for reagent dartguns as poison can still kill you just as easily."
	item = /obj/item/mod/control/pre_equipped/juggernaut
	progression_minimum = 40 MINUTES
	cost = 18
	surplus = 5

/datum/uplink_item/suits/inquisitory
	name = "Syndicate Dark Paladin MODsuit"
	desc = "A blessed high-speed suit (stolen?) by the Gorlex Maradeurs, purposed for less than honest intents. \
			Comes with all the usual features of an Elite Syndicate MODsuit with some additional modules. \
			Modules include: A flashdark module, a shove blocker, a no-slip module, and a state-of-the-art magic nullification module."
	item = /obj/item/mod/control/pre_equipped/responsory/inquisitory/syndie/super
	progression_minimum = 20 MINUTES
	cost = 18
	surplus = 5
