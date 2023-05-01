; purgewipe.g   Purging Filament and Wiping Nozzle
;  To be run after filament swap
;  T.A.Smith 5/1/2023
M564 H1 S0  ; Disable absolute axis limits Unless Axis is not homed
G1 Y100 X-26 F3000  ; THESE ARE EXAMPLES need to find real coords
; 
G1 E150 F600        ;Purge Filament
;
; <<<<(Would Be nice to have a Y/N for question "Is the Correct color Extruding?")
;
G1 Y180 F3000       ; Start wipe back and forth
G1 Y160 F3000       ; wipe
G1 Y180 F3000       ; wipe
G1 Y160 F3000       ; wipe
G1 Y160 X10         ; move in bounds
M564 H1 S0          ; Enable absolute axis limits