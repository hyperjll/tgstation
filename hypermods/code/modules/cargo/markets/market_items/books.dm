/datum/market_item/offense
	category = "Offensive"
	abstract_path = /datum/market_item/offense
	markets = list(/datum/market/curator)

/datum/market_item/defense
	category = "Defensive"
	abstract_path = /datum/market_item/defense
	markets = list(/datum/market/curator)

/datum/market_item/mobility
	category = "Mobility"
	abstract_path = /datum/market_item/mobility
	markets = list(/datum/market/curator)

/datum/market_item/support
	category = "Support"
	abstract_path = /datum/market_item/support
	markets = list(/datum/market/curator)

/datum/market_item/utility
	category = "Utility"
	abstract_path = /datum/market_item/utility
	markets = list(/datum/market/curator)

/datum/market_item/support/slimes
	name = "Slime Encyclopedia"
	desc = "An encyclopedia documenting all known slime subspecies, and the possible remedies their cores can provide."
	item = /obj/item/magicbook/slimes

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/food
	name = "Culinary Dreams"
	desc = "A book with a rather hard cover, a quick peer into the book's contents reveals eerily life-like foodstuffs."
	item = /obj/item/magicbook/food

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/support/healing
	name = "Applied Medicare"
	desc = "A book containing various medicine recipes and how to apply them effectively."
	item = /obj/item/magicbook/healing

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/offense/lightning
	name = "The End is Nigh"
	desc = "An unholy text of unknown origin, those who've attempted to read it's contents usually recieve the shock of their life."
	item = /obj/item/magicbook/lightning

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 100

/datum/market_item/mobility/blink
	name = "Blink Tome"
	desc = "A tome of sapphire blue covers that makes anyone feel... unstable just by staring at it."
	item = /obj/item/magicbook/blink

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/freeze
	name = "Chilling Pages"
	desc = "A mysterious book that's chilling to the touch, occasionally a few vapors emit from it."
	item = /obj/item/magicbook/freeze

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/sleepy
	name = "Sleepytime Stories"
	desc = "A book containing countless soothing tales to send you off to dreamland."
	item = /obj/item/magicbook/sleepy

	price_min = CARGO_CRATE_VALUE * 1
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 100

/datum/market_item/support/birds
	name = "Birds of the World"
	desc = "A book written by an unknown author, occasionally this book... chirps?"
	item = /obj/item/magicbook/birds

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3
	availability_prob = 100

/datum/market_item/offense/fire
	name = "Pyrokinetics Explored"
	desc = "A guidebook containing the scramblings of an author who's clearly a bit too excited by fires."
	item = /obj/item/magicbook/fire

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/trees
	name = "Applied Silviculture"
	desc = "A book made from bark, it's pages document the 'outdoors' experience perhaps a bit too well."
	item = /obj/item/magicbook/trees

	price_min = CARGO_CRATE_VALUE * 1
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/fishing
	name = "The Angler's Guide"
	desc = "A book with a scale-like cover, it's pages are wet and slimey."
	item = /obj/item/magicbook/fishing

	price_min = CARGO_CRATE_VALUE * 1
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/volcano
	name = "Joy of Volcanology"
	desc = "An ominous book that scalds those it touches. Makes for a decent house-warmer."
	item = /obj/item/magicbook/volcano

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 7
	stock_max = 3
	availability_prob = 100

/datum/market_item/support/spiders
	name = "Arachnophobia 101"
	desc = "A book with a large, seemingly authentic spider web printed upon it's cover. It makes your flesh crawl just by looking at it."
	item = /obj/item/magicbook/spiders

	price_min = CARGO_CRATE_VALUE * 6
	price_max = CARGO_CRATE_VALUE * 8
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/temperature
	name = "Tempering Temperatures"
	desc = "A detailed guide on how to: Not die to extreme temperatures."
	item = /obj/item/magicbook/temperature

	price_min = CARGO_CRATE_VALUE * 0.5
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/light
	name = "Lux Aeterna Vol. 1"
	desc = "A strange tome which looks remarkably... lit up? It's difficult to notice any shadows upon it."
	item = /obj/item/magicbook/light

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/light2
	name = "Lux Aeterna Vol. 2"
	desc = "A powerful tome containing incredible light. Rays of light can be seen pouring out of it from between the pages."
	item = /obj/item/magicbook/light2

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/wetness
	name = "Rainy Days"
	desc = "A book containing pages that seem to be soaked with water, the words within are barely legible."
	item = /obj/item/magicbook/wetness

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/moon
	name = "Lunar Grimoire"
	desc = "A rare grimoire containing the 'secrets of the moon', whatever that means."
	item = /obj/item/magicbook/moon

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3
	availability_prob = 100

