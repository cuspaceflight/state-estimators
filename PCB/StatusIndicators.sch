EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32f405vgt
LIBS:adp3335
LIBS:buzzer
LIBS:q_nmos_gsd
LIBS:ADIS16405
LIBS:uSD_holder
LIBS:ms5611-01ba03
LIBS:microusb
LIBS:usblc6-2
LIBS:swd
LIBS:IMU-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title "6DOF IMU Indicators"
Date "2015-10-31"
Rev "0.1"
Comp "Cambridge University Spaceflight"
Comment1 "Gregory Brooks"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2200 4000 0    60   Input ~ 0
IMU
Text HLabel 4100 4000 0    60   Input ~ 0
Buzzer
Text HLabel 2200 3000 0    60   Input ~ 0
Sensors
$Comp
L +5V #PWR11
U 1 1 5634EC79
P 2200 2000
F 0 "#PWR11" H 2200 1850 50  0001 C CNN
F 1 "+5V" H 2200 2140 50  0000 C CNN
F 2 "" H 2200 2000 60  0000 C CNN
F 3 "" H 2200 2000 60  0000 C CNN
	1    2200 2000
	1    0    0    -1  
$EndComp
Text HLabel 2200 3500 0    60   Input ~ 0
~Sensors
Text HLabel 2200 4500 0    60   Input ~ 0
~IMU
$Comp
L BUZZER SP1
U 1 1 5634F9B5
P 5900 3550
F 0 "SP1" H 6400 3550 60  0000 C CNN
F 1 "SPEAKER" V 6050 3550 60  0000 C CNN
F 2 "IMU:ABI-042-RC" H 5900 3550 60  0001 C CNN
F 3 "~" H 5900 3550 60  0000 C CNN
F 4 "Value" H 5900 3550 60  0001 C CNN "Digikey"
F 5 "1827949" H 5900 3550 60  0001 C CNN "Farnell"
F 6 "Value" H 5900 3550 60  0001 C CNN "Fieldname"
	1    5900 3550
	1    0    0    -1  
$EndComp
$Comp
L LED D5
U 1 1 563508F7
P 2900 3500
F 0 "D5" H 2900 3600 50  0000 C CNN
F 1 "LED_RED" H 2900 3400 50  0000 C CNN
F 2 "IMU:0603_LED" H 2900 3500 60  0001 C CNN
F 3 "~" H 2900 3500 60  0000 C CNN
F 4 "Value" H 2900 3500 60  0001 C CNN "Digikey"
F 5 "2290329" H 2900 3500 60  0001 C CNN "Farnell"
F 6 "Value" H 2900 3500 60  0001 C CNN "Fieldname"
	1    2900 3500
	-1   0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 56350DBA
P 2900 3000
F 0 "D4" H 2900 3100 50  0000 C CNN
F 1 "LED_GREEN" H 2900 2900 50  0000 C CNN
F 2 "IMU:0603_LED" H 2900 3000 60  0001 C CNN
F 3 "~" H 2900 3000 60  0000 C CNN
F 4 "Value" H 2900 3000 60  0001 C CNN "Digikey"
F 5 "2290328" H 2900 3000 60  0001 C CNN "Farnell"
F 6 "Value" H 2900 3000 60  0001 C CNN "Fieldname"
	1    2900 3000
	-1   0    0    -1  
$EndComp
$Comp
L LED D6
U 1 1 563510ED
P 2900 4000
F 0 "D6" H 2900 4100 50  0000 C CNN
F 1 "LED_GREEN" H 2900 3900 50  0000 C CNN
F 2 "IMU:0603_LED" H 2900 4000 60  0001 C CNN
F 3 "~" H 2900 4000 60  0000 C CNN
F 4 "Value" H 2900 4000 60  0001 C CNN "Digikey"
F 5 "2290328" H 2900 4000 60  0001 C CNN "Farnell"
F 6 "Value" H 2900 4000 60  0001 C CNN "Fieldname"
	1    2900 4000
	-1   0    0    -1  
$EndComp
$Comp
L LED D7
U 1 1 5635112A
P 2900 4500
F 0 "D7" H 2900 4600 50  0000 C CNN
F 1 "LED_RED" H 2900 4400 50  0000 C CNN
F 2 "IMU:0603_LED" H 2900 4500 60  0001 C CNN
F 3 "~" H 2900 4500 60  0000 C CNN
F 4 "Value" H 2900 4500 60  0001 C CNN "Digikey"
F 5 "2290329" H 2900 4500 60  0001 C CNN "Farnell"
F 6 "Value" H 2900 4500 60  0001 C CNN "Fieldname"
	1    2900 4500
	-1   0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 56351282
