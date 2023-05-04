; Configuration file for Blade's RailCore 2 - RepRap Firmware v3.x
;====================================================================
;Board: Duet WiFi 1.02 or later + DueX5
;Firmware: RepRapFirmware for Duet 2 WiFi/Ethernet 3.4.2 (2022-09-13)
;Duet WiFi Server Version: 1.27
;Duet Web Control 3.4.2
; TAS 5-3-2023
;====================================================================

; COMMUNICATION AND GENERAL
M111 S0                            	 ; Debug (S0 is off; S1 is on)
M929 P"eventlog.txt" S2             	; Start logging to file eventlog.txt
M915 X Y S10 F0 R1                  	; log motor stalls
G21                           	        ; Work in millimetres
G90                            	        ; Send absolute coordinates...
M83                                	; ...but relative extruder moves
M669 K1					; Select CoreXY kinematics (RRF 2.03 and later)
M555 P2								; Set output to look like Marlin

;*** Wifi NETWORKING
; For M586 'Pnn' 0 = HTTP or HTTPS, 1 = FTP or SFTP, 2 = Telnet or SSH
; Snn 0 = disable this protocol, 1 = enable this protocol
M552 S1								; Enable WiFi
M586 P0 S1                          ; enable HTTP
M586 P1 S1                          ; enable FTP
M586 P2 S0                          ; Disable Telnet


M575 P1 B57600 S1			; Comms parameters for PanelDue
M550 P"RailCore2"			; Machine name and Netbios name (can be anything you like)

M551 Pmyrap                        ; Machine password (used for FTP too)
;*** If you have more than one Duet on your network, they must all have different MAC addresses, so change the last digits
;M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xEE 	; MAC Address


; (AXIS AND MOTOR CONFIGURATION)

M584 X0 Y1 Z5:6:7 E3		   	; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders removed - E 4,8 and 9 per Duet3D Support 4/13/2020
M569 P0 S0                          	; Drive 0 goes forwards (change to S0 to reverse it) X stepper (Rear)
M569 P1 S1                          	; Drive 1 goes backwards	Y Stepper (Front)
M569 P2 S1                          	; Drive 2 goes forwards		(Unused)
M569 P3 S0                        	; Drive 3 goes forwards		Extruder (forward for LDO motor)
M569 P4 S1                          	; Drive 4 goes forwards		(unused)
M569 P5 S0				; Drive 5 goes backwards	Front Left Z
M569 P6 S0				; Drive 6 goes backwards	Rear Left Z
M569 P7 S0				; Drive 7 goes backwards	Right Z


;STEPPERS
M350 X16 Y16 Z16 E16 I1             ; set 16x microstepping for axes& extruder, with interpolation 
;_RRF3_ comment out:M574 X1 Y1 Z0 S1; set homing switch configuration (x,y at min, z at max) IF YOU NEED TO REVERSE YOUR HOMING SWITCHES CHANGE S1 to S0

;M906 X1400 Y1400 Z1200 E800 I30	    ; Set motor currents (mA)- changed x-y to 1400 5/4/2020 z=1200 and idle current(I) from 60 to 30 3/18/2023-- chg TAS 4-16-2023
M906 X1300 Y1300 Z1000 E1000 I30	; TAS 4/15/2023
M84 S60								; Set motor idle timeout
M201 X2350 Y2350 Z250 E2000         ; Accelerations (mm/s^2) chg from X3000 Y3000 Z100 E1500 original -- chg from M201 X1750 Y1750 Z250 E1500 - TAS 4/17/2023
M203 X24000 Y24000 Z900 E3600       ; Maximum speeds (mm/min)
M566 X900 Y900 Z100 E3600           ; Maximum jerk speeds mm/minute changed jerk from X1000 Y1000 Z100 E1500 original -- chg from M566 X600 Y600 Z200 E3600 - TAS 4/17/2023
;
;M579 Xnn Ynn Znn					; Scale Cartesian axes. Example: assume L(set in slicer)=100mm M=actual measurement
									; Xnnn..Ynnn..Znnn = L/M

