; homez.g - for RRF 3
; called to home the Z axis
; added Eculid stuff and commented out to prepare for upgrade TAS 3/18/2023
; work in progress
; TAS 6-13-2023

echo "Homing Z"
M401 P0					; Deploy probe
M400                    ; wait for moves to finish 
M913 Z80                ; set Z motors to 80% of their normal current TAS-6/13/2023
M561                    ; clear any bed transform TAS-6/13/2023
M290 R0 S0              ; clear babystepping TAS-6/13/2023
G91                     ; relative positioning
G1 Z5 F1000 H2		    ; lift Z relative to current position
G90                     ; absolute positioning
G1 X150 Y150 F6000      ; go to bed center probe point
;G1 X168 Y142 F4000      ; go to bed center (adjusted for magnets) probe point
G30                     ; home Z by probing the bed
M400                    ; wait for moves to finish
M402 P0					; retract probe
M400                    ; wait for moves to finish
M913 Z100               ; set Z motors to 100% of their normal current TAS-6/13/2023
M300 S4500 P100         ;Beep

;===================================================
; Modify for Euclid detachable probe
;   ;=commenting active  ;C=originally commented out in source script
;===================================================

;echo "DEBUG: Running homez.g macro"

;G91             	  ; relative positioning

;M400					; wait for moves to complete

;C ;echo "DEBUG: First Lift Z (8) in home-Z" 
;C ;G1 H2 Z8 F1000	 	  ; lift Z relative to current position

;G90                                             ; absolute positioning
;echo "Probe State Value = " ^sensors.probes[0].value[0]
;echo "deployuser token = " ^sensors.probes[0].deployedByUser
;echo "DEBUG: Call deployprobe.g macro" 
;M401 P0                                         ; This runs macro file deployprobe
;echo "DEBUG: returned from deployprobe.g"
;echo "Probe State Value = " ^sensors.probes[0].value[0]
;echo "deployuser token = " ^sensors.probes[0].deployedByUser

;G90                 ; absolute mode (should already be from deployprobe - but setting here anyway)
;G1 X150 Y150 F4000  ; go to bed center probe point
;M400					; wait for moves to complete
;echo "Execute G30 command"
;G30              	  ; home Z by probing the bed
;M400

;echo "Probe State Value = " ^sensors.probes[0].value[0]
;echo "deployuser token = " ^sensors.probes[0].deployedByUser

;echo "DEBUG: Call retractprobe.g macro"
;M402 P0                                         ; retract / remove probe
;echo "DEBUG: Returned from retractprobe.g"
;echo "Probe State Value = " ^sensors.probes[0].value[0]
;echo "deployuser token = " ^sensors.probes[0].deployedByUser
;C ;G91                                             ; relative positioning
;C ;echo "DEBUG: Second Lift Z (8) in home-Z (switch to raise) - commenting out for now"                                     
;C ;G1 H2 Z-8 F1000                                 ; lift Z relative to current position
;G90                                             ; absolute positioning

;echo "DEBUG: homez.g macro complete"
