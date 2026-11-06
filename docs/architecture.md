# 32-Bit Pipelined Processor

## Architecture
32-bit RISC Processor

## Pipeline Stages
1. Instruction Fetch (IF)
2. Instruction Decode (ID)
3. Execute (EX)
4. Memory Access (MEM)
5. Write Back (WB)

## Specifications
- 32-bit datapath
- 32 general-purpose registers
- 32-bit instructions
- 256-word instruction memory
- 256-word data memory
- 5-stage pipeline

## Supported Instructions
ADD, SUB, AND, OR, XOR,
ADDI, LW, SW, BEQ, J

## Advanced Features
- Data forwarding
- Hazard detection
- Pipeline stalling
- Branch flushing

## Development Tools
- Verilog HDL
- Icarus Verilog
- GTKWave
- Yosys
- Git