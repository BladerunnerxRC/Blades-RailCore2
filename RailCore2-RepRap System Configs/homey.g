; homey.g - for RRF 3
; called to home the Y axis
; T.A.Smith 6/13/2023
M913 X80 Y80 Z80    ; set X Y Z motors to 80% of their normal current TAS-6-13-2023
G91                 ; relative positioning
G1 Z5 F1000 H2		; lift Z relative to current position
G1 Y-320 F3000 H1	; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F1000         ; go back a few mm
G1 Y-10 H1 F200	    ; move slowly to Y axis endstop once more (second pass)
G90                 ; absolute positioning
G1 Y150 F3000        move tool to loc where x home will not hit lead screws
M400                ; wait for moves to finish
M913 X100 Y100 Z100 ; set X Y Z motors to 100% of their normal current TAS-6-13-2023
M300 S4500 P100     ; Beep