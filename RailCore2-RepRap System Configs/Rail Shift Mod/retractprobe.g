; Retract BLTouch probe - for RRF 3
; Ensure polarity is correct before probing Z

; Start Euclid Changes


echo "DEBUG: running retractprobe.g macro"

if sensors.probes[0].value[0]!= 0
    abort "retractprobe: Probe not currently picked up!"

echo "pass first logic loop"

G90	                          ; absolute positioning
M564 H1 S0                    ; S=0 Allow movement BEYOND axes boundaries H=1 forbid movement of axes that have not been homed
G1 X90 Y300 F6000              ; move to the starting point (6000 for normal speed)
; G1 X90 Y305.3  F3000           ; move to intermediate point (3000 for normal speed)
M400
G1 X40 Y300  F3000           ; move to just outside dock position - leave at speed 300
M400
G1 X0 Y300  F1200          ; move to dock and drop off probe
M400
G1 X0 Y280  F3000           ; move to the side adjacent to the dock
M400
;G1 X150.0 Y150.0 F6000        ; move to the center of bed (don't think this is needed...)
M400

M564 H1 S1                    ; S=1 Restrict movement to within axes boundaries H=1 forbid movement of axes that have not been homed

echo "DEBUG: complete movement commands"

if sensors.probes[0].value[0]!= 1000
    abort "retractprobe: Probe not correctly dropped off in dock!"
	
echo "DEBUG: retractprobe.g macro complete"
