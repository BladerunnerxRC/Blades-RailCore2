; --------=========RailCore2 End GCODE ==========----- (3-8-2023)
M400                            ; Wait for all previous moves to complete
M104 S0                         ; turn off extruder heater
M140 S0                         ; turn off bed heater
M106 S0                         ; turn off parts cooling fan
G91                             ; Relative move
G1 E-4.0 Z+20.0 F1000.0         ; E : Nozzle Up/Bed Down 10mm and retract - (E to exclude from layer count)
G90                             ; Absolute moves
G1 X10 Y280 F2000               ; Move Y-carriage for part removal
G4 S30                          ; Wait 30 seconds (since M84 seems ignored with arguments)
G29 S2                          ; Clear Mesh Bed leveling (if any)
; M84  