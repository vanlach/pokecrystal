	object_const_def ; object_event constants
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUY

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	yesorno
	iftrue .BlueRematch
	closetext
	end

.BlueRematch:
	special HealParty
	winlosstext Blue_RematchDefeatText, 0
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	end

ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd gymstatue1

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "Blue: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at Cinnabar,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the gyms in Johto?"

	para "Heh! Johto's gyms"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, Johto"
	line "Champ?"
	done

LeaderBlueWinText:
	text "Blue: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's Earthbadge."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "Earthbadge."
	done

LeaderBlueAfterText:
	text "Blue: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBlueEpilogueText:
	text "Blue: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"

	para "<……><……><……>"
	line "<……><……><……>"

	para "Why are you still"
	line "here? You know"

	para "what, let's have"
	line "a rematch."
	done

Blue_RematchDefeatText:
	text "Blue: What?"

	para "How the heck did I"
	line "lose to you again?"

	para "…"
	done

ViridianGymGuyText:
	text "Yo, champ in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The gym leader is"
	line "a guy who battled"

	para "the champion three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuyWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
