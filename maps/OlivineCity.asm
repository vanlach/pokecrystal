	object_const_def ; object_event constants
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_OLIVINE_RIVAL

OlivineCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	return

OlivineCityRivalSceneTop:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88d2
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x1a88f4
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88db
	setscene SCENE_FINISHED
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	end

OlivineCityRivalSceneBottom:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88d6
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x1a88f7
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, MovementData_0x1a88e8
	disappear OLIVINECITY_OLIVINE_RIVAL
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext OlivineCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokecenterSign:
	jumpstd pokecentersign

OlivineCityMartSign:
	jumpstd martsign

MovementData_0x1a88d2:
	step DOWN
	step RIGHT
	step RIGHT
	step_end

MovementData_0x1a88d6:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end

MovementData_0x1a88db:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a88e8:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a88f4:
	step DOWN
	turn_head UP
	step_end

MovementData_0x1a88f7:
	step UP
	turn_head DOWN
	step_end

OlivineCityRivalText:
	text "…"

	para "You again?"

	para "There's no need to"
	line "panic. I don't"

	para "bother with wimps"
	line "like you."

	para "Speaking of weak-"
	line "lings, the city's"

	para "gym leader isn't"
	line "here."

	para "Supposedly taking"
	line "care of a sick"

	para "#mon at the"
	line "lighthouse."

	para "Humph! Boo-hoo!"
	line "Just let sick"
	cont "#mon go!"

	para "A #mon that"
	line "can't battle is"
	cont "worthless!"

	para "Why don't you go"
	line "train at the"
	cont "lighthouse?"

	para "Who knows. It may"
	line "make you a bit"
	cont "less weak!"
	done

OlivineCitySailor1Text:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the lighthouse"

	para "to guide it, no"
	line "ship can sail."
	done

OlivineCityStandingYoungsterPokegearText:
	text "That thing you"
	line "have--it's a #-"
	cont "gear, right? Wow,"
	cont "that's cool."
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, you have a"
	line "#dex!"

	para "That is just so"
	line "awesome."
	done

OlivineCitySailor2Text:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done

OlivineCitySignText:
	text "Olivine City"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "Olivine Port"
	line "Fast Ship Pier"
	done

OlivineGymSignText:
	text "Olivine City"
	line "#mon Gym"
	cont "Leader: Jasmine"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "Olivine Lighthouse"
	line "Also known as the"
	cont "Glitter Lighthouse"
	done

OlivineCityBattleTowerSignText:
	text "Battle Tower ahead"
	line "Opening Now!"
	done

OlivineCityBattleTowerSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "Battle Tower ahead"
	done

OlivineCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 13, 21, OLIVINE_POKECENTER_1F, 1
	warp_event 10, 11, OLIVINE_GYM, 1
	warp_event 25, 11, OLIVINE_TIMS_HOUSE, 1
	warp_event  0,  0, OLIVINE_HOUSE_BETA, 1 ; inaccessible
	warp_event 29, 11, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 13, 15, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 21, OLIVINE_CAFE, 1
	warp_event 19, 17, OLIVINE_MART, 2
	warp_event 29, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 27, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 27, OLIVINE_PORT_PASSAGE, 2

	db 2 ; coord events
	coord_event 13, 12, SCENE_DEFAULT, OlivineCityRivalSceneTop
	coord_event 13, 13, SCENE_DEFAULT, OlivineCityRivalSceneBottom

	db 7 ; bg events
	bg_event 17, 11, BGEVENT_READ, OlivineCitySign
	bg_event 20, 24, BGEVENT_READ, OlivineCityPortSign
	bg_event  7, 11, BGEVENT_READ, OlivineGymSign
	bg_event 30, 28, BGEVENT_READ, OlivineLighthouseSign
	bg_event  3, 23, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 14, 21, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 20, 17, BGEVENT_READ, OlivineCityMartSign

	db 4 ; object events
	object_event 26, 27, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 20, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, -1
	object_event 17, 21, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 10, 11, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
