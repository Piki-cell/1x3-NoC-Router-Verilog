# 1×3 Router Module for Network-on-Chip (NoC)

## 📖 Overview

This project presents the design and implementation of a **1×3 Router Module** for a **Network-on-Chip (NoC)** using **Verilog HDL**.

The router forwards incoming packets from a single input port to one of three output ports based on a 2-bit select signal using a Finite State Machine (FSM).

---

## 🚀 Features

- Verilog HDL Implementation
- Finite State Machine (FSM) Based Design
- 1×3 Packet Routing
- Low Latency Communication
- Functional Simulation
- RTL Verification

---

## 🛠 Software Used

- Verilog HDL
- Xilinx Vivado
- ModelSim

---

## 📂 Repository Contents

- `router_1x3.v` – Main router module
- `tb_router_1x3.v` – Testbench for simulation
- `Images(output).pdf` – RTL schematic and simulation waveform
- `README.md`

---

## 📌 Inputs

- clk
- reset
- valid_in
- sel
- data_in

---

## 📌 Outputs

- data_out0
- data_out1
- data_out2
- valid_out0
- valid_out1
- valid_out2

---

## ⚙️ Working Principle

The router remains in the **IDLE** state until a valid packet arrives.

When **valid_in** becomes HIGH, the FSM transitions to the **SEND** state and routes the packet to one of the three output ports depending on the value of the **sel** signal.

After successful transmission, the FSM returns to the **IDLE** state.

---

## 📊 Results

- Correct packet routing
- Successful FSM state transitions
- One clock cycle latency
- Functional simulation verified

The RTL schematic and simulation waveform are included in **Images(output).pdf**.


---

## 📄 License

This project is licensed under the MIT License.

