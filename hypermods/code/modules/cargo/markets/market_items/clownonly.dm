/datum/market_item/clownmain
	category = "Clown Market"
	abstract_path = /datum/market_item/clownmain
	markets = list(/datum/market/clown)

/datum/market_item/clownmain/gamble
	name = "Clown Gadget Box"
	desc = "A single box of clownly gadgets, who knows what you'll get!"
	item = /obj/item/storage/box/clowngadgets

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 1
	availability_prob = 100

/datum/market_item/clownmain/banana
	name = "Banana"
	desc = "The clown's highly prized fruit, the very symbol of clowns across the galaxy! \
			When eaten by clowns, it provides slight healing and it's peel can be used to slip people!"
	item = /obj/item/food/grown/banana

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 100
	availability_prob = 100

/datum/market_item/clownmain/creampie
	name = "Banana Cream Pie"
	desc = "A single, freshly baked banana cream pie, just like how our mothers used to make them."
	item = /obj/item/food/pie/cream

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 20
	availability_prob = 100

/datum/market_item/clownmain/waterflower
	name = "Water Flower"
	desc = "A sunflower, with a special little twist!"
	item = /obj/item/reagent_containers/spray/waterflower

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 10
	availability_prob = 100

/datum/market_item/clownmain/balloons
	name = "Box of Long Balloons"
	desc = "A single box of long balloons! Straight from our fields."
	item = /obj/item/storage/box/balloons

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 1.9
	stock_max = 5
	availability_prob = 100

/datum/market_item/clownmain/bikehorn
	name = "Bike Horn"
	desc = "A horn off of a bicycle. All clowns within the spinward sector come with one!"
	item = /obj/item/bikehorn

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 1.8
	stock_max = 5
	availability_prob = 100

/datum/market_item/clownmain/clownpda
	name = "Clown PDA"
	desc = "A portable clown PDA! Slipping capabilities included!"
	item = /obj/item/modular_computer/pda/clown

	price_min = CARGO_CRATE_VALUE * 4
	price_max = CARGO_CRATE_VALUE * 8
	stock_max = 4
	availability_prob = 100

/datum/market_item/clownmain/atmosfake
	name = "Fake HoloSIGN Projector"
	desc = "A holosign projector that projects fake atmos holosigns!"
	item = /obj/item/holosign_creator/atmos/fake

	price_min = CARGO_CRATE_VALUE * 6
	price_max = CARGO_CRATE_VALUE * 15
	stock_max = 3
	availability_prob = 100

/datum/market_item/clownmain/lubeflower
	name = "Lube Flower"
	desc = "A sunflower loaded with every clowns favorite liquid!"
	item = /obj/item/reagent_containers/spray/waterflower/lube

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 3
	availability_prob = 100

/datum/market_item/clownmain/bananium
	name = "Bananium"
	desc = "A single sheet of bananium, highly prized and sought after by all clowns everywhere!"
	item = /obj/item/stack/sheet/mineral/bananium

	price_min = CARGO_CRATE_VALUE * 10
	price_max = CARGO_CRATE_VALUE * 20
	stock_max = 1
	availability_prob = 100

/datum/market_item/clownmain/cosmohonk
	name = "Cosmohonk MODsuit"
	desc = "The clown's signature MODsuit, complete with space-faring abilities and other clownly modules!"
	item = /obj/item/mod/control/pre_equipped/cosmohonk

	price_min = CARGO_CRATE_VALUE * 10
	price_max = CARGO_CRATE_VALUE * 20
	stock_max = 2
	availability_prob = 100
