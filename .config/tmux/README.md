# 💡 My Custom Tmux Configuration

This is my personal tmux configuration, optimized for:

- 💻 Better keybindings  
- 🎨 Themed and colorful UI  
- 🖱️ Mouse support  
- 📋 System clipboard integration  
- 💾 Persistent sessions  
- 🧭 Seamless navigation with Neovim  
- 🎚️ Pane and window enhancements  

---

## 📦 Plugin Manager

This config uses TPM (Tmux Plugin Manager) and expects it to be installed in:

If not already installed:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
---

## 📁 File Structure

Place your main config file at:
```
~/.config/tmux/tmux.conf
```
or clone this repo at
```
~/.config/tmux/
```
---

## 🔧 Features & Customizations

### 🌈 Colors and Display
- 256-color and true-color (24-bit) support  
- Gruvbox theme via tmux2k plugin  
- Centered and clean status bar with CPU, RAM, and time  
- Optional Unicode/powerline-style icons  

### 🖱️ General Settings
- Mouse support enabled  
- Clipboard integration via ./copy.sh  
- Vi-style keybindings for copy-mode  
- Window and pane indexing starts at 1  

### 🪟 Window & Pane Management
- Ctrl + Space as prefix key  
- Prefix + \\ → Split pane horizontally  
- Prefix + - → Split pane vertically  
- Prefix + c → New window (same working dir)  
- Prefix + j/k/l/h → Resize pane  
- Prefix + m → Maximize or restore pane  

### 📋 Copy Mode
- Prefix + mouse drag → Select without exiting copy-mode  
- Prefix + v → Start selection (vi mode)  
- Prefix + y → Copy using ./copy.sh  

### 🧭 Vim Navigation (with Neovim)
- Seamless pane navigation between tmux and Neovim using vim-tmux-navigator  

### 💾 Persistent Sessions
- Auto-save sessions every 15 minutes  
- Auto-restore last session on tmux start  

---

## ⚡ Key Bindings Cheatsheet

Shortcut               | Action
-----------------------|------------------------------------------
<Prefix> + r           | Reload tmux config  
<Prefix> + c           | New window (in same path)  
<Prefix> + \\          | Split pane horizontally  
<Prefix> + -           | Split pane vertically  
<Prefix> + m           | Maximize / restore pane  
<Prefix> + j/k/l/h     | Resize pane  
<Prefix> + v           | Begin text selection (vi mode)  
<Prefix> + y           | Copy to clipboard via ./copy.sh  
<Prefix> + ,           | Rename current window  
<Prefix> + $           | Rename current session  
<Prefix> + s           | Show and switch between sessions  
<Prefix> + I           | Install plugins (via TPM)  
<Prefix> + U           | Update plugins (via TPM)  
tmux kill-server       | Kill all tmux sessions  

---

## 💾 Session Management Commands

These are commands you run in your terminal (not key bindings):

### ▶️ Start a new tmux session:

tmux new -s <session-name>

Example:

tmux new -s dev

---

### 📂 List existing sessions:

tmux ls

---

### 🔄 Attach to an existing session:

tmux attach -t <session-name>

---

### 💾 Save current session (via tmux-resurrect):

<Prefix> + Ctrl-s

---

### ♻️ Restore the last saved session:

<Prefix> + Ctrl-r

---

## 🚀 Installing Plugins

Inside tmux, press:

<Prefix> + I

To update plugins:

<Prefix> + U

---

## 📄 Requirements

- tmux (v3.1+ recommended)  
- clip.exe (for WSL), pbcopy (macOS), or xclip (Linux)  
- ./copy.sh script for cross-platform clipboard support  
- Nerd Fonts for full icon support (optional)  

---

## 🧪 Debug Tips

To check status bar configuration:

tmux show -g status-left  
tmux show -g status-right  
tmux show -g status-justify  

---

## 🧠 Extras

Set your terminal $TERM to xterm-256color or screen-256color for best compatibility.

---

Enjoy tmux! ⚡🧪

