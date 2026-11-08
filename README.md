# 32-Bit Five-Stage Pipelined RISC Processor

A 32-bit pipelined RISC processor designed using Verilog HDL, with functional verification, logic synthesis, and ASIC physical-design implementation using open-source EDA tools.

## Project Overview

This project implements a 32-bit, five-stage pipelined RISC processor. It includes instruction execution, register operations, memory access, data forwarding, hazard detection, pipeline stalling, and branch handling.

The design was synthesized using Yosys and physically implemented using OpenROAD Flow Scripts with the Nangate45 standard-cell platform.

## Architecture

The processor uses five pipeline stages:

| Stage | Name | Function |
|---|---|---|
| IF | Instruction Fetch | Fetches instructions |
| ID | Instruction Decode | Decodes instructions and reads registers |
| EX | Execute | Performs ALU operations and address calculations |
| MEM | Memory Access | Performs data-memory operations |
| WB | Write Back | Writes results into the register file |

## Specifications

| Feature | Specification |
|---|---|
| Architecture | 32-bit RISC |
| Datapath width | 32 bits |
| Instruction width | 32 bits |
| Pipeline stages | 5 |
| General-purpose registers | 32 |
| Instruction memory | 256 words |
| Data memory | 256 words |
| Top module | `processor` |

## Supported Instructions

- Arithmetic: `ADD`, `SUB`, `ADDI`
- Logical: `AND`, `OR`, `XOR`
- Memory: `LW`, `SW`
- Branch: `BEQ`
- Jump: `J`

## Advanced Pipeline Features

- Data forwarding
- Hazard detection
- Pipeline stalling
- Branch handling
- Pipeline flushing
- Program counter control

## Project Directory Structure

```text
32-bit-Pipelined-Processor/
│
├── rtl/                 # Verilog RTL modules
├── testbench/           # Verilog testbenches
├── simulation/          # Simulation outputs
├── diagrams/            # Architecture diagrams
├── docs/                # Technical documentation
├── reports/             # Synthesis reports and netlists
│
└── physical_design/
    └── final_outputs/   # Final ASIC implementation files
        ├── 6_final.gds
        ├── 6_final.odb
        ├── 6_final.def
        ├── 6_final.sdc
        ├── 6_final.spef
        ├── 6_final.v
        ├── 6_finish.rpt
        └── 6_finish_hold_precision.rpt
```

## Development and EDA Tools

- Verilog HDL
- Icarus Verilog
- GTKWave
- Yosys
- OpenROAD
- OpenROAD Flow Scripts
- KLayout
- Nangate45 standard-cell platform
- Git and GitHub
- Ubuntu 24.04 on WSL2

## Functional Verification

The project includes testbenches for individual processor modules and the complete processor.

Verified functional areas include:

- ALU operations
- Register-file operations
- Instruction decoding
- Memory operations
- Data forwarding
- Load-use hazard handling
- Branch and jump operations
- Pipeline flushing
- Pipeline stalling
- Branch-versus-jump priority

Yosys synthesis checking reported **zero structural problems**.

## Synthesis Results

Yosys generic synthesis statistics:

| Metric | Result |
|---|---:|
| Generic logic cells | 33,504 |
| Submodules | 20 |
| Public ports | 167 |
| Port bits | 1,983 |
| Structural problems | 0 |

*These are generic synthesis statistics, not the final standard-cell area.*

## ASIC Physical Design Results

The design was implemented using OpenROAD Flow Scripts and the Nangate45 platform.

Completed implementation stages:

1. RTL synthesis
2. Floorplanning
3. Global placement
4. Detailed placement
5. Clock Tree Synthesis (CTS)
6. Global routing
7. Detailed routing
8. Filler insertion
9. Parasitic extraction
10. Final GDS generation
11. Timing and DRC reporting

### Physical Design Metrics

| Metric | Result |
|---|---:|
| Platform | Nangate45 |
| Clock period | 20 ns |
| Final reported design area | 499 µm² |
| Reported utilization | 51% |
| Final cell count | 814 |
| Extracted nets | 432 |
| Extracted RC segments | 1,245 |
| Extracted coupling capacitances | 1,720 |

### Timing Results

| Metric | Result |
|---|---:|
| Setup WNS | 0.00 ns |
| Setup TNS | 0.00 ns |
| Worst setup slack | +18.47 ns |
| Setup violation count | 0 |
| Minimum slack among 20 inspected hold paths | +0.003518 ns |
| Inspected hold paths | All MET |

The final hold analysis was performed with a configured `HOLD_SLACK_MARGIN` of 0.01 ns.

*The hold result above describes the 20 paths inspected in the precision report, not an exhaustive all-path sign-off.*

### Design Rule Checks

- Detailed routing DRC report: 0 bytes.
- KLayout DRC count report: 0 violations in the completed check.

## Final Physical Design Deliverables

The `physical_design/final_outputs/` directory contains:

| File | Description |
|---|---|
| `6_final.gds` | Final layout in GDSII format |
| `6_final.odb` | OpenROAD database |
| `6_final.def` | Design Exchange Format layout |
| `6_final.sdc` | Timing constraints |
| `6_final.spef` | Extracted parasitic data |
| `6_final.v` | Final synthesized netlist |
| `6_finish.rpt` | Final implementation report |
| `6_finish_hold_precision.rpt` | Detailed hold timing report |

## Future Work

- FPGA implementation and hardware testing
- Further power, performance, and area optimization
- Improved memory implementation
- Additional instruction-set support
- ASIC tapeout exploration

## Project Information

**Project:** 32-Bit Five-Stage Pipelined RISC Processor
**Domain:** Electronics and Communication Engineering — VLSI Design and Technology
**HDL:** Verilog
**Implementation Platform:** Nangate45
**Physical Design Tool:** OpenROAD

## Author

**Sukhraj Singh Dhaliwal**

B.Tech — Electronics and Communication Engineering
VLSI Design and Technology

## License

Add a suitable open-source license before redistributing this project.
