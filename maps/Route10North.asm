	object_const_def ; object_event constants
	const ROUTE10NORTH_ZAPDOS

Route10North_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .ZapdosNoAppear
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .ZapdosAppear
	sjump .ZapdosNoAppear

.ZapdosAppear:
	appear ROUTE10NORTH_ZAPDOS
	return

.ZapdosNoAppear:
	disappear ROUTE10NORTH_ZAPDOS
	return

Route10NorthZapdos:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	setevent EVENT_FOUGHT_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon ZAPDOS, 50
	startbattle
	disappear ROUTE10NORTH_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Gyaaas"
	done

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd pokecentersign

PowerPlantSignText:
	text "Kanto Power Plant"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  5,  9, POWER_PLANT, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7, 11, BGEVENT_READ, PowerPlantSign
	bg_event 14,  1, BGEVENT_READ, Route10PokecenterSign

	db 1 ; object events
	object_event  2,  8, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route10NorthZapdos, EVENT_ROUTE_10_NORTH_ZAPDOS
