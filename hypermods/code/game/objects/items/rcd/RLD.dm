/obj/item/construction/rld/borg // Thanks RCD code
	desc = "A device used to rapidly provide lighting sources to an area. Reload with iron, plasteel, glass or compressed matter cartridges."
	/// enery usage
	var/energyfactor = 0.072 * STANDARD_CELL_CHARGE

/obj/item/construction/rld/borg/get_matter(mob/user)
	if(!iscyborg(user))
		return 0
	var/mob/living/silicon/robot/borgy = user
	if(!borgy.cell)
		return 0
	max_matter = borgy.cell.maxcharge
	return borgy.cell.charge

/obj/item/construction/rld/borg/useResource(amount, mob/user)
	if(!iscyborg(user))
		return 0
	var/mob/living/silicon/robot/borgy = user
	if(!borgy.cell)
		if(user)
			balloon_alert(user, "no cell found!")
		return 0
	. = borgy.cell.use(amount * energyfactor) //borgs get 1.3x the use of their RCDs
	if(!. && user)
		balloon_alert(user, "insufficient charge!")
	return .

/obj/item/construction/rld/borg/checkResource(amount, mob/user)
	if(!iscyborg(user))
		return 0
	var/mob/living/silicon/robot/borgy = user
	if(!borgy.cell)
		if(user)
			balloon_alert(user, "no cell found!")
		return 0
	. = borgy.cell.charge >= (amount * energyfactor)
	if(!. && user)
		balloon_alert(user, "insufficient charge!")
	return .
