	object_const_def ; object_event constants
	const ARTICUNOCHAMBER_ARTICUNO

ArticunoChamber_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Articuno

.DummyScene0:
	end

.Articuno:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .ArticunoNoAppear
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .ArticunoAppear
	sjump .ArticunoNoAppear

.ArticunoAppear:
	appear ARTICUNOCHAMBER_ARTICUNO
	return

.ArticunoNoAppear:
	disappear ARTICUNOCHAMBER_ARTICUNO
	return

ArticunoChamberArticuno:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon ARTICUNO, 50
	startbattle
	disappear ARTICUNOCHAMBER_ARTICUNO
	reloadmapafterbattle
	end

ArticunoText:
	text "Gyaaas"
	done

ArticunoChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  5, ROUTE_20, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  2, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoChamberArticuno, EVENT_ARTICUNO_CHAMBER_ARTICUNO
