; resume.g
; called before a print from SD card is resumed
G1 R1 Z5 F5000	; go to 5mm above position of the last print move
G1 R1			; Lower nozzle to last print move
M83				; relative extruder moves
G1 E2 F2500		; undo the retraction extrude 10mm of filament