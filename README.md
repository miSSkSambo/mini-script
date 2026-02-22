# mini-script


# 🚀 MiniScript Smart Contract S (Haskell)

![Haskell](https://img.shields.io/badge/Language-Haskell-purple)
![Build](https://img.shields.io/badge/Build-Cabal-blue)
![GHC](https://img.shields.io/badge/GHC-9.6.7-orange)
![License](https://img.shields.io/badge/License-MIT-brightgreen)
![Status](https://img.shields.io/badge/Project-Active-success)

A minimal smart contract scripting engine written in Haskell using Cabal.

This project demonstrates domain-specific language (DSL) design, deterministic ledger state transitions, conditional execution logic, and modular interpreter architecture using pure functional programming.

---

# 📑 Table of Contents

* [📖 Project Overview](#-project-overview)
* [🏗️ Architecture Overview](#️-architecture-overview)
* [🔗 Core Features](#-core-features)

  * [Statement Structure](#-statement-structure)
  * [Ledger State Machine](#-ledger-state-machine)
  * [Conditional Execution](#-conditional-execution)
  * [Deterministic Evaluation](#-deterministic-evaluation)
* [🖥️ Setup & Installation Guide](#️-setup--installation-guide-windows--wsl2--ghcup)
* [🔨 Build & Run](#-build--run)
* [📸 Screenshots](#-screenshots)
* [🔍 Execution Output](#-execution-output)
* [🧠 Concepts Demonstrated](#-concepts-demonstrated)
* [💡 Why I Built This](#-why-i-built-this)
* [🧰 Technologies Used](#-technologies-used)
* [🚀 Future Improvements](#-future-improvements)
* [👤 Author](#-author)
* [📜 License](#-license)

---

# 📖 Project Overview

MiniScript models a simplified smart contract execution environment with:

* Transfer instructions
* Conditional balance checks
* Deterministic ledger updates
* Functional state transitions
* Immutable account modeling
* Modular interpreter architecture

Instead of networking or mining, the focus is purely on execution logic and state correctness.

The architecture emphasizes immutability, predictability, and safe evaluation.

---

# 🏗️ Architecture Overview

The system is modular and divided into:

```
mini-script/
├── src/
│   ├── AST.hs          → Language definitions (Statements, Comparisons)
│   ├── Ledger.hs       → Ledger state & transfer logic
│   ├── Interpreter.hs  → Execution engine
│   ├── Parser.hs       → Reserved for future DSL parsing
├── app/
│   └── Main.hs         → Simulation entry point
├── test/
├── mini-script.cabal
```

Each layer is intentionally separated:

* **AST** defines the language structure
* **Ledger** defines state transitions
* **Interpreter** defines execution rules
* **Main** orchestrates simulation

---

# 🔗 Core Features

## 1️⃣ Statement Structure

The DSL supports two instruction types:

```haskell
Transfer Name Name Amount
IfBalance Name Comparison Amount Statement
```

Comparison operators:

```haskell
GreaterThan
LessThan
EqualTo
```

This enables conditional execution similar to real smart contracts.

---

## 2️⃣ Ledger State Machine

Transactions are processed sequentially.

Rules enforced:

* No negative balances
* No invalid transfers
* Deterministic state transitions
* Safe evaluation using `Either`

All state updates return a new immutable ledger.

---

## 3️⃣ Conditional Execution

Example script:

```
transfer Kabelo Kelebogile 100
transfer Kelebogile Karabo 50
ifbalance Kabelo > 500 then transfer Kabelo Karabo 200
```

The conditional statement evaluates the ledger state before executing nested instructions.

---

## 4️⃣ Deterministic Evaluation

Execution is performed using:

```haskell
foldl run (Right ledger0) script
```

This ensures:

* Predictable state evolution
* No side effects
* Functional state modeling

---

# 🖥️ Setup & Installation Guide (Windows + WSL2 + GHCup)

This project runs inside **Ubuntu (WSL2)**.

---

## 🪟 1. Install WSL2

Open PowerShell as Administrator:

```powershell
wsl --install
```

Restart your computer.

Verify:

```powershell
wsl -l -v
```

Ensure Version 2 is enabled.

---

## 🐧 2. Install Ubuntu 22.04

```powershell
wsl --install -d Ubuntu-22.04
```

Create your Linux username and password.

---

## 📦 3. Install Development Tools

Inside Ubuntu:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git build-essential libgmp-dev -y
```

---

## 🧊 4. Install GHCup

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Then:

```bash
source ~/.ghcup/env
```

Verify:

```bash
ghc --version
cabal --version
```

---

## 📥 5. Clone Repository

```bash
git clone https://github.com/miSSkSambo/mini-script.git
cd mini-script
```

---

# 🔨 Build & Run

```bash
cabal build
cabal run
```

Expected output:

```
🚀 MiniScript Smart Contract Simulator

Initial Ledger:
("Kabelo",1000)
("Karabo",200)
("Kelebogile",500)

Final Ledger:
("Kabelo",700)
("Karabo",450)
("Kelebogile",550)
```

---

# 📸 Screenshots

## New Project
<img width="960" height="1020" alt="new project created" src="https://github.com/user-attachments/assets/05142ab1-8eef-4987-bf30-90b9015fdc1e" />

## 📦 AST Module
<img width="960" height="1020" alt="AST hs" src="https://github.com/user-attachments/assets/f460cb2f-4dfd-46d2-baf7-9ec2418270af" />

## 🧠 Interpreter Module
<img width="960" height="1020" alt="interpreter hs" src="https://github.com/user-attachments/assets/8a7f4250-e2c7-46a8-acb1-325905a85b16" />

## 💰 Ledger Module
<img width="960" height="1020" alt="ledger hs" src="https://github.com/user-attachments/assets/c35d7797-346e-4ef3-a568-228892ef006d" />

## 🚀 Main Application
<img width="960" height="1020" alt="main hs" src="https://github.com/user-attachments/assets/e3e4d4f0-e52a-4075-8f7f-f96249c269a7" />

## 📝 Parser Module
<img width="960" height="1020" alt="parser hs" src="https://github.com/user-attachments/assets/7d57bb4c-edd3-47b4-95a7-71fa4fc3933e" />

## 📊 Program Output
<img width="960" height="1020" alt="output for mini script" src="https://github.com/user-attachments/assets/655d6122-8ad6-4ac6-af83-59892e9d8277" 


---

# 🔍 Execution Output

```
Initial Ledger:
("Kabelo",1000)
("Karabo",200)
("Kelebogile",500)

Final Ledger:
("Kabelo",700)
("Karabo",450)
("Kelebogile",550)
```

The conditional transfer executes successfully because Kabelo’s balance remains above 500 after the first transfer.

---

# 🧠 Concepts Demonstrated

* Domain-Specific Language (DSL) design
* Algebraic data types
* Pattern matching
* Functional state transitions
* Deterministic evaluation
* Error handling using `Either`
* Immutable ledger modeling
* Interpreter architecture
* Modular separation of concerns

---

# 💡 Why I Built This

I built this project to understand how smart contract logic can be modeled from first principles using pure functional programming.

Rather than using an existing blockchain framework, I wanted to:

* Design a minimal scripting language
* Implement a deterministic execution engine
* Model immutable ledger state transitions
* Explore conditional smart contract logic
* Understand interpreter architecture

By separating **AST → Ledger → Interpreter → Main**, I mirrored real smart contract systems where language definition, state logic, and execution layers are independent components.

This project serves as a foundation for future extensions such as:

* Real text-based DSL parsing
* Gas-cost simulation
* Persistent storage
* Multi-user execution
* On-chain validation simulation

---

# 🧰 Technologies Used

* Haskell
* Cabal
* GHC 9.6.7
* GHCup
* WSL2 Ubuntu

---

# 🚀 Future Improvements

* Implement full text-based script parser
* Add CLI script file input
* Add JSON export
* Add persistent storage
* Add test suite with property testing
* Add gas accounting model
* Expand DSL with loops and multiple conditions

---

# 👤 Author

Katlego

---

# 📜 License

MIT

---

