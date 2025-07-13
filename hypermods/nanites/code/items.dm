/obj/item/storage/box/disks_nanite
	name = "nanite program disks box"
	illustration = "disk_kit"

/obj/item/storage/box/disks_nanite/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/disk/nanite_program(src)

/obj/item/storage/box/disks_nanite/random
	name = "nanite program disks box"
	illustration = "disk_kit"

/obj/item/storage/box/disks_nanite/random/PopulateContents()
	var/list/types = subtypesof(/obj/item/disk/nanite_program/)
	for(var/i in 1 to 7)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/disks_nanite/syndicate
	name = "cybersun nanite program disks box"
	illustration = "disk_kit"

/obj/item/storage/box/disks_nanite/syndicate/PopulateContents()
	new /obj/item/disk/nanite_program/viral(src)
	new /obj/item/disk/nanite_program/spreading(src)
	new /obj/item/disk/nanite_program/nanite_sting(src)
	new /obj/item/disk/nanite_program/explosive(src)
	new /obj/item/disk/nanite_program/meltdown(src)
	new /obj/item/disk/nanite_program/pacifying(src)
	new /obj/item/disk/nanite_program/mind_control(src)

//Names are intentionally all the same - track your nanites, or use a hand labeler
//This also means that you can give flesh melting nanites to your victims if you feel like it

/obj/item/disk/nanite_program
	name = "nanite program disk"
	desc = "A disk capable of storing nanite programs. Can be customized using a Nanite Programming Console."
	icon = 'hypermods/nanites/icons/disk.dmi'
	icon_state = "nanite"
	///The program currently uploaded into the disk. If set to something, the disk will spawn with that program on mapload.
	var/datum/nanite_program/program

/obj/item/disk/nanite_program/Initialize(mapload)
	. = ..()
	if(program)
		program = new program

/obj/item/disk/nanite_program/examine(mob/user)
	. = ..()
	if(program) // because why aren't these labeled?
		. += "The digital footprint reads: [program.name]."

/obj/item/disk/nanite_program/aggressive_replication
	program = /datum/nanite_program/aggressive_replication

/obj/item/disk/nanite_program/metabolic_synthesis
	program = /datum/nanite_program/metabolic_synthesis

/obj/item/disk/nanite_program/viral
	program = /datum/nanite_program/viral

/obj/item/disk/nanite_program/meltdown
	program = /datum/nanite_program/meltdown

/obj/item/disk/nanite_program/emp
	program = /datum/nanite_program/emp

/obj/item/disk/nanite_program/spreading
	program = /datum/nanite_program/spreading

/obj/item/disk/nanite_program/regenerative
	program = /datum/nanite_program/regenerative

/obj/item/disk/nanite_program/regenerative_advanced
	program = /datum/nanite_program/regenerative_advanced

/obj/item/disk/nanite_program/temperature
	program = /datum/nanite_program/temperature

/obj/item/disk/nanite_program/purging
	program = /datum/nanite_program/purging

/obj/item/disk/nanite_program/purging_advanced
	program = /datum/nanite_program/purging_advanced

/obj/item/disk/nanite_program/brain_heal
	program = /datum/nanite_program/brain_heal

/obj/item/disk/nanite_program/brain_heal_advanced
	program = /datum/nanite_program/brain_heal_advanced

/obj/item/disk/nanite_program/blood_restoring
	program = /datum/nanite_program/blood_restoring

/obj/item/disk/nanite_program/nervous
	program = /datum/nanite_program/nervous

/obj/item/disk/nanite_program/hardening
	program = /datum/nanite_program/hardening

/obj/item/disk/nanite_program/coagulating
	program = /datum/nanite_program/coagulating

/obj/item/disk/nanite_program/necrotic
	program = /datum/nanite_program/necrotic

/obj/item/disk/nanite_program/brain_decay
	program = /datum/nanite_program/brain_decay

/obj/item/disk/nanite_program/pyro
	program = /datum/nanite_program/pyro

/obj/item/disk/nanite_program/cryo
	program = /datum/nanite_program/cryo

/obj/item/disk/nanite_program/toxic
	program = /datum/nanite_program/toxic

/obj/item/disk/nanite_program/suffocating
	program = /datum/nanite_program/suffocating

/obj/item/disk/nanite_program/heart_stop
	program = /datum/nanite_program/heart_stop

/obj/item/disk/nanite_program/explosive
	program = /datum/nanite_program/explosive

/obj/item/disk/nanite_program/shock
	program = /datum/nanite_program/shocking

/obj/item/disk/nanite_program/sleepy
	program = /datum/nanite_program/sleepy

/obj/item/disk/nanite_program/paralyzing
	program = /datum/nanite_program/paralyzing

