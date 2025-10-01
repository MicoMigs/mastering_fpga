# Four-Tap Shift Register on Nexys A7 (Artix-7 100T)

This project demonstrates a simple 4-stage shift register on the **Digilent Nexys A7 FPGA board**. It drives the user LEDs (LD0–LD3) with a shifting pattern, and—best of all—it gets you started with Vivado **without using the GUI**.

---

## Prerequisites

* Xilinx Vivado (2020.2 or newer recommended)
* Digilent Nexys A7 (Artix-7 100T) board
* USB cable connected to **J6 (PROG/UART port)**

---

## Project Structure

* `src/top.v` — Verilog source for the shift register
* `top_physical.xdc` — Pin constraints for Nexys A7
* `top_timing.xdc` — Timing constraints (100 MHz clock)
* `go.tcl` — Vivado build script (batch mode)
* `go.ps1` — PowerShell wrapper to invoke Vivado with `go.tcl`
* `clean.ps1` — Cleanup script (removes build artifacts)
* `top.bit` — Bitstream output (generated after build)

---

## How to Build and Program

### 1. Build the Bitstream

From the project directory, run:

```powershell
.\go.ps1
```

This script runs Vivado in batch mode to synthesize, implement, and generate `top.bit`.

### 2. Program the Board

Once complete, program the Nexys A7 with the generated `top.bit`.

### 3. Observe the LEDs

* User LEDs **LD0–LD3** will show a rotating “shift” pattern.
* If the LEDs don’t light correctly, double-check:

  * Power supply and J6 connection
  * Pin constraints in `top_physical.xdc`
  * That the latest bitstream is programmed

---

## Cleaning the Project

To remove temporary build files and reports:

```powershell
.\clean.ps1
```

---

## File Reference

* **`top_physical.xdc`** — Maps `clk` and `led[3:0]` signals to Nexys A7 pins.
* **`top_timing.xdc`** — Defines 100 MHz clock period and timing constraints.
* **`go.tcl`** — Automates Vivado steps: synthesis, place-and-route, reports, bitstream generation.

---

## License

MIT

---