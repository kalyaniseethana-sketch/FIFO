# Synchronous FIFO using Verilog

## Overview

This project implements an **8-bit Synchronous FIFO (First-In, First-Out)** memory using Verilog HDL. The FIFO stores data in the order it is received and outputs it in the same order.

## Features

- 8-bit data width
- 8 memory locations
- Synchronous read and write
- Full and Empty status flags
- GTKWave waveform support

## Inputs

| Signal | Description |
|--------|-------------|
| clk | System Clock |
| reset | Reset Signal |
| wr_en | Write Enable |
| rd_en | Read Enable |
| data_in[7:0] | Input Data |

## Outputs

| Signal | Description |
|--------|-------------|
| data_out[7:0] | Output Data |
| full | FIFO Full Flag |
| empty | FIFO Empty Flag |

## Project Files

- `fifo.v` – FIFO design
- `fifo_tb.v` – Testbench
- `fifo.vcd` – Waveform file
- `simulation_result.png` – Waveform screenshot

## Simulation

### Compile

```bash
iverilog -o fifo fifo.v fifo_tb.v
```

### Run

```bash
vvp fifo
```

### Open Waveform

```bash
gtkwave fifo.vcd
```

## Applications

- Data buffering
- UART communication
- Network routers
- DSP systems
- Embedded systems
- Processor pipelines

## Expected Behavior

1. Write data values: 10, 20, 30, 40.
2. Read data values in the same order.
3. Verify `full` and `empty` flags.