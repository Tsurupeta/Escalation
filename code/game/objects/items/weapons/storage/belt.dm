/obj/item/weapon/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	storage_slots = 7
	max_w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")
	var/show_above_suit = 0

/obj/item/weapon/storage/belt/verb/toggle_layer()
	set name = "Switch Belt Layer"
	set category = "Object"

	if(show_above_suit == -1)
		to_chat(usr, "<span class='notice'>\The [src] cannot be worn above your suit!</span>")
		return
	show_above_suit = !show_above_suit
	update_icon()

/obj/item/weapon/storage/update_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt()


/obj/item/weapon/storage/belt/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_belt_str && contents.len)
		for(var/obj/item/I in contents)
			ret.overlays += image("icon" = 'icons/mob/belt.dmi', "icon_state" = "[I.item_state ? I.item_state : I.icon_state]")
	return ret

/obj/item/weapon/storage/belt/utility
	name = "tool-belt"
	desc = "A belt of durable leather, festooned with hooks, slots, and pouches."
	description_info = "The tool-belt has enough slots to carry a full engineer's toolset: screwdriver, crowbar, wrench, welder, cable coil, and multitool. Simply click the belt to move a tool to one of its slots."
	description_fluff = "Good hide is hard to come by in certain regions of the galaxy. When they can't come across it, most TSCs will outfit their crews with toolbelts made of synthesized leather."
	description_antag = "Only amateurs skip grabbing a tool-belt."
	icon_state = "utilitybelt"
	item_state = "utility"
	can_hold = list(
		///obj/item/weapon/combitool,
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/device/multitool,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/analyzer,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/material/hatchet,
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)


/obj/item/weapon/storage/belt/utility/full/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))


/obj/item/weapon/storage/belt/utility/atmostech/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/t_scanner(src)



/obj/item/weapon/storage/belt/medical
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medicalbelt"
	item_state = "medical"
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)

/obj/item/weapon/storage/belt/medical/emt
	name = "EMT utility belt"
	desc = "A sturdy black webbing belt with attached pouches."
	icon_state = "emsbelt"
	item_state = "emsbelt"

/obj/item/weapon/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon_state = "securitybelt"
	item_state = "security"
	can_hold = list(
		/obj/item/weapon/grenade,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/handcuffs,
		/obj/item/device/flash,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_magazine,
		/obj/item/weapon/reagent_containers/food/snacks/donut/,
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/gun/energy/taser,
		/obj/item/weapon/gun/energy/stunrevolver,
		/obj/item/weapon/flame/lighter,
		/obj/item/clothing/glasses/hud/security,
		/obj/item/device/flashlight,
		/obj/item/device/pda,
		/obj/item/device/radio/headset,
		/obj/item/device/hailer,
		/obj/item/device/megaphone,
		/obj/item/weapon/melee,
		/obj/item/weapon/gun/projectile/pistol/sec,
		/obj/item/taperoll,
		/obj/item/device/holowarrant,
		/obj/item/weapon/magnetic_ammo
		)

/obj/item/weapon/storage/belt/soulstone
	name = "soul stone belt"
	desc = "Designed for ease of access to the shards during a fight, as to not let a single enemy spirit slip away."
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"
	storage_slots = 6
	can_hold = list(
		/obj/item/device/soulstone
		)

/obj/item/weapon/storage/belt/soulstone/full/New()
	..()
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)


/obj/item/weapon/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "championbelt"
	item_state = "champion"
	storage_slots = 1
	can_hold = list(
		/obj/item/clothing/mask/luchador
		)

/obj/item/weapon/storage/belt/security/tactical
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swatbelt"
	item_state = "swatbelt"
	storage_slots = 7

/obj/item/weapon/storage/belt/security/duty
	name = "duty belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	storage_slots = 5