P 2900 2500
F 0 "D3" H 2900 2600 50  0000 C CNN
F 1 "LED_GREEN" H 2900 2400 50  0000 C CNN
F 2 "IMU:0603_LED" H 2900 2500 60  0001 C CNN
F 3 "~" H 2900 2500 60  0000 C CNN
F 4 "Value" H 2900 2500 60  0001 C CNN "Digikey"
F 5 "2290328" H 2900 2500 60  0001 C CNN "Farnell"
F 6 "Value" H 2900 2500 60  0001 C CNN "Fieldname"
	1    2900 2500
	-1   0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 563512B1
P 2900 2000
F 0 "D2" H 2900 2100 50  0000 C CNN
F 1 "LED_GREEN" H 2900 1900 50  0000 C CNN
F 2 "IMU:0603_LED" H 2900 2000 60  0001 C CNN
F 3 "~" H 2900 2000 60  0000 C CNN
F 4 "Value" H 2900 2000 60  0001 C CNN "Digikey"
F 5 "2290328" H 2900 2000 60  0001 C CNN "Farnell"
F 6 "Value" H 2900 2000 60  0001 C CNN "Fieldname"
	1    2900 2000
	-1   0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 563517D4
P 2450 2000
F 0 "R6" V 2570 2090 60  0000 C CNN
F 1 "200" V 2350 2000 60  0000 C CNN
F 2 "IMU:0603" H 2450 2000 60  0001 C CNN
F 3 "~" H 2450 2000 60  0000 C CNN
F 4 "Value" H 2450 2000 60  0001 C CNN "Digikey"
F 5 "1469777" H 2450 2000 60  0001 C CNN "Farnell"
F 6 "Value" H 2450 2000 60  0001 C CNN "Fieldname"
	1    2450 2000
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 5635198A
P 2450 2500
F 0 "R7" V 2570 2590 60  0000 C CNN
F 1 "130" V 2350 2500 60  0000 C CNN
F 2 "IMU:0603" H 2450 2500 60  0001 C CNN
F 3 "~" H 2450 2500 60  0000 C CNN
F 4 "Value" H 2450 2500 60  0001 C CNN "Digikey"
F 5 "2141288" H 2450 2500 60  0001 C CNN "Farnell"
F 6 "Value" H 2450 2500 60  0001 C CNN "Fieldname"
	1    2450 2500
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 563519E2
P 2450 3000
F 0 "R8" V 2570 3090 60  0000 C CNN
F 1 "130" V 2350 3000 60  0000 C CNN
F 2 "IMU:0603" H 2450 3000 60  0001 C CNN
F 3 "~" H 2450 3000 60  0000 C CNN
F 4 "Value" H 2450 3000 60  0001 C CNN "Digikey"
F 5 "2141288" H 2450 3000 60  0001 C CNN "Farnell"
F 6 "Value" H 2450 3000 60  0001 C CNN "Fieldname"
	1    2450 3000
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 56351A54
P 2450 4000
F 0 "R10" V 2570 4090 60  0000 C CNN
F 1 "130" V 2350 4000 60  0000 C CNN
F 2 "IMU:0603" H 2450 4000 60  0001 C CNN
F 3 "~" H 2450 4000 60  0000 C CNN
F 4 "Value" H 2450 4000 60  0001 C CNN "Digikey"
F 5 "2141288" H 2450 4000 60  0001 C CNN "Farnell"
F 6 "Value" H 2450 4000 60  0001 C CNN "Fieldname"
	1    2450 4000
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 56351ECB
P 2450 3500
F 0 "R9" V 2570 3590 60  0000 C CNN
F 1 "150" V 2350 3500 60  0000 C CNN
F 2 "IMU:0603" H 2450 3500 60  0001 C CNN
F 3 "~" H 2450 3500 60  0000 C CNN
F 4 "Value" H 2450 3500 60  0001 C CNN "Digikey"
F 5 "2333549" H 2450 3500 60  0001 C CNN "Farnell"
F 6 "Value" H 2450 3500 60  0001 C CNN "Fieldname"
	1    2450 3500
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 563521EC
P 2450 4500
F 0 "R11" V 2570 4590 60  0000 C CNN
F 1 "150" V 2350 4500 60  0000 C CNN
F 2 "IMU:0603" H 2450 4500 60  0001 C CNN
F 3 "~" H 2450 4500 60  0000 C CNN
F 4 "Value" H 2450 4500 60  0001 C CNN "Digikey"
F 5 "2333549" H 2450 4500 60  0001 C CNN "Farnell"
F 6 "Value" H 2450 4500 60  0001 C CNN "Fieldname"
	1    2450 4500
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 56368248
P 4400 4000
F 0 "R12" V 4520 4090 60  0000 C CNN
F 1 "100" V 4300 4000 60  0000 C CNN
F 2 "IMU:0603" H 4400 4000 60  0001 C CNN
F 3 "~" H 4400 4000 60  0000 C CNN
F 4 "Value" H 4400 4000 60  0001 C CNN "Digikey"
F 5 "2331989" H 4400 4000 60  0001 C CNN "Farnell"
F 6 "Value" H 4400 4000 60  0001 C CNN "Fieldname"
	1    4400 4000
	0    1    1    0   
