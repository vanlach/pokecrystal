	object_const_def ; object_event constants
	const MEW_GARDEN_MEW

MewGarden_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Mew

.Mew:
	checkevent EVENT_FOUGHT_MEW
	iftrue .NoAppear
	sjump .Appear

.Appear:
	appear MEW_GARDEN_MEW
	return

.NoAppear:
	disappear MEW_GARDEN_MEW

Mew:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon MEW, 50
	startbattle
	disappear MEW_GARDEN_MEW
	reloadmapafterbattle
	end

MewText:
	text "Myuu!"
	done

MewGardenSignpost:
	jumptext MewGardenSignpostText

MewGardenSignpostText:
	text "This is a"
	line "mysterious"

	para "place. It is"
	line "said that Mew"

	para "lives in this"
	line "forest."
	done

MewGardenShrineText:
	text "It's a shrine…"

	para "Not sure who"
	line "built it…"
	done

MewGarden_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 24, SILVER_CAVE_OUTSIDE, 3
	warp_event 17, 25, SILVER_CAVE_OUTSIDE, 4

	db 0 ; coord events

	db 4 ; bg events
	bg_event  9, 23, BGEVENT_READ, MewGardenSignpost
	bg_event 14, 16, BGEVENT_READ, MewGardenShrineText
	bg_event  4, 14, BGEVENT_READ, MewGardenShrineText
	bg_event 12,  6, BGEVENT_READ, MewGardenShrineText

	db 1 ; object events
	object_event 9, 4, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Mew, EVENT_MEW_GARDEN_MEW
