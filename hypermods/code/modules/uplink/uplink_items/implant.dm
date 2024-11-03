/datum/uplink_item/implants/weapons_auth
	name = "Syndicate Firearm Authentication Implant"
	desc = "A singular implant, it's required for using most advanced syndicate weaponry such as the C-20r or the Bulldog. \
			Only really useful if you're in close contact with some of our more heavily armed operatives, likely of the nuclear variety."
	item = /obj/item/storage/box/syndie_kit/syndiefirearmauth
	progression_minimum = 20 MINUTES
	cost = 1
	surplus = 0
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/implants/adrenalin
	name = "Adrenaline Implant"
	desc = "A single implanter, containing an adrenaline implant. When activated, it infuses the host's bloodstream with \
			10 units of Synaptizine, Omnizine, and Stimulants leading to massive healing, increased speed, and near-immunity to stuns for a limited time. \
			Can be used 3 times."
	item = /obj/item/storage/box/syndie_kit/adrenalineimplant
	cost = 7
	surplus = 15

/datum/uplink_item/implants/chemstorage
	name = "Chemical Storage Implant"
	desc = "A box containing a chemical storage implant case, an implanter, a syringe, and a beaker. You'll have to supply your own chemicals though. \
			To apply: inject chemicals (up to 50u) into the implant case using the syringe, then use the implanter to remove the implant and inject into target or yourself. \
			Targets can only have one of these implants at any given time. When activated, the chemicals within the implant are injected directly into the host's bloodstream."
	item = /obj/item/storage/box/syndie_kit/chem_storage_implant
	cost = 1
	surplus = 60

/datum/uplink_item/implants/kravmaga
	name = "Krav Maga Implant"
	desc = "A single sterile implanter containing a neural datachip containing extensive education of Krav Maga, an effective martial art. \
			Allows the user to 'toggle' knowledge over Krav Maga, allowing you to conceal the martial arts gained."
	item = /obj/item/storage/box/syndie_kit/krav_maga
	progression_minimum = 30 MINUTES
	cost = 12
	surplus = 10

/datum/uplink_item/implants/wasps
	name = "Wasp Revenge Implant"
	desc = "An implanter containing a special bluespace container that shall release 5 of our finest toxic specimens upon your death. \
			The implant does NOT expire upon death, and if revived will activate again upon your next death. \
			Works well as a final 'Fuck-you' to whoever killed you."
	item = /obj/item/storage/box/syndie_kit/waspimplant
	cost = 2
	surplus = 50
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/implants/waspsmacro
	name = "Macro Wasp Revenge Implant"
	desc = "An implanter containing a special bluespace container that shall release 20 of our finest toxic specimens upon your death. \
			The implant does NOT expire upon death, and if revived will activate again upon your next death. \
			Works EXCEPTIONALLY well as a final 'Fuck-you' to whoever killed you. Pray you get revived for maximum carnage."
	item = /obj/item/storage/box/syndie_kit/waspimplantmacro
	progression_minimum = 30 MINUTES
	cost = 8
	surplus = 10
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/implants/tesla
	name = "Flyzapper Implant"
	desc = "An implanter containing a special tesla coil which discharges biological lightning upon your death. \
			The implant does NOT expire upon death, and if revived will activate again upon your next death. \
			Electrocutes everyone nearby upon it's activation."
	item = /obj/item/storage/box/syndie_kit/teslaimplant
	cost = 2
	surplus = 50

/datum/uplink_item/implants/teslamacro
	name = "Macro Flyzapper Implant"
	desc = "An implanter containing a special tesla coil which discharges biological lightning upon your death. \
			The implant does NOT expire upon death, and if revived will activate again upon your next death. \
			Electrocutes everyone in a massive area around you upon it's activation, capable of killing people en-mass."
	item = /obj/item/storage/box/syndie_kit/teslaimplantmacro
	progression_minimum = 30 MINUTES
	cost = 8
	surplus = 10

/datum/uplink_item/implants/emp_shield
	name = "EMP Shield Implant"
	desc = "Developed by Cybersun to assist with the S.E.L.F. movement, this implant will protect you and your insides from electromagnetic interference. \
			Due to technical limitations, it will overload and shut down for a short time if triggered too often."
	item = /obj/item/storage/box/syndie_kit/emp_shield
	cost = 4
	surplus = 20
	progression_minimum = 10 MINUTES

/datum/uplink_item/implants/scram
	name = "Scram Implant"
	desc = "A two-use implant rigged with precision-based bluespace technology which will warp the user \
			somewhere nearby, but if the user is gravely injured it'll warp you somewhere safe. \
			Does not come with life insurance."
	item = /obj/item/storage/box/syndie_kit/scramimplant
	cost = 6
	surplus = 20

/datum/uplink_item/implants/tenacity
	name = "Tenacity Implant"
	desc = "An implant injected into the brain, and later activated automatically upon entering critical condition. \
			Prevents the host from collapsing from critical condition, thanks to the folks at Interdyne for their extensive research for this one."
	item = /obj/item/storage/box/syndie_kit/imp_tenacity
	cost = 12
	progression_minimum = 30 MINUTES
	cant_discount = TRUE // This thing is fucking POWERFUL, let's not potentially make it cheaper.
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/implants/mindhack
	name = "Mindhack Implant"
	desc = "A special implant developed by the Roseus Galactic Actors Guild in conjunction with Cybersun Industries, \
			this implant hijacks the target's mental functions, instilling a directive directly into the victim's psyche. \
			Those who are implanted will become convinced they are a Syndicate Agent, and that they are to protect and obey the implanter (hopefully you). \
			Brainwashing instilled by this implant cannot penetrate mindshields, but will persist should the mindshield be installed after the mindhack. \
			The implant will refresh the brainwashing after a short delay should it be removed by a Psychologist."
	item = /obj/item/storage/box/syndie_kit/imp_mindhack
	cost = 4
	surplus = 40
	progression_minimum = 10 MINUTES

/datum/uplink_item/implants/robusttec
	name = "R.O.B.U.S.T Implant"
	desc = "A special implant developed by Vahlen Pharmaceuticals, of which the design has reportedly been stolen by Nanotrasen. \
			The implant is designed to synthesize medicinal chemicals should the host be gravely injured. \
			After activation, the implant requires an estimated 100 seconds to recharge."
	item = /obj/item/storage/box/syndie_kit/imp_robusttec
	cost = 8
	surplus = 10
	progression_minimum = 20 MINUTES
