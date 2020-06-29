/obj/item/container/food/dynamic/fish
	name = "fish"
	icon = 'icons/obj/item/consumable/food/meat.dmi'
	icon_state = "fish"
	crafting_id = "fish"

	health = /health/obj/item/misc/

	scale_sprite = FALSE

/obj/item/container/food/dynamic/fish/update_icon()

	var/total_raw = 0
	var/total_cooked = 0

	var/best_meat
	var/best_meat_volume

	for(var/reagent_type in reagents.stored_reagents)
		var/amount = reagents.stored_reagents[reagent_type]
		var/reagent/R = REAGENT(reagent_type)

		if(R.flags_reagent & FLAG_REAGENT_COOKED)
			total_cooked += amount
			if(!best_meat || amount > best_meat_volume)
				best_meat = reagent_type
				best_meat_volume = amount

		else if(R.flags_reagent & FLAG_REAGENT_RAW)
			total_raw += amount
			if(!best_meat || amount > best_meat_volume)
				best_meat = reagent_type
				best_meat_volume = amount

	if(!best_meat)
		return ..()

	icon = initial(icon)

	var/icon/I = new/icon(icon,icon_state)
	var/reagent/RM = REAGENT(best_meat)
	I.Blend(RM.color,ICON_MULTIPLY)

	if(RM.flags_reagent & FLAG_REAGENT_COOKED)
		var/icon/I3 = new/icon(icon,"grill_marks")
		var/icon/I4 = new/icon(I)
		I4.Blend(rgb(0,0,0,200),ICON_MULTIPLY)
		I3.Blend(I4,ICON_ADD)
		I.Blend(I3,ICON_OVERLAY)

	icon = I

	return ..()