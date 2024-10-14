/datum/uplink_category/surgical
	name = "Surgical Gadgets"
	weight = 6

/datum/uplink_item/surgical
	category = /datum/uplink_category/surgical


/datum/uplink_item/surgical/reusableautosurgeon
	name = "Syndicate Autosurgeon"
	desc = "A multi-use autosurgeon for surgically implanting whatever you want into yourself. \
			Works on both organs and cybernetics. Often useful for installing multiple of our cybernetics."
	item = /obj/item/autosurgeon/syndicate
	cost = 4

/datum/uplink_item/surgical/reusableautosurgeon/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		cost /= 2

/datum/uplink_item/surgical/cavitymanipulator
	name = "Cavity Manipulator"
	desc = "An autosurgeon specifically designed to implant items into one's torso cavity area. Can be used infinitely. \
			Cannot take items back out from one's cavity region, use with caution."
	item = /obj/item/cavitymanipulator
	cost = 4
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/regenerative
	name = "Regenerative Implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Allowing for slow recovery of all forms of damage. \
			Beware of health scanners, as constant supervision of your health may give you away. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/regenerativebetter/hidden/single_use
	cost = 8
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/syndiantidrop
	name = "Syndicate Anti-Drop Implant"
	desc = "An anti-drop implant which can be activated to bind whatever is in your hands TO YOUR HANDS, preventing disarms and any attempts to drop the item. \
			Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/anti_drop/hidden/single_use
	progression_minimum = 10 MINUTES
	cost = 4
	surplus = 10

/datum/uplink_item/surgical/reviver
	name = "Reviver Implant"
	desc = "This implant will attempt to revive and heal you if you lose consciousness, and can even repair your body and \
			defibrillate your heart should you perish. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/reviver/tenmincap/hidden/single_use
	cost = 6
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/syndiantistun
	name = "Syndicate CNS Rebooter Implant"
	desc = "A CNS Rebooter implant specifically designed to hide from medical scans of all kinds. When installed, it'll reduce the effectiveness of stuns upon the owner. \
			Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/anti_stun/hidden/single_use
	progression_minimum = 10 MINUTES
	cost = 6
	surplus = 40
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/syndisignaller
	name = "Signaler Implant"
	desc = "An hidden implant which can be activated to reveal a signaler. For the most devious of scenario-makers. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/signaler/hidden/single_use
	cost = 1
	surplus = 0

/datum/uplink_item/surgical/toolsets
	name = "Toolset Implants"
	desc = "A multisurgeon containing both an arm-concealed toolset implant and a surgical toolset. Comes with an autosurgeon."
	item = /obj/item/multisurgeon/toolsets
	cost = 6
	surplus = 30

/datum/uplink_item/surgical/esword
	name = "Hardlight Blade Implant"
	desc = "An autosurgeon containing a hardlight blade implant, has the same effectiveness as a energy sword but has no defensive abilities. \
			Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/esword/hidden/single_use
	progression_minimum = 30 MINUTES
	cost = 10
	surplus = 40

/datum/uplink_item/surgical/strength
	name = "S.A.E.M Implants"
	desc = "A multisurgeon containing two strong-arm empowered musculature implants. \
			These implants grant the arms of it's user increased punching power, increasing it's damage toward body and stamina. \
			Also knocks people around easily."
	item = /obj/item/multisurgeon/syndicate/strongarm/single_use
	progression_minimum = 10 MINUTES
	cost = 6
	surplus = 30

/datum/uplink_item/surgical/buster
	name = "Buster Arm Implants"
	desc = "A multisurgeon containing two buster-arm empowered musculature implants that double as grappling hooks. \
			These implants grant the arms of it's user increased punching power, increasing it's damage toward body and stamina greatly. \
			Also knocks people around easily and can cause them to crash harmfully into walls and people. \
			Activate the implant with nothing in hand to reveal a grappling hook capable of grabbing people and pulling them close, comes with two hooks."
	item = /obj/item/multisurgeon/syndicate/strongarm/buster/single_use
	progression_minimum = 30 MINUTES
	cost = 25
	surplus = 10
	purchasable_from = ~UPLINK_SPY // Letting this pass as a bounty would be hellish. Bounties ain't hard enough for this to be reasonably earned.

/datum/uplink_item/surgical/gasharpoon
	name = "Garsharpoon Implant"
	desc = "A heavily modified harpoon gun that automatically synthesizes incredibly sharp harpoons for ammunition. \
			Fits within your arm for easy concealment. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/gasharpoon/hidden/single_use
	progression_minimum = 20 MINUTES
	cost = 10
	surplus = 20

/datum/uplink_item/surgical/lifesupport
	name = "Life-Support Implants"
	desc = "A breathing tube and nutriment pump PLUS implant within one multisurgeon. You'll never have to eat or wear a mask again. Comes with an autosurgeon."
	item = /obj/item/multisurgeon/lifesupport
	cost = 3
	surplus = 20

/datum/uplink_item/surgical/medicalhud
	name = "Syndicate MedHUD Implant"
	desc = "A cybersun industries branded MedicalHUD implant, comes with a one-use autosurgeon for quick installation. Only one HUD implant can be installed per agent."
	item = /obj/item/autosurgeon/syndicate/contraband_medhud
	cost = 1
	surplus = 0

