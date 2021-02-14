SECTION "Utility Functions", ROM0

; Run test case from the table
; Parameters:
; BC - array offset of the test case in the table
RunTest:
    ; save all other registers
    push af
    push de
    push hl

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
    pop hl
    pop de
    pop af
    ret

; Run all test cases in the table
RunAllTests:
    push bc
    push hl

    ; initialize array index to the start of the individual test cases
    ld bc, 6

.all_tests_loop
    call RunTest
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc ; bc += 6
    
    ; check if end of list and loop if not
    ld a, [TestCaseTableSize] ; array size
    cp c ; TODO: make 16 bit comparison if table size exceeds 256
    jp nz, .all_tests_loop

    pop hl
    pop bc
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

; Loads an array of data into Wave RAM for APU Channel 3
; Parameters:
; HL - address of the first byte of data to copy
CopyWaveform:
    push de
    push bc
    ld de, SOUND_WAVE_TABLE_START
    ld bc, SOUND_WAVE_TABLE_STOP - SOUND_WAVE_TABLE_START
    call mCopy
    pop bc
    pop de
    ret

Wait1000:
    call Wait500
    call Wait500
    ret

Wait500:
    call Wait100
    call Wait100
    call Wait100
    call Wait100
    call Wait100
    ret

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