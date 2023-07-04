
; from JeffDM on Railcore Discord
;cool down hot end using part cooling fan, then switch back to normal "speed mode" once cool
G10 P0 S0               ; hot end OFF 
M104 S0                 ; bed OFF
M106 P0 T50 S255 H1     ; thermostatic mode for part cooling fan, fan on until below T-temp.