; homex.g - for RRF 3
; called to home the X axis
;
; generated by RepRapFirmware Configuration Tool v2 on Tue Dec 25 2018 20:01:04 GMT-0600 (Central Standard Time)
; Modified 19b July 2021 for Euclid detachable probe

G91               ; relative positioning
echo "DEBUG: First Lift Z (8) in home-X" 
G1 H2 Z8 F1000    ; lift Z relative to current position
G1 H1 X-320 F4000 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F2000        ; go back a few mm
G1 H1 X-320 F300  ; move slowly to X axis endstop once more (second pass)
echo "DEBUG: First Lower Z (8) in home-X" 
G1 H2 Z-8 F300    ; lower Z (raise bed)
G90               ; absolute positioning