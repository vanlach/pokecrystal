	object_const_def ; object_event constants
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY
	const SILVERCAVEPOKECENTER1F_SELLER

SilverCavePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilverCavePokecenter1FNurseScript:
	jumpstd pokecenternurse

SilverCavePokecenter1FGrannyScript:
	jumptextfaceplayer SilverCavePokecenter1FGrannyText

SilverCavePokecenter1FSellerScript:
	faceplayer
	opentext
	checkevent EVENT_UNLOCKED_RARE_ITEM_SELLER
	iffalse .GoBeatRed
	pokemart MARTTYPE_RARE_ITEMS, MART_SILVER_CAVE_CENTER
	closetext
	end

.GoBeatRed
	writetext SilverCavePokecenter1FSellerGetStrongerText
	waitbutton
	closetext
	end

SilverCavePokecenter1FGrannyText:
	text "Trainers who seek"
	line "power climb Mt."

	para "Silver despite its"
	line "many dangers…"

	para "With their trusted"
	line "#mon, they must"

	para "feel they can go"
	line "anywhere…"
	done

SilverCavePokecenter1FSellerGetStrongerText:
	text "I've got some rare"
	line "items for sale."

	para "But it doesn't look"
	line "like you are that"

	para "strong of a"
	line "trainer…"

	para "Come back when you"
	line "are the strongest"
	cont "trainer."
	done

SilverCavePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  4,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FGrannyScript, -1
	object_event  5,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FSellerScript, -1
