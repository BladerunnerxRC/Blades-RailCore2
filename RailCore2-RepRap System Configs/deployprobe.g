; ------------======Deploy Euclid Bed leveling Probe=======------
; 
; T.A.Smith 5-3-2023  -- Added changes after new x-rail positions
; T.A Smith 5-10-2023 -- Location Changes for dock after installing 713 Maker Euclid Dock
;
;echo "DEBUG: Running deployprobe.g"
; uncomment next line to echo the probe deploy state 
echo "deployuser token = " ^sensors.probes[0].deployedByUser

M564 H1 S0     ; S=0 Allow movement BEYOND axes boundaries H=1 forbid movement of axes that have not been homed
G91                           ; relative positioning
;echo "DEBUG: First Lift Z (8) in deployprobe.g" 
G1 H2 Z8 F4000        ; move Z 8 for clearance above dock
                       ; need to figure out some safety check on this
G90                                   ; absolute positioning

echo "Before If: Probe State = " ^sensors.probes[0].value[0]

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  ; uncomment next line to echo the probe deploy state 
    echo "deployuser token = " ^sensors.probes[0].deployedByUser
    echo "Probe State = " ^sensors.probes[0].value[0]
	M300 S100 P2000
	abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"
  
; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
;echo "DEBUG: Pass first logic test"
;G1 X-17 Y280 F6000              ; move adjacent to probe dock location
M400                          ; wait for moves to finish
;echo "DEBUG: Probe Pickup while loop running"
; uncomment next line to echo the probe deploy state 
echo "deployuser token (before while loop) = " ^sensors.probes[0].deployedByUser
while sensors.probes[0].value[0]=1000
G1 X11.5 Y250 F6000			; move to ready position
M400
G1 X11.5 Y308.5 F1200           ;  move over dock  F3000 is standard speed
echo "Probe State = " ^sensors.probes[0].value[0]
G1 X60 Y308.5 F1200           ;  slide probe out of dock - slowly
G1 X150 Y150 F8000          ; move to in bound location - a little faster
M400
;echo "DEBUG: Probe Pickup while loop complete"
; uncomment to echo the probe deploy state 
echo "deployuser token (after while loop) = " ^sensors.probes[0].deployedByUser

;G91                           ; relative positioning
;echo "DEBUG: Second Lift Z (10) in deployprobe.g" 
;G1 H2 Z10 F3000               ; move bed to clear probe from build surface (not needed?)

M400                          ; wait for moves to finish
M564 H1 S1      ; S=1 Restrict movement to within axes boundaries H=1 forbid movement of axes that have not been homed

if sensors.probes[0].value[0]!=0
  echo "Probe Pickup while loop complete"
  ; uncomment to echo the probe deploy state 
  echo "deployuser token (in abort if section)= " ^sensors.probes[0].deployedByUser
  abort "deployprobe endvalue not 0 Probe not picked up!  Print cancelled."
  
;echo "DEBUG: deployprobe.g complete"