/obj/item/weapon/storage/belt/waistpack
	name = "waist pack"
	desc = "A small bag designed to be worn on the waist. May make your butt look big."
	icon_state = "fannypack_white"
	item_state = "fannypack_white"
	storage_slots = null
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = ITEM_SIZE_SMALL * 4
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/weapon/storage/belt/waistpack/big
	name = "large waist pack"
	desc = "An bag designed to be worn on the waist. Definitely makes your butt look big."
	icon_state = "fannypack_big_white"
	item_state = "fannypack_big_white"
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = ITEM_SIZE_NORMAL * 4

/obj/item/weapon/storage/belt/waistpack/big/New()
	..()
	slowdown_per_slot[slot_belt] = 3


/obj/item/weapon/storage/belt/harness
	name = "harness"
	desc = "A golden belt for the true champion."
	icon_state = "championbelt"
	item_state = "champion"
	storage_slots = 0
	can_hold = null

/obj/item/weapon/storage/belt/harness/sa
	name = "soviet harness"
	desc = "A cheap harness used by Warsaw Pact military forces."
	icon_state = "sa_harness"
	item_state = "sa_harness"
	show_above_suit = 1
	storage_slots = 3
	can_hold = list(/obj/item/weapon/shovel/spadewp,
	/obj/item/weapon/storage/belt/holster/flaskstorage/soviet,
	/obj/item/weapon/storage/firstaid/sa_ifak)

/obj/item/weapon/storage/belt/harness/sa/New()
	..()
	new /obj/item/weapon/shovel/spadewp(src)
	new /obj/item/weapon/storage/belt/holster/flaskstorage/soviet(src)
	new /obj/item/weapon/storage/firstaid/sa_ifak(src)

/obj/item/weapon/storage/belt/sa
	name = "soviet belt"
	desc = "A belt used by Soviet officers. An USSR Star is engraved on the buckle."
	icon_state = "sa_officerharness"
	item_state = "sa_officerharness"
	show_above_suit = 1
	storage_slots = 1
	can_hold = list(/obj/item/weapon/storage/belt/holster/flaskstorage/soviet)

/obj/item/weapon/storage/belt/sa/New()
	..()
	new /obj/item/weapon/storage/belt/holster/flaskstorage/soviet(src)

/obj/item/weapon/storage/belt/harness/finn
	name = "finnish harness"
	desc = "A cheap harness used by Finnnish military forces."
	icon_state = "sa_harness"
	item_state = "sm_harness"
	storage_slots = 3
	can_hold = list(/obj/item/weapon/shovel/spadewp,
	/obj/item/weapon/storage/belt/holster/flaskstorage/soviet,
	/obj/item/weapon/storage/firstaid/sa_ifak)

/obj/item/weapon/storage/belt/harness/finn/New()
	..()
	new /obj/item/weapon/shovel/spadewp(src)
	new /obj/item/weapon/storage/belt/holster/flaskstorage/soviet(src)
	new /obj/item/weapon/storage/firstaid/sa_ifak(src)

/obj/item/weapon/storage/belt/finn
	name = "finnish belt"
	desc = "A simple belt used by Finnish officers."
	icon_state = "sa_officerharness"
	item_state = "sm_harness_officer"
	show_above_suit = 1
	storage_slots = 1
	can_hold = list(/obj/item/weapon/storage/belt/holster/flaskstorage/soviet)

/obj/item/weapon/storage/belt/finn/New()
	..()
	new /obj/item/weapon/storage/belt/holster/flaskstorage/soviet(src)

/obj/item/weapon/storage/belt/bdw
	name = "bundeswehr belt"
	desc = "A pistol belt used by Bundeswehr officers. A Bundesadler is engraved on the buckle"
	icon_state = "bdw_belt"
	item_state = "bdw_belt"
	storage_slots = 1
	can_hold = (/obj/item/weapon/storage/belt/holster/flaskstorage/nato)

/obj/item/weapon/storage/belt/bdw/New()
	..()
	new /obj/item/weapon/storage/belt/holster/flaskstorage/nato(src)

