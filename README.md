[README.md](https://github.com/user-attachments/files/32202901/README.md)
# Smart Home Security Logic System

## Project Overview

**Smart Home Security Logic System** is a beginner-level digital logic
project developed in **Verilog HDL** and tested using **AMD Vivado**.

The system monitors three security sensors:

-   **D** -- Door Sensor
-   **W** -- Window Sensor
-   **M** -- Motion Sensor

When any sensor is activated, the **Master Alarm** becomes HIGH.
Separate alarm outputs also show which sensor or sensors are active.

The project demonstrates basic **Boolean logic, OR gates, RTL design,
simulation, synthesis, implementation, and FPGA design analysis**.

------------------------------------------------------------------------

## Objectives

The main objectives of this project are:

1.  Monitor multiple home security sensors.
2.  Generate a separate alarm signal for each sensor.
3.  Generate one master alarm for the complete security system.
4.  Verify the logic using simulation and a self-checking testbench.
5.  Generate synthesis and implementation reports.
6.  View RTL and synthesized schematics.
7.  Maintain the project using Git and GitHub.

------------------------------------------------------------------------

## System Inputs and Outputs

  Signal           Type     Description
  ---------------- -------- ------------------------
  `D`              Input    Door sensor
  `W`              Input    Window sensor
  `M`              Input    Motion sensor
  `Door_Alarm`     Output   Door alarm status
  `Window_Alarm`   Output   Window alarm status
  `Motion_Alarm`   Output   Motion alarm status
  `Master_Alarm`   Output   Overall security alarm

------------------------------------------------------------------------

## Logic Used

The individual alarms directly follow their corresponding sensors:

``` text
Door_Alarm   = D
Window_Alarm = W
Motion_Alarm = M
```

The master alarm uses OR logic:

``` text
Master_Alarm = D OR W OR M
```

Therefore, the master alarm becomes `1` whenever at least one security
sensor is activated.

### Basic Logic Diagram

``` text
D ───────────────► Door_Alarm
│
├────► OR ──┐
W ──────────┤     │
│           ├────► OR ─────► Master_Alarm
M ──────────┘
│
└───────────────► Motion_Alarm
```

The actual RTL and synthesized schematics are available in the
`reports/schematics/` folder.

------------------------------------------------------------------------

## Truth Table

  D   W   M   Door Alarm   Window Alarm   Motion Alarm   Master Alarm
  --- --- --- ------------ -------------- -------------- --------------
  0   0   0   0            0              0              0
  0   0   1   0            0              1              1
  0   1   0   0            1              0              1
  0   1   1   0            1              1              1
  1   0   0   1            0              0              1
  1   0   1   1            0              1              1
  1   1   0   1            1              0              1
  1   1   1   1            1              1              1

------------------------------------------------------------------------

## Verilog Design

The main design is implemented in:

``` text
Smart_Home_Security.srcs/sources_1/new/smart_security.v
```

The design uses simple continuous assignments and OR logic, making it
suitable for understanding the fundamentals of combinational digital
circuits.

------------------------------------------------------------------------

## Simulation

A self-checking Verilog testbench is included at:

``` text
Smart_Home_Security.srcs/sim_1/new/smart_security_tb.v
```

The testbench checks all **8 possible combinations** of the three input
sensors.

The simulation verifies:

-   No sensor activation
-   Motion activation
-   Window activation
-   Window + Motion
-   Door activation
-   Door + Motion
-   Door + Window
-   All three sensors

The waveform configuration is saved in:

``` text
reports/smart_security_tb_behav.wcfg
```

------------------------------------------------------------------------

## Design Verification

The simulation was completed successfully and the waveform was checked
for all eight input combinations.

The expected behavior is:

``` text
000 → Master Alarm OFF
001 → Motion Alarm ON
010 → Window Alarm ON
011 → Window + Motion ON
100 → Door Alarm ON
101 → Door + Motion ON
110 → Door + Window ON
111 → All Alarms ON
```

------------------------------------------------------------------------

## Vivado Reports

The project contains generated Vivado reports for both synthesis and
implementation.

### Synthesis Reports

``` text
reports/synthesis/
├── utilization.rpt
├── timing_summary.rpt
├── power.rpt
└── methodology.rpt
```

### Implementation Reports

``` text
reports/implementation/
├── utilization.rpt
├── timing_summary.rpt
├── power.rpt
├── drc.rpt
└── methodology.rpt
```

These reports provide information about resource utilization, timing,
power estimation, design-rule checks, and methodology analysis.

------------------------------------------------------------------------

## Schematics

Vivado-generated schematic PDFs are included in:

``` text
reports/schematics/
├── RTL_Schematic.pdf
└── Synthesized_Schematic.pdf
```

### RTL Schematic

Shows the logical structure interpreted from the Verilog RTL.

### Synthesized Schematic

Shows the circuit structure generated after synthesis.

------------------------------------------------------------------------

## FPGA and Software

### FPGA Target

``` text
Device: xc7a100tcsg324-1
Family: Artix-7
```

### Development Tool

``` text
AMD Vivado
```

### Hardware Description Language

``` text
Verilog HDL
```

### Version Control

``` text
Git
GitHub
```

------------------------------------------------------------------------

## Project Structure

``` text
Smart_Home_Security/
│
├── reports/
│   ├── implementation/
│   ├── schematics/
│   │   ├── RTL_Schematic.pdf
│   │   └── Synthesized_Schematic.pdf
│   ├── synthesis/
│   └── smart_security_tb_behav.wcfg
│
├── Smart_Home_Security.srcs/
│   ├── sources_1/
│   │   └── new/
│   │       └── smart_security.v
│   └── sim_1/
│       └── new/
│           └── smart_security_tb.v
│
├── .gitignore
├── Smart_Home_Security.xpr
└── README.md
```

Vivado temporary and generated working folders are excluded from Git
using `.gitignore` to keep the repository clean.

------------------------------------------------------------------------

## How to Run the Project

1.  Install **AMD Vivado**.
2.  Clone or download this repository.
3.  Open `Smart_Home_Security.xpr` in Vivado.
4.  Review the Verilog source.
5.  Run **Behavioral Simulation**.
6.  Check the waveform for all eight test cases.
7.  Run **Synthesis**.
8.  Open the synthesized design and review the schematic.
9.  Run **Implementation**.
10. Review the reports stored in the `reports` folder.

------------------------------------------------------------------------

## Future Advancements

This project can be developed into a more practical smart-home security
system.

### 1. Buzzer and LED Indicators

Connect physical LEDs and a buzzer to the FPGA so that an alarm can be
shown and heard when a sensor is triggered.

### 2. Sensor Identification

Add a priority or display circuit to show exactly which sensor caused
the alarm on a seven-segment display or LCD.

### 3. Alarm Memory

Add a latch or flip-flop so that once an alarm is triggered, it remains
active until a reset button is pressed.

### 4. Password-Based Reset

Add a keypad and digital password system so that the alarm can only be
disabled after entering the correct password.

### 5. Alarm Delay

Add a timer that provides a short entry/exit delay before activating or
disabling the alarm.

### 6. More Sensors

The design can be expanded with:

-   Smoke sensor
-   Fire sensor
-   Gas sensor
-   Temperature sensor
-   Additional doors and windows

### 7. Seven-Segment Display

Display messages such as:

``` text
DOOR
WINDOW
MOTION
ALARM
```

depending on the active sensor.

### 8. GSM or IoT Connectivity

A future version could send an alert to a phone or web application when
a security event occurs.

### 9. Event Logging

Add memory to store information about sensor activations so that
previous security events can be reviewed.

### 10. Smart Security Controller

The complete project could eventually combine sensors, timers,
authentication, displays, communication, and alarm control into a larger
FPGA-based security controller.

------------------------------------------------------------------------

## Learning Outcomes

This project provides practical experience with:

-   Digital logic design
-   Boolean expressions
-   OR gates
-   Combinational circuits
-   Verilog HDL
-   Testbench development
-   Behavioral simulation
-   Waveform analysis
-   RTL schematic analysis
-   Synthesis
-   FPGA implementation
-   Timing and utilization reports
-   Git and GitHub project management

------------------------------------------------------------------------

## Conclusion

The **Smart Home Security Logic System** demonstrates how a simple
real-world security requirement can be converted into a digital logic
circuit and implemented using Verilog.

The current design is intentionally simple and focuses on understanding
the basic concepts of **inputs, outputs, Boolean logic, simulation,
synthesis, and FPGA implementation**. It also provides a strong starting
point for developing a more advanced smart-home security system in the
future.

------------------------------------------------------------------------

## Author

**Smart Home Security Logic System**\
B.Tech CSIT Digital Logic Project\
Developed using Verilog HDL and AMD Vivado
