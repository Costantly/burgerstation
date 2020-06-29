/obj/item/weapon/ranged/bullet/magazine/pistol/high_power
	name = "10mm NT Penetrator Pistol"
	desc = "For when 9mm isn't big enough."
	desc_extended = "The 10mm NanoTrasen Pistol is a more advanced pistol for a more advanced user. While the recoil and weight is a little hard to manage, an expert with this gun can do some serious damage."
	icon = 'icons/obj/item/weapons/ranged/pistol/10mm_nt.dmi'
	icon_state = "inventory"
	value = 110

	shoot_delay = 2

	automatic = FALSE

	shoot_sounds = list('sound/weapons/10/shoot.ogg')

	can_wield = FALSE

	view_punch = 8

	slowdown_mul_held = HELD_SLOWDOWN_PISTOL

	size = SIZE_2
	weight = WEIGHT_3

	heat_per_shot = 0.02
	heat_max = 0.12

	bullet_length_min = 25
	bullet_length_best = 32
	bullet_length_max = 33

	bullet_diameter_min = 10
	bullet_diameter_best = 10.17
	bullet_diameter_max = 11

/obj/item/weapon/ranged/bullet/magazine/pistol/high_power/get_static_spread() //Base spread
	return 0.0025

/obj/item/weapon/ranged/bullet/magazine/pistol/high_power/get_skill_spread(var/mob/living/L) //Base spread
	return max(0,0.02 - (0.03 * L.get_skill_power(SKILL_RANGED)))