/datum/market_item/support/bees
	name = "Apicultural Notes"
	desc = "A notebook that seemingly buzzes on it's own, it's probably best you never open it."
	item = /obj/item/magicbook/bees

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/everything
	name = "Everything Encyclopedia Vol. 1"
	desc = "A strange encyclopedia containing texts native across it's entire family of arcane literature."
	item = /obj/item/magicbook/everything

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/everything2
	name = "Everything Encyclopedia Vol. 2"
	desc = "A strange encyclopedia containing a wide variety of documentations and listings for items all across the galaxy, illegal or not."
	item = /obj/item/magicbook/everything2

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/deconversion
	name = "Deconversion Tactics"
	desc = "A seemingly holy text containing ancient arcane techniques in subdueing subversion within another's mind."
	item = /obj/item/magicbook/deconversion

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3
	availability_prob = 100

/datum/market_item/support/hypnotizing
	name = "Hypnosis and You"
	desc = "An tome containing symbols you don't recognize, made by an unknown author."
	item = /obj/item/magicbook/hypnotizing

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 8
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/vision
	name = "Optical Augmentation"
	desc = "A tome containing strange, glowing letters written in a font unknown to most. Just looking at the letters invokes a strange feeling within one's eyes."
	item = /obj/item/magicbook/vision

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/pressure
	name = "Pressurized Predicts"
	desc = "A book written by an unknown author, the first page only contains one word: 'Space.'"
	item = /obj/item/magicbook/pressure

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/holyness
	name = "The Good Book"
	desc = "Not to be confused with the bible, this seemingly holy textbook is written in such a way to be understood even if one cannot read."
	item = /obj/item/magicbook/holyness

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/silence
	name = "Silent Secrets"
	desc = "This 'book' if you can call it that, seemingly has no words?"
	item = /obj/item/magicbook/silence

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3
	availability_prob = 100

/datum/market_item/offense/pestilence
	name = "Immuno Inductionary"
	desc = "A medical textbook documenting every disease ever discovered, it's rumored to actually inflict the disease the reader stumbles upon."
	item = /obj/item/magicbook/pestilence

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 7.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/mobility/shelter
	name = "Sheltered Texts"
	desc = "A textbook documenting the effects of a 'Stabilized Bluespace Extract' written by someone named 'Hyper'."
	item = /obj/item/magicbook/shelter

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/charge
	name = "Charged Propaganda"
	desc = "A propagandized piece of literature made by an unknown ethereal author. The text has become far too dated to read."
	item = /obj/item/magicbook/charge

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 4.5
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/honk
	name = "Tome of the Circus Vol. 1"
	desc = "A... unique tome... all of it's pages simply read: 'HONK HONK HONK HONK HONK'"
	item = /obj/item/magicbook/honk

	price_min = CARGO_CRATE_VALUE * 0.5
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 3
	availability_prob = 100

/datum/market_item/defense/honk2
	name = "Tome of the Circus Vol. 2"
	desc = "A mysterious tome written by an unknown author, while the text only reads 'HONK HONK HONK', the text seemingly blends into itself to create a spiral pattern."
	item = /obj/item/magicbook/honk2

	price_min = CARGO_CRATE_VALUE * 1.8
	price_max = CARGO_CRATE_VALUE * 2.2
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/event
	name = "Event Calender"
	desc = "A sheet of pages that are barely glued into a book cover properly, they contain the findings of a self-proclaimed 'archmage' who once completed a 'grand ritual'."
	item = /obj/item/magicbook/event

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 3
	availability_prob = 100

/datum/market_item/utility/threat
	name = "Threat Report"
	desc = "A sturdy book detailing a myriad of possible threats near the user's location. At the very back of the book is a red button that reads: 'Feeling lucky?'"
	item = /obj/item/magicbook/threat

	price_min = CARGO_CRATE_VALUE * 10
	price_max = CARGO_CRATE_VALUE * 20
	stock_max = 3
	availability_prob = 100
	restockable = FALSE

/**
/datum/market_item//
	name = ""
	desc = ""
	item = /obj/item/magicbook/

	price_min = CARGO_CRATE_VALUE * 1
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 100
**/
