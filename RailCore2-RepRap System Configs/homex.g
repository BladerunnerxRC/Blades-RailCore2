; X-Axis homing
; T.A.Smith - 6/13/2023
echo "HOME X"
M913 X80 Y80 Z80    ; set X Y Z motors to 80% of their normal current TAS-6-13-2023
G91                 ; relative positioning
G1 Z4 F1000 H2		; lift Z relative to current position, H2=Individual motor mode - usually used with G91
G1 X-290 F3000 H1	; move quickly to X axis endstop and stop there (first pass)
G1 X5 F1000         ; go back a few mm
G1 X-320 F1200 H1	; move slower to X axis endstop and stop there (second pass)
G1 X25 F1500        ; Move to actual x=0  - from Endstop of out of bounds area
G92 X0              ; set new X position to 0
M400                ; wait for moves to finish
M913 X100 Y100 Z100 ; set X Y Z motors to 100% of their normal current TAS-6-13-2023
G90                 ; set to absolute positioning
M300 S4500 P100     ; Beep

