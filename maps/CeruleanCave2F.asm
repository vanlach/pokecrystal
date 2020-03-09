	object_const_def ; object_event constants

CeruleanCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanCave2FHiddenFullRestore:
	itemball FULL_RESTORE

CeruleanCave2FHiddenUltraBall:
	itemball ULTRA_BALL

CeruleanCave2FHiddenPPUp:
	itemball PP_UP

CeruleanCave2FHiddenMoonStone:
	itemball MOON_STONE

CeruleanCave2FHiddenNugget:
	hiddenitem NUGGET, EVENT_CERULEAN_CAVE_2F_HIDDEN_NUGGET

CeruleanCave2FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_CERULEAN_CAVE_2F_HIDDEN_HYPER_POTION

CeruleanCave2FHiddenProtein:
	hiddenitem PROTEIN, EVENT_CERULEAN_CAVE_2F_HIDDEN_PROTEIN

CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 11,  3, CERULEAN_CAVE_1F, 2
	warp_event 31,  3, CERULEAN_CAVE_1F, 3
	warp_event  3,  5, CERULEAN_CAVE_1F, 4
	warp_event 25,  9, CERULEAN_CAVE_1F, 6
	warp_event 21,  9, CERULEAN_CAVE_1F, 7
	warp_event  5, 13, CERULEAN_CAVE_1F, 8
	

	db 0 ; coord events

	db 3 ; bg events
	bg_event 16,  4, BGEVENT_ITEM, CeruleanCave2FHiddenNugget
	bg_event 13, 17, BGEVENT_ITEM, CeruleanCave2FHiddenHyperPotion
	bg_event 17, 19, BGEVENT_ITEM, CeruleanCave2FHiddenProtein
	

	db 1 ; object events
	object_event  7,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FNugget, EVENT_CERULEAN_CAVE_1F_NUGGET
