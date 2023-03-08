; --------------============bed.g============--------
;-----------------------(3*8*2023)------------------
M561                        ; clear any existing bed transform
G1 Z5			            ; Linear Move(G1) Rapid Move(G0) 
G30 P0 X15 Y45 Z-99999      ; Set or Report Current Probe status
G30 P1 X15 Y275 Z-99999     ; Set or Report Current Probe status
G30 P2 X275 Y275 Z-99999    ; Set or Report Current Probe status
G30 P3 X275 Y45 Z-99999 S3  ; Set or Report Current Probe status
G1 X0 Y0 F5000              ; move the head to the corner
