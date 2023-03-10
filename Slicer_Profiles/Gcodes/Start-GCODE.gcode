; --------=========RailCore2 Start GCODE ==========----- (3-8-2023)
; Raise bed temp to profile requested bed temp
M140 S[first_layer_bed_temperature] ; Raise bed temp to profile requested bed temp
M104 S150 T0                        ; Raise hot-end temp to 150C for G32 auto-calibration
M190 S[first_layer_bed_temperature] ; Wait for bed temp to rise
M109 S150 T0                        ; Wait for hot-end temp to rise to 150C
G28                                 ; home all axes
G32                                 ; Autocalibrate bed
G32                                 ; Autocalibrate bed a second time
G28 Z                               ; Home Z after bed leveling
;
G1 Z10 F1000                        ; Move bed down 10
M104 S[first_layer_temperature] T0  ; Raise hot-end temp to profile requested hot-end layer 1 temp
M109 S[first_layer_temperature] T0  ; Wait for hot-end temp to rise to profile requested hot-end layer 1 temp
;
G1 X0.0 Y0.0 Z1.0 F2000.0           ; prepare to prime
G92 E0                              ; reset extrusion distance
G1 Z0.2 F600
G1 X60.0 E9.0  F1000.0              ; priming
G1 X125.0 E12.5  F1000.0            ; priming
G1 Z0.5 F600
G92 E0                              ; reset extrusion distance
G29 S1                              ; turn mesh bed comp on
M376 H5                             ; turn mesh comp off after 5mm
; end of start code