# 1x3-NoC-Router-Verilog
Verilog implementation of a 1x3 Network-on-Chip (NoC) Router using Finite State Machine (FSM).
# 1x3 Router Module for Network-on-Chip (NoC)

## Overview

This project presents the design and implementation of a **1×3 Router Module** for a **Network-on-Chip (NoC)** using **Verilog HDL**.

The router forwards incoming packets from a single input port to one of three output ports based on a 2-bit selection signal using a Finite State Machine (FSM).

---

## Features

- Verilog HDL implementation
- Finite State Machine (FSM) based architecture
- 1 Input → 3 Output Router
- Low latency packet routing
- Functional simulation
- RTL design verification

---

## Software Used

- Verilog HDL
- Xilinx Vivado
- ModelSim

---

## Inputs

- clk
- reset
- valid_in
- sel
- data_in

---

## Outputs

- data_out0
- data_out1
- data_out2
- valid_out0
- valid_out1
- valid_out2

---

## Working Principle

The router remains in the **IDLE** state until a valid packet arrives.

When **valid_in** becomes HIGH, the FSM enters the **SEND** state and routes the packet to one of the three output ports depending on the value of the **sel** signal.

After successful transmission, the FSM returns to the **IDLE** state.

---

## Results

- Successful packet routing
- Correct FSM state transitions
- One clock cycle latency
- Verified using simulation waveforms

---

## Repository Contents

- 📄 Project Report
- 📚 Documentation

> **Note:** The original Verilog source files are currently unavailable. This repository contains the complete project report and implementation details. The source code will be added once recovered.

---

## Authors

- Harshita Choudhury
- Jayashri
- Prabhanshi
