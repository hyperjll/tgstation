/datum/uplink_item/implants/emp
	name = "EMP Implant"
	desc = "A single implanter containing an EMP pulse implant. Useful to disrupt communications, \
			security's energy weapons and silicon lifeforms when you're in a tight spot. \
			Can be used 3 times, and will recharge 1 use every 5 minutes."
	item = /obj/item/storage/box/syndie_kit/imp_emp
	cost = 1

/datum/uplink_item/implants/emp/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		cost *= 3

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
			Can be used 3 times, will recharge 1 use every 10 minutes."
	item = /obj/item/storage/box/syndie_kit/adrenalineimplant
	cost = 7
	surplus = 15

/datum/uplink_item/implants/chemstorage
	name = "Chemical Storage Implant"
	desc = "A box containing a chemical storage implant case, an implanter, a syringe, and a beaker. You'll have to supply your own chemicals though. \
			To apply: inject chemicals (up to 100u) into the implant case using the syringe, then use the implanter to remove the implant and inject into target or yourself. \
			Targets can only have one of these implants at any given time. When activated, the chemicals within the implant are injected directly into the host's bloodstream."
	item = /obj/item/storage/box/syndie_kit/chem_storage_implant
	cost = 1
	surplus = 60

/datum/uplink_item/implants/binary
	name = "Internal Binary Radio Implant"
	desc = "An implant injected into the body, allowing the use of an internal Binary translating radio. \
			Used just like a regular headset, but can be disabled to use external headsets normally and to avoid detection."
	item = /obj/item/storage/box/syndie_kit/imp_binary
	cost = 7
	surplus = 60

/datum/uplink_item/implants/dnascramble
	name = "DNA Scrambler Implant"
	desc = "An implant injected into the body, allowing the user to scramble their DNA and appearance ONCE. \
			Comes bundled with integrated electronics designed to alter any identification cards the user may be wearing \
			to display their new name. Does NOT change your clothing or the ID's job assignment."
	item = /obj/item/storage/box/syndie_kit/imp_dnascramble
	cost = 5
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
			Does not come with life insurance. Will recharge 1 use every 5 minutes."
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
			Flashing the victim of this implant can restore it's brainwashing, useful against psychologists."
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

/datum/uplink_item/implants/violentpsychosis
	name = "Violent Psychosis Implant"
	desc = "An implant injected into the brain, it actively feeds the host's violent tendencies, causing a violent psychosis. \
			Those under the effects of this implant tend to fight in unpredictable ways."
	item = /obj/item/storage/box/syndie_kit/imp_violentpsychosis
	cost = 10
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/implants/camouflage
	name = "Camouflage Implant"
	desc = "An implant injected into the body and later activated at the request of the host, it projects a field of energy which \
			bends light around it. This field only covers the host, and due to technical limitations the field of energy isn't truely \
			'solid', thus light can still make it past the energy field. While not complete invisibility, it's still effective in keeping you hidden."
	item = /obj/item/storage/box/syndie_kit/imp_camo
	cost = 16
	progression_minimum = 30 MINUTES
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/implants/pseudodeath
	name = "Pseudo-Death Implant"
	desc = "A rarely used implant designed to fake your death upon sustaining too much damage while in critical condition. \
			After faking your death, you'll revive after a minute with most of the damage you've sustained mitigated. \
			Your body will become highly resistant to damage while 'dead'. Cannot revive you should you sustain enough damage to ACTUALLY die."
	item = /obj/item/storage/box/syndie_kit/imp_pseudodeath
	cost = 7
	surplus = 20

/datum/uplink_item/implants/imp_lifeformradar
	name = "Lifeform Detection Implants"
	desc = "A miniaturized lifeform detection device stashed within an implant that feeds information \
			directly into the host's brain. This allows the host to both use a crew monitor and \
			locate their fellow crew members via their suit sensors without any handheld clutter."
	item = /obj/item/storage/box/syndie_kit/imp_lifeformradar
	cost = 4
	surplus = 30

/datum/uplink_item/implants/imp_ling
	name = "Regenerate Implant"
	desc = "The pinnacle of the Tiger Cooperative and Cybersun Industries collaborative efforts on genetic engineering. \
			This implant after being injected into a host will synchronize with the host's DNA and build up a chemical reserve capable of rapidly \
			regenerating limbs and organs of the host in near instantaneous speeds. \
			Requires 10 minutes per charge, and can store up to 2 charges. Starts off with no charges."
	item = /obj/item/storage/box/syndie_kit/imp_ling
	cost = 4
	surplus = 30
	progression_minimum = 10 MINUTES
