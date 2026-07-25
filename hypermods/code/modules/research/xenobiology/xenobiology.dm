/obj/item/slimepotion/sentience/traitor
	name = "syndicate intelligence potion"
	desc = "A miraculous chemical mix that grants human like intelligence to living beings. It has been modified with Syndicate technology to also grant an internal radio implant to the target and authenticate with identification systems."

/obj/item/slimepotion/sentience/traitor/after_success(mob/living/user, mob/living/smart_mob)
	var/obj/item/implant/radio/syndicate/imp = new(src)
	imp.implant(smart_mob, user)
	smart_mob.AddComponent(/datum/component/simple_access, list(ACCESS_SYNDICATE, ACCESS_MAINT_TUNNELS))
