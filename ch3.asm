SECTION "Channel 3 Tests", ROM0

RampWaveformData:
DB $88
DB $99
DB $AA
DB $BB
DB $CC
DB $DD
DB $EE
DB $FF
DB $00
DB $11
DB $22
DB $33
DB $44
DB $55
DB $66
DB $77

W301_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W301:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ; Play sound
    ld hl, W301_Sound_1
    call PlaySoundHL
    
    call Wait1000
    ret

W302_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %01000000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W302:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ; Play sound
    ld hl, W302_Sound_1
    call PlaySoundHL
    
    call Wait1000
    ret

W303_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %01100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W303:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ; Play sound
    ld hl, W303_Sound_1
    call PlaySoundHL
    
    call Wait1000
    ret

W304_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00000000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W304:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ; Play sound
    ld hl, W304_Sound_1
    call PlaySoundHL
    
    call Wait1000
    ret

W305_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W305_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %01000000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W305_Sound_3:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %01100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W305_Sound_4:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00000000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W305:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ; 100% volume
    ld hl, W305_Sound_1
    call PlaySoundHL
    call Wait500

    ; 50%
    ld hl, W305_Sound_2
    call PlaySoundHL
    call Wait500

    ; 25%
    ld hl, W305_Sound_3
    call PlaySoundHL
    call Wait500

    ; Mute
    ld hl, W305_Sound_4
    call PlaySoundHL
    call Wait500

    ; 25%
    ld hl, W305_Sound_3
    call PlaySoundHL
    call Wait500

    ; 50%
    ld hl, W305_Sound_2
    call PlaySoundHL
    call Wait500

    ; 100%
    ld hl, W305_Sound_1
    call PlaySoundHL
    call Wait500

    ret

W306:
    ; TODO
    ret

W307_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W307_Sound_2:
DW SOUND_CH3_START
DB %00000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

W307:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ; On
    ld hl, W307_Sound_1
    call PlaySoundHL
    call Wait500

    ; Off
    ld hl, W307_Sound_2
    call PlaySoundHL
    call Wait500

    ; On
    ld hl, W307_Sound_1
    call PlaySoundHL
    call Wait500

    ret

W308_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %00000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %00000000 ; SOUND_CH3_LOWFREQ
DB %10000000 ; SOUND_CH3_HIGHFREQ

W308:
    ; Load sample waveform data into RAM
    ld hl, RampWaveformData
    call CopyWaveform

    ld hl, W308_Sound_1
    call PlaySoundHL
    call Wait100
    call PlaySoundHL ; Restart
    call Wait100
    call Wait100
    call PlaySoundHL ; Restart
    call Wait100
    call Wait100
    call Wait100
    call PlaySoundHL ; Restart
    call Wait100
    call Wait100
    call Wait100
    call Wait100

    ret

L301_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

L301:
    ld hl, L301_Sound_1
    call PlaySoundHL

    ; Wait 5 secs
    call Wait1000
    call Wait1000
    call Wait1000
    call Wait1000
    call Wait1000

    ret

; Max Sound Length
L302_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %11000110 ; SOUND_CH3_HIGHFREQ

; 50% Sound Length
L302_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10100000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %11000110 ; SOUND_CH3_HIGHFREQ

; Min Sound Length
L302_Sound_3:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10111111 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %11000110 ; SOUND_CH3_HIGHFREQ

L302:
    ld hl, L302_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, L302_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, L302_Sound_3
    call PlaySoundHL
    call Wait500

    ret

; 50% Sound Length with Restart
L303_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10100000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %11000110 ; SOUND_CH3_HIGHFREQ


; Max Sound Length, No Restart
L303_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %01000110 ; SOUND_CH3_HIGHFREQ

L303:
    ; Without modification
    ld hl, L303_Sound_1
    call PlaySoundHL

    call Wait1000

    ; With modification
    ld hl, L303_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L303_Sound_2
    call PlaySoundHL

    call Wait500

    ret

; Max Sound Length with Restart
L304_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %11000110 ; SOUND_CH3_HIGHFREQ


; Min Sound Length, No Restart
L304_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10111111 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %01000110 ; SOUND_CH3_HIGHFREQ

L304:
    ; Without modification
    ld hl, L304_Sound_1
    call PlaySoundHL

    call Wait1000

    ; With modification
    ld hl, L304_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L304_Sound_2
    call PlaySoundHL

    call Wait500

    ret

; Max Sound Length
L305_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %11000110 ; SOUND_CH3_HIGHFREQ

; Disabled Sound Length
L305_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

L305:
    ld hl, L305_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L305_Sound_2
    call PlaySoundHL

    call Wait1000

    ret

; Disabled Sound Length
L306_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10111111 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %10000110 ; SOUND_CH3_HIGHFREQ

; Min Sound Length, no restart
L306_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10111111 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11010110 ; SOUND_CH3_LOWFREQ
DB %01000110 ; SOUND_CH3_HIGHFREQ

L306:
    ld hl, L306_Sound_1
    call PlaySoundHL

    call Wait100
    call Wait100

    ld hl, L306_Sound_2
    call PlaySoundHL

    call Wait1000

    ret

; Min Frequency
F301_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %00000000 ; SOUND_CH3_LOWFREQ
DB %10000000 ; SOUND_CH3_HIGHFREQ

F301_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %00111111 ; SOUND_CH3_LOWFREQ
DB %10000000 ; SOUND_CH3_HIGHFREQ

F301_Sound_3:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11111111 ; SOUND_CH3_LOWFREQ
DB %10000001 ; SOUND_CH3_HIGHFREQ

F301_Sound_4:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11111111 ; SOUND_CH3_LOWFREQ
DB %10000011 ; SOUND_CH3_HIGHFREQ


F301_Sound_5:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %00000000 ; SOUND_CH3_LOWFREQ
DB %10000111 ; SOUND_CH3_HIGHFREQ

; Max Frequency
F301_Sound_6:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %11111111 ; SOUND_CH3_LOWFREQ
DB %10000111 ; SOUND_CH3_HIGHFREQ

F301:
    ld hl, F301_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, F301_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, F301_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, F301_Sound_4
    call PlaySoundHL
    call Wait500

    ld hl, F301_Sound_5
    call PlaySoundHL
    call Wait500

    ld hl, F301_Sound_6
    call PlaySoundHL
    call Wait500

    ret

; With restart
F302_Sound_1:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %00000000 ; SOUND_CH3_LOWFREQ
DB %10000111 ; SOUND_CH3_HIGHFREQ

; Without restart
F302_Sound_2:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %10000000 ; SOUND_CH3_LOWFREQ
DB %00000111 ; SOUND_CH3_HIGHFREQ

; Without restart
F302_Sound_3:
DW SOUND_CH3_START
DB %10000000 ; SOUND_CH3_START
DB %10000000 ; SOUND_CH3_LENGTH
DB %00100000 ; SOUND_CH3_VOLUME
DB %00000000 ; SOUND_CH3_LOWFREQ
DB %00000111 ; SOUND_CH3_HIGHFREQ

F302:
    ld hl, F302_Sound_1
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F302_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ret
    