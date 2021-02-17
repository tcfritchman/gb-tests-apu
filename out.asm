SECTION "Output Terminal Tests", ROM0

OT_Sound_1:
DW SOUND_CH1_START
DB %00000000 ; SOUND_CH1_START
DB %10000000 ; SOUND_CH1_LENGTH
DB %11110000 ; SOUND_CH1_ENVELOPE
DB %11010110 ; SOUND_CH1_LOWFREQ
DB %10000110 ; SOUND_CH1_HIGHFREQ

OT_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

OT_Sound_3:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

OT_Sound_4:
DW SOUND_CH4_START
DB %00000000 ; SOUND_CH4_START
DB %00000000 ; SOUND_CH4_LENGTH
DB %11110000 ; SOUND_CH4_ENVELOPE
DB %00110001 ; SOUND_CH4_POLY
DB %10000000 ; SOUND_CH4_OPTIONS

OT01:
    ; Set all channels output to none
    ld a, %00000000
    ld [SOUND_OUTPUTS], a

    ; Start sound on all channels
    ld hl, OT_Sound_1
    call PlaySoundHL
    ld hl, OT_Sound_2
    call PlaySoundHL
    ld hl, OT_Sound_3
    call PlaySoundHL
    ld hl, OT_Sound_4
    call PlaySoundHL

    ; toggle between right, both, left, and none
    ; for each channel

    ; Channel 1
    ld a, %00000001
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00010001
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00010000
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00000000
    ld [SOUND_OUTPUTS], a
    call Wait500

    ; Channel 2
    ld a, %00000010
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00100010
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00100000
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00000000
    ld [SOUND_OUTPUTS], a
    call Wait500

    ; Channel 3
    ld a, %00000100
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %01000100
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00100000
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00000000
    ld [SOUND_OUTPUTS], a
    call Wait500

    ; Channel 4
    ld a, %00001000
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %10001000
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %10000000
    ld [SOUND_OUTPUTS], a
    call Wait500
    ld a, %00000000
    ld [SOUND_OUTPUTS], a
    call Wait500

    ret

OT02:
    ; Set all channels output to none
    ld a, %00000000
    ld [SOUND_OUTPUTS], a

    ; Start sound on all channels
    ld hl, OT_Sound_1
    call PlaySoundHL
    ld hl, OT_Sound_2
    call PlaySoundHL
    ld hl, OT_Sound_3
    call PlaySoundHL
    ld hl, OT_Sound_4
    call PlaySoundHL

    ; Channel 1
    ld a, %00010001
    ld [SOUND_OUTPUTS], a
    call OutputVolumeTest

    ; Channel 2
    ld a, %00100010
    ld [SOUND_OUTPUTS], a
    call OutputVolumeTest

    ; Channel 3
    ld a, %01000100
    ld [SOUND_OUTPUTS], a
    call OutputVolumeTest

    ; Channel 4
    ld a, %10001000
    ld [SOUND_OUTPUTS], a
    call OutputVolumeTest

    ret

OT03:
    ld hl, OT_Sound_1
    call PlaySoundHL
    call Wait500
    ; turn off sound
    ld a, %00000000
    ld [SOUND_ONOFF], a

    call APUReset
    call Wait500

    ld hl, OT_Sound_2
    call PlaySoundHL
    call Wait500
    ; turn off sound
    ld a, %00000000
    ld [SOUND_ONOFF], a

    call APUReset
    call Wait500

    ld hl, OT_Sound_3
    call PlaySoundHL
    call Wait500
    ; turn off sound
    ld a, %00000000
    ld [SOUND_ONOFF], a

    call APUReset
    call Wait500

    ld hl, OT_Sound_4
    call PlaySoundHL
    call Wait500
    ; turn off sound
    ld a, %00000000
    ld [SOUND_ONOFF], a

    call APUReset
    call Wait500

    ret

OutputVolumeTest:
    ; Increase and decrease volume on Right and Left outputs
    ld a, %00000001
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00000010
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00000011
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00000100
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00000101
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00000110
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00000111
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00010000
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00100000
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %00110000
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %01000000
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %01010000
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %01100000
    ld [SOUND_VOLUME], a
    call Wait100
    ld a, %01110000
    ld [SOUND_VOLUME], a
    call Wait100

    ret