;END STOPS
M574 X1 S1 P"xstop"			        ; _RRF3_ set X endstop to xstop port active high
M574 Y1 S1 P"ystop"			        ; _RRF3_ set Y endstop to ystop port active high
;PRINT VOLUME
M208 X287 Y287 Z310 S0               ; set axis maxima and high homing switch positions
M208 X0 Y0 Z-0.2 S1                 ; set axis minima and low homing switch positions

;LEADSCREW LOCATIONS
; M671 X-10:-10:333  Y22.5:277.5:150 S7.5  ;Front left, Rear Left, Right  S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew
M671 X-12.5:-12.5:343  Y23:277.2:150 S2.5  ;Front left (-12.5,23), Rear Left(-12.5,277.2), Right(343,148) to the bolt for the yoke of each leadscrew

;EXTRUDER E-STEPS
M92 X200 Y200 Z1600 E826	        ; steps/mm - old E steps 837 changed to 826  04/11/2020

;HEATERS
;
M308 S1 P"e0temp" Y"thermistor" A"e0_heat" T100000 B4725 R4700 C7.06e-8 H0 L0	; configure sensor 1 as thermistor on pin e0temp (Hotend)
M950 H1 C"e0heat" T1				;define Hotend heater is on e0heat
M143 H1 S300                        ; set the maximum temperature of the hot-end default=300C
;-----------------------------------------------------------------------------------
;If you have a Slice Engineering thermistor, comment out the next line -- Note Filastruder Kit Shipped with E3D thermistor
;_RRF3_ comment out: M305 P1 T100000 B4725 R4700 H0 L0 C7.06e-8	; Put your own H and/or L values here to set the first nozzle thermistor ADC correction
;
;BED HEATER
				;_RRF3_ define Bed heater is on bedheat
;_RRF3_ comment out: M305 P0 T100000 B3950 R4700 H0 L0	; Put your own H and/or L values here to set the bed thermistor ADC correction
;-----------------------------------------------------------------------------------
M308 S0 P"bedtemp" Y"thermistor" A"bed_heat" T100000 B3950 R4700 H0 L0 		;_RRF3_ Bed thermistor, connected to bedtemp on Duet2
M950 H0 C"bedheat" T0               ; create bed heater output on bedheat and map it to sensor 0
M140 H0                             ; Inform the firmware that bed heater 0 uses heater 0
M140 H0                             ; Standby and initial Temp for bed set to 0 (-273 = "off")  (** before M143 )
M143 H0 S120                        ; set the maximum bed temperature default=120C
M570 S360				            ; HEATER TIMEOUT - Hot end may be a little slow to heat up so allow it 180 seconds

;PID SETTINGS  
M307 H1 A457.8 C194.7 D3.2 S1.00 V24.0 B0 ; Hotend Heater 1 - Hot-end - PID tuned @ 240C 4/10/2020
M307 H0 R0.325 C637.9 D12.53 S1.00 V24.1  ;Heater 0 - MIC 6 Bed - PID tuned @110C 3/30/2021

; FANS
M950 F0 C"fan0"						;_RRF3_ define fan0 - Hotend Fan
M950 F1 C"fan1"						;_RRF3_ define fan1 - Part cooling fan
M950 F2 C"fan2"						;_RRF3_ define fan2  ??
M950 F3 C"duex.fan3"				;_RRF3_ define fan3 USED for Front LED Light
M106 P0 H-1 				        ; Init Hotend Fan - disable thermostatic mode for fan 0
M106 P1 H-1 			        	; Init part cooling fan - disable thermostatic mode for fan 1
M106 P2 H-1							; ?? not sure if anything is hooked up to this
M106 P3 H-1							; Init for Front LED Light
M106 P0 S0 			            	; - Hotend Fan - turn off fans
M106 P1 S0							; - Part cooling fan - turn off fans
M106 P2 S0							; ?? not sure if anything is hooked up to this
M106 P3 S0							; - Front LED Light - turn off light
	
