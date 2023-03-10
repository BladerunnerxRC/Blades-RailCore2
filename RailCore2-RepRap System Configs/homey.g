; homey.g - for RRF 3
; called to home the Y axis
G91                 ; relative positioning
G1 Z5 F1000 H2		; lift Z relative to current position
G1 Y-320 F3000 H1	; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F1000         ; go back a few mm
G1 Y-10 H1 F200	    ; move slowly to Y axis endstop once more (second pass)
G1 Z-4 F200 H2		;_RRF3_ change S2 to H2
G90                 ; absolute positioning
