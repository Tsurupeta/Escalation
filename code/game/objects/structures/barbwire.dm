/obj/structure/barbwire
	name = "barbwire"
	icon = 'icons/obj/structures.dmi'
	icon_state = "barbwire"
	anchored = 1

/obj/structure/barbwire/ex_act(severity)
	switch (severity)
		if (3.0)
			if (prob(50))
				qdel(src)
		else
			qdel(src)

/obj/structure/barbwire/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	return 1


/obj/structure/barbwire/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

/obj/structure/barbwire/Crossed(AM as mob|obj)
	if(ismob(AM))
		var/mob/M = AM
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(10, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(4)
				to_chat(M, "\red <B>Your [affecting.name] gets slightly cut by \the [src]!</B>")
				return ..()
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(20, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(6)
				to_chat(M, "\red <B>Your [affecting.name] gets cut by \the [src]!</B>")
				return ..()
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(30, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(10)
				to_chat(M, "\red <B>Your [affecting.name] gets deeply cut by \the [src]!</B>")
				return ..()
	..()

/obj/structure/barbwire/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wirecutters))
		if(anchored)
			user.visible_message("\blue \The [user] starts to cut through \the [src] with [W].")
			if(!do_after(user,60))
				user.visible_message("\blue \The [user] decides not to cut through the \the [src].")
				return
			user.visible_message("\blue \The [user] finishes cutting through \the [src]!")
			playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
			qdel(src)
			return
	/*if(istype(W, /obj/item/weapon/material/knife/bayonet/))
		if(anchored)
			user.visible_message("\blue \The [user] starts to cut through \the [src] with [W].")
			if(!do_after(user,120))
				user.visible_message("\blue \The [user] couldn't cut through the \the [src].")
				return
			user.visible_message("\blue \The [user] finishes cutting through \the [src]!")
			playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
			qdel(src)
			return*/
	else
		return


//deployable barbwire
/obj/item/stack/barbwire_coil //taken from /obj/item/stack/metalcoil
	name = "barbwire coil"
	desc = "Barbwire coil used for setting up barbwire."
	singular_name = "coil"
	icon = 'icons/obj/craftlootable.dmi'
	icon_state = "coil"
	flags = CONDUCT
	w_class = ITEM_SIZE_LARGE
	force = 2.0
	throwforce = 15.0
	throw_speed = 5
	throw_range = 20
	matter = list(DEFAULT_WALL_MATERIAL = 1875)
	amount = 10 //starting amount, I put it at 10 since its a starting item
	max_amount = 10
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")

//checking to see there are no barbwire on the turf, prevents stacking barbwire
/obj/item/stack/barbwire_coil/proc/check4barbwire(mob/user as mob)
	if(locate(/obj/structure/barbwire) in user.loc.contents)
		to_chat(user, "<span class='warning'>There is already some barbwire there.</span>")
		return 1
	return 0

/obj/item/stack/barbwire_coil/attack_self(mob/user as mob)
	if(check4barbwire(user)) //delete this and replace with the comment below to disable barbedwire being placed on top
//	if((check4barbwire(user) || check4sandbags(user) || check4struct(user))// 0 || 0 || 0
		return

	if(!isturf(user.loc)) //from sandbags
		to_chat(user, "<span class='warning'>Haha, not funny.</span>")
		return

	if(do_after(user, 30, src))
		to_chat(user, "<span class='notice'>You finish setting up the barbwire!</span>")
		use(1)
		if(!src) return

	var/obj/structure/barbwire/deployed = new(user.loc)//new (user.loc)
	deployed.set_dir(user.dir)