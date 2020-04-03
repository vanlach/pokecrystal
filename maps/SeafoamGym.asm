	object_const_def ; object_event constants
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUY

SeafoamGym_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	yesorno
	iftrue .BlaineRematch
	closetext
	end

.BlaineRematch:
	special HealParty
	winlosstext Blaine_RematchDefeatText, 0
	loadtrainer BLAINE, 1
	startbattle
	reloadmapafterbattle
	end

SeafoamGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript:
	writetext SeafoamGymGuyWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "Blaine: Waaah!"

	para "My gym in Cinnabar"
	line "burned down."

	para "My fire-breathing"
	line "#mon and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a gym"

	para "leader here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a badge."

	para "Ha! You'd better"
	line "have Burn Heal!"
	done

BlaineWinLossText:
	text "Blaine: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "Volcanobadge!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "Volcanobadge."
	done

BlaineAfterBattleText:
	text "Blaine: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "Cinnabar Gym,"

	para "we'll have to have"
	line "a rematch."
	done

BlaineFightDoneText:
	text "Blaine: My fire"
	line "#mon will be"

	para "even stronger."
	line "Just you watch!"

	para "I'll even let"
	line "you help me train."

	para "Let's have a"
	line "rematch!"
	done

Blaine_RematchDefeatText:
	text "Blaine: Awesome."
	line "I've burnt out…"
	done

SeafoamGymGuyWinText:
	text "Yo!"

	para "… Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "Cinnabar Gym was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
	done

SeafoamGymGuyWinText2:
	text "A #mon gym can"
	line "be anywhere as"

	para "long as the gym"
	line "leader is there."

	para "There's no need"
	line "for a building."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, ROUTE_20, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
