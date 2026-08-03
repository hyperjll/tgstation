/obj/item/cigarette/interdyne
	desc = "An interdyne brand cigarette."
	chem_volume = 60
	smoketime = 2 MINUTES
	smoke_all = TRUE
	lung_harm = 0.2
	list_reagents = list(/datum/reagent/drug/nicotine = 7.5, /datum/reagent/drug/nicotwaine = 2.5, /datum/reagent/medicine/omnizine = 5, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/drug/happiness = 15, /datum/reagent/drug/opium = 10, /datum/reagent/medicine/ultravasculine = 2, /datum/reagent/medicine/mannitol = 3)

/obj/item/cigarette/interdyne/smoke_in_face(mob/living/getting_smoked)
	. = ..()
	getting_smoked.adjust_eye_blur(6 SECONDS)
	getting_smoked.adjust_temp_blindness(2 SECONDS)

/obj/item/cigarette/cigar/interdyne
	smoketime = 6 MINUTES
	smoke_all = TRUE
	chem_volume = 120
	lung_harm = 0.2
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/drug/nicotwaine = 5, /datum/reagent/medicine/omnizine = 30, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/drug/happiness = 30, /datum/reagent/drug/opium = 15, /datum/reagent/medicine/ultravasculine = 2.5, /datum/reagent/medicine/ambuzol = 5, /datum/reagent/medicine/mannitol = 7.5)
	choke_time_max = 30 SECONDS

/obj/item/cigarette/cigar/security
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 25, /datum/reagent/drug/opium = 5, /datum/reagent/medicine/dylovene = 5)

/obj/item/cigarette/cigar/payload
	smoke_all = TRUE
	chem_volume = 300

/obj/item/cigarette/placebo
	smoke_all = TRUE
	list_reagents = null

/obj/item/cigarette/cigar/placebo
	smoke_all = TRUE
	list_reagents = null

// Dan's soaked rejects

/obj/item/cigarette/slept_past_alarm
	name = "slept past alarm"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/tazinide = 10)

/obj/item/cigarette/rollbacks
	name = "rollbacks"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/cryostylane = 5, /datum/reagent/toxin/chloralhydrate = 10)

/obj/item/cigarette/cruise_chaser
	name = "cruise chaser"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/cryostylane = 5, /datum/reagent/medicine/stimulants = 5)

/obj/item/cigarette/performance_art
	name = "performance art"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/consumable/laughter = 5, /datum/reagent/inverse/bicaridine = 10)

/obj/item/cigarette/passion_of_love
	name = "passion of love"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/phlogiston = 5, /datum/reagent/clf3 = 5)

/obj/item/cigarette/on_second_thought
	name = "on second thought"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/toxin/mutetoxin = 15)

/obj/item/cigarette/big_city_slugger
	name = "big city slugger"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/lead = 15)

/obj/item/cigarette/banana_scented
	name = "banana scented"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/consumable/banana = 10, /datum/reagent/consumable/nutriment/peptides = 5)

/obj/item/cigarette/super_powered
	name = "super powered"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/nicotwaine = 5, /datum/reagent/medicine/stimulants = 7.5, /datum/reagent/toxin/heartbreaker = 7.5)

/obj/item/cigarette/say_cheese
	name = "say cheese"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/drug/vasopressin = 10, /datum/reagent/inverse/hercuri = 10)

/obj/item/cigarette/anarcho_primitivist
	name = "anarcho primitivist"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/emp_powder = 10, /datum/reagent/toxin/muscleparalyzers = 5, /datum/reagent/impurity/methanol = 5)

/obj/item/cigarette/botanists_folly
	name = "botanist's folly"
	desc = "An odd-looking cigarette."
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/toxin/plantbgone/weedkiller = 5, /datum/reagent/plantnutriment/speedgrow = 5, /datum/reagent/glue = 10)

// Trick cigs

/obj/item/cigarette/syndicate/explosive
	chem_volume = 5
	smoketime = 1 MINUTES
	list_reagents = list(/datum/reagent/drug/nicotine = 5)

/obj/item/cigarette/syndicate/explosive/put_out(mob/user, done_early = FALSE)
	explosion(src.loc,1,1,2,flame_range = 3)
	qdel(src)
	src.visible_message("<span class='alert'>The [src] explodes!</span>")

// Dermal hardening cigs