/obj/item/disk/nanite_program/fake_death
	program = /datum/nanite_program/fake_death

/obj/item/disk/nanite_program/pacifying
	program = /datum/nanite_program/pacifying

/obj/item/disk/nanite_program/glitch
	program = /datum/nanite_program/glitch

/obj/item/disk/nanite_program/brain_misfire
	program = /datum/nanite_program/brain_misfire

/obj/item/disk/nanite_program/skin_decay
	program = /datum/nanite_program/skin_decay

/obj/item/disk/nanite_program/nerve_decay
	program = /datum/nanite_program/nerve_decay

/obj/item/disk/nanite_program/refractive
	program = /datum/nanite_program/refractive

/obj/item/disk/nanite_program/conductive
	program = /datum/nanite_program/conductive

/obj/item/disk/nanite_program/stun
	program = /datum/nanite_program/stun

/obj/item/disk/nanite_program/speech
	program = /datum/nanite_program/comm/speech

/obj/item/disk/nanite_program/voice
	program = /datum/nanite_program/comm/voice

/obj/item/disk/nanite_program/mind_control
	program = /datum/nanite_program/comm/mind_control


/obj/item/disk/nanite_program/kickstart
	program = /datum/nanite_program/protocol/kickstart

/obj/item/disk/nanite_program/factory
	program = /datum/nanite_program/protocol/factory

/obj/item/disk/nanite_program/tinker
	program = /datum/nanite_program/protocol/tinker

/obj/item/disk/nanite_program/offline
	program = /datum/nanite_program/protocol/offline

/obj/item/disk/nanite_program/hive
	program = /datum/nanite_program/protocol/hive

/obj/item/disk/nanite_program/zip
	program = /datum/nanite_program/protocol/zip

/obj/item/disk/nanite_program/free_range
	program = /datum/nanite_program/protocol/free_range

/obj/item/disk/nanite_program/unsafe_storage
	program = /datum/nanite_program/protocol/unsafe_storage

/obj/item/disk/nanite_program/health
	program = /datum/nanite_program/sensor/health

/obj/item/disk/nanite_program/damage
	program = /datum/nanite_program/sensor/damage

/obj/item/disk/nanite_program/crit
	program = /datum/nanite_program/sensor/crit

/obj/item/disk/nanite_program/death
	program = /datum/nanite_program/sensor/death

/obj/item/disk/nanite_program/voice
	program = /datum/nanite_program/sensor/voice

/obj/item/disk/nanite_program/species
	program = /datum/nanite_program/sensor/species

/obj/item/disk/nanite_program/defib
	program = /datum/nanite_program/defib

/obj/item/disk/nanite_program/good_mood
	program = /datum/nanite_program/good_mood

/obj/item/disk/nanite_program/bad_mood
	program = /datum/nanite_program/bad_mood

/obj/item/disk/nanite_program/self_scan
	program = /datum/nanite_program/self_scan

/obj/item/disk/nanite_program/dermal_button
	program = /datum/nanite_program/dermal_button

/obj/item/disk/nanite_program/stealth
	program = /datum/nanite_program/stealth

/obj/item/disk/nanite_program/nanite_sting
	program = /datum/nanite_program/nanite_sting

/obj/item/disk/nanite_program/mitosis
	program = /datum/nanite_program/mitosis

/obj/item/disk/nanite_program/flesh_eating
	program = /datum/nanite_program/flesh_eating

/obj/item/disk/nanite_program/poison
	program = /datum/nanite_program/poison

/obj/item/disk/nanite_program/memory_leak
	program = /datum/nanite_program/memory_leak

/obj/item/disk/nanite_program/adrenaline
	program = /datum/nanite_program/adrenaline

/obj/item/disk/nanite_program/mindshield // Risky handing this one to nukies
	program = /datum/nanite_program/mindshield


/obj/item/disk/nanite_program/research
	program = /datum/nanite_program/research

/obj/item/disk/nanite_program/accelerated_synthesis
	program = /datum/nanite_program/accelerated_synthesis

/obj/item/disk/nanite_program/construct_tool
	program = /datum/nanite_program/construct_tool

/obj/item/disk/nanite_program/convert_nanites
	program = /datum/nanite_program/convert_nanites

/obj/item/disk/nanite_program/construct_tool_adv
	program = /datum/nanite_program/construct_tool_adv

/obj/item/disk/nanite_program/construct_tool_super
	program = /datum/nanite_program/construct_tool_super

/obj/item/disk/nanite_program/bluespace_blood
	program = /datum/nanite_program/bluespace_blood

/obj/item/disk/nanite_program/botsummon
	program = /datum/nanite_program/botsummon

/obj/item/disk/nanite_program/researchplus
	program = /datum/nanite_program/researchplus

