SECTION "Utility Functions", ROM0

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
;   HL - address of the first byte of data to copy
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