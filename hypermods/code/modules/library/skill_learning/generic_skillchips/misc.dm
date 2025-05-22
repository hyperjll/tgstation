/obj/item/skillchip/tipsoftheround
	name = "T1pp3R skillchip"
	auto_traits = list()
	skill_name = "Globalized Tip-o-pedia"
	skill_description = "Connects you directly to some kind of 4th-wall-breaking tip website, where the tips go, are anyone's guess."
	skill_icon = FA_ICON_GLOBE
	activate_message = span_notice("You feel something tab within your brain as a garbled mess of information fills your head.")
	deactivate_message = span_notice("You feel the garbled information leave your head, you feel... relieved.")

	actions_types = list(/datum/action/cooldown/tipsoftheround)

/datum/action/cooldown/tipsoftheround
	name = "Send Tip"
	desc = "Untangle something from the tip-pedia to announce."
	button_icon = 'hypermods/icons/hud/actions.dmi'
	button_icon_state = "tip"
	cooldown_time = 60 SECONDS

/datum/action/cooldown/tipsoftheround/Activate(atom/target_atom)
	. = ..()
	send_tip_of_the_round(owner, pick(GLOB.global_tips), source = "Tippedia")
