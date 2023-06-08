; File     : Euclid-bed.g - for RRF 3
; Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
; ToDo : make changes to coordinates since Euclid not affected by magnets.
;Edited by : TAS - 8-JUN-2023 -- X and Y changes made after flipping Z-brackets

M561 						; clear any existing bed transform
;echo "DEBUG: Call deployprobe.g macro" 
M401 P0                                  ; This runs macro file deployprobe
;echo "DEBUG: returned from deployprobe.g"
M400
; 4 Point Probe - TAS			; define 4 points in a clockwise direction around the bed, starting near (0,0)
;echo "DEBUG: Start true bed level"
G30 P0 X0 Y45 Z-99999 			; Set or Report Current Probe status
G30 P1 X0 Y285 Z-99999		    ; Set or Report Current Probe status
G30 P2 X290 Y285 Z-99999	    ; Set or Report Current Probe status
G30 P3 X290 Y45 Z-99999 S3	    ; Set or Report Current Probe status
G30 P0 X0 Y45 Z-99999 			; Set or Report Current Probe status
G30 P1 X0 Y285 Z-99999		    ; Set or Report Current Probe status
G30 P2 X290 Y285 Z-99999	    ; Set or Report Current Probe status
G30 P3 X290 Y285 Z-99999 S3	    ; Set or Report Current Probe status
;echo "DEBUG: END true bed level"
M400
;echo "DEBUG: Final Z Home"
G91                     ; relative positioning
G1 Z5 F1000 H2		    ; lift Z relative to current position
G90                     ; absolute positioning
G1 X150 Y150 F2400     ; go to bed center probe point
G30                   ; home Z by probing the bed
M400
;echo "DEBUG: Call retractprobe.g macro"
M402 P0                                    ; retract / remove probe
;echo "DEBUG: Returned from retractprobe.g"

;G1 X10 Y10 F4000            	       ; move the head to the corner (optional)

;
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)

; G29 S1; perform mesh bed leveling (or, with S1 load from heightmap.csv)
; G29   ; perform mesh bed leveling (or, with S1 load from heightmap.csv)
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; OLd Below
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;M561                         ; clear any existing bed transform
;G1 Z5			; _RRF3_ remove S2 
;G30 P0 X15 Y45 Z-99999
;G30 P1 X15 Y275 Z-99999
;G30 P2 X275 Y275 Z-99999
;G30 P3 X275 Y45 Z-99999 S3
;G1 X0 Y0 F5000               ; move the head to the corner