$EndComp
$Comp
L R R13
U 1 1 56368510
P 5250 3600
F 0 "R13" V 5150 3500 60  0000 C CNN
F 1 "10" V 5350 3600 60  0000 C CNN
F 2 "IMU:0603" H 5250 3600 60  0001 C CNN
F 3 "~" H 5250 3600 60  0000 C CNN
F 4 "Value" H 5250 3600 60  0001 C CNN "Digikey"
F 5 "2331975" H 5250 3600 60  0001 C CNN "Farnell"
F 6 "Value" H 5250 3600 60  0001 C CNN "Fieldname"
	1    5250 3600
	0    -1   -1   0   
$EndComp
$Comp
L Q_NMOS_GSD Q1
U 1 1 5636865C
P 4900 4000
F 0 "Q1" H 5200 4050 50  0000 R CNN
F 1 "Q_NMOS_GSD_PSV" H 5750 3950 50  0000 R CNN
F 2 "IMU:SOT-23" H 5100 4100 29  0001 C CNN
F 3 "" H 4900 4000 60  0000 C CNN
F 4 "Value" H 4900 4000 60  0001 C CNN "Digikey"
F 5 "1510761" H 4900 4000 60  0001 C CNN "Farnell"
F 6 "Value" H 4900 4000 60  0001 C CNN "Fieldname"
	1    4900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2000 3100 4750
Connection ~ 3100 2500
Connection ~ 3100 3000
Connection ~ 3100 3500
Connection ~ 3100 4000
Connection ~ 3100 4500
Wire Wire Line
	2600 2000 2700 2000
Wire Wire Line
	2600 2500 2700 2500
Wire Wire Line
	2600 3000 2700 3000
Wire Wire Line
	2600 4000 2700 4000
Wire Wire Line
	2200 2000 2300 2000
Wire Wire Line
	2200 2500 2300 2500
Wire Wire Line
	2200 3000 2300 3000
Wire Wire Line
	2200 4000 2300 4000
Wire Wire Line
	2600 3500 2700 3500
Wire Wire Line
	2600 4500 2700 4500
Wire Wire Line
	2300 4500 2200 4500
Wire Wire Line
	2200 3500 2300 3500
Wire Wire Line
	5700 3300 5700 3500
Wire Wire Line
	5400 3600 5700 3600
Wire Wire Line
	5000 3600 5000 3800
Wire Wire Line
	5000 4200 5000 4350
Wire Wire Line
	4550 4000 4700 4000
Wire Wire Line
	4100 4000 4250 4000
$Comp
L +3.3V #PWR12
U 1 1 5636BED9
P 2200 2500
F 0 "#PWR12" H 2200 2460 30  0001 C CNN
F 1 "+3.3V" H 2200 2610 30  0000 C CNN
F 2 "" H 2200 2500 60  0000 C CNN
F 3 "" H 2200 2500 60  0000 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR15
U 1 1 5636C396
P 5700 3300
F 0 "#PWR15" H 5700 3260 30  0001 C CNN
F 1 "+3.3V" H 5700 3410 30  0000 C CNN
F 2 "" H 5700 3300 60  0000 C CNN
F 3 "" H 5700 3300 60  0000 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 5636C57D
P 5000 4350
F 0 "#PWR14" H 5000 4350 30  0001 C CNN
F 1 "GND" H 5000 4280 30  0001 C CNN
F 2 "" H 5000 4350 60  0000 C CNN
F 3 "" H 5000 4350 60  0000 C CNN
	1    5000 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR13
U 1 1 5636C73C
P 3100 4750
F 0 "#PWR13" H 3100 4750 30  0001 C CNN
F 1 "GND" H 3100 4680 30  0001 C CNN
F 2 "" H 3100 4750 60  0000 C CNN
F 3 "" H 3100 4750 60  0000 C CNN
	1    3100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3600 5100 3600
$EndSCHEMATC
