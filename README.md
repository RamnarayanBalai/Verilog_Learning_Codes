# Verilog Learning Codes

A comprehensive, well-organized repository of Verilog HDL implementations covering fundamental to intermediate digital design concepts. This repository contains 50+ RTL modules and testbenches organized by circuit type and complexity level.

## Overview

This repository is designed for learning and practicing Verilog HDL through hands-on implementation of digital circuits. Each module includes:
- **RTL Implementation**: Gate-level, behavioral, and dataflow Verilog code
- **Testbenches**: Comprehensive simulation testbenches for functional verification
- **Organized Structure**: Categorized by circuit type for easy navigation and learning progression

## Features

- ✅ **50+ RTL Modules** spanning basic to advanced concepts
- ✅ **9 Complete Testbenches** for simulation and verification
- ✅ **Well-Organized**: Categorized by design type and complexity
- ✅ **Educational**: Progressive learning from basics to sequential circuits
- ✅ **Vivado Compatible**: All files tested in Xilinx Vivado environment

## Folder Structure

```
Verilog_Learning_Codes/
├── basic/
│   ├── rtl/          # Fundamental Verilog concepts
│   │   ├── arithmatic_operators.v
│   │   ├── blocking_vs_nonblocking_assignment.v
│   │   └── compare_storage_elements.v
│   └── tb/           # Testbenches for basic modules
│       └── compare_storage_elements_tb.v
│
├── combinational circuit/
│   ├── rtl/          # Combinational logic circuits (21 modules)
│   │   ├── adder_substractor_4bit.v
│   │   ├── decoder_*.v
│   │   ├── encoder_*.v
│   │   ├── mux_*.v
│   │   ├── full_adder.v
│   │   ├── half_adder.v
│   │   ├── rca_*.v
│   │   └── hexto7segment.v
│   └── tb/           # Combinational circuit testbenches
│       └── adder_substractor_tb.v
│
└── Sequential Circuit/
    ├── rtl/          # Sequential logic circuits (13 modules)
    │   ├── DFF*.v             (D Flip-Flops with variants)
    │   ├── TFF.v              (Toggle Flip-Flop)
    │   ├── D_latch.v          (D Latch)
    │   ├── *_counter.v        (Various counter implementations)
    │   ├── register_*.v       (Shift registers and PIPO/SISO)
    │   ├── timer_param.v      (Parameterized timer)
    │   ├── pwm_*.v            (PWM modules)
    │   └── univ_shift_reg.v   (Universal shift register)
    └── tb/           # Sequential circuit testbenches (7 modules)
        ├── async_up_counter_tb.v
        ├── tb_mod_counter*.v
        ├── tb_sync_counter.v
        ├── tb_timer_param.v
        ├── tb_up_down_counter.v
        └── pwm_basic_tb.v
```

## Category Descriptions

### 📚 Basic (`basic/`)
Fundamental Verilog concepts including:
- Arithmetic operators and expressions
- Blocking vs. non-blocking assignments
- Storage elements and comparisons

**RTL Files**: 3 | **TB Files**: 1

### 🔗 Combinational Circuits (`combinational circuit/`)
Logic circuits with outputs dependent only on current inputs:
- **Adders**: Half adder, Full adder, RCA (4-bit, N-bit), Signed adders
- **Multiplexers**: 2x1, 4x1, N-bit variants, Generic implementations
- **Decoders**: 2x4 (with/without enable), Generic decoder
- **Encoders**: 4x2, Priority encoders (4x2 & generic)
- **Displays**: 7-segment display decoder
- **Multiple Operand Adders**

**RTL Files**: 21 | **TB Files**: 1

### ⏱️ Sequential Circuits (`Sequential Circuit/`)
Logic circuits with memory and state:
- **Flip-Flops**: D, T variants (basic, multiple, negative edge, with reset)
- **Latches**: D latch implementations
- **Counters**: Async/Sync up counters, Up/Down counters, BCD, Mod-N (fixed & parameterized)
- **Registers**: Simple, PIPO (Parallel-In-Parallel-Out), SISO (Serial-In-Serial-Out)
- **Shift Registers**: Basic and universal shift registers with load
- **Timers**: Parameterized timer modules
- **PWM**: Basic and improved PWM implementations

