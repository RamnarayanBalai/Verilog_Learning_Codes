# Verilog HDL Implementations for Digital Logic Design

## 1. Overview

This repository contains a structured collection of my Verilog HDL learnings. The modules cover fundamental concepts, combinational and sequential logic, finite state machines, and memory architectures, targeting applications in FPGA, ASIC, and embedded systems.

---

## 2. Module Categories

The codebase is organized into the following categories, progressing from fundamental constructs to system-level designs.

- **[Basics](#3-basics-of-verilog-hdl):** Foundational Verilog constructs and assignment types.
- **[Combinational Circuits](#4-combinational-logic-circuits):** Stateless logic circuits, including arithmetic units, multiplexers, and decoders.
- **[Sequential Circuits](#5-sequential-logic-circuits):** State-holding circuits, including latches, flip-flops, counters, and registers.
- **[Finite State Machines (FSMs)](#6-finite-state-machines-fsms):** Controllers and sequence detectors using Moore and Mealy models.
- **[Memory Systems](#7-memory-systems):** Implementations of Block RAM (BRAM) and standard RAM structures.
- **[Push Button Interface](#8-push-button-interface):** Hardware interfacing techniques for handling switch bounce and detecting signal edges.
- **[Swap Two Memory Locations](#9-swap-two-memory-locations):** A system-level design integrating an FSM with a register file.
- **[Traffic Light Controller](#10-traffic-light-controller):** A complete FSM-based system design example.

---

## 3. Basics of Verilog HDL

### 3.1. Theoretical Foundation

Verilog HDL is used to describe the structure and behavior of digital hardware. Unlike sequential software programming, its primary execution model is concurrent, reflecting the parallel nature of hardware. Two fundamental concepts are arithmetic operations at the hardware level and the distinction between blocking and non-blocking assignments, which is critical for correctly modeling combinational and sequential logic.

### 3.2. Module Implementations

| File | Description | Key Concepts Demonstrated |
|------|-------------|---------------------------|
| [arithmatic_operators.v](Basics/rtl/arithmatic_operators.v) | An N-bit arithmetic module. | Implements addition and subtraction, demonstrating carry and overflow generation for signed and unsigned numbers. |
| [blocking_vs_nonblocking_assignment.v](Basics/rtl/blocking_vs_nonblocking_assignment.v) | A module comparing `assign` (`=`) and `always @*` (`<=`) blocks. | Illustrates the synthesis and simulation differences between blocking (`=`) and non-blocking (`<=`) assignments. Blocking assignments are evaluated sequentially within a block and are suitable for combinational logic. Non-blocking assignments are scheduled to occur at the end of a time step, preventing race conditions in sequential logic. |

---

## 4. Combinational Logic Circuits

### 4.1. Theoretical Foundation

A combinational circuit's outputs are a pure function of its present inputs. Mathematically, `Output = f(Input)`. These circuits have no memory elements and thus no state. Their behavior is defined by Boolean algebra. Key design considerations include propagation delay, logic gate count, and power consumption.

### 4.2. Module Implementations

#### 4.2.1. Adders and Arithmetic Logic

These modules form the basis of Arithmetic Logic Units (ALUs).

| File | Description | Implementation Details |
|------|-------------|------------------------|
| [half_adder.v](Combinational%20circuits/rtl/half_adder.v) | 1-bit half adder. | `S = A ^ B`, `Cout = A & B`. |
| [full_adder.v](Combinational%20circuits/rtl/full_adder.v) | 1-bit full adder. | Implemented by instantiating two half adders. `S = (A ^ B) ^ Cin`. |
| [rca_4bit.v](Combinational%20circuits/rtl/rca_4bit.v) | 4-bit Ripple Carry Adder. | Constructed by cascading four full adders. The critical path is through the carry chain. |
| [rca_nbit.v](Combinational%20circuits/rtl/rca_nbit.v) | N-bit parameterizable RCA. | A generic implementation of the ripple-carry design. |
| [adder_substractor_4bit.v](Combinational%20circuits/rtl/adder_substractor_4bit.v) | 4-bit adder/subtractor. | Uses XOR gates to conditionally invert the second operand for subtraction, based on a control signal. `A - B = A + (~B + 1)`. |
| [adder_substractor_nbit.v](Combinational%20circuits/rtl/adder_substractor_nbit.v) | N-bit parameterizable adder/subtractor. | A generic version of the above. |
| [adder_substractor_signedNo.v](Combinational%20circuits/rtl/adder_substractor_signedNo.v) | Signed number adder/subtractor. | Handles two's complement arithmetic and overflow detection. |
| [multiple_adder.v](Combinational%20circuits/rtl/multiple_adder.v) | Multi-operand adder. | Demonstrates how to add more than two numbers, often synthesized into a carry-save adder tree. |

#### 4.2.2. Multiplexers (MUX)

Multiplexers are data selectors, routing one of several inputs to a single output based on a select signal.

| File | Description | Implementation Style |
|------|-------------|----------------------|
| [mux_2x1_gate.v](Combinational%20circuits/rtl/mux_2x1_gate.v) | 2-to-1 MUX. | Gate-level (AND-OR logic). `Y = (A & ~S) | (B & S)`. |
| [mux_2x1_dataflow.v](Combinational%20circuits/rtl/mux_2x1_dataflow.v) | 2-to-1 MUX. | Dataflow (`assign Y = S ? B : A;`). |
| [mux_2x1_beh.v](Combinational%20circuits/rtl/mux_2x1_beh.v) | 2-to-1 MUX. | Behavioral (`always @*` with `case` or `if-else`). |
| [mux_2x1_nbit.v](Combinational%20circuits/rtl/mux_2x1_nbit.v) | N-bit wide 2-to-1 MUX. | Parameterizable data width. |
| [mux_4x1.v](Combinational%20circuits/rtl/mux_4x1.v) | 4-to-1 MUX. | Basic implementation. |
| [mux_4x1_nbit.v](Combinational%20circuits/rtl/mux_4x1_nbit.v) | N-bit wide 4-to-1 MUX. | Parameterizable data width. |
| [mux_generic_1bit.v](Combinational%20circuits/rtl/mux_generic_1bit.v) | Generic MUX. | Input count is parameterizable. |

#### 4.2.3. Decoders and Encoders

Decoders convert binary information from N inputs to a maximum of 2^N unique outputs. Encoders perform the reverse operation.

| File | Description | Logic Function |
|------|-------------|----------------|
| [decoder_2x4.v](Combinational%20circuits/rtl/decoder_2x4.v) | 2-to-4 decoder. | Converts a 2-bit address into a 4-bit one-hot output. |
| [decoder_2x4_en.v](Combinational%20circuits/rtl/decoder_2x4_en.v) | 2-to-4 decoder with enable. | Adds an enable signal to control the output. |
| [decoder_generic.v](Combinational%20circuits/rtl/decoder_generic.v) | N-to-2^N decoder. | Parameterizable input width. |
| [encoder_4x2.v](Combinational%20circuits/rtl/encoder_4x2.v) | 4-to-2 encoder. | Converts a 4-bit one-hot input to a 2-bit binary output. |
| [priority_encoder.v](Combinational%20circuits/rtl/priority_encoder.v) | Priority encoder. | If multiple inputs are active, the one with the highest priority is encoded. |
| [generic_priority_encoder.v](Combinational%20circuits/rtl/generic_priority_encoder.v) | Generic priority encoder. | Parameterizable input width. |

#### 4.2.4. Display Interfaces

| File | Description | Application |
|------|-------------|-------------|
| [hexto7segment.v](Combinational%20circuits/rtl/hexto7segment.v) | Hex-to-7-segment decoder. | Maps a 4-bit hexadecimal value to the 7 signals required to drive a common-cathode 7-segment display. |

---

## 5. Sequential Logic Circuits

### 5.1. Theoretical Foundation

Sequential circuits contain memory elements (latches or flip-flops), and their outputs depend on both current inputs and the previous state. The state is stored in memory elements and updated based on a clock signal (in synchronous circuits). The state transition is governed by the characteristic equations of the memory elements.

### 5.2. Module Implementations

#### 5.2.1. Latches and Flip-Flops

These are the fundamental 1-bit memory elements.

| File | Description | Triggering Mechanism |
|------|-------------|----------------------|
| [D_latch.v](Sequential%20Circuits/rtl/D_latch.v) | D Latch. | Level-sensitive. The output follows the input `D` when the clock is high. |
| [DFF.v](Sequential%20Circuits/rtl/DFF.v) | D Flip-Flop. | Positive edge-triggered. The output `Q` is updated with the value of `D` only at the rising edge of the clock. |
| [DFF_reset.v](Sequential%20Circuits/rtl/DFF_reset.v) | D Flip-Flop with asynchronous reset. | Includes a reset input that forces the state to a known value regardless of the clock. |
| [DFF_neg.v](Sequential%20Circuits/rtl/DFF_neg.v) | D Flip-Flop. | Negative edge-triggered. |
| [DFF_multi.v](Sequential%20Circuits/rtl/DFF_multi.v) | D Flip-Flop with complementary outputs. | Provides both `Q` and `Q_bar`. |
| [TFF.v](Sequential%20Circuits/rtl/TFF.v) | T Flip-Flop. | Toggles its state (`Q` <= `~Q`) when input `T` is high and a clock edge occurs. |

#### 5.2.2. Counters

Counters are sequential circuits that progress through a predetermined sequence of states.

| File | Description | Key Feature |
|------|-------------|-------------|
| [up_counter.v](Sequential%20Circuits/rtl/up_counter.v) | Synchronous up-counter. | Increments on each clock cycle. |
| [async_up_counter.v](Sequential%20Circuits/rtl/async_up_counter.v) | Asynchronous (ripple) up-counter. | The output of one flip-flop serves as the clock for the next, leading to propagation delay accumulation. |
| [up_down_counter.v](Sequential%20Circuits/rtl/up_down_counter.v) | Synchronous up/down counter. | A control signal determines the direction of counting. |
| [sync_counter.v](Sequential%20Circuits/rtl/sync_counter.v) | Generic synchronous counter. | A more detailed implementation. |
| [mod_counter.v](Sequential%20Circuits/rtl/mod_counter.v) | Modulo-N counter. | Counts from 0 to N-1 and then resets. |
| [BCD_counter.v](Sequential%20Circuits/rtl/BCD_counter.v) | Binary Coded Decimal (BCD) counter. | Counts from 0 to 9 and resets. Used for decimal applications. |
| [UDL_counter.v](Sequential%20Circuits/rtl/UDL_counter.v) | Up/Down/Load counter. | Can count up, count down, or be parallel-loaded with a specific value. |

#### 5.2.3. Registers and Shift Registers

Registers are arrays of flip-flops used to store multi-bit data. Shift registers allow data to be moved between adjacent flip-flops.

| File | Description | I/O Configuration |
|------|-------------|---------------------|
| [register_simple.v](Sequential%20Circuits/rtl/register_simple.v) | N-bit register. | Parallel-In, Parallel-Out (PIPO). |
| [register_PIPO_LOAD.v](Sequential%20Circuits/rtl/register_PIPO_LOAD.v) | PIPO register with load enable. | Data is loaded only when the `load` signal is active. |
| [register_SISO.v](Sequential%20Circuits/rtl/register_SISO.v) | Shift register. | Serial-In, Serial-Out (SISO). |
| [shift_register_LOAD.v](Sequential%20Circuits/rtl/shift_register_LOAD.v) | Shift register with parallel load. | Can be loaded serially or in parallel. |
| [univ_shift_reg.v](Sequential%20Circuits/rtl/univ_shift_reg.v) | Universal shift register. | Supports shift left, shift right, parallel load, and hold operations. |
| [LFSR.v](Sequential%20Circuits/rtl/LFSR.v) | Linear Feedback Shift Register. | Generates a pseudo-random bit sequence. Used in testing, cryptography, and communications. |

#### 5.2.4. Timing and Control

| File | Description | Application |
|------|-------------|-------------|
| [timer_param.v](Sequential%20Circuits/rtl/timer_param.v) | Parameterizable countdown timer. | Generates a pulse after a specified number of clock cycles. |
| [pwm_basic.v](Sequential%20Circuits/rtl/pwm_basic.v) | Pulse Width Modulation (PWM) generator. | Creates a square wave with a variable duty cycle. Used in motor control, power regulation, etc. |

---

## 6. Finite State Machines (FSMs)

### 6.1. Theoretical Foundation

An FSM is a model of computation defined by a set of states, a start state, an input alphabet, and a transition function.
- **Moore FSM:** The output is a function only of the current state. `Output = g(Current_State)`.
- **Mealy FSM:** The output is a function of both the current state and the current inputs. `Output = g(Current_State, Current_Input)`. Mealy machines can often be implemented with fewer states than Moore machines but may have asynchronous output changes.

### 6.2. Module Implementations

| File | Model | Description |
|------|-------|-------------|
| [moore_011_detector.v](Finite%20State%20Machines/rtl/moore_011_detector.v) | Moore | Detects the serial input sequence "011". The output is asserted for one clock cycle after the sequence is detected. |
| [moore_101_detector.v](Finite%20State%20Machines/rtl/moore_101_detector.v) | Moore | Detects the serial input sequence "101". |
| [mealy_011_detector.v](Finite%20State%20Machines/rtl/mealy_011_detector.v) | Mealy | Detects the serial input sequence "011". The output is asserted as soon as the final '1' is received. |
| [mealy_101_detector.v](Finite%20State%20Machines/rtl/mealy_101_detector.v) | Mealy | Detects the serial input sequence "101". |
| [fsm_counter.v](Finite%20State%20Machines/rtl/fsm_counter.v) | FSM | A simple counter implemented with an explicit state machine structure. |

---

## 7. Memory Systems

### 7.1. Theoretical Foundation

On-chip memory is a critical component of digital systems. In FPGAs, this is often implemented using dedicated Block RAM (BRAM) resources, which are more efficient than synthesizing RAM from logic elements (LUTs). Key parameters include data width, address width (which determines depth), and port configuration (single-port, simple dual-port, true dual-port).

### 7.2. Module Implementations

These modules follow templates that synthesis tools infer as BRAM.

| File | Description | Port Configuration |
|------|-------------|--------------------|
| [bram_synch_one_port.v](Memory/rtl/bram_synch_one_port.v) | Synchronous Single-Port RAM. | One port for both reading and writing. |
| [bram_synch_dual_port.v](Memory/rtl/bram_synch_dual_port.v) | Synchronous True Dual-Port RAM. | Two independent ports, each capable of simultaneous read and write operations. |
| [bram_simple_synch_dual_port.v](Memory/rtl/bram_simple_synch_dual_port.v) | Synchronous Simple Dual-Port RAM. | One port is read-only, and the other is write-only. |
| [ram_2ports.v](Memory/rtl/ram_2ports.v) | Generic 2-port RAM. | A behavioral model of a dual-port RAM. |
| [ram_3ports.v](Memory/rtl/ram_3ports.v) | Generic 3-port RAM. | A behavioral model of a RAM with three access ports. |

---

## 8. Push Button Interface

### 8.1. Theoretical Foundation

Interfacing with mechanical switches requires handling physical phenomena like contact bounce. Debouncing circuits filter out the spurious transitions that occur when a switch is pressed or released. Edge detection circuits are then used to generate single-cycle pulses corresponding to the clean rising or falling edge of the debounced signal.

### 8.2. Module Implementations

| File | Description | Purpose |
|------|-------------|---------|
| [debouncer_delayed.v](Push%20Buttons/Debouncing/rtl/debouncer_delayed.v) | Timer-based debouncer. | Waits for the input signal to be stable for a fixed duration before passing it through. |
| [debouncer_delayed_fsm.v](Push%20Buttons/Debouncing/rtl/debouncer_delayed_fsm.v) | FSM-based debouncer. | Uses a state machine to manage the debouncing logic, offering a more robust solution. |
| [synchronizer.v](Push%20Buttons/Edge%20Detection/rtl/synchronizer.v) | Two-flop synchronizer. | Used to safely bring an asynchronous input signal into a synchronous clock domain, mitigating metastability. |
| [edge_detector.v](Push%20Buttons/Edge%20Detection/rtl/edge_detector.v) | Edge detection circuit. | Compares the current value of a signal with its value from the previous clock cycle to detect rising or falling edges. |
| [button.v](Push%20Buttons/Edge%20Detection/rtl/button.v) | Complete button interface. | Integrates debouncing and edge detection into a single module. |

---

## 9. Swap Two Memory Locations

### 9.1. System Overview

This is a system-level design that integrates an FSM controller with a register file (a small, fast memory array) and multiplexers. The system swaps the contents of two specified locations within the register file. It demonstrates how a control unit (the FSM) orchestrates data movement between datapath components.

### 9.2. Module Implementations

| File | Role in System | Description |
|------|----------------|-------------|
| [swap_fsm.v](Swap_Two_Memory_Locations/rtl/swap_fsm.v) | Control Unit | An FSM that sequences the read and write operations required for the swap. |
| [register_file.v](Swap_Two_Memory_Locations/rtl/register_file.v) | Datapath | A small RAM-like structure that holds the data. |
| [mux_4x1_nbit.v](Swap_Two_Memory_Locations/rtl/mux_4x1_nbit.v) | Datapath | Used for routing data within the system. |
| [swap_reg_file.v](Swap_Two_Memory_Locations/rtl/swap_reg_file.v) | Top-Level | Integrates the FSM and datapath components into a complete system. |

---

## 10. Traffic Light Controller

### 10.1. System Overview

A classic FSM application that controls the signals at a road intersection. The system cycles through a sequence of states (e.g., Green, Yellow, Red) with specific time durations for each state. This design demonstrates the use of an FSM for real-time control applications.

### 10.2. Module Implementations

| File | Description |
|------|-------------|
| [traffic_light_controller.v](Traffic-Light-Controller/design-01/traffic_light_controller.v) | The core FSM for the traffic light controller. It uses timers to determine the duration of each state. |
| [tb_tlc.v](Traffic-Light-Controller/design-01/tb_tlc.v) | A testbench to verify the correct sequence and timing of the traffic light signals. |

---

## 11. Simulation and Synthesis

### 11.1. Prerequisites

- A Verilog simulator (e.g., ModelSim, QuestaSim, Xcelium, VCS, or the open-source iverilog).
- An FPGA synthesis tool (e.g., Xilinx Vivado, Intel Quartus) for hardware implementation.

### 11.2. Running Simulation

The repository is configured with PowerShell scripts for simulation, which can be executed from within a configured VS Code environment. Alternatively, standard tool flows can be used.

**Example with iverilog:**
```bash
# Compile the RTL and testbench files
iverilog -o design.vvp <testbench_file.v> <rtl_file.v>

# Run the compiled simulation
vvp design.vvp

# (Optional) Open the waveform dump file with a viewer like GTKWave
gtkwave dump.vcd
```

1. Create new Vivado project
2. Add RTL files from `*/rtl/` folder
3. Add testbench from `*/tb/` folder
4. Run behavioral simulation

### Simulation with ModelSim
```bash
vlog rtl/*.v tb/*.v
vsim -gui work.module_tb
```

## Contact

**Author**: Ramnarayan Balai  
**Email**: ramnarayanbalai365@gmail.com  
**GitHub**: [@RamnarayanBalai](https://github.com/RamnarayanBalai)
