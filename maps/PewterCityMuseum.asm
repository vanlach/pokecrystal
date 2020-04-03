	object_const_def ; object_event constants
	const PEWTERMUSEUM_SCIENTIST

PewterMuseum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterCityMuseumScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FOSSIL_POKEMON
	iffalse .GiveFossilPokemon
	writetext PewterCityMuseumScientistText
	waitbutton
	closetext
	end

.GiveFossilPokemon:
	writetext GiveFossilPokemonText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 20
	givepoke KABUTO, 20
	givepoke AERODACTYL, 20
	setevent EVENT_GOT_FOSSIL_POKEMON
	closetext
	end

.PartyFull:
	writetext GiveFossilPokemonPartyFullText
	waitbutton
	closetext
	end

GiveFossilPokemonText:
	text "I have the three"
	line "fossil #mon:"

	para "Omanyte, Kabuto"
	line "and Aerodactyl."

	para "Please take them"
	line "to help with my"
	cont "research."
	done

GiveFossilPokemonPartyFullText:
	text "Uh oh. Looks like"
	line "you don't have"

	para "any room in your"
	line "party."

	para "Come back when"
	line "you do."
	done

PewterCityMuseumScientistText:
	text "I reopened the"
	line "lab so that I"

	para "can continue re-"
	line "searching the"
	cont "fossil #mon."
	done

PewterMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, PEWTER_CITY, 6
	warp_event  5,  7, PEWTER_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityMuseumScientistScript, -1
	