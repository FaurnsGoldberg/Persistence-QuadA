/obj/item/weapon/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	storage_slots = 7
	item_flags = SLOT_BELT
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
		/obj/item/weapon/extinguisher/mini,
		/obj/item/weapon/marshalling_wand
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
		/obj/item/weapon/crowbar,
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
		/obj/item/weapon/gun/projectile/sec,
		/obj/item/weapon/gun/projectile/colt/detective,
		/obj/item/taperoll,
		/obj/item/device/holowarrant,
		/obj/item/weapon/magnetic_ammo
		)

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
	storage_slots = 9

/obj/item/weapon/storage/belt/security/fed
	name = "federation combat belt"
	desc = "Can hold combat gear such as ammo magazines and grenades."
	icon_state = "ammobelt"
	item_state = "ammobelt"
	storage_slots = 9

/obj/item/weapon/storage/belt/security/military
	name = "parade belt"
	desc = "A striking red ammo belt, more for style than camouflage."
	icon_state = "military"
	item_state = "military"
	storage_slots = 9

/obj/item/weapon/storage/belt/security/assault
	name = "assault belt"
	desc = "A tactical assault belt."
	icon_state = "assault"
	item_state = "assault"
	storage_slots = 6

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

/obj/item/weapon/storage/belt/botany
	name = "botanist belt"
	desc = "Can hold various botanical supplies."
	icon_state = "botany"
	item_state = "botany"
	can_hold = list(
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/shovel,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/spray,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/wirecutters/clippers,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/device/flashlight/pen,
		/obj/item/taperoll,
		/obj/item/weapon/gun/energy/floragun,
		/obj/item/weapon/grenade/chem_grenade/antiweed,
		/obj/item/seeds/
		)

/obj/item/weapon/storage/belt/janitor
	name = "janibelt"
	desc = "A belt used to hold most janitorial supplies."
	icon_state = "janibelt"
	item_state = "janibelt"
	storage_slots = 6
	can_hold = list(
		/obj/item/weapon/caution,
		/obj/item/device/lightreplacer,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/spray/cleaner,
		/obj/item/weapon/reagent_containers/glass/rag,
		/obj/item/weapon/grenade/chem_grenade/cleaner,
		/obj/item/weapon/soap,
		/obj/item/clothing/mask/gas,
		/obj/item/weapon/reagent_containers/spray,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/device/flashlight/pen,
		/obj/item/taperoll,
		)

/obj/item/weapon/storage/belt/janitor/large
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"

/obj/item/weapon/storage/belt/bandolier
	name = "bandolier"
	desc = "A bandolier for holding ammunition."
	icon_state = "bandolier"
	item_state = "bandolier"
	storage_slots = 8
	can_hold = list(
		/obj/item/ammo_casing/
		)

/obj/item/weapon/storage/belt/fannypack
	name = "fannypack"
	desc = "A dorky fannypack for keeping small items in."
	icon_state = "fannypack_leather"
	item_state = "fannypack_leather"
	storage_slots = null
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = ITEM_SIZE_SMALL * 4

/obj/item/weapon/storage/belt/fannypack/black
	name = "black fannypack"
	icon_state = "fannypack_black"
	item_state = "fannypack_black"

/obj/item/weapon/storage/belt/fannypack/red
	name = "red fannypack"
	icon_state = "fannypack_red"
	item_state = "fannypack_red"

/obj/item/weapon/storage/belt/fannypack/purple
	name = "purple fannypack"
	icon_state = "fannypack_purple"
	item_state = "fannypack_purple"

/obj/item/weapon/storage/belt/fannypack/blue
	name = "blue fannypack"
	icon_state = "fannypack_blue"
	item_state = "fannypack_blue"

/obj/item/weapon/storage/belt/fannypack/orange
	name = "orange fannypack"
	icon_state = "fannypack_orange"
	item_state = "fannypack_orange"

/obj/item/weapon/storage/belt/fannypack/green
	name = "green fannypack"
	icon_state = "fannypack_green"
	item_state = "fannypack_green"

/obj/item/weapon/storage/belt/fannypack/pink
	name = "pink fannypack"
	icon_state = "fannypack_pink"
	item_state = "fannypack_pink"

/obj/item/weapon/storage/belt/fannypack/cyan
	name = "cyan fannypack"
	icon_state = "fannypack_cyan"
	item_state = "fannypack_cyan"

/obj/item/weapon/storage/belt/fannypack/yellow
	name = "yellow fannypack"
	icon_state = "fannypack_yellow"
	item_state = "fannypack_yellow"

/obj/item/weapon/storage/belt/fannypack/white
	name = "white fannypack"
	icon_state = "fannypack_blanca"
	item_state = "fannypack_blanca"
//This is mixed up with the small waistpack above.
//I dont wan't to break anything so this is the blanca version.

/obj/item/weapon/storage/belt/peddler
	name = "Peddlers Belt"
	desc = "Holds things while business is conducted."
	icon_state = "lazbelt"
	item_state = "lazbelt"
	storage_slots = 6
	// If someone ever ports the lazarus injector, so sorry about this.

/obj/item/weapon/storage/belt/bluespace
	name = "Belt of Holding"
	desc = "The greatest in pants-supporting technology."
	icon_state = "holdingbelt"
	item_state = "holdingbelt"
	storage_slots = 14
	origin_tech = "bluespace=5;materials=4;engineering=4;plasmatech=5"
	can_hold = list()

/obj/item/weapon/storage/belt/utility/chief
	name = "Chief Engineer's toolbelt"
	desc = "Holds tools, looks snazzy"
	icon_state = "utility_ce"
	item_state = "utility_ce"