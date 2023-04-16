;M280 P0 S10 	;_RRF3_ change P3 to P0 ;BLTOUCH servo deploy probe point
echo "Deploying Probe"
G1 X0 Y250 F6000
G1 X0 Y300 F1500
G1 X50 Y300 F1500
;G1 X150 Y150 F6000
