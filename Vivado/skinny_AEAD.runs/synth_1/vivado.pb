
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/utils_1/imports/synth_1/testbench.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2d
bC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/utils_1/imports/synth_1/testbench.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
�
Command: %s
53*	vivadotcl2q
osynth_design -top skinny_top -part xc7s6cpga196-1Q -directive AreaOptimized_medium -control_set_opt_threshold 1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
x
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2
xc7s6Z17-347h px� 
h
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2
xc7s6Z17-349h px� 
D
Loading part %s157*device2
xc7s6cpga196-1QZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
87928Z8-7075h px� 
�
%s*synth2z
xStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 992.934 ; gain = 467.281
h px� 
�
synthesizing module '%s'%s4497*oasys2

skinny_top2
 2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
28@Z8-6157h px� 
�
default block is never used226*oasys2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1248@Z8-226h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
reg_expected_ciphertext2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1718@Z8-567h px� 
�
default block is never used226*oasys2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1818@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

skinny_top2
 2
02
12U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
28@Z8-6155h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1105.312 ; gain = 579.660
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1105.312 ; gain = 579.660
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1105.312 ; gain = 579.660
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0232

1105.3122
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2a
]C:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/constrs_1/new/constraints_io.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2a
]C:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/constrs_1/new/constraints_io.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1173.3552
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0082

1173.3552
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:11 ; elapsed = 00:00:13 . Memory (MB): peak = 1173.355 ; gain = 647.703
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7s6cpga196-1Q
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:11 ; elapsed = 00:00:13 . Memory (MB): peak = 1173.355 ; gain = 647.703
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:13 . Memory (MB): peak = 1173.355 ; gain = 647.703
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
!inferring latch for variable '%s'327*oasys2
reg_ciphertext_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1898@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_expected_ciphertext_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1978@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
isLoadDone_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1848@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
isEncDone_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1858@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_plaintext_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1878@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
counter_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1908@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
round_counter_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1838@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_tweakey_reg[0]2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
2008@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_tweakey_reg[1]2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
2008@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_tweakey_reg[2]2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
2008@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
initial_tweakey_reg2U
QC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.srcs/sources_1/new/DUT.sv2
1888@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:14 . Memory (MB): peak = 1173.355 ; gain = 647.703
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   33 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 2     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input    128 Bit         XORs := 1     
h p
x
� 
H
%s
*synth20
.	   2 Input      8 Bit         XORs := 12    
h p
x
� 
H
%s
*synth20
.	   4 Input      8 Bit         XORs := 8     
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 16    
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input  384 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input  384 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input  128 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input  128 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
o
%s
*synth2W
UPart Resources:
DSPs: 10 (col length:20)
BRAMs: 10 (col length: RAMB18 20 RAMB36 10)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2 
reg_expected_ciphertext_reg[2]2

skinny_topZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2 
reg_expected_ciphertext_reg[1]2

skinny_topZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
round_counter_reg[7]2

skinny_topZ8-3332h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:28 ; elapsed = 00:00:33 . Memory (MB): peak = 1277.055 ; gain = 751.402
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
;
%s*synth2#
!
ROM: Preliminary Mapping Report
h px� 
\
%s*synth2D
B+------------+-----------------+---------------+----------------+
h px� 
]
%s*synth2E
C|Module Name | RTL Object      | Depth x Width | Implemented As | 
h px� 
\
%s*synth2D
B+------------+-----------------+---------------+----------------+
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | s_box           | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | round_constants | 64x6          | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 64x6          | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C|skinny_top  | p_0_out         | 256x8         | LUT            | 
h px� 
]
%s*synth2E
C+------------+-----------------+---------------+----------------+

h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:34 ; elapsed = 00:00:39 . Memory (MB): peak = 1327.391 ; gain = 801.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:39 ; elapsed = 00:00:45 . Memory (MB): peak = 1458.012 ; gain = 932.359
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:39 ; elapsed = 00:00:46 . Memory (MB): peak = 1458.066 ; gain = 932.414
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:00:42 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:42 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:42 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:42 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:43 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:43 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     4|
h px� 
2
%s*synth2
|2     |CARRY4 |    45|
h px� 
2
%s*synth2
|3     |LUT1   |    64|
h px� 
2
%s*synth2
|4     |LUT2   |   245|
h px� 
2
%s*synth2
|5     |LUT3   |   288|
h px� 
2
%s*synth2
|6     |LUT4   |   327|
h px� 
2
%s*synth2
|7     |LUT5   |   365|
h px� 
2
%s*synth2
|8     |LUT6   |   829|
h px� 
2
%s*synth2
|9     |MUXF7  |    15|
h px� 
2
%s*synth2
|10    |FDCE   |     4|
h px� 
2
%s*synth2
|11    |LD     |  1038|
h px� 
2
%s*synth2
|12    |IBUF   |    35|
h px� 
2
%s*synth2
|13    |OBUF   |     1|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:43 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 15 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:37 ; elapsed = 00:00:48 . Memory (MB): peak = 1575.668 ; gain = 981.973
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:43 ; elapsed = 00:00:49 . Memory (MB): peak = 1575.668 ; gain = 1050.016
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0142

1584.8202
0.000Z17-268h px� 
V
-Analyzing %s Unisim elements for replacement
17*netlist2
1098Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
�
�Netlist '%s' is not ideal for floorplanning, since the cellview '%s' contains a large number of primitives.  Please consider enabling hierarchy in synthesis if you want to do floorplanning.
310*netlist2

skinny_top2

skinny_topZ29-101h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12
7Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0042

1588.5202
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2z
x  A total of 1038 instances were transformed.
  LD => LDCE: 1031 instances
  LD => LDCE (inverted pins: G): 7 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

7177cec7Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
242
172
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:462

00:00:542

1588.5202

1218.633Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0042

1588.5202
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2U
SC:/Users/saini/OneDrive/Desktop/skinny_AEAD/skinny_AEAD.runs/synth_1/skinny_top.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2_
]report_utilization -file skinny_top_utilization_synth.rpt -pb skinny_top_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu Dec  5 19:33:46 2024Z17-206h px� 


End Record