/obj/item/cigarette/syndicate/dermalharden
	desc = "A Robust brand cigarette."
	chem_volume = 20
	smoketime = 2 MINUTES
	dragtime = 6 SECONDS
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/dermalnanites = 20)

// Special healing cigs

/obj/item/cigarette/syndicate/space_cigarette_pen_acid
	desc = "A Space brand cigarette that can be smoked anywhere."
	chem_volume = 35
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/pen_acid = 20, /datum/reagent/medicine/silibinin = 10, /datum/reagent/medicine/oculine = 3, /datum/reagent/medicine/mannitol = 2)

/obj/item/cigarette/syndicate/dromedary_oxandrolone
	desc = "A DromedaryCo brand cigarette. Contrary to popular belief, does not contain Calomel, but is reported to have a watery taste."
	chem_volume = 30
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/oxandrolone = 20, /datum/reagent/water = 5, /datum/reagent/medicine/oculine = 3, /datum/reagent/medicine/mannitol = 2)

/obj/item/cigarette/syndicate/uplift_salbutamol
	desc = "An Uplift Smooth brand cigarette. Smells refreshing."
	chem_volume = 25
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/salbutamol = 20, /datum/reagent/medicine/oculine = 3, /datum/reagent/medicine/mannitol = 2)

/obj/item/cigarette/syndicate/robust_sal_acid
	desc = "A Robust brand cigarette."
	chem_volume = 30
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/sal_acid = 20, /datum/reagent/medicine/coagulant = 5, /datum/reagent/medicine/oculine = 3, /datum/reagent/medicine/mannitol = 2)

/obj/item/cigarette/syndicate/deluxe_antibrute_cigarette_pack
	desc = "It has a rather bitter smell."
	chem_volume = 35
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/sal_acid = 20, /datum/reagent/medicine/coagulant = 5)

/obj/item/cigarette/syndicate/deluxe_antiburn_cigarette_pack
	desc = "It smells... ashy."
	chem_volume = 30
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/oxandrolone = 20)

/obj/item/cigarette/syndicate/deluxe_antioxygen_cigarette_pack
	desc = "It has a refreshing scent."
	chem_volume = 30
	smoketime = 2 MINUTES
	smoke_all = TRUE
	dragtime = 0.15
	list_reagents = list(/datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/salbutamol = 10, /datum/reagent/medicine/epinephrine = 10)

/obj/item/cigarette/syndicate/deluxe_antitoxin_cigarette_pack
	desc = "Smells like chlorine."
	chem_volume = 30
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/pen_acid = 10, /datum/reagent/medicine/silibinin = 10)

/obj/item/cigarette/syndicate/deluxe_speedup_cigarette_pack
	desc = "The innards of the cigarette sparkle a silver color."
	chem_volume = 40
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 5, /datum/reagent/medicine/ephedrine = 25, /datum/reagent/drug/methamphetamine = 10)

/obj/item/cigarette/syndicate/deluxe_cureall_cigarette_pack
	desc = "The cigarette is strangely silky."
	chem_volume = 35
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 6, /datum/reagent/medicine/sal_acid = 6, /datum/reagent/medicine/oxandrolone = 6, /datum/reagent/medicine/salbutamol = 6, /datum/reagent/medicine/pen_acid = 6, /datum/reagent/medicine/coagulant = 5)

/obj/item/cigarette/syndicate/deluxe_sensory_cigarette_pack
	desc = "The cigarette is tough to crush."
	chem_volume = 40
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/oculine = 10, /datum/reagent/medicine/mannitol = 10, /datum/reagent/medicine/inacusiate = 10)

/obj/item/cigarette/syndicate/deluxe_strange_cigarette_pack
	desc = "It feels... mysterious."
	chem_volume = 80
	smoketime = 3 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/omnizine = 5, /datum/reagent/medicine/rezadone = 5, /datum/reagent/medicine/leporazine = 5, /datum/reagent/medicine/strange_reagent = 20, /datum/reagent/medicine/epinephrine = 10, /datum/reagent/toxin/formaldehyde = 5, /datum/reagent/toxin/histamine = 30)

/obj/item/cigarette/syndicate/deluxe_slimey_cigarette_pack
	desc = "It's slimey, both in taste and smell!"
	chem_volume = 35
	smoketime = 2 MINUTES
	smoke_all = TRUE
	list_reagents = list(/datum/reagent/medicine/regen_jelly = 30, /datum/reagent/medicine/coagulant = 5)
