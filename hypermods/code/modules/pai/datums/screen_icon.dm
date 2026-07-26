// Datums describing an icon that is overlaid on a pAI card, to make its screen show something. The
// player can select between any of these at any time. These are usually faces, but can
// realistically be anything (similar to an AI's display).

/datum/pai_screen_image_syndicate
	// The name to show in the radial menu.
	var/name
	// The icon and icon state that is applied to the pAI device when this screen image is selected.
	var/icon/icon = 'hypermods/icons/obj/aicards.dmi'
	var/icon_state
	// The FontAwesome icon to use next to the "Display" button in the pAI's tgui interface window.
	var/interface_icon

/datum/pai_screen_image_syndicate/angry
	name = "Angry"
	icon_state = "spai-angry"
	interface_icon = "angry"

/datum/pai_screen_image_syndicate/cat
	name = "Cat"
	icon_state = "spai-cat"
	interface_icon = "cat"

/datum/pai_screen_image_syndicate/extremely_happy
	name = "Extremely Happy"
	icon_state = "spai-extremely-happy"
	interface_icon = "grin-beam"

/datum/pai_screen_image_syndicate/face
	name = "Face"
	icon_state = "spai-face"
	interface_icon = "grin-alt"

/datum/pai_screen_image_syndicate/happy
	name = "Happy"
	icon_state = "spai-happy"
	interface_icon = "smile"

/datum/pai_screen_image_syndicate/laugh
	name = "Laugh"
	icon_state = "spai-laugh"
	interface_icon = "grin-tears"

/datum/pai_screen_image_syndicate/neutral
	name = "Neutral"
	icon_state = "spai-null"
	interface_icon = "meh"

/datum/pai_screen_image_syndicate/off
	name = "None"
	icon_state = "spai-off"
	interface_icon = "meh-blank"

/datum/pai_screen_image_syndicate/sad
	name = "Sad"
	icon_state = "spai-sad"
	interface_icon = "sad-cry"

/datum/pai_screen_image_syndicate/sunglasses
	name = "Sunglasses"
	icon_state = "spai-sunglasses"
	interface_icon = "sun"

/datum/pai_screen_image_syndicate/what
	name = "What"
	icon_state = "spai-what"
	interface_icon = "frown-open"
