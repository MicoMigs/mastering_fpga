# Four-Tap Shift Register on Nexys A7 (Artix-7 100T)

This project gets the user started with the Digilent Nexys A7 FPGA board. It demonstrates a simple 4-stage shift register with LED output.

## Prerequisites
- Vivado (2020.2 or newer recommended)
- Digilent Nexys A7 (Artix-7 100T)
- USB cable in (J6)

## Project Structure
- `src/top.v` — Verilog source for the shift register
- `top_physical.xdc` — Pin constraints for Nexys A7
- `top_timing.xdc` — Timing constraints (100 MHz clock)
- `go.tcl` — Vivado build script
- `top.bit` — Generated bitstream (after build)

## How to Build and Program

### 1. Build the Bitstream
Run in the project directory and terminal:

```powershell
.\go.ps1
```

This will synthesize, implement, and generate `top.bit` onto the board.

### 3. Observe the LEDs
- The four user LEDs (LD0–LD3) will show a moving pattern, indicating the shift register is working.
- If LEDs are dim, check power, constraints, and bitstream.

## Clean files
Run, in project directory:

```powershell
.\clean.ps1
```

## File Reference
- `top_physical.xdc`: Maps `clk` and `led[3:0]` to Nexys A7 pins.
- `top_timing.xdc`: Sets 100 MHz clock timing.
- `go.tcl`: Automates Vivado build steps.

## License
MIT
