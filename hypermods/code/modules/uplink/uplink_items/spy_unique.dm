/datum/uplink_item/spy_unique/modsuitmodbundle
	name = "Box of MODsuit Modules"
	desc = "A box containing five random illegal MODsuit modules. Feeling lucky?"
	item = /obj/item/storage/box/syndie_kit/modsuitmodbundle
	cost = SPY_UPPER_COST_THRESHOLD - 1 // I'd like this to be in medium-diff bounties

/datum/uplink_item/spy_unique/xraygoggles
	name = "X-Ray Goggles"
	desc = "A single pair of X-Ray goggles, when worn they allow the wearer to see past any and all obstacles. Doesn't come with chameleon technology for stealth operations."
	item = /obj/item/clothing/glasses/thermal/xray
	cost = SPY_UPPER_COST_THRESHOLD

/datum/uplink_item/spy_unique/laserturret
	name = "Disposable Laser Turret"
	desc = "A beacon that summons a disposable heavy-laser turret to your location. \
			Makes for a decent distraction to cause chaos and can potentially kill several people before going down. \
			The turret won't shoot it's deployer, nor anyone clearly affiliated with the Syndicate."
	item = /obj/item/sbeacondrop/heavylaserturret
	cost = SPY_UPPER_COST_THRESHOLD - 5 // 7 TC