/datum/uplink_item/surgical/diagnostichud
	name = "Syndicate DiagnosticHUD Implant"
	desc = "A cybersun industries branded DiagnosticHUD implant, comes with a one-use autosurgeon for quick installation. Only one HUD implant can be installed per agent."
	item = /obj/item/autosurgeon/syndicate/contraband_diaghud
	cost = 1
	surplus = 0

/datum/uplink_item/surgical/securityhud
	name = "Syndicate SecHUD Implant"
	desc = "A cybersun industries branded SecurityHUD implant, comes with a one-use autosurgeon for quick installation. Only one HUD implant can be installed per agent."
	item = /obj/item/autosurgeon/syndicate/contraband_sechud
	cost = 2
	surplus = 10

/datum/uplink_item/surgical/flash
	name = "Photon Projector Implant"
	desc = "An arm-mounted flash, perfect for those pesky silicons in a pinch. The bulb will replace itself over time. \
			Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/flash/hidden/single_use
	progression_minimum = 10 MINUTES
	cost = 6
	surplus = 25

/datum/uplink_item/surgical/jumpshoes
	name = "Jumpshoes Implants"
	desc = "A pair of cybernetic jumpshoes for each leg, allows you to dash forward a short distance every 6 seconds. \
			Comes with a one-use multisurgeon."
	item = /obj/item/multisurgeon/jumpboots
	cost = 5
	surplus = 0

/datum/uplink_item/surgical/airshoes
	name = "Airshoes Implants"
	desc = "A pair of cybernetic airshoes for each leg, allows you to dash forward a medium distance every 4 seconds. \
			Comes with a one-use multisurgeon."
	item = /obj/item/multisurgeon/airshoes
	progression_minimum = 15 MINUTES
	cost = 8
	surplus = 40

/datum/uplink_item/surgical/noslipall
	name = "No-Slip Implants"
	desc = "A pair of highly advanced cybernetics which directly attach to the host's nervous system. \
			When the cybernetics detect the host is slipping, they'll quickly manipulate the host's muscles to avoid a fall. \
			Comes with a one-use multisurgeon."
	item = /obj/item/multisurgeon/noslipall
	progression_minimum = 20 MINUTES
	cost = 12
	surplus = 25

/datum/uplink_item/surgical/magboots
	name = "Magboots Implants"
	desc = "A pair of highly experimental magnetic cybernetics which are to be installed within the user's legs. \
			When installed, the host will be able to toggle the magnetics within the cybernetics, attaching to the floor as if they were wearing magboots. \
			Comes with a one-use multisurgeon."
	item = /obj/item/multisurgeon/magboots
	progression_minimum = 15 MINUTES
	cost = 8
	surplus = 10

/datum/uplink_item/surgical/mantis
	name = "G.O.R.L.E.X. Mantis Blade"
	desc = "One G.O.R.L.E.X Mantis blade implant able to be retracted inside your body at will for easy storage and concealing. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/syndie_mantis
	cost = 6
	surplus = 50
	purchasable_from = ~UPLINK_SPY
	progression_minimum = 5 MINUTES

/datum/uplink_item/surgical/makarov_implant
	name = "Makarov Arm implant"
	desc = "A modified version of the Makarov pistol placed inside of the forearm to allow for easy concealment. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/makarov_implant
	cost = 9
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/m1911_implant
	name = "M1911 Arm implant"
	desc = "A modified version of the M1911 pistol placed inside of the forearm to allow for easy concealment. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/m1911_implant
	cost = 8
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/deagle_implant
	name = "Desert Eagle Arm implant"
	desc = "A modified version of the Desert Eagle placed inside of the forearm to allow for easy concealment. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/deagle_implant
	cost = 12
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/viper_implant
	name = "Viper Arm implant"
	desc = "A modified version of the Viper pistol placed inside of the forearm to allow for easy concealment. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/viper_implant
	cost = 10
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/cobra_implant
	name = "Cobra Arm implant"
	desc = "A modified version of the Cobra pistol placed inside of the forearm to allow for easy concealment. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/cobra_implant
	progression_minimum = 5 MINUTES
	cost = 9
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/surgical/spinaloverclock
	name = "Neural Overclocker Implant"
	desc = "A spinal cord integrable implant that stimulates your central nervous system in order to enable you to perform muscle movements faster, resulting in (75%) faster movement and (35%) actions. \
			Overuse will inevitably result in irreversable bodily harm, ensure long periods of rest between uses. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/syndicate/spinalspeed
	cost = 14
	surplus = 0
	limited_stock = 1
	progression_minimum = 30 MINUTES

/datum/uplink_item/surgical/hammerimplant
	name = "Vxtvul Hammer Implant"
	desc = "An implant which will fold a Vxtvul hammer into your hands upon injection. \
			This hammer can be retracted and wielded in two hands as an effective armor-piercing weapon. \
			It can be charged by the user's concentration, which permits a single blow that will decimate construction, \
			fling bodies, and heavily damage mechs. Vir'ln krx'tai, lost one. Comes with an autosurgeon."
	cost = 16
	surplus = 5
	progression_minimum = 35 MINUTES
	item = /obj/item/autosurgeon/syndicate/syndie_hammer
