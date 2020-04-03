SilverCaveOutside_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	return

MtSilverPokecenterSign:
	jumpstd pokecentersign

MtSilverSign:
	jumptext MtSilverSignText

MtSilverMewGardenSign:
	jumptext MtSilverMewGardenText

SilverCaveOutsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE

MtSilverSignText:
	text "Mt.Silver"
	done

MtSilverMewGardenText:
	text "Mew Garden"
	done

SilverCaveOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 23, 19, SILVER_CAVE_POKECENTER_1F, 1
	warp_event 18, 11, SILVER_CAVE_ROOM_1, 1
	warp_event  4, 22, MEW_GARDEN, 1
	warp_event  4, 23, MEW_GARDEN, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event  9, 25, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore
	bg_event  7, 23, BGEVENT_READ, MtSilverMewGardenSign

	db 0 ; object events
