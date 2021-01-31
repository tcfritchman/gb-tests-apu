GAME_NAME equs "APU TESTS"
ROM_SIZE EQU 0
RAM_SIZE EQU 0
CART_TYPE EQU $00 ; ROM ONLY

INCLUDE "gingerbread.asm"
INCLUDE "font.inc"
INCLUDE "util.asm"
INCLUDE "table.asm"
INCLUDE "ch1.asm"

SECTION "Program", ROM0

begin:
    ; Load font data into vram
    ld hl, font_tile_data
    ld de, TILEDATA_START
    ld bc, font_tile_data_size
    call mCopyVRAM

    ; Enable the LCD
    call StartLCD

    ; Reset the APU
    call APUReset

    ; reset b for counter
    ld b, 0
    ld c, 0

    jp .render_text

.main_loop
    ; check up, down, and A buttons
    call ReadKeys
    ld d, a
    and KEY_UP
    cp 0
    jp nz, .menu_up
    ld a, d
    and KEY_DOWN
    cp 0
    jp nz, .menu_down
    ld a, d
    and KEY_A
    cp 0
    jp nz, .menu_select_test

    ; no button pressed
    jp .main_loop

.menu_up
    ; do nothing if end of list
    ld a, [TestCaseTableSize] ; array size
    sub a, 6 ; address - 1 element's size
    cp c ; TODO make 16 bit comparison

    jp z, .main_loop

    ; else, increment the array address by element size
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc

    jp .render_text

.menu_down
    ; do nothing if start of list
    ld a, 0
    cp c ; TODO make 16 bit comparison

    jp z, .main_loop

    ; else, decrement the array address by element size
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc

    jp .render_text

.render_text
    ; get array address
    ld hl, TestCaseTable

    add hl, bc ; text to write is at this address

    push bc
    
    ld b, 4 ; Text length
    ld c, 0 ; draw to background
    ld de, 0 ; position number
    call RenderTextToLengthByPosition

    pop bc

    ; debounce
    call Wait100
    
    jp .main_loop

.menu_select_test
    ; get array address
    ld hl, TestCaseTable

    add hl, bc ; start address of element
    ld de, 4 ; plus 4 to get location of function address of test
    add hl, de

    ; grey palette colors
    ld a, %01010100
    ld [BG_PALETTE], a
    ld [SPRITE_PALETTE_1], a
    ld [SPRITE_PALETTE_2], a

    push bc

    ; play test case ("CALL" with function's address in HL)
    ld bc, .return_from_test
    push bc
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    jp hl

.return_from_test
    call APUReset

    pop bc

    ; Set default palette
    ld a, %11100100
    ld [BG_PALETTE], a
    ld [SPRITE_PALETTE_1], a
    ld [SPRITE_PALETTE_2], a

    ; return to main loop
    jp .main_loop
