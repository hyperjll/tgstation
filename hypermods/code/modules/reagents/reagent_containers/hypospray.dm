/obj/item/reagent_containers/hypospray/buyable
	name = "civilian hypospray"
	icon_state = "combat_hypo"
	inhand_icon_state = "combat_hypo"
	worn_icon_state = "hypo"

/obj/item/reagent_containers/hypospray/hacked
	name = "civilian hypospray"
	icon_state = "combat_hypo"
	inhand_icon_state = "combat_hypo"
	worn_icon_state = "hypo"
	volume = 80
	possible_transfer_amounts = list(1,3,5,30)

/obj/item/reagent_containers/hypospray/gorlex
	name = "gorlex hypospray"
	desc = "The Vahlen Pharmaceuticals hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to fellow operatives."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	inhand_icon_state = "gorlex"
	worn_icon_state = "gorlex"
	lefthand_file = 'hypermods/icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/equipment/medical_righthand.dmi'
	icon_state = "gorlex"
	volume = 80
	ignore_flags = 1 // So they can heal their comrades.
	possible_transfer_amounts = list(1,3,5,10,20,30)
	list_reagents = list(/datum/reagent/medicine/omnizine = 30, /datum/reagent/medicine/stimulants = 30, /datum/reagent/medicine/coagulant/tranexamicacid  = 10, /datum/reagent/medicine/hyronalin = 10)



/obj/item/reagent_containers/hypospray/medipen/limborganregen
	name = "changeling extract medipen"
	desc = "Contains a very large amount of an incredibly powerful regenerative chemical. Results in near instantaneous regrowth of missing limbs and organs."
	icon_state = "syndipen"
	inhand_icon_state = "tbpen"
	base_icon_state = "syndipen"
	volume = 1
	amount_per_transfer_from_this = 1
	list_reagents = list(/datum/reagent/medicine/changelingextract = 1)

/obj/item/reagent_containers/hypospray/medipen/resurrector
	name = "resurrector nanite serum"
	desc = "A single-use superdose of nanites capable of restoring a corpse to perfect working very quickly. Does nothing on a living person."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "resurrector"
	base_icon_state = "resurrector"
	list_reagents = list(/datum/reagent/medicine/resurrector_nanites = 1)

/obj/item/reagent_containers/hypospray/medipen/resurrector/attack(mob/living/M, mob/user)
	if(!reagents.total_volume)
		to_chat(user, span_warning("[src] is empty!"))
		return
	if(do_after(user, 3 SECONDS, M))
		..()


/obj/item/reagent_containers/hypospray/medipen/syndicatevirus
	name = "syndicate virus medipen"
	desc = "An autoinjector containing a highly advanced medical virus."
	icon_state = "syndipen"
	inhand_icon_state = "medipen"
	base_icon_state = "syndipen"
	amount_per_transfer_from_this = 5
	volume = 5
	list_reagents = list(/datum/reagent/blood = 5)
	spawned_disease = /datum/disease/advance/supersyndicate


/obj/item/reagent_containers/hypospray/medipen/spacepen
	name = "space medipen"
	desc = "Contains a moderate amount of barozine to prevent pressure damage, and leporazine to prevent temperature damage. Use in moderation."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpen"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpen"
	volume = 30
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/barozine = 15, /datum/reagent/medicine/leporazine = 15)

/obj/item/reagent_containers/hypospray/medipen/formaldehyde
	name = "formaldehyde medipen"
	desc = "An autoinjector containing formaldehyde, used to preserve corpses in a pinch."
	icon_state = "medipen"
	inhand_icon_state = "medipen"
	base_icon_state = "medipen"
	list_reagents = list(/datum/reagent/toxin/formaldehyde = 10)
	custom_premium_price = 30

/obj/item/reagent_containers/hypospray/medipen/arithrazine
	name = "arithrazine medipen"
	desc = "An autoinjector containing arithrazine, used to quickly purge radiaton at the cost of inflicting brute damage."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenari"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenari"
	list_reagents = list(/datum/reagent/medicine/arithrazine = 10)
	custom_price = 50
	custom_premium_price = 100

