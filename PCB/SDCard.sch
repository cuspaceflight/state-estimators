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
Sheet 2 7
Title "IMU SDCard"
Date ""
Rev ""
Comp "CUSF"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MICROSD_HOLDER U1
U 1 1 563870D3
P 3850 3400
F 0 "U1" H 3900 3450 60  0000 C CNN
F 1 "MICROSD_HOLDER" H 4400 2950 60  0000 C CNN
F 2 "IMU:MEM2051" H 4250 3400 60  0001 C CNN
F 3 "" H 4250 3400 60  0000 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 563872C8
P 4900 3000
F 0 "R3" V 4980 3000 50  0000 C CNN
F 1 "51k" V 4900 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4830 3000 30  0001 C CNN
F 3 "" H 4900 3000 30  0000 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5638738C
P 5150 3000
F 0 "R4" V 5230 3000 50  0000 C CNN
F 1 "51k" V 5150 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5080 3000 30  0001 C CNN
F 3 "" H 5150 3000 30  0000 C CNN
	1    5150 3000
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 563873C3
P 5400 3000
F 0 "R5" V 5480 3000 50  0000 C CNN
F 1 "51k" V 5400 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5330 3000 30  0001 C CNN
F 3 "" H 5400 3000 30  0000 C CNN
	1    5400 3000
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 563873E2
P 5650 3000
F 0 "R6" V 5730 3000 50  0000 C CNN
F 1 "51k" V 5650 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5580 3000 30  0001 C CNN
F 3 "" H 5650 3000 30  0000 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
Text HLabel 2950 3550 0    60   Input ~ 0
CARD_DETECT
$Comp
L C C16
U 1 1 56387499
P 2050 3350
F 0 "C16" H 2075 3450 50  0000 L CNN
F 1 "100n" H 2075 3250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2088 3200 30  0001 C CNN
F 3 "" H 2050 3350 60  0000 C CNN
	1    2050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2750 5650 2750
Wire Wire Line
	2050 3850 3800 3850
Wire Wire Line
	3800 3850 3800 3950
Wire Wire Line
	2950 3250 3350 3250
Wire Wire Line
	2950 3400 3350 3400
Wire Wire Line
	3350 3550 2950 3550
Wire Wire Line
	4400 3250 6050 3250
Wire Wire Line
	4400 3350 6100 3350
Wire Wire Line
	4400 3450 6100 3450
Wire Wire Line
	4400 3550 6050 3550
Wire Wire Line
	4900 3150 4900 3250
Connection ~ 4900 3250
Wire Wire Line
	5150 3150 5150 3350
Connection ~ 5150 3350
Wire Wire Line
	5400 3150 5400 3450
Connection ~ 5400 3450
Wire Wire Line
	5650 3150 5650 3550
Connection ~ 5650 3550
Connection ~ 3800 2750
Wire Wire Line
	3800 2600 3800 2950
Wire Wire Line
	2050 2750 2050 3200
Wire Wire Line
	2050 3500 2050 3850
$Comp
L +3.3V #PWR019
U 1 1 56388654
P 3800 2600
F 0 "#PWR019" H 3800 2560 30  0001 C CNN
F 1 "+3.3V" H 3800 2710 30  0000 C CNN
F 2 "" H 3800 2600 60  0000 C CNN
F 3 "" H 3800 2600 60  0000 C CNN
	1    3800 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 56388674
P 3800 3950
F 0 "#PWR020" H 3800 3950 30  0001 C CNN
F 1 "GND" H 3800 3880 30  0001 C CNN
F 2 "" H 3800 3950 60  0000 C CNN
F 3 "" H 3800 3950 60  0000 C CNN
	1    3800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2850 4900 2750
Connection ~ 4900 2750
Wire Wire Line
	5150 2850 5150 2750
Connection ~ 5150 2750
Wire Wire Line
	5400 2850 5400 2750
Connection ~ 5400 2750
Wire Wire Line
	5650 2750 5650 2850
Text GLabel 6150 3150 2    60   Input ~ 0
SDIO_D0
Text GLabel 6150 3300 2    60   Input ~ 0
SDIO_D1
Text GLabel 6150 3500 2    60   Input ~ 0
SDIO_D2
Text GLabel 6150 3650 2    60   Input ~ 0
SDIO_D3
Wire Wire Line
	6100 3450 6100 3500
Wire Wire Line
	6100 3500 6150 3500
Wire Wire Line
	6100 3350 6100 3300
Wire Wire Line
	6100 3300 6150 3300
Wire Wire Line
	6050 3250 6050 3150
Wire Wire Line
	6050 3150 6150 3150
Wire Wire Line
	6050 3550 6050 3650
Wire Wire Line
	6050 3650 6150 3650
Text GLabel 2950 3250 0    60   Input ~ 0
SDIO_CMD
Text GLabel 2950 3400 0    60   Input ~ 0
SDIO_CK
$EndSCHEMATC
