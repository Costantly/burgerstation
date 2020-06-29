/obj/item/clothing/shirt/normal
	name = "shirt"
	icon = 'icons/obj/item/clothing/shirts/normal.dmi'

	item_slot = SLOT_TORSO

	defense_rating = list(
		BLADE = 15,
		BLUNT = 15,
		PIERCE = 15,
		MAGIC = 10,
		COLD = 25,
	)

	dyeable = TRUE

	polymorphs = list(
		"shirt" = COLOR_WHITE
	)

	value = 20


/obj/item/clothing/shirt/normal/striped
	name = "striped shirt"
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"stripes" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/uniform
	name = "uniformed shirt"
	polymorphs = list(
		"shirt" = COLOR_WHITE,
		"shoulders" = COLOR_BLACK
	)

/obj/item/clothing/shirt/normal/uniform/nanotrasen
	name = "nanotrasen uniformed shirt"
	polymorphs = list(
		"shirt" = COLOR_NANOTRASEN,
		"shoulders" = COLOR_WHITE
	)

/obj/item/clothing/shirt/normal/security
	name = "security shirt"
	polymorphs = list(
		"shirt" = COLOR_SECURITY_LIGHT,
	)

/obj/item/clothing/shirt/normal/engineering
	name = "engineering shirt"
	polymorphs = list(
		"shirt" = COLOR_ENGINEERING,
		"shoulders" = COLOR_VISIBLE_GREEN
	)

/obj/item/clothing/shirt/normal/medical
	name = "medical shirt"
	polymorphs = list(
		"shirt" = COLOR_MEDICAL_LIGHT
	)


/obj/item/clothing/shirt/normal/grey
	name = "assistant shirt"
	polymorphs = list(
		"shirt" = COLOR_GREY
	)