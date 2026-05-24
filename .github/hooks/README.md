# Verilog Testbench Simulation Hook Setup

## Overview
This hook automates compilation and simulation of Verilog testbenches with automatic dependency resolution.

**Components:**
- `verilog-sim.json` - Hook configuration (triggers on tool use)
- `verilog-gate.ps1` - Gate script (decides when to inject context)
- `verilog-build-sim.ps1` - Build & simulation script

## How It Works

### Automatic Dependency Resolution
When you simulate a testbench, the hook:
1. **Parses** the testbench file to find module instantiations
2. **Recursively searches** for all RTL dependencies in `rtl/` directories
3. **Compiles** all files together with `iverilog -g2012`
4. **Runs simulation** with `vvp`

## Usage

### Via VS Code Tasks (Recommended)

Open the Command Palette (`Ctrl+Shift+P`) and select:

- **"Tasks: Run Test Task"** or press `Ctrl+Shift+Alt+T`
  - Runs the default task: **Build & Simulate Testbench**
  
Available tasks:
1. **Verilog: Build & Simulate Testbench** - Compile and run simulation (default)
2. **Verilog: Build Only (Compile)** - Compilation only, skip simulation
3. **Verilog: Run Testbench List** - List all testbenches in workspace

**Note:** Make sure the testbench file is open/active in the editor before running the task.

### Via Command Line

### Via Command Line

**Direct Script Execution:**
```powershell
.\.github\hooks\verilog-build-sim.ps1 -TbFile "Finite State Machines\tb\tb_011_detector.v" -WorkDir "."
```

### Via Copilot Chat (Automatic)

Open the file and ask the assistant to simulate or build the testbench. The hook will automatically resolve dependencies and run the simulation.

## File Resolution Pattern

The script searches for RTL files matching instantiated modules:

```
Searchable Locations:
- Same directory as TB (../rtl/)
- Parent directory (../../rtl/)  
- Any folder named rtl/ in workspace root
```

**Example:** If your TB instantiates module `moore_011_detector`, the script finds:
- `Finite State Machines/rtl/moore_011_detector.v`

## Requirements

- **iverilog** (Icarus Verilog compiler)
- **vvp** (Icarus Verilog runtime)

### Install on Windows:
```powershell
# Using Chocolatey
choco install iverilog

# Or download from: http://iverilog.icarus.com/
```

## Dependency Graph Example

```
tb_011_detector.v
  ├─→ moore_011_detector.v
  │   └─→ (no further dependencies)
  └─→ (other instantiated modules...)

All files compiled together:
iverilog -g2012 -o output.out tb_011_detector.v moore_011_detector.v ...
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "iverilog not found" | Install Icarus Verilog and ensure it's in PATH |
| Module not resolved | Check RTL filename matches module name (case-sensitive) |
| Compilation fails | Verify all RTL files are syntactically correct |
| Simulation hangs | Check for infinite loops or missing `$finish` in testbench |

## Advanced: Manual RTL File List

If automatic resolution fails, provide files manually:

```powershell
iverilog -g2012 -o test.out tb_file.v module1.v module2.v
vvp test.out
```

## Notes

- RTL files searched in alphabetical order within each directory
- Module names are case-sensitive and must match filenames
- Supports both `.v` (Verilog) and `.sv` (SystemVerilog) files
- Output file created as `testbench_name.out` (same directory as TB)
