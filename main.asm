GAME_NAME equs "APU TEST"

INCLUDE "gingerbread.asm"
INCLUDE "font.inc"

SECTION "Test Text", ROM0

TestCaseTable:

DB "L101"
DW L101
DB "L102"
DW L102
DB "L103"
DW L103
DB "L104"
DW L104
DB "L105"
DW L105
DB "L106"
DW L106

DB "D101"
DW D101
DB "D102"
DW D102

DB "F101"
DW F101
DB "F102"
DW F102

DB "E101"
DW E101
DB "E102"
DW E102
DB "E103"
DW E103
DB "E104"
DW E104
DB "E105"
DW E105
DB "E106"
DW E106
DB "E107"
DW E107
DB "E108"
DW E108
DB "E109"
DW E109

DB "S101"
DW S101
DB "S102"
DW S102
DB "S103"
DW S103
DB "S104"
DW S104
DB "S105"
DW S105
DB "S106"
DW S106
DB "S107"
DW S107

TestCaseTableSize:
DB (TestCaseTableSize - TestCaseTable)

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

    ; return to main loop
    jp .main_loop

    ; ld a, [TestCaseTableSize]
    ; cp c ; TODO make 16 bit comparison

    ; jp nz, .main_loop
    ; ld b, 0
    ; ld c, 0
    ; jp .main_loop

    ; call APUReset
    ; call E109

    ; Finally
    ; call APUReset
.lockup
    jr .lockup

SECTION "Channel 1 Tests", ROM0

L101_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

L101:
    ld hl, L101_Sound_1
    call PlaySoundHL

    ; Wait 5 secs
    call Wait1000
    call Wait1000
    call Wait1000
    call Wait1000
    call Wait1000

    ret

; Max Sound Length
L102_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %11000110 ; SOUND_CH1_HIGHFREQ

; 50% Sound Length
L102_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10100000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %11000110 ; SOUND_CH1_HIGHFREQ

; Min Sound Length
L102_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10111111 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %11000110 ; SOUND_CH1_HIGHFREQ

L102:
    ld hl, L102_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, L102_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, L102_Sound_3
    call PlaySoundHL
    call Wait500

    ret

; 50% Sound Length with Restart
L103_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10100000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %11000110 ; SOUND_CH1_HIGHFREQ


; Max Sound Length, No Restart
L103_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %01000110 ; SOUND_CH1_HIGHFREQ

L103:

    ; Without modification
    ld hl, L103_Sound_1
    call PlaySoundHL

    call Wait1000

    ; With modification
    ld hl, L103_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L103_Sound_2
    call PlaySoundHL

    call Wait500

    ret


; Max Sound Length with Restart
L104_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %11000110 ; SOUND_CH1_HIGHFREQ


; Min Sound Length, No Restart
L104_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10111111 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %01000110 ; SOUND_CH1_HIGHFREQ

L104:

    ; Without modification
    ld hl, L104_Sound_1
    call PlaySoundHL

    call Wait1000

    ; With modification
    ld hl, L104_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L104_Sound_2
    call PlaySoundHL

    call Wait500

    ret

; Max Sound Length
L105_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %11000110 ; SOUND_CH1_HIGHFREQ

; Disabled Sound Length
L105_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

L105:
    ld hl, L105_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L105_Sound_2
    call PlaySoundHL

    call Wait1000

    ret

; Disabled Sound Length
L106_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10111111 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Min Sound Length, no restart
L106_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10111111 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %01000110 ; SOUND_CH1_HIGHFREQ

L106:
    ld hl, L106_Sound_1
    call PlaySoundHL

    call Wait100
    call Wait100

    ld hl, L106_Sound_2
    call PlaySoundHL

    call Wait1000

    ret

; 12.5% Duty
D101_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %00000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 25% Duty
D101_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %01000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 50% Duty
D101_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 75% Duty
D101_Sound_4:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %11000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

D101:
    ld hl, D101_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, D101_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, D101_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, D101_Sound_4
    call PlaySoundHL
    call Wait500

    ret

; 50% Duty, with restart
D102_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 25% Duty, no restart
D102_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %01000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

; 50% Duty, no restart
D102_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

D102_Sound_4:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %00000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

D102:
    ld hl, D102_Sound_1
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_4
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D102_Sound_4
    call PlaySoundHL
    call Wait100
    call Wait100

    ret

; Min Frequency
F101_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %00000000 ; SOUND_CH1_LOWFREQ
DB %10000000 ; SOUND_CH1_HIGHFREQ

F101_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %00111111 ; SOUND_CH1_LOWFREQ
DB %10000000 ; SOUND_CH1_HIGHFREQ

F101_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11111111 ; SOUND_CH1_LOWFREQ
DB %10000001 ; SOUND_CH1_HIGHFREQ

F101_Sound_4:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11111111 ; SOUND_CH1_LOWFREQ
DB %10000011 ; SOUND_CH1_HIGHFREQ


F101_Sound_5:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %00000000 ; SOUND_CH1_LOWFREQ
DB %10000111 ; SOUND_CH1_HIGHFREQ

; Max Frequency
F101_Sound_6:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11111111 ; SOUND_CH1_LOWFREQ
DB %10000111 ; SOUND_CH1_HIGHFREQ

F101:
    ld hl, F101_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, F101_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, F101_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, F101_Sound_4
    call PlaySoundHL
    call Wait500

    ld hl, F101_Sound_5
    call PlaySoundHL
    call Wait500

    ld hl, F101_Sound_6
    call PlaySoundHL
    call Wait500

    ret

; With restart
F102_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %00000000 ; SOUND_CH1_LOWFREQ
DB %10000111 ; SOUND_CH1_HIGHFREQ

