; X axis homing file for dc42 Duet firmware
G91                 ; relative positioning
G1 Z4 F1000 H2		; lift Z relative to current position
G1 X-320 F4000 H1	; move quickly to X axis endstop and stop there (first pass)
G1 X5 F1000         ; go back a few mm
G1 X-10 H1 F200		; move slowly to X axis endstop once more (second pass)
G1 Z-5 F200 H2		; lower Z again
G90                 ; absolute positioning
