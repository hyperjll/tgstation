/obj/item/rsf/donutsynth
	name = "Donut Synthesizer"
	desc = "A self-recharging device used to rapidly deploy donuts."
	icon_state = "rcd"
	base_icon_state = "rcd"
	spent_icon_state = "rcd"
	max_matter = 10
	cost_by_item = list(/obj/item/food/donut/plain = 100, /obj/item/food/donut/berry = 150, /obj/item/food/donut/choco = 200)
	dispense_cost = 100
	discriptor = "donut-units"
	action_type = "Fabricates"
	cooldowndelay = 10 SECONDS
