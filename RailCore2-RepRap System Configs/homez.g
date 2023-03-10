; homez.g - for RRF 3
; called to home the Z axis

G91                     ; relative positioning
G1 Z5 F1000 H2		    ; lift Z relative to current position
G90                     ; absolute positioning
;G1 X150 Y150 F2400     ; go to bed center probe point
G1 X168 Y142 F4000      ; go to bed center (adjusted for magnets) probe point
G30                     ; home Z by probing the bed
G1 H2 Z5 F400           ; lift Z relative to current position