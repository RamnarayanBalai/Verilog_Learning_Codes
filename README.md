# Verilog Learning Codes

A structured repository of Verilog HDL implementations covering digital design concepts from basics to advanced topics. Contains 37 RTL modules and 9 testbenches organized by circuit type.

## Features

- 50+ total files (37 RTL + 9 testbenches)
- Organized by learning level: Basic → Combinational → Sequential
- Multiple implementation styles (behavioral, dataflow, gate-level)
- Compatible with Xilinx Vivado, ModelSim, VCS
- Comprehensive testbenches for verification

## Folder Structure

```
Verilog_Learning_Codes/
├── basic/                          # Fundamental concepts
│   ├── rtl/                        # Arithmetic, operators, assignments
│   └── tb/                         # Corresponding testbenches
│
├── combinational circuit/          # Logic circuits (no memory)
│   ├── rtl/                        # Adders, muxes, decoders, encoders
│   └── tb/                         # Testbenches
│
└── Sequential Circuit/             # Logic circuits (with memory)
    ├── rtl/                        # Flip-flops, counters, shift registers
    └── tb/                         # Testbenches
```

## Module Categories

| Category | Modules | Description |
|----------|---------|-------------|
| **Basic** | 3 RTL, 1 TB | Operators, assignments, storage elements |
| **Combinational** | 21 RTL, 1 TB | Adders, decoders, encoders, muxes, displays |
| **Sequential** | 13 RTL, 7 TB | Flip-flops, counters, registers, PWM, timers |

## Quick Start

### Prerequisites
- Xilinx Vivado (2019.1+) or ModelSim/VCS
- Basic Verilog knowledge

### Setup
```bash
git clone https://github.com/RamnarayanBalai/Verilog_Learning_Codes.git
cd Verilog_Learning_Codes
```

### Simulation with Vivado
1. Create new Vivado project
2. Add RTL files from `*/rtl/` folder
3. Add testbench from `*/tb/` folder
4. Run behavioral simulation

### Simulation with ModelSim
```bash
vlog rtl/*.v tb/*.v
vsim -gui work.module_tb
```

## Learning Path

1. **Start with Basic**: Understand Verilog operators and non-blocking assignments
2. **Combinational Logic**: Implement arithmetic and logic circuits
3. **Sequential Logic**: Master flip-flops, counters, and state machines

## Contact

**Author**: Ramnarayan Balai  
**Email**: 2311401230@stu.manit.ac.in  
**GitHub**: [@RamnarayanBalai](https://github.com/RamnarayanBalai)

## License

Open-sourced for educational purposes.