/obj/item/reagent_containers/hypospray/medipen/bicaridine
	name = "bicaridine medipen"
	desc = "An autoinjector containing bicaridine, used to quickly heal all forms of brute damage."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenbic"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenbic"
	list_reagents = list(/datum/reagent/medicine/bicaridine = 10)
	custom_price = 50
	custom_premium_price = 100

/obj/item/reagent_containers/hypospray/medipen/dermaline
	name = "dermaline medipen"
	desc = "An autoinjector containing dermaline, used to quickly heal all forms of burn damage."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpender"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpender"
	list_reagents = list(/datum/reagent/medicine/dermaline = 8)
	custom_price = 50
	custom_premium_price = 100

/obj/item/reagent_containers/hypospray/medipen/hyronalin
	name = "hyronalin medipen"
	desc = "An autoinjector containing hyronalin, used to cure radiation."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenhyv"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenhyv"
	volume = 15
	list_reagents = list(/datum/reagent/medicine/hyronalin = 15)
	custom_price = 25
	custom_premium_price = 50

/obj/item/reagent_containers/hypospray/medipen/morphine
	name = "morphine medipen"
	desc = "An autoinjector containing morphine, used to quickly stabilize someone in critical condition. Acts as a decent painkiller."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenmor"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenmor"
	list_reagents = list(/datum/reagent/medicine/morphine = 10)
	custom_price = 25
	custom_premium_price = 50

/obj/item/reagent_containers/hypospray/medipen/penthrite/better
	name = "penthrite autoinjector"
	desc = "Experimental heart medication."
	icon_state = "atropen"
	inhand_icon_state = "atropen"
	base_icon_state = "atropen"
	list_reagents = list(/datum/reagent/medicine/c2/penthrite = 30)

/obj/item/reagent_containers/hypospray/medipen/combatmedicine
	name = "combat medical medipen"
	desc = "An autoinjector containing omnizine and tranexamic acid, used to heal all types of damage in the thick of battle."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpen"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpen"
	volume = 30
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/omnizine = 25, /datum/reagent/medicine/coagulant/tranexamicacid = 5)

/obj/item/reagent_containers/hypospray/medipen/donkcostim
	name = "donk co. stimpack"
	desc = "Contains six doses of various donk co. sponsored chemicals, symptoms include: faster brain and motor ability, healing, respiration, temperature stabilization, stun resistance, and temporary blood restoration."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancysyndistimpen"
	inhand_icon_state = "medipen"
	base_icon_state = "fancysyndistimpen"
	volume = 90
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/drug/syndimethamphetamine = 15, /datum/reagent/medicine/omnizine = 15, /datum/reagent/medicine/salbutamol = 15, /datum/reagent/medicine/salglu_solution = 15, /datum/reagent/medicine/synaptizine = 15, /datum/reagent/medicine/teporone = 15)

/obj/item/reagent_containers/hypospray/medipen/juggernaut
	name = "juggernaut stimpack"
	desc = "Contains three doses of juggernaut, a specialized combat chemical which nullifies pain and reduces incoming damage."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenmacrostim"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenmacrostim"
	volume = 60
	amount_per_transfer_from_this = 20
	list_reagents = list(/datum/reagent/medicine/juggernaut = 60)

/obj/item/reagent_containers/hypospray/medipen/hyperzine
	name = "hyperzine injector"
	desc = "Contains one dose of hyperzine, an effective fast-acting restorative stimulant. Ensure proper injection procedures are taken."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "hyperzinepen"
	inhand_icon_state = "medipen"
	base_icon_state = "hyperzinepen"
	volume = 30
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/hyperzine = 30)

/obj/item/reagent_containers/hypospray/medipen/hyperzinemicro
	name = "hyperzine micro-injector"
	desc = "Contains one dose of hyperzine, an effective fast-acting restorative stimulant. Ensure proper injection procedures are taken."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "hyperzinepen"
	inhand_icon_state = "medipen"
	base_icon_state = "hyperzinepen"
	volume = 15
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/hyperzine = 15)

