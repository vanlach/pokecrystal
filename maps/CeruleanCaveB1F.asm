	object_const_def ; object_event constants
	const CERULEAN_CAVE_B1F_MEWTWO

CeruleanCaveB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Mewtwo

.DummyScene0:
	end

.Mewtwo:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .MewtwoNoAppear
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .MewtwoAppear
	sjump .MewtwoNoAppear

.MewtwoAppear:
	appear CERULEAN_CAVE_B1F_MEWTWO
	return

.MewtwoNoAppear:
	disappear CERULEAN_CAVE_B1F_MEWTWO
	return

CeruleanCaveB1FMewtwo:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon MEWTWO, 80
	startbattle
	disappear CERULEAN_CAVE_B1F_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "Myuu!"
	done

CeruleanCaveB1FUltraBall:
	itemball ULTRA_BALL

CeruleanCaveB1FMaxElixer:
	itemball MAX_ELIXER

CeruleanCaveB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_CERULEAN_CAVE_B1F_HIDDEN_ULTRA_BALL

CeruleanCaveB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_CERULEAN_CAVE_B1F_HIDDEN_MAX_REVIVE

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, CERULEAN_CAVE_1F, 5
	

	db 0 ; coord events

	db 2 ; bg events
	bg_event 24, 11, BGEVENT_ITEM, CeruleanCaveB1FHiddenUltraBall
	bg_event  8,  6, BGEVENT_ITEM, CeruleanCaveB1FHiddenMaxRevive
	

	db 3 ; object events
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FUltraBall, EVENT_CERULEAN_CAVE_B1F_ULTRA_BALL
	object_event 26,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FMaxElixer, EVENT_CERULEAN_CAVE_B1F_MAX_ELIXER
	object_event  7, 13, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, CeruleanCaveB1FMewtwo, EVENT_CERULEAN_CAVE_B1F_MEWTWO