**RTL Files**: 13 | **TB Files**: 7

## Getting Started

### Prerequisites
- **Xilinx Vivado** (2019.1 or later) or any Verilog simulator (ModelSim, VCS, etc.)
- Basic understanding of digital design concepts
- Familiarity with Verilog HDL syntax

### How to Use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/RamnarayanBalai/Verilog_Learning_Codes.git
   cd Verilog_Learning_Codes
   ```

2. **Choose a module to study** based on your learning level:
   - Start with `basic/` for foundational concepts
   - Progress to `combinational circuit/` for logic design
   - Move to `Sequential Circuit/` for advanced topics

3. **Review the RTL code:**
   - Examine the implementation in `*/rtl/` folders
   - Understand the design methodology used

4. **Run simulations:**
   - Open testbenches in `*/tb/` folders
   - Execute in your preferred simulator
   - Analyze waveforms and verify functionality

## Simulation Guide

### Using Vivado
1. Create a new Vivado project
2. Add RTL files from desired `rtl/` folder
3. Add corresponding testbench from `tb/` folder
4. Run behavioral simulation
5. Inspect waveforms in Wave window

### Using ModelSim/VCS
```bash
# Compile RTL and Testbench
vlog path/to/rtl/*.v path/to/tb/*.v

# Run simulation
vsim -gui work.module_name_tb
```

## Module Naming Conventions

| Pattern | Meaning | Example |
|---------|---------|---------|
| `*_tb.v` | Testbench file | `adder_substractor_tb.v` |
| `tb_*.v` | Alternate testbench naming | `tb_mod_counter.v` |
| `*_nbit.v` | N-bit parameterized versions | `mux_2x1_nbit.v` |
| `*_param.v` | Parameterized implementations | `mod_counter_param.v` |
| `DFF_*.v` | D Flip-Flop variants | `DFF_reset.v`, `DFF_neg.v` |
| `*_beh.v` | Behavioral implementations | `mux_2x1_beh.v` |

## Learning Roadmap

### Phase 1: Basics (3 modules)
- Understand Verilog operators and assignments
- Explore blocking vs. non-blocking semantics
- Learn storage element comparisons

### Phase 2: Combinational Logic (21 modules)
- Implement arithmetic circuits (adders, subtractors)
- Design multiplexers and decoders
- Build priority encoders
- Practice N-bit scalable designs

### Phase 3: Sequential Logic (13 modules)
- Master flip-flops and latches
- Design synchronous and asynchronous counters
- Build shift registers and custom timing circuits
- Implement PWM and timer modules

## Tools & Technologies

- **Hardware Description Language**: Verilog HDL
- **Design Environment**: Xilinx Vivado
- **Simulators Tested**: Vivado xsim
- **Compatible With**: ModelSim, VCS, Icarus Verilog
- **Version Control**: Git & GitHub

## Key Features of Each Module

- **Scalability**: N-bit parameterized designs where applicable
- **Variants**: Multiple implementation styles (behavioral, dataflow, gate-level)
- **Testbenches**: Comprehensive test cases for verification
- **Comments**: Detailed inline documentation
- **Real-world Patterns**: Based on industry-standard practices

## Statistics

| Category | RTL Modules | Testbenches | Total Files |
|----------|-------------|-------------|------------|
| Basic | 3 | 1 | 4 |
| Combinational Circuit | 21 | 1 | 22 |
| Sequential Circuit | 13 | 7 | 20 |
| **Total** | **37** | **9** | **46** |

## Contributing

This is a personal learning repository. Feel free to fork and adapt for your own learning purposes.

## License

This project is open-sourced for educational purposes.

## Contact

**Author**: Ramnarayan Balai  
**Email**: 2311401230@stu.manit.ac.in  
**GitHub**: [@RamnarayanBalai](https://github.com/RamnarayanBalai)

---

## Progress Log

- 2025-12-26: Added RTL combinational circuit/rtl/adder_substractor_4bit.v
- 2025-12-29: Added RTL combinational circuit/rtl/adder_substractor_nbit.v
- 2025-12-31: Added RTL combinational circuit/rtl/adder_sunstractor_signedNo.v
- 2026-01-03: Added RTL basic/rtl/arithmatic_operators.v
- 2026-01-05: Added RTL Sequential Circuit/rtl/async_up_counter.v
- 2026-01-08: Added RTL Sequential Circuit/rtl/BCD_counter.v
- 2026-01-10: Added RTL basic/rtl/blocking_vs_nonblocking_assignment.v
- 2026-01-13: Added RTL basic/rtl/compare_storage_elements.v
- 2026-01-15: Added RTL Sequential Circuit/rtl/D_latch.v
- 2026-01-18: Added RTL combinational circuit/rtl/decoder_2x4.v
- 2026-01-20: Added RTL combinational circuit/rtl/decoder_2x4_en.v
- 2026-01-23: Added RTL combinational circuit/rtl/decoder_generic.v
- 2026-01-25: Added RTL Sequential Circuit/rtl/DFF.v
- 2026-01-28: Added RTL Sequential Circuit/rtl/DFF_multi.v
- 2026-01-30: Added RTL Sequential Circuit/rtl/DFF_neg.v
- 2026-02-02: Added RTL Sequential Circuit/rtl/DFF_reset.v
- 2026-02-04: Added RTL combinational circuit/rtl/encoder_4x2.v
- 2026-02-07: Added RTL combinational circuit/rtl/full_adder.v
- 2026-02-09: Added RTL combinational circuit/rtl/generic_priority_encoder.v
- 2026-02-12: Added RTL combinational circuit/rtl/half_adder.v
- 2026-02-14: Added RTL combinational circuit/rtl/hexto7segment.v
- 2026-02-17: Added RTL Sequential Circuit/rtl/mod_counter.v
- 2026-02-19: Added RTL Sequential Circuit/rtl/mod_counter_input.v
- 2026-02-22: Added RTL Sequential Circuit/rtl/mod_counter_param.v
- 2026-02-24: Added RTL Sequential Circuit/rtl/multi_decade_counter.v
- 2026-02-27: Added RTL combinational circuit/rtl/multiple_adder.v
- 2026-03-01: Added RTL combinational circuit/rtl/mux_2x1_beh.v
- 2026-03-04: Added RTL combinational circuit/rtl/mux_2x1_dataflow.v
- 2026-03-06: Added RTL combinational circuit/rtl/mux_2x1_gate.v
- 2026-03-09: Added RTL combinational circuit/rtl/mux_2x1_nbit.v
- 2026-03-11: Added RTL combinational circuit/rtl/mux_4x1.v
- 2026-03-14: Added RTL combinational circuit/rtl/mux_4x1_nbit.v
- 2026-03-16: Added RTL combinational circuit/rtl/mux_generic_1bit.v
- 2026-03-19: Added RTL combinational circuit/rtl/priority_encoder.v
- 2026-03-21: Added RTL Sequential Circuit/rtl/pwm_basic.v
- 2026-03-24: Added RTL Sequential Circuit/rtl/pwm_improved.v
- 2026-03-26: Added RTL combinational circuit/rtl/rca_4bit.v
- 2026-03-26: Added TB combinational circuit/tb/adder_substractor_tb.v
- 2026-03-29: Added TB Sequential Circuit/tb/async_up_counter_tb.v
- 2026-03-31: Added TB basic/tb/compare_storage_elements_tb.v
- 2026-04-03: Added TB Sequential Circuit/tb/pwm_basic_tb.v
- 2026-04-05: Added TB Sequential Circuit/tb/tb_mod_counter.v
- 2026-04-08: Added TB Sequential Circuit/tb/tb_mod_counter_input.v
- 2026-04-10: Added TB Sequential Circuit/tb/tb_sync_counter.v
- 2026-04-13: Added TB Sequential Circuit/tb/tb_timer_param.v
- 2026-04-15: Added TB Sequential Circuit/tb/tb_up_down_counter.v
