; homez.g - for RRF 3
; called to home the Z axis
; added Eculid stuff and commented out to prepare for upgrade TAS 3/18/2023
; slight modifications TAS 5-3-2023

echo "Homing Z"
M401 P0					;Deploy probe
M400
G91                     ; relative positioning
G1 Z5 F1000 H2		    ; lift Z relative to current position
G90                     ; absolute positioning
G1 X150 Y150 F6000     ; go to bed center probe point
;G1 X168 Y142 F4000      ; go to bed center (adjusted for magnets) probe point
G30                   ; home Z by probing the bed
M400
M402 P0					; retract probe
G1 H2 Z5 F400           ; lift Z relative to current position

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
