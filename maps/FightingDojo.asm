	object_const_def ; object_event constants
	const FIGHTINGDOJO_BLACK_BELT1
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3
	const FIGHTINGDOJO_BLACK_BELT4
	const FIGHTINGDOJO_BLACK_BELT5
	const FIGHTINGDOJO_POKE_BALL1
	const FIGHTINGDOJO_POKE_BALL2

FightingDojo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FightingDojoBlackBelt:
	jumptextfaceplayer FightingDojoBlackBeltText
	faceplayer
	opentext
	checkevent EVENT_PICKED_UP_FOCUS_BAND
	iftrue .AlreadyGotFocusBand
	writetext FightingDojoBlackBeltText
	waitbutton
	verbosegiveitem FOCUS_BAND
	iffalse .NoRoomForFocusBand
	setevent EVENT_PICKED_UP_FOCUS_BAND
.AlreadyGotFocusBand
	writetext FightingDojoBlackbeltFindKarateKingText
	waitbutton
	closetext
	end
.NoRoomForFocusBand
	writetext NoRoomForFocusBandText
	waitbutton
	closetext
	end

FightingDojoBlackBeltAaron:
	trainer BLACKBELT_T, AARON, EVENT_BEAT_BLACKBELT_AARON, BlackBeltAaronSeenText, BlackBeltAaronBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackBeltAaronAfterBattleText
	waitbutton
	closetext
	end

FightingDojoBlackBeltMike:
	trainer BLACKBELT_T, MIKE, EVENT_BEAT_BLACKBELT_MIKE, BlackBeltMikeSeenText, BlackBeltMikeBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackBeltMikeAfterBattleText
	waitbutton
	closetext
	end

FightingDojoBlackBeltHitoshi:
	trainer BLACKBELT_T, HITOSHI, EVENT_BEAT_BLACKBELT_HITOSHI, BlackBeltHitoshiSeenText, BlackBeltHitoshiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackBeltHitoshiAfterBattleText
	waitbutton
	closetext
	end

FightingDojoBlackBeltHideki:
	trainer BLACKBELT_T, HIDEKI, EVENT_BEAT_BLACKBELT_HIDEKI, BlackBeltHidekiSeenText, BlackBeltHidekiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BlackBeltHidekiAfterBattleText
	waitbutton
	closetext
	end

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoHitmonchan:
	itemball HITMONCHAN, 20

FightingDojoHitmonlee:
	itemball HITMONLEE, 20

FightingDojoBlackBeltText:
	text "Hello!"

	para "Karate King, the"
	line "Fighting Dojo's"

	para "master, is in a"
	line "cave in Johto for"
	cont "training."

	para "Here, this Focus"
	line "Band might help"

	para "if you find the"
	line "Karate King."
	done

FightingDojoBlackbeltFindKarateKingText:
	text "Hello!"

	para "Karate King, the"
	line "Fighting Dojo's"

	para "master, is in a"
	line "cave in Johto for"
	cont "training."
	done

NoRoomForFocusBandText:
	text "Looks like you"
	line "don't have enough"

	para "space for this."

	para "Come back when"
	line "you have space."
	done

BlackBeltHidekiSeenText:
	text "Welcome to the"
	line "Fighting Dojo!"

	para "We're all students"
	line "of the Karate King"

	para "and are tough"
	line "trainers."

	para "Let's begin!"
	done

BlackBeltHidekiBeatenText:
	text "Wow you're tough!"
	done

BlackBeltHidekiAfterBattleText:
	text "If you can defeat"
	line "all of us then you"

	para "might be able to"
	line "take on the Karate"
	cont "King."
	done

BlackBeltHitoshiSeenText:
	text "So you've made it"
	line "this far."

	para "You won't make it"
	line "past me!"
	done

BlackBeltHitoshiBeatenText:
	text "I underestimated"
	line "you."
	done

BlackBeltHitoshiAfterBattleText:
	text "Just because you"
	line "beat me doesn't"

	para "mean you'll beat"
	line "the other black-"
	cont "belts."
	done

BlackBeltMikeSeenText:
	text "I'm one of Karate"
	line "King's best"
	cont "students."

	para "Show me what you"
	line "got."
	done

BlackBeltMikeBeatenText:
	text "Woah, are you a"
	line "student of the"

	para "Karate King too?"
	done

BlackBeltMikeAfterBattleText:
	text "The Karate King"
	line "is the best fight-"
	cont "er I've ever seen."
	done

BlackBeltAaronSeenText:
	text "I'm the last one."

	para "Ready for our"
	line "fight?"
	done

BlackBeltAaronBeatenText:
	text "Wow you are tough."
	done

BlackBeltAaronAfterBattleText:
	text "You might be able"
	line "to take on the"
	cont "Karate King."
	done

FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2

	db 7 ; object events
	object_event  4,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  6,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, FightingDojoBlackBeltAaron, -1
	object_event  3,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, FightingDojoBlackBeltMike, -1
	object_event  6,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, FightingDojoBlackBeltHitoshi, -1
	object_event  3,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, FightingDojoBlackBeltHideki, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoHitmonchan, EVENT_FIGHTING_DOJO_HITMONCHAN
	object_event  5,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoHitmonlee, EVENT_FIGHTING_DOJO_HITMONLEE
