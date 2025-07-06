# 🛠️ My Neovim Configuration (NvChad v2.5)

Welcome to **my personal Neovim set‑up**, built on top of the blazing‑fast [NvChad](https://nvchad.com/) framework (version 2.5).  This README is meant to be a **one‑stop reference**: from installing the config to mastering everyday workflows with Vim motions, window management, LSP, and more.  Whether you are tweaking the setup or simply need a quick key‑binding refresher, everything lives here.  *Happy hacking!*

---

## 📋 Table of Contents

1. [Prerequisites](#-prerequisites)
2. [Installation](#-installation)
3. [Directory Overview](#-directory-overview)
4. [Key Concepts & Philosophy](#-key-concepts--philosophy)
5. [✨ Feature Highlights](#-feature-highlights)
6. [🚀 Quick Start](#-quick-start)
7. [🗺️ Essential Vim Motions & Commands](#-essential-vim-motions--commands)
8. [🗝️ Custom Key‑Bindings (Leader = Space)](#-custom-key-bindings-leader--space)
9. [🔌 Plugin List & Usage](#-plugin-list--usage)
10. [💻 Language Server & Formatting](#-language-server--formatting)
11. [🐞 Debugging (DAP)](#-debugging-dap)
12. [🎨 Theming & UI Tweaks](#-theming--ui-tweaks)
13. [⚙️ Adding / Overriding Plugins](#-adding--overriding-plugins)
14. [🔄 Updating NvChad & Plugins](#-updating-nvchad--plugins)
15. [⚡ Performance Tips & Troubleshooting](#-performance-tips--troubleshooting)
16. [🧾 License & Credits](#-license--credits)

---

## 🔧 Prerequisites

| Software            | Version | Notes                          |
| ------------------- | ------- | ------------------------------ |
| **Neovim**          |  ≥ 0.9  | Confirm with `nvim --version`  |
| **Git**             |  Latest | For cloning & updates          |
| **Node.js**         |  ≥ 18   | Treesitter, LSP tooling        |
| **ripgrep**         | Any     | Telescope live grep            |
| **fd**              | Any     | Fuzzy finder backend           |
| **Python 3**        | ≥ 3.8   | Pylsp & other language tooling |
| **Go** *(optional)* | ≥ 1.21  | For `gopls`, etc.              |

> ⚠️ **WSL Users:** Enable clipboard integration (e.g., `win32yank.exe`) for system‑wide copy/paste.

---

## 📦 Installation

```bash
# Backup any existing config
mv ~/.config/nvim{,.backup}

# Clone NvChad template (depth 1) and switch to my branch
git clone --depth 1 --branch v2.5 https://github.com/NvChad/NvChad ~/.config/nvim

# Pull my custom layer on top
git clone https://github.com/<myusername>/nvchad-custom ~/.config/nvim/lua/custom

# Start Neovim (first launch will install plugins)
nvim
```

**Optional:** Use a Git submodule or dotfiles manager (e.g., chezmoi, yadm) if you sync configs across machines.

---

## 📂 Directory Overview

```
.config/nvim/
├─ init.lua        # Loads NvChad core
├─ lua/
│  ├─ core/        # NvChad internals (don’t edit)
│  ├─ custom/      # ← All my customisations live here
│  │   ├─ init.lua           # Entry point for overrides
│  │   ├─ plugins.lua        # Extra plugins & overrides
│  │   ├─ mappings.lua       # Key‑maps
│  │   ├─ lsp.lua            # Mason & LSP setup
│  │   ├─ autocmds.lua       # Auto‑commands (events)
│  │   └─ …                  # Additional modules
│  └─ chadrc.lua   # Main config file (links to custom)
└─ README.md       # 🡐 This file
```

*Everything editable sits under `lua/custom/` ― no touching `core/`!*

---

## 🧭 Key Concepts & Philosophy

* **Modularity:** NvChad treats your overrides as a *layer*, so updates rarely break.
* **Lazy Loading:** Plugins load only when needed → faster startup.
* **Leader‑First Workflow:** Almost every custom command sits behind `<Space>`.
* **Zero config drift:** Keep personal tweaks in version control & portable.

---

## ✨ Feature Highlights

* **Treesitter** powered syntax & code folding
* **Mason** automatic LSP/DAP/server installations
* **Telescope** fuzzy finder w/ extensions
* **nvim‑cmp** completion w/ snippets (LuaSnip)
* **Gitsigns** realtime Git hunk indicators + actions
* **Lazygit** integration in a floating terminal
* **Which‑Key** on‑screen key‑binding hints
* **Noice & Lualine** modern UI with notifications & statusline
* **ToggleTerm** drop‑down terminals
* **Alpha‑Nvim** custom start‑screen dashboard
* **Cheat‑Sheet**: This README!

---

## 🚀 Quick Start

1. Launch **Neovim**: `nvim`
2. Wait for `packer.nvim` (NvChad’s plugin manager) to sync on first run.
3. Open a project directory: `:e ~/projects/myapp`
4. Press **`<Space> e`** for the file explorer (nvim‑tree).
5. Start coding – LSP, completion, and linting kick in automatically.

---

## 🗺️ Essential Vim Motions & Commands

### Navigation

| Keys                | Action                    |
| ------------------- | ------------------------- |
| `h` `j` `k` `l`     | Left/Down/Up/Right        |
| `w` `b`             | Next / previous word      |
| `e`                 | End of word               |
| `gg` / `G`          | Start / end of file       |
| `{` `}`             | Previous / next paragraph |
| `Ctrl‑u` / `Ctrl‑d` | Half‑page up / down       |
| `%`                 | Jump to matching bracket  |

### Editing

| Keys            | Action                                |
| --------------- | ------------------------------------- |
| `i` `I` `a` `A` | Insert before/linestart/after/lineend |
| `o` / `O`       | New line below / above                |
| `c` + motion    | Change text (delete into insert)      |
| `d` + motion    | Delete                                |
| `y` + motion    | Yank (copy)                           |
| `p` / `P`       | Paste after / before                  |
| `.`             | Repeat last change                    |
| `u` / `Ctrl‑r`  | Undo / redo                           |

### Visual Mode & Text Objects

| Keys                 | Description                     |
| -------------------- | ------------------------------- |
| `v` / `V` / `Ctrl‑v` | Char / line / block visual mode |
| `aw` / `iw`          | Around / inner word             |
| `ap` / `ip`          | Around / inner paragraph        |
| `a"` / `i"`          | Around / inner quotes           |
| `a)` / `i)`          | Around / inner parentheses      |

### Windows, Tabs & Buffers

| Keys                    | Action                                 |
| ----------------------- | -------------------------------------- |
| `Ctrl‑w s` / `Ctrl‑w v` | Split window horizontally / vertically |
| `Ctrl‑w hjkl`           | Move between splits                    |
| `Ctrl‑w =`              | Equalize split sizes                   |
| `:tabnew` / `gt` / `gT` | New tab / next / previous tab          |
| `<Space> b n/p`         | Next / previous buffer                 |
| `<Space> b D`           | Close current buffer                   |

### Search & Replace

| Keys               | Action                                        |
| ------------------ | --------------------------------------------- |
| `/pattern` `n` `N` | Forward, next, previous match                 |
| `*` / `#`          | Search word under cursor forwards / backwards |
| `:%s/foo/bar/gc`   | Substitute globally with confirm              |

### Registers & Macros

| Keys          | Action                                        |
| ------------- | --------------------------------------------- |
| `"aY` / `"ap` | Yank to / paste from register `a`             |
| `q q` … `q`   | Record macro into `q` register; run with `@q` |

### Marks & Jumps

| Keys              | Action                          |
| ----------------- | ------------------------------- |
| `m a`             | Set mark `a`                    |
| `` `a` ``         | Jump to mark                    |
| `Ctrl‑o / Ctrl‑i` | Jump back / forward in jumplist |

> **Tip:** NvChad ships with [`which‑key`](https://github.com/folke/which-key.nvim) so you can press `<Space>` anytime and wait; available mappings will pop up.

---

## 🗝️ Custom Key‑Bindings (Leader = `<Space>`)

| Key   | Description                          |
| ----- | ------------------------------------ |
| `e`   | Toggle **File Explorer** (nvim‑tree) |
| `f f` | **Find files** (Telescope)           |
| `f g` | **Live grep**                        |
| `b l` | **Buffer list**                      |
| `g s` | **Stage hunk** (Gitsigns)            |
| `g r` | **Reset hunk**                       |
| `g p` | **Preview hunk**                     |
| `d t` | **ToggleTerm** dropdown              |
| `c d` | **Open Lazygit** inside terminal     |
| `m a` | **Mason** : ensure LSP & tools       |
| `l R` | **Restart LSP**                      |
| `q q` | **Quit** all                         |

> For full mapping list open `which‑key` with `<Space>` or inspect `lua/custom/mappings.lua`.

---

## 🔌 Plugin List & Usage

Below is a curated list; see `custom/plugins.lua` for the definitive source.

| Plugin                | Purpose              | Usage Hints                          |
| --------------------- | -------------------- | ------------------------------------ |
| **`nvim‑tree.lua`**   | File explorer        | `<Space> e` to toggle                |
| **`telescope.nvim`**  | Fuzzy finder         | `ff`, `fg`, `fb`, `fh`               |
| **`nvim‑lspconfig`**  | LSP client           | Auto‑loaded per filetype             |
| **`mason.nvim`**      | LSP/DAP installer    | `<Space> m a` to manage              |
| **`nvim‑cmp`**        | Autocompletion       | `Tab` / `Shift‑Tab` to navigate menu |
| **`LuaSnip`**         | Snippet engine       | `Tab` to jump placeholders           |
| **`null‑ls`**         | Formatters & linters | Auto‑format on save (`gq`)           |
| **`gitsigns.nvim`**   | Git hunks            | Stage/reset etc. with leader + `g`   |
| **`lualine.nvim`**    | Statusline           | Shows mode, branch, LSP, diag        |
| **`noice.nvim`**      | UI notifications     | Cleaner `:messages`                  |
| **`toggleterm.nvim`** | Integrated terminals | `Alt` + `i/o/t` splits               |
| **`hop.nvim`**        | Easier motions       | `s` two letters jump                 |

*(Auto‑installed by NvChad; extra plugins listed in `custom/plugins.lua`.)*

---

## 💻 Language Server & Formatting

### Installing Servers

```lua
-- lua/custom/lsp.lua
require("mason").setup {}
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "tsserver", "clangd" }
}
```

Restart Neovim and Mason will pull binaries automatically.

### On‑Save Formatting

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format { timeout_ms = 2000 }
  end,
})
```

> Use `:NullLsInfo` to debug formatters.

---

## 🐞 Debugging (DAP)

* **Installation:** Mason → `mason install debugpy` (or `cppdbg`, etc.)
* **Key‑Bindings:**

  | Key           | Action            |
  | ------------- | ----------------- |
  | `<F5>`        | Start / Continue  |
  | `<F10>`       | Step Over         |
  | `<F11>`       | Step Into         |
  | `<F12>`       | Step Out          |
  | `<Leader> db` | Toggle breakpoint |
  | `<Leader> dr` | Toggle REPL       |

> Configure launch settings in `lua/custom/dap.lua`.

---

## 🎨 Theming & UI Tweaks

* Themes live in `lua/custom/themes.lua` (defaults to *Catppuccin‑Mocha*).
* Change theme on‑the‑fly: `:Telescope themes`.
* Enable transparency: set `ui.transparency = true` in `chadrc.lua`.
* Font ligatures? Use a patched Nerd Font like **Hack Nerd Font**.

---

## ⚙️ Adding / Overriding Plugins

In `lua/custom/plugins.lua`:

```lua
return {
  { "folke/trouble.nvim", cmd = "TroubleToggle", opts = {} },
  { "tpope/vim‑surround", event = "VeryLazy" },
  -- Disable a default plugin
  { "windwp/nvim‑autopairs", enabled = false },
}
```

Run `:NvChadUpdate` or restart to install changes.

---

## 🔄 Updating NvChad & Plugins

```bash
cd ~/.config/nvim
# Pull latest NvChad core (v2.5.x → v2.6 etc.)
git pull origin v2.5

# Update custom layer
cd lua/custom && git pull

# Inside Neovim
:PackerSync   # installs/updates plugins
:NvChadUpdate # syncs core patches
```

> Always backup before bumping major versions.

---

## ⚡ Performance Tips & Troubleshooting

| Symptom            | Possible Fix                                      |
| ------------------ | ------------------------------------------------- |
| Slow startup       | Check `:StartupTime`, disable heavy plugins       |
| LSP not attaching  | `:LspInfo` to see status, check `mason‑lspconfig` |
| Treesitter failing | `:TSInstallSync <lang>`                           |
| Keymap conflicts   | `:WhichKey <leader>` to inspect                   |
| Broken UI / fonts  | Use Nerd Font; run `FC‑Cache -fv` on Linux        |

---

## 🧾 License & Credits

* **NvChad** © 2021‑2025 [Siduck](https://github.com/siduck) & contributors (GPL‑3.0)
* Additional plugins are under their respective licenses.
* My customizations are released under the MIT License (see `LICENSE.md`).

---

> *Made with ❤️  &  ☕ in the command line.*

