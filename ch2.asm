SECTION "Channel 2 Tests", ROM0

L201_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

L201:
    ld hl, L201_Sound_1
    call PlaySoundHL

    ; Wait 5 secs
    call Wait1000
    call Wait1000
    call Wait1000
    call Wait1000
    call Wait1000

    ret

; Max Sound Length
L202_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %11000110 ; SOUND_CH2_HIGHFREQ

; 50% Sound Length
L202_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10100000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %11000110 ; SOUND_CH2_HIGHFREQ

; Min Sound Length
L202_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10111111 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %11000110 ; SOUND_CH2_HIGHFREQ

L202:
    ld hl, L202_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, L202_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, L202_Sound_3
    call PlaySoundHL
    call Wait500

    ret

; 50% Sound Length with Restart
L203_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10100000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %11000110 ; SOUND_CH2_HIGHFREQ


; Max Sound Length, No Restart
L203_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %01000110 ; SOUND_CH2_HIGHFREQ

L203:
    ; Without modification
    ld hl, L203_Sound_1
    call PlaySoundHL

    call Wait1000

    ; With modification
    ld hl, L203_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L203_Sound_2
    call PlaySoundHL

    call Wait500

    ret

; Max Sound Length with Restart
L204_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %11000110 ; SOUND_CH2_HIGHFREQ


; Min Sound Length, No Restart
L204_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10111111 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %01000110 ; SOUND_CH2_HIGHFREQ

L204:
    ; Without modification
    ld hl, L204_Sound_1
    call PlaySoundHL

    call Wait1000

    ; With modification
    ld hl, L204_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L204_Sound_2
    call PlaySoundHL

    call Wait500

    ret

; Max Sound Length
L205_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %11000110 ; SOUND_CH2_HIGHFREQ

; Disabled Sound Length
L205_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

L205:
    ld hl, L205_Sound_1
    call PlaySoundHL

    call Wait100

    ld hl, L205_Sound_2
    call PlaySoundHL

    call Wait1000

    ret

; Disabled Sound Length
L206_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10111111 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Min Sound Length, no restart
L206_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10111111 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %01000110 ; SOUND_CH2_HIGHFREQ

L206:
    ld hl, L206_Sound_1
    call PlaySoundHL

    call Wait100
    call Wait100

    ld hl, L206_Sound_2
    call PlaySoundHL

    call Wait1000

    ret

; 12.5% Duty
D201_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %00000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 25% Duty
D201_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %01000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 50% Duty
D201_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 75% Duty
D201_Sound_4:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %11000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

D201:
    ld hl, D201_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, D201_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, D201_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, D201_Sound_4
    call PlaySoundHL
    call Wait500

    ret

; 50% Duty, with restart
D202_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 25% Duty, no restart
D202_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %01000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %00000110 ; SOUND_CH2_HIGHFREQ

; 50% Duty, no restart
D202_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %00000110 ; SOUND_CH2_HIGHFREQ

D202_Sound_4:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %00000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %00000110 ; SOUND_CH2_HIGHFREQ

D202:
    ld hl, D202_Sound_1
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_4
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, D202_Sound_4
    call PlaySoundHL
    call Wait100
    call Wait100

    ret

; Min Frequency
F201_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %00000000 ; SOUND_CH2_LOWFREQ
DB %10000000 ; SOUND_CH2_HIGHFREQ

F201_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %00111111 ; SOUND_CH2_LOWFREQ
DB %10000000 ; SOUND_CH2_HIGHFREQ

F201_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11111111 ; SOUND_CH2_LOWFREQ
DB %10000001 ; SOUND_CH2_HIGHFREQ

F201_Sound_4:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11111111 ; SOUND_CH2_LOWFREQ
DB %10000011 ; SOUND_CH2_HIGHFREQ


F201_Sound_5:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %00000000 ; SOUND_CH2_LOWFREQ
DB %10000111 ; SOUND_CH2_HIGHFREQ