/obj/item/disk/nanite_program/deadchat
	program = /datum/nanite_program/deadchat

/obj/item/disk/nanite_program/bodily_augment
	program = /datum/nanite_program/bodily_augment

/obj/item/disk/nanite_program/sticky_fingers
	program = /datum/nanite_program/sticky_fingers

/obj/item/disk/nanite_program/metabolic_suppression
	program = /datum/nanite_program/metabolic_suppression

/obj/item/disk/nanite_program/extinguisher
	program = /datum/nanite_program/extinguisher

/obj/item/disk/nanite_program/painnull
	program = /datum/nanite_program/painnull

/obj/item/disk/nanite_program/antidismember
	program = /datum/nanite_program/antidismember

/obj/item/disk/nanite_program/antibomb
	program = /datum/nanite_program/antibomb

/obj/item/disk/nanite_program/slipresist
	program = /datum/nanite_program/slipresist

/obj/item/disk/nanite_program/magicshield
	program = /datum/nanite_program/magicshield

/obj/item/disk/nanite_program/hardiness
	program = /datum/nanite_program/hardiness

/obj/item/disk/nanite_program/antikpa
	program = /datum/nanite_program/antikpa

/obj/item/disk/nanite_program/antirad
	program = /datum/nanite_program/antirad

/obj/item/disk/nanite_program/antigrab
	program = /datum/nanite_program/antigrab

/obj/item/disk/nanite_program/weatherendure
	program = /datum/nanite_program/weatherendure

/obj/item/disk/nanite_program/obsidian
	program = /datum/nanite_program/obsidian

/obj/item/disk/nanite_program/plantlike
	program = /datum/nanite_program/plantlike

/obj/item/disk/nanite_program/limbtach
	program = /datum/nanite_program/limbtach

/obj/item/disk/nanite_program/pyramid
	program = /datum/nanite_program/protocol/pyramid

/obj/item/disk/nanite_program/eclipse
	program = /datum/nanite_program/protocol/eclipse

/obj/item/disk/nanite_program/collective
	program = /datum/nanite_program/protocol/collective

/obj/item/disk/nanite_program/backup
	program = /datum/nanite_program/protocol/backup

/obj/item/disk/nanite_program/blood_storage
	program = /datum/nanite_program/protocol/blood_storage

/obj/item/disk/nanite_program/emergency
	program = /datum/nanite_program/protocol/emergency

/obj/item/disk/nanite_program/stasis
	program = /datum/nanite_program/protocol/stasis

/obj/item/disk/nanite_program/freedom
	program = /datum/nanite_program/freedom

/obj/item/disk/nanite_program/construct_ammo
	program = /datum/nanite_program/construct_ammo

/obj/item/disk/nanite_program/construct_c4
	program = /datum/nanite_program/construct_c4
/** Best keep this outta nukie hands
/obj/item/disk/nanite_program/telecrystal
	program = /datum/nanite_program/telecrystal
**/
/obj/item/disk/nanite_program/kravmaga
	program = /datum/nanite_program/kravmaga

/obj/item/disk/nanite_program/suicidal
	program = /datum/nanite_program/suicidal

/obj/item/disk/nanite_program/organrepair
	program = /datum/nanite_program/organrepair

/obj/item/disk/nanite_program/corpsepreserve
	program = /datum/nanite_program/corpsepreserve

/obj/item/disk/nanite_program/critstable
	program = /datum/nanite_program/critstable

/obj/item/disk/nanite_program/naniteresus
	program = /datum/nanite_program/naniteresus

/obj/item/disk/nanite_program/synthflesh
	program = /datum/nanite_program/synthflesh

/obj/item/disk/nanite_program/mendingbrute
	program = /datum/nanite_program/mendingbrute

/obj/item/disk/nanite_program/mendingburn
	program = /datum/nanite_program/mendingburn

/obj/item/disk/nanite_program/mendingtoxin
	program = /datum/nanite_program/mendingtoxin

/obj/item/disk/nanite_program/selfresp
	program = /datum/nanite_program/selfresp

/obj/item/disk/nanite_program/repairingplus
	program = /datum/nanite_program/repairingplus

/obj/item/disk/nanite_program/woundfixer
	program = /datum/nanite_program/woundfixer

/obj/item/disk/nanite_program/alcoholic
	program = /datum/nanite_program/alcoholic

/obj/item/disk/nanite_program/weakness
	program = /datum/nanite_program/weakness

/obj/item/disk/nanite_program/neuraltrauma
	program = /datum/nanite_program/neuraltrauma

/obj/item/disk/nanite_program/braintrauma
	program = /datum/nanite_program/braintrauma

/obj/item/disk/nanite_program/lungdestruction
	program = /datum/nanite_program/lungdestruction