/obj/item/reagent_containers/hypospray/medipen/cardiaccs
	name = "cardiac combi-stimpack"
	desc = "Contains ten doses of epinephrine and saline-glucose solution, giving 2.5 units of each every time it's used."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenmacrostim"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenmacrostim"
	volume = 50
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/epinephrine  = 25, /datum/reagent/medicine/salglu_solution = 25)

/obj/item/reagent_containers/hypospray/medipen/bloodlosscs
	name = "bloodloss combi-stimpack"
	desc = "Contains ten doses of filgrastim and proconvertin, giving 2.5 units of each every time it's used."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenmacrostim"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenmacrostim"
	volume = 50
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/filgrastim = 25, /datum/reagent/medicine/coagulant/proconvertin = 25)

/obj/item/reagent_containers/hypospray/medipen/lifesupportcs
	name = "lifesupport combi-stimpack"
	desc = "Contains ten doses of salbutamol and mannitol, giving 2.5 units of each every time it's used."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "fancymedpenmacrostim"
	inhand_icon_state = "medipen"
	base_icon_state = "fancymedpenmacrostim"
	volume = 50
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/salbutamol = 25, /datum/reagent/medicine/mannitol = 25)

/obj/item/reagent_containers/hypospray/medipen/lethaldose
	name = "epinephrine medipen"
	desc = "A rapid and safe way to stabilize patients in critical condition for personnel without advanced medical knowledge. Contains a powerful preservative that can delay decomposition when applied to a dead body, and stop the production of histamine during an allergic reaction."
	icon_state = "medipen"
	inhand_icon_state = "medipen"
	base_icon_state = "medipen"
	volume = 50
	amount_per_transfer_from_this = 50
	list_reagents = list(/datum/reagent/medicine/epinephrine = 10, /datum/reagent/toxin/venom = 10, /datum/reagent/toxin/cyanide = 10, /datum/reagent/toxin/fentanyl = 10, /datum/reagent/toxin/coniine = 10,)

/obj/item/reagent_containers/hypospray/medipen/pacify
	name = "pacification medipen"
	desc = "A rapid way to dispense chemicals specifically meant for subduing someone quickly and temporarily."
	icon_state = "medipen"
	inhand_icon_state = "medipen"
	base_icon_state = "medipen"
	volume = 45
	amount_per_transfer_from_this = 45
	list_reagents = list(/datum/reagent/toxin/mutetoxin = 20, /datum/reagent/pax = 20, /datum/reagent/toxin/staminatoxin = 5)

/obj/item/reagent_containers/hypospray/medipen/chemkillswitch
	name = "chemical kill-switch injector"
	desc = "A medipen loaded with a specialized nanite virus. The nanites take roughly 5 minutes before activation. Upon activation, the nanites will cause MASSIVE Toxin and Brute damage to the victim, guaranteeing the destruction of several organs and instant death. Should the nanites be depleted earlier, the damage can be lessened."
	icon_state = "medipen"
	inhand_icon_state = "medipen"
	base_icon_state = "medipen"
	volume = 60
	amount_per_transfer_from_this = 60
	list_reagents = list(/datum/reagent/toxin/nanitedestroyers = 60)

/obj/item/reagent_containers/hypospray/medipen/restorationnaniteinjector
	name = "restoration nanite injector"
	desc = "Contains a moderate amount of an incredibly powerful chemical agent, quickly healing all-forms of damage."
	icon_state = "syndipen"
	inhand_icon_state = "medipen"
	base_icon_state = "syndipen"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = list(/datum/reagent/medicine/healingnanites = 20)

/obj/item/reagent_containers/hypospray/medipen/experistimulants
	name = "experimental stimulant injector"
	desc = "Contains a moderate amount of an experimental stimulant."
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "expstimpen"
	inhand_icon_state = "medipen"
	base_icon_state = "expstimpen"
	volume = 25
	amount_per_transfer_from_this = 25
	list_reagents = list(/datum/reagent/medicine/experimentalstimulants = 25)

/obj/item/reagent_containers/hypospray/medipen/invisibility
	desc = "An autoinjector containing a stabilized Saturn-X compound. Causes the user to become invisible for a limited time, clothes will NOT become invisible."