; TOOL DEFINITIONS
M563 P0 D0 H1                      	; Define tool 0
G10 P0 X0 Y0 Z0                     ; Set tool 0 axis offsets
G10 P0 S0 R0                       	; Set tool 0 operating and standby temperatures
G10 P0 S0 R0 F1					    ; Set tool 0 operating and standby temperatures(-273 = "off")


; *******************Z PROBE AND COMPENSATION DEFINITION***********************
;
;*** If you have a switch instead of an IR probe, change P1 to P4 in the following M558 command
; IR PRobe - uncomment the following 2 lines if you have a and IR Probe, and comment out the BLTouch section below
;RRF3 IR Probe only comment out: M558 P1 X0 Y0 Z1			; Z probe is an IR probe and is not used for homing any axes
;M558 P1 C"^zprobe.in" H5 F120 T6000 A5 S0.02  ; _RRF3_ IR Probe connected to Z probe IN pin
;G31 X0 Y30 Z2.00 P500			; Set the zprobe height and threshold (put your own values here) 

;*******************(Set PRobe Points for Mesh Bed Measurements)**************************** 

;M557 X0:287 Y0:287 P20:20
M557 X0:287 Y0:256 P15:15; 
;M557 X10:287 Y0:250 S25:25
;M557 X2:295 Y36:295 P9:9                           ; Set Default Mesh - NOTE: take probe offset into account - "full" bed  - 7/19/2021
                                                   ; E.G. If probe offset is 42 on Y, then Y50:290 will take the hotend to Y08 to Y248)
                                                   ; for Mandala Rose Magnetic Bed x max changed to 290 from 295 due to tongue cooler

;BLTouch - comment out the following 3 lines if using a IR Probe
;M558 P9 C"^zprobe.in" H5 R1 F150 T6000 A5 S0.02  ; _RRF3_ BLTouch connected to Z probe IN pin -Changed homing speed from 50 to 150 - 10-16-2022
;M950 S0 C"duex.pwm1"				   ; _RRF3_ Define BLTouch Servo (S0) on duet pwm1

; ----------==============Z-Probe - Euclid Detachable Omron switch probe===================------------

M558 K0 P5 C"^zprobe.in" H5 R0.5 F240:120 T9000 A3 S0.03  ; K0 for probe 0, P5 for NC switch, C for input pin, ^ for enabling the native pullup
                                                    ; resistor on Duet2 hardware running RRF3 H dive height of 8mm, F240 probing speed ?mm/sec, 
                                                    ; T9000 travel speed 150mm/sec, A= number of probes 3, S0.03 max tolerance of 0.03

;G31 K0 P500 X-1 Y35 Z2.84                           ; Set Z probe trigger value, offset and trigger height (18 July 2021)
                                                    ; Tip: A larger trigger height in G31 moves you CLOSER to the bed
                                                    ; switch plunger is 35mm to the RIGHT and 2 in FRONT of the nozzle
                                                    ; switch triggers 0.9mm BELOW nozzle
                                                    ; https://duet3d.dozuki.com/Wiki/Test_and_calibrate_the_Z_probe#Section_Fine_tuning_the_trigger_height
                                

; OFFSET FOR SPECIFIC NOZZLES CURRENTLY INSTALLED
;G31 X2 Y42 Z3.59 P25 ; 0.5mm Nozzle-x -- Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here
;G31 X2 Y42 Z3.67 P25 ; 0.3mm Brass -- Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here
;G31 X2 Y42 Z3.655 P25 ; 0.8mm E3D Copper-- Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here
G31 P500 X-5 Y36 Z6.405 ; 0.6mm Bondtech CHT -- Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here
;G31 P500 X-5 Y36 Z6.305 ; 0.6mm Bondtech CHT -- Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here
;G31 X2 Y42 Z3.283 P25 ; 0.8mm Bondtech CHT -- Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here

; PRESSURE ADVANCE
; M572 D0 S0.06 ; set extruder 0 pressure advance to 0.06 seconds

;INPUT SHAPING - Activate Accelerometer
;M955 P0 C"spi.cs4+spi.cs3" I52 ; Uncomment to activate accelerometer for measurments

T0					; select first hot end