; Max Frequency
F201_Sound_6:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11111111 ; SOUND_CH2_LOWFREQ
DB %10000111 ; SOUND_CH2_HIGHFREQ

F201:
    ld hl, F201_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, F201_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, F201_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, F201_Sound_4
    call PlaySoundHL
    call Wait500

    ld hl, F201_Sound_5
    call PlaySoundHL
    call Wait500

    ld hl, F201_Sound_6
    call PlaySoundHL
    call Wait500

    ret

; With restart
F202_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %00000000 ; SOUND_CH2_LOWFREQ
DB %10000111 ; SOUND_CH2_HIGHFREQ

; Without restart
F202_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %10000000 ; SOUND_CH2_LOWFREQ
DB %00000111 ; SOUND_CH2_HIGHFREQ

; Without restart
F202_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %00000000 ; SOUND_CH2_LOWFREQ
DB %00000111 ; SOUND_CH2_HIGHFREQ

F202:
    ld hl, F202_Sound_1
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_3
    call PlaySoundHL
    call Wait100
    call Wait100

    ld hl, F202_Sound_2
    call PlaySoundHL
    call Wait100
    call Wait100

    ret

; Max Volume
E201_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 3/4 Volume
E201_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11000000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 1/2 Volume
E201_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; 1/4 Volume
E201_Sound_4:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %01000000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Min Volume
E201_Sound_5:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %00000000 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

E201:
    ld hl, E201_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E201_Sound_2
    call PlaySoundHL
    call Wait500

    ld hl, E201_Sound_3
    call PlaySoundHL
    call Wait500

    ld hl, E201_Sound_4
    call PlaySoundHL
    call Wait500

    ld hl, E201_Sound_5
    call PlaySoundHL
    call Wait500

    ret

; Min start vol, Ascending
E202_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %00001111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Med start vol, Ascending
E202_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10001111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Max start vol, Ascending
E202_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11111111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

E202:
    ld hl, E202_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E202_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E202_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Max start vol, Descending
E203_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Med start vol, Descending
E203_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Min start vol, Descending
E203_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %00000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

E203:
    ld hl, E203_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    call Wait500
    
    ld hl, E203_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E203_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

; Min vol slope, ascending
E204_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %00001111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Med vol slope, ascending
E204_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %00001100 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Min vol slope (1), ascending
E204_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %00000001 ; SOUND_CH2_ENVELOPE
DB %11011110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

E204:
    ld hl, E204_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    call Wait500
    
    ld hl, E204_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E204_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret
    
; Min vol slope, descending
E205_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Med vol slope, descending
E205_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110100 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Min vol slope (1), descending
E205_Sound_3:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %11110001 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

E205:
    ld hl, E205_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ld hl, E205_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ld hl, E205_Sound_3
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

E206_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Modify initial volume, no restart
E206_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %00000110 ; SOUND_CH2_HIGHFREQ

E206:
    ld hl, E206_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E206_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ret

E207_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Modify Direction, no restart
E207_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10001111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %00000110 ; SOUND_CH2_HIGHFREQ

E207:
    ld hl, E207_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E207_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000
    
    ret

E208_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

; Modify slope, no restart
E208_Sound_2:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000100 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %00000110 ; SOUND_CH2_HIGHFREQ

E208:
    ld hl, E208_Sound_1
    call PlaySoundHL
    call Wait500

    ld hl, E208_Sound_2
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret

E209_Sound_1:
DW SOUND_CH2_START
DB %00000000 ; SOUND_CH2_START
DB %10000000 ; SOUND_CH2_LENGTH
DB %10000111 ; SOUND_CH2_ENVELOPE
DB %11010110 ; SOUND_CH2_LOWFREQ
DB %10000110 ; SOUND_CH2_HIGHFREQ

E209:
    ld hl, E208_Sound_1
    call PlaySoundHL
    call Wait500

    ; restart sound
    ld hl, E208_Sound_1
    call PlaySoundHL
    call Wait1000
    call Wait1000

    ret
