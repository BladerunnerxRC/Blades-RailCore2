; Updated with new version - 4/16/2023
; M280 P0 S90		;servo deploy BLTouch pin probe
echo "Retracting Probe"
G1 X50 Y300 F6000
G1 X0 Y300 F1500
G1 X0 Y250 F1500
;G1 X150 Y150 F6000
