# Space Blasters – Bash Terminal Shooter

## 🎮 Game Summary

A simple, fun, and brutally retro **two-player space shooter**, running entirely in the terminal, written in **Bash**.

Two spaceships shoot missiles at each other.  
The first player to score **3 hits** on the opponent **wins**!

---

## 📋 Requirements

- Linux / macOS / WSL (or any system with Bash)
- Terminal with at least 49×20 size (recommended 70+ columns and 70+ rows)

---

## 🚀 Installation and Setup

### 1. Clone or download the repository:

```bash
git clone <repository-url>
cd <repository-folder>a
```
### 2. Make the scripts executable:

```bash
chmod +x Puc.sh Vporabnik.sh
```

### 3. Run the main game in the first terminal:

```bash
bash ./Puc.sh
```

Or with custom settings:

```bash
bash ./Puc.sh A L 0.15
```

### ⚙️ Launch Parameters

| Parameter | Description                                   | Default | Example     |
|-----------|-----------------------------------------------|---------|------------|
| `<name1>`  | Name of Player 1's ship  (top ship)                 | A       | W, p, q    |
| `<name2>`  | Name of Player 2's ship (bottom ship)                | L       | P, D, r    |
| `<frame>` | Frame delay in seconds (smaller = faster)   | 0.15    | 0.06, 0.25 |

### 🎯 How to Play

## Terminals:

First terminal → ```bash Puc.sh``` → displays the game

Second terminal → ``` ./Vporabnik.sh``` → sends commands

## Controls:

Player 1 moves with the A, W, D keys, W for shooting

Player 2 moves with the arrow keys, Up arrow for shooting

Goal: The first player to hit the opponent 3 times wins!

## Recommendations:

Resize the terminal window before starting the game.
