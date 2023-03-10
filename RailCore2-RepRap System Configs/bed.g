; --------------============bed.g============--------
;-----------------------(3*8*2023)------------------
M561                            ; clear any existing bed transform
G1 Z5			                ; Linear Move(G1) Rapid Move(G0) 
G30 P0 X15 Y45 Z-99999          ; Set or Report Current Probe status
G30 P1 X15 Y275 Z-99999         ; Set or Report Current Probe status
G30 P2 X275 Y275 Z-99999        ; Set or Report Current Probe status
G30 P3 X275 Y45 Z-99999 S3      ; Set or Report Current Probe status
; 3 Point Probe
;G30 P0 X15 Y45 Z-99999		    ; probe near a leadscrew
;G30 P1 X15 Y255 Z-99999		; probe near a leadscrew
;G30 P2 X285 Y150 Z-99999 S3    ; probe near a leadscrew and calibrate 3 motors
;
;G1 X0 Y0 F5000                 ; move the head to the corner
G1 X5 Y5 F4000                  ; move the head to the corner