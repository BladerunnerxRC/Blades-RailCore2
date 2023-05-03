; X-Axis homing
; T.A.Smith - 5/3/2023
echo "HOME X"
G91                 ; relative positioning
G1 Z4 F1000 H2		; lift Z relative to current position, H2=Individual motor mode - usually used with G91
G1 X-290 F4000 H1	; move quickly to X axis endstop and stop there (first pass)
G1 X5 F1000        ; go back a few mm
G1 X-320 F1200 H1	; move slower to X axis endstop and stop there (second pass)
G1 X17 F1500      ; Move to actual x=0  - from Endstop of out of bounds area
G92 X0			      ; set new X position to 0
G90                ; set to absolute positioning
M300 S4500 P100     ;Beep
