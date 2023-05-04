; Retract Euclid probe - for RRF 3
; T.A. Smith 5-3-2023 -- updated with new doc loacations after x-rail relocation

echo "DEBUG: running retractprobe.g macro"

if sensors.probes[0].value[0]!= 0
    abort "retractprobe: Probe not currently picked up!"

echo "pass first logic loop"

G90	                          ; absolute positioning
M564 H1 S0                    ; S=0 Allow movement BEYOND axes boundaries H=1 forbid movement of axes that have not been homed
G1 X90 Y303 F6000              ; move to the starting point
M400
G1 X40 Y303  F3000           ; move to just outside dock position - leave at speed 300
M400
G1 X-17 Y303  F1200          ; move to dock and drop off probe
M400
G1 X-17 Y280  F3000           ; move to the side adjacent to the dock
M400
G1 X10 Y280 F6000		; move inbounds
M400

M564 H1 S1                    ; S=1 Restrict movement to within axes boundaries H=1 forbid movement of axes that have not been homed

echo "DEBUG: complete movement commands"

if sensors.probes[0].value[0]!= 1000
    abort "retractprobe: Probe not correctly dropped off in dock!"
	
echo "DEBUG: retractprobe.g macro complete"
