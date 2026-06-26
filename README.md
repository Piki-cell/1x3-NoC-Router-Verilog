# 1×3 Router Module for Network-on-Chip (NoC)

## 📖 Overview

This project implements a **1×3 Router Module** for a **Network-on-Chip (NoC)** using **Verilog HDL**.

The router forwards incoming packets from a single input channel to one of three output ports based on the destination select signal using a Finite State Machine (FSM).

---

## 🚀 Features

- Verilog HDL Design
- FSM-based Packet Routing
- 1 Input → 3 Output Architecture
- Low Latency Routing
- Functional Simulation
- RTL Verification

---

## 🛠 Software Used

- Verilog HDL
- Xilinx Vivado
- ModelSim

---

## 📂 Repository Contents

├── router_1x3.v

├── tb_router_1x3.v

├── Project_Report.pdf

└── README.md

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

## ⚙️ Working

The router remains in the **IDLE** state until a valid packet arrives.

Once **valid_in** becomes HIGH, the FSM transitions to the **SEND** state and forwards the packet to the selected output port based on the **sel** signal.

---

## 📊 Results

- Correct Packet Routing
- Successful FSM Operation
- One Clock Cycle Latency
- Functional Simulation Verified

---

## 👩‍💻 Authors

- Harshita Choudhury
- Jayashri
- Prabhanshi
