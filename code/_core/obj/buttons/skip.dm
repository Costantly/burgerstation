/obj/button/skip
	name = "skip cutscene"
	desc = "I PUT EFFORT INTO THESE."
	desc_extended = "Skips the current cutscene."
	icon_state = "sneak_0"
	screen_loc = "RIGHT,BOTTOM"

	var/sneaking = 0

	flags = FLAGS_HUD_SPECIAL


/obj/button/skip/clicked_by_object(var/mob/caller,object,location,control,params)
	caller.skip_cutscene = TRUE
	return ..()
