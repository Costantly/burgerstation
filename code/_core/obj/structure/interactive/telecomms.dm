var/global/list/all_telecomms = list()

/obj/structure/interactive/telecomms
	name = "telecommunications system"
	desc = "The complexity of a communications setup packed into one easy package!"
	icon = 'icons/obj/structure/telecomms.dmi'
	icon_state = "comm_server"

	var/list/queued_data = list()

	var/list/broadcasting_areas = list()

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#0000FF"

/obj/structure/interactive/telecomms/PreDestroy()

	for(var/k in broadcasting_areas)
		remove_telecomm(k)

	. = ..()

/obj/structure/interactive/telecomms/proc/add_telecomm(var/area_identifier)

	if(!all_telecomms[area_identifier])
		all_telecomms[area_identifier] = list()

	all_telecomms[area_identifier] += src
	broadcasting_areas[area_identifier] = TRUE

	return TRUE

/obj/structure/interactive/telecomms/proc/remove_telecomm(var/area_identifier)

	if(!all_telecomms[area_identifier])
		all_telecomms[area_identifier] = list()
		return TRUE

	all_telecomms[area_identifier] -= src
	broadcasting_areas -= area_identifier

	return TRUE


/obj/structure/interactive/telecomms/proc/add_data(var/data_identifier,var/list/data_to_add)
	ASSERT(data_identifier)
	ASSERT(data_to_add)
	queued_data[data_identifier] = data_to_add
	return TRUE


/obj/structure/interactive/telecomms/proc/process_all_data()
	for(var/id in queued_data)
		var/v = queued_data[id]
		if(!process_data(v))
			log_error("Warning! [src.get_debug_name()] couldn't be processed! Breaking!")
			break
	queued_data.Cut()
	return TRUE

/obj/structure/interactive/telecomms/proc/process_data(var/list/data_to_process = list())

	for(var/k in SSradio.all_radios)
		CHECK_TICK_SAFE(75,FPS_SERVER)
		var/obj/item/device/radio/R = k
		if(!R || R.qdeleting)
			SSradio.all_radios -= k
			continue
		if(R.frequency != data_to_process["frequency"] && !R.listening_frequencies["[data_to_process["frequency"]]"])
			continue
		var/area/A = get_area(R)
		if(!A)
			log_error("Warning: Tried processing radio data for [R.get_debug_name()], but it didn't have a valid area! (loc: [R.loc])")
			continue
		if(!A.area_identifier || !broadcasting_areas[A.area_identifier])
			continue
		use_ears(
			data_to_process["speaker"],
			R,
			data_to_process["text_to_say"],
			data_to_process["raw_text_to_say"],
			data_to_process["language_text_to_say"],
			data_to_process["text_type"],
			data_to_process["frequency"],
			data_to_process["language"],
			data_to_process["talk_range"],
			R.broadcasting_range
		)

	return TRUE


/obj/structure/interactive/telecomms/station
	name = "station telecomms system"

/obj/structure/interactive/telecomms/station/Initialize()
	add_telecomm("Burgerstation")
	add_telecomm("Mission")
	add_telecomm("Central Command")
	add_telecomm("Fallback")
	. = ..()

/*
/obj/structure/interactive/telecomms/process_data(var/list/data_to_process = list()) //Meme shitcode.

	. = ..()

	if(. && SStelecomm_trigger.stored_trigger && data_to_process["text_to_say"] && SStelecomm_trigger.stored_trigger.check_trigger(data_to_process["text_to_say"]))
		SStelecomm_trigger.stored_trigger.trigger()
		qdel(SStelecomm_trigger.stored_trigger)
		SStelecomm_trigger.stored_trigger = null
*/

/obj/structure/interactive/telecomms/vr

/obj/structure/interactive/telecomms/vr/Initialize()
	add_telecomm("Virtual Reality")
	. = ..()