/obj/item/weapon/storage/belt/harness/bdw
	name = "bundeswehr harness"
	desc = "A generic harness used by Bundeswehr."
	icon_state = "bdw_harness"
	item_state = "bdw_harness"
	show_above_suit = 1
	storage_slots = 3
	can_hold = list(/obj/item/weapon/shovel/etool,
	/obj/item/weapon/storage/belt/holster/flaskstorage/nato,
	/obj/item/weapon/storage/firstaid/usmc_ifak)

/obj/item/weapon/storage/belt/harness/bdw/New()
	..()
	new /obj/item/weapon/shovel/etool(src)
	new /obj/item/weapon/storage/belt/holster/flaskstorage/nato(src)
	new /obj/item/weapon/storage/firstaid/usmc_ifak(src)

/obj/item/weapon/storage/belt/harness/baf
	name = "british harness"
	desc = "A generic harness used by the BAF."
	icon_state = "bdw_harness"
	item_state = "bdw_harness"
	show_above_suit = 1
	storage_slots = 3
	can_hold = list(/obj/item/weapon/shovel/etool,
	/obj/item/weapon/storage/belt/holster/flaskstorage/nato,
	/obj/item/weapon/storage/firstaid/usmc_ifak)

/obj/item/weapon/storage/belt/harness/baf/New()
	..()
	new /obj/item/weapon/shovel/etool(src)
	new /obj/item/weapon/storage/belt/holster/flaskstorage/nato(src)
	new /obj/item/weapon/storage/firstaid/usmc_ifak(src)


/obj/item/weapon/storage/belt/harness/nvaddr
	name = "nationale volksarmee harness"
	desc = "A cheap harness used by the Nationale Volksarmee."
	icon_state = "nvaddr_harness"
	item_state = "nvaddr_harness"
	show_above_suit = 1
	storage_slots = 3
	can_hold = list(/obj/item/weapon/shovel/spadewp,
	/obj/item/weapon/storage/belt/holster/flaskstorage/soviet,
	/obj/item/weapon/storage/firstaid/sa_ifak)

/obj/item/weapon/storage/belt/harness/nvaddr/New()
	..()
	new /obj/item/weapon/shovel/spadewp(src)
	new /obj/item/weapon/storage/belt/holster/flaskstorage/soviet(src)
	new /obj/item/weapon/storage/firstaid/sa_ifak(src)

/obj/item/weapon/storage/belt/nvaddr
	name = "nationale volksarmee belt"
	desc = "A belt used by NVA officers. A DDR Emblem is engraved on the buckle."
	icon_state = "nvaddr_officerharness"
	item_state = "nvaddr_officerharness"
	show_above_suit = 1
	storage_slots = 1
	can_hold = list(/obj/item/weapon/storage/belt/holster/flaskstorage/soviet)

/obj/item/weapon/storage/belt/nvaddr/New()
	..()
	new /obj/item/weapon/storage/belt/holster/flaskstorage/soviet(src)

/obj/item/weapon/storage/belt/harness/usmc
	name = "ALICE harness"
	desc = "A modular belt and harness used by the US Military."
	icon_state = "usmc_harness"
	item_state = "usmc_harness"
	show_above_suit = 1
	storage_slots = 3
	can_hold = list(/obj/item/weapon/shovel/etool,
	/obj/item/weapon/storage/belt/holster/flaskstorage/nato,
	/obj/item/weapon/storage/firstaid/usmc_ifak)

/obj/item/weapon/storage/belt/harness/usmc/New()
	..()
	new /obj/item/weapon/shovel/etool(src)
	new /obj/item/weapon/storage/belt/holster/flaskstorage/nato(src)
	new /obj/item/weapon/storage/firstaid/usmc_ifak(src)

/obj/item/weapon/storage/belt/usmc
	name = "ALICE belt"
	desc = "An ALICE belt used by the US Military, without its harness."
	icon_state = "usmc_belt"
	item_state = "usmc_belt"
	show_above_suit = 1
	storage_slots = 1
	can_hold = list(/obj/item/weapon/storage/belt/holster/flaskstorage/nato)

/obj/item/weapon/storage/belt/usmc/New()
	..()
	new /obj/item/weapon/storage/belt/holster/flaskstorage/nato(src)