; Without restart
F102_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %10000000 ; SOUND_CH1_LOWFREQ
DB %00000111 ; SOUND_CH1_HIGHFREQ

; Without restart
F102_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %00000000 ; SOUND_CH1_LOWFREQ
DB %00000111 ; SOUND_CH1_HIGHFREQ

F102:
    ld hl, F102_Sound_1
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F102_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ret

; Max Volume
E101_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 3/4 Volume
E101_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11000000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 1/2 Volume
E101_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; 1/4 Volume
E101_Sound_4:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %01000000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Min Volume
E101_Sound_5:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %00000000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

E101:
    ld hl, E101_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E101_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, E101_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, E101_Sound_4
    call PlaySoundHL
    call Wait500

    ld hl, E101_Sound_5
    call PlaySoundHL
    call Wait500

    ret

; Min start vol, Ascending
E102_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %00001111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med start vol, Ascending
E102_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10001111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Max start vol, Ascending
E102_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11111111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

E102:
    ld hl, E102_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E102_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E102_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Max start vol, Descending
E103_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med start vol, Descending
E103_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Min start vol, Descending
E103_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %00000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

E103:
    ld hl, E103_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, E103_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E103_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Min vol slope, ascending
E104_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %00001111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med vol slope, ascending
E104_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %00001100 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Min vol slope (1), ascending
E104_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %00000001 ; SOUND_CH1_ENVELOPE
DB %11011110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

E104:
    ld hl, E104_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, E104_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E104_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret
    
; Min vol slope, descending
E105_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med vol slope, descending
E105_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110100 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Min vol slope (1), descending
E105_Sound_3:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110001 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

E105:
    ld hl, E105_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, E105_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E105_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

E106_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Modify initial volume, no restart
E106_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

E106:
    ld hl, E106_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E106_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ret

E107_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Modify Direction, no restart
E107_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10001111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

E107:
    ld hl, E107_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E107_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ret

E108_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Modify slope, no restart
E108_Sound_2:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000100 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

E108:
    ld hl, E108_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E108_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

E109_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %10000111 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

E109:
    ld hl, E108_Sound_1
    call PlaySoundHL
    call Wait500

    ; restart sound
    ld hl, E108_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Max Sweep Time
S101_Sound_1:
DW SOUND_CH1_START
DB %01110000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med Sweep Time
S101_Sound_2:
DW SOUND_CH1_START
DB %01000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Min Sweep Time
S101_Sound_3:
DW SOUND_CH1_START
DB %00010000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

S101:
    ld hl, S101_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, S101_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, S101_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Min Sweep Shift
S102_Sound_1:
DW SOUND_CH1_START
DB %01110000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med Sweep Shift
S102_Sound_2:
DW SOUND_CH1_START
DB %01110100 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Max Sweep Shift
S102_Sound_3:
DW SOUND_CH1_START
DB %01110111 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

S102:
    ld hl, S102_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, S102_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, S102_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Min Sweep Shift
S103_Sound_1:
DW SOUND_CH1_START
DB %01111000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Med Sweep Shift
S103_Sound_2:
DW SOUND_CH1_START
DB %01111100 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Max Sweep Shift
S103_Sound_3:
DW SOUND_CH1_START
DB %01111111 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

S103:
    ld hl, S103_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, S103_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, S103_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

S104_Sound_1:
DW SOUND_CH1_START
DB %01111000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Modify Sweep Time, no restart
S104_Sound_2:
DW SOUND_CH1_START
DB %00011000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

S104:
    ld hl, S104_Sound_1
    call PlaySoundHL
    call Wait500
    
    ld hl, S104_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

S105_Sound_1:
DW SOUND_CH1_START
DB %01111000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Modify Sweep Direction, no restart
S105_Sound_2:
DW SOUND_CH1_START
DB %01110000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

S105:
    ld hl, S105_Sound_1
    call PlaySoundHL
    call Wait500
    
    ld hl, S105_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

S106_Sound_1:
DW SOUND_CH1_START
DB %01111000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

; Modify Sweep Shift, no restart
S106_Sound_2:
DW SOUND_CH1_START
DB %01111111 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %00000110 ; SOUND_CH1_HIGHFREQ

S106:
    ld hl, S106_Sound_1
    call PlaySoundHL
    call Wait500
    
    ld hl, S106_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

S107_Sound_1:
DW SOUND_CH1_START
DB %01111000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

S107:
    ld hl, S107_Sound_1
    call PlaySoundHL
    call Wait500
    
    ; Restart sound
    ld hl, S107_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

Sound_Ch1_Default:
DW SOUND_CH1_START
DB %00000000
DB %00000000
DB %00000000
DB %00000000
DB %00000000

Sound_Ch2_Default:
DW SOUND_CH2_START
DB %00000000
DB %00000000
DB %00000000
DB %00000000
DB %00000000

Sound_Ch3_Default:
DW SOUND_CH3_START
DB %00000000
DB %00000000
DB %00000000
DB %00000000
DB %00000000

Sound_Ch4_Default:
DW SOUND_CH4_START
DB %00000000
DB %00000000
DB %00000000
DB %00000000
DB %00000000

; Restart APU, zero all audio channel registers, maximize volume,
; and output sound for all channels. Waits 1 sec after initializing.
APUReset:
    call DisableAudio
    ld hl, Sound_Ch1_Default
    call PlaySoundHL
    ld hl, Sound_Ch2_Default
    call PlaySoundHL
    ld hl, Sound_Ch3_Default
    call PlaySoundHL
    ld hl, Sound_Ch4_Default
    call PlaySoundHL
    call EnableAudio
    ret

Wait1000:
    call Wait500
    call Wait500

Wait500:
    call Wait100
    call Wait100
    call Wait100
    call Wait100
    call Wait100

Wait100:
    ld de, 10500
.loop
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .loop
	ret