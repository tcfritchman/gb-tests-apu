font_tile_data:
; Blank
DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
; 0-9
DB $00,$00,$1C,$1C,$22,$22,$22,$22,$22,$22,$22,$22,$1C,$1C,$00,$00
DB $00,$00,$06,$06,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00
DB $00,$00,$1C,$1C,$02,$02,$04,$04,$08,$08,$10,$10,$1E,$1E,$00,$00
DB $00,$00,$1C,$1C,$02,$02,$0C,$0C,$02,$02,$02,$02,$1C,$1C,$00,$00
DB $00,$00,$12,$12,$12,$12,$1E,$1E,$02,$02,$02,$02,$02,$02,$00,$00
DB $00,$00,$1E,$1E,$10,$10,$1E,$1E,$02,$02,$02,$02,$1E,$1E,$00,$00
DB $00,$00,$0C,$0C,$10,$10,$1C,$1C,$12,$12,$12,$12,$0C,$0C,$00,$00
DB $00,$00,$1C,$1C,$04,$04,$0E,$0E,$04,$04,$04,$04,$04,$04,$00,$00
DB $00,$00,$1C,$1C,$22,$22,$1C,$1C,$22,$22,$22,$22,$1C,$1C,$00,$00
DB $00,$00,$1E,$1E,$12,$12,$1E,$1E,$02,$02,$02,$02,$02,$02,$00,$00
; A-Z
DB $00,$00,$18,$18,$24,$24,$3C,$3C,$24,$24,$24,$24,$24,$24,$00,$00
DB $00,$00,$38,$38,$24,$24,$38,$38,$24,$24,$24,$24,$38,$38,$00,$00
DB $00,$00,$1C,$1C,$20,$20,$20,$20,$20,$20,$20,$20,$1C,$1C,$00,$00
DB $00,$00,$38,$38,$24,$24,$24,$24,$24,$24,$24,$24,$38,$38,$00,$00
DB $00,$00,$3C,$3C,$20,$20,$38,$38,$20,$20,$20,$20,$3C,$3C,$00,$00
DB $00,$00,$3C,$3C,$20,$20,$38,$38,$20,$20,$20,$20,$20,$20,$00,$00
DB $00,$00,$18,$18,$20,$20,$2C,$2C,$24,$24,$24,$24,$18,$18,$00,$00
DB $00,$00,$24,$24,$24,$24,$3C,$3C,$24,$24,$24,$24,$24,$24,$00,$00
DB $00,$00,$38,$38,$10,$10,$10,$10,$10,$10,$10,$10,$38,$38,$00,$00
DB $00,$00,$3C,$3C,$04,$04,$04,$04,$04,$04,$04,$04,$38,$38,$00,$00
DB $00,$00,$24,$24,$28,$28,$30,$30,$28,$28,$24,$24,$24,$24,$00,$00
DB $00,$00,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$38,$38,$00,$00
DB $00,$00,$22,$22,$36,$36,$2A,$2A,$22,$22,$22,$22,$22,$22,$00,$00
DB $00,$00,$24,$24,$34,$34,$2C,$2C,$24,$24,$24,$24,$24,$24,$00,$00
DB $00,$00,$18,$18,$24,$24,$24,$24,$24,$24,$24,$24,$18,$18,$00,$00
DB $00,$00,$38,$38,$24,$24,$38,$38,$20,$20,$20,$20,$20,$20,$00,$00
DB $00,$00,$18,$18,$24,$24,$24,$24,$24,$24,$2C,$2C,$1C,$1C,$02,$02
DB $00,$00,$38,$38,$24,$24,$38,$38,$24,$24,$24,$24,$24,$24,$00,$00
DB $00,$00,$1C,$1C,$20,$20,$18,$18,$04,$04,$04,$04,$38,$38,$00,$00
DB $00,$00,$3E,$3E,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$00,$00
DB $00,$00,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$18,$18,$00,$00
DB $00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$14,$14,$08,$08,$00,$00
DB $00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$2A,$2A,$14,$14,$00,$00
DB $00,$00,$22,$22,$14,$14,$08,$08,$08,$08,$14,$14,$22,$22,$00,$00
DB $00,$00,$22,$22,$14,$14,$08,$08,$08,$08,$08,$08,$08,$08,$00,$00
DB $00,$00,$3C,$3C,$04,$04,$08,$08,$10,$10,$20,$20,$3C,$3C,$00,$00

; 37 Tiles X 16 bytes each
font_tile_data_size EQU $0250

CHARMAP "A", $0B
CHARMAP "B", $0C
CHARMAP "C", $0D
CHARMAP "D", $0E
CHARMAP "E", $0F
CHARMAP "F", $10
CHARMAP "G", $11
CHARMAP "H", $12
CHARMAP "I", $13
CHARMAP "J", $14
CHARMAP "K", $15
CHARMAP "L", $16
CHARMAP "M", $17
CHARMAP "N", $18
CHARMAP "O", $19
CHARMAP "P", $1A
CHARMAP "Q", $1B
CHARMAP "R", $1C
CHARMAP "S", $1D
CHARMAP "T", $1E
CHARMAP "U", $1F
CHARMAP "V", $20
CHARMAP "W", $21
CHARMAP "X", $22
CHARMAP "Y", $23
CHARMAP "Z", $24
CHARMAP "0", $01
CHARMAP "1", $02
CHARMAP "2", $03
CHARMAP "3", $04
CHARMAP "4", $05
CHARMAP "5", $06
CHARMAP "6", $07
CHARMAP "7", $08
CHARMAP "8", $09
CHARMAP "9", $0A
CHARMAP " ", $00