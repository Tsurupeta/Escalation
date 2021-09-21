
/obj/vehicles/t72_tank
	name = "T-72"
	desc = "The T-72 Main Battle Tank is equipped with a 125mm smoothbore gun loaded with HE shells and 7.62mm PKMT coaxial machine firing 7.62mm AP rounds. This will present a great foe to any force."

	icon = 'code/modules/vehicles/types/t72.dmi'
	icon_state = "move"
	anchored = 1

	bound_height = 100
	bound_width = 96
	pixel_x = -70
	pixel_y = -70

	comp_prof = /datum/component_profile/t72_tank

	vehicle_move_delay = 5
	exposed_positions = list("passenger" = 40,"gunner" = 5)

	occupants = list(4,1)

	vehicle_size = 96

	move_sound = 'sound/tank/x_T72Rumble.wav'

	vehicle_view_modifier = 1.65

	light_color = "#E1FDFF"

/obj/item/vehicle_component/health_manager/t72_tank
	integrity = 750
	resistances = list("brute"=65,"burn"=50,"emp"=40,"bomb"=65)
	repair_materials = list("steel")

/datum/component_profile/t72_tank
	pos_to_check = "gunner"
	gunner_weapons = list(/obj/item/weapon/gun/vehicle_turret/switchable/t72_turret)
	vital_components = newlist(/obj/item/vehicle_component/health_manager/t72_tank)
	cargo_capacity = 8 //Can hold, at max, two normals

/obj/item/weapon/gun/vehicle_turret/switchable/t72_turret
	name = "T-72 Fire Control"
	desc = "A slow firing but devastatingly damaging cannon."

	fire_delay = 5 SECONDS
	fire_sound = 'sound/tank/main_gun_04.wav'

	burst = 1

	guns_switchto = newlist(/datum/vehicle_gun/t72_cannon,/datum/vehicle_gun/t72_machinegun)

/datum/vehicle_gun/t72_cannon
	name = "T-64 Cannon"
	desc = "A slow firing but devastatinly damaging cannon."
	burst_size = 1
	burst_delay = 1
	fire_delay = 5 SECONDS
	fire_sound = 'sound/tank/main_gun_04.wav'
	proj_fired = /obj/item/projectile/bullet/tank_shell

/datum/vehicle_gun/t72_machinegun
	name = "T-72 Machinegun"
	desc = "A short burst machinegun, used for anti-infantry purposes."
	burst_size = 3
	burst_delay = 0.1 SECONDS
	fire_delay = 0.5 SECONDS
	fire_sound = 'sound/weapons/gunshot/pkm.ogg'
	proj_fired = /obj/item/projectile/bullet/rifle/a762x54

/obj/vehicles/t72_tank/destroyed
	icon_state = "move-destroyed"
	anchored = 1

/obj/vehicles/t72_tank/destroyed/amx30
	icon_state = "move-destroyed"
	name = "AMX-30"
	desc = "Developed to defend against low-altitude attacks, the system included two Hispano-Suiza 30-millimeter (1.2 in) 831 A automatic guns, coupled to an Oeil-noir fire control system. This system had already been installed on the AMX-13, in lieu of a heavier chassis, using a turret designated the S 401 A. Although this particular vehicle began production in 1962, the appearance of the AMX-30 offered a larger chassis to which the S 401 A turret could be mounted on, providing superior mobility. The heavier AMX-30 also provided a more stable platform for the guns, and allowed the system to carry much more ammunition (1,200 rounds, as compared to the 600 carried by the AMX-13 version). The guns were designed to fire in 5-round or 15-round bursts, with a cyclic rate of fire of 650 rounds per minute. They were controlled by an analogue computer, receiving information from a Doppler radar, which could be folded into an armoured box when not in use to protect from damage. The fire control depended on visual tracking, and so could only work in daylight and clear weather"
