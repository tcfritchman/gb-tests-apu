SECTION "Test Case Table", ROM0

; Test cases array

; Structure:
; First 4 bytes: test case name, exactly 4 chars
; Bytes 5 & 6: address of the test case function

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