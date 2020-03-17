LoadBattleMenu:
	ld hl, BattleMenuHeader
	jr _BattleMenuCommon
	ret

SafariBattleMenu:
; untranslated
	ld hl, MenuHeader_0x24f4e
	jp _BattleMenuCommon

ContestBattleMenu:
	ld hl, MenuHeader_0x24f89

_BattleMenuCommon:
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	ld b, QUICK_B
	ld a, [wBattleType]
	cp BATTLETYPE_CONTEST
	jr z, .ok
	ld b, QUICK_B | QUICK_START | QUICK_SELECT
	ld a, [wBattleMode]
	dec a
	ld a, QUICK_START | QUICK_SELECT
	jr nz, .ok2
.ok
	ld a, b
.ok2
	ld [wBattleMenuFlags], a
	call _2DMenu
	ld a, [wBattleMenuFlags]
	and QUICK_PACK
	ld [wBattleMenuFlags], a
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	jp ExitMenu


BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f34
	db 1 ; default option

MenuData_0x24f34:
	db $91 ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba Strings24f3d
	dbw BANK(MenuData_0x24f34), 0

Strings24f3d:
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"

MenuHeader_0x24f4e:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f56
	db 1 ; default option

MenuData_0x24f56:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f5f
	dba Function24f7c

Strings24f5f:
	db "サファりボール×　　@" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"

Function24f7c:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

MenuHeader_0x24f89:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f91
	db 1 ; default option

MenuData_0x24f91:
	db $91 ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba Strings24f9a
	dba Function24fb2

Strings24f9a:
	db "FIGHT@"
	db "<PKMN>@"
	db "PARKBALL×  @"
	db "RUN@"

Function24fb2:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
