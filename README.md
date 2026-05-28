# 🌌 .dotfiles

Modern, XDG-compliant configuration files for a high-performance development environment on **Arch Linux (WSL2)**. This setup is optimized for a full-stack workflow involving **Next.js**, **Docker**, **Go**, and **Rust**.

> [!NOTE]
> This `README.md` was generated using Gemini CLI, based on the configs in this repository, and then altered a bit to reflect the full picture. So, read this with a grain of salt.

---

## 🛠️ Core Stack

- **Shell:** `zsh` + [Oh My Zsh](https://ohmyz.sh/) (Theme: `frisk-unity`, a custom version based on `frisk`)
- **Editor:** [Neovim](https://neovim.io/) (Distribution: [LazyVim](https://www.lazyvim.org/))
- **Multiplexer:** `tmux` + [TPM](https://github.com/tmux-plugins/tpm) (Theme: `tokyo-night-tmux`)
- **System Info:** `fastfetch` (Custom Homelab layout)
- **Navigation:** `zoxide`, `fzf`, `oil.nvim`
- **Languages:** Node.js (pnpm/bun), Go, Rust, Python, Zig

## ✨ Key Features

- **📂 XDG Compliance:** Strictly enforces XDG Base Directory standards to keep `$HOME` clean.
- **🚀 Optimized Neovim:** LazyVim setup with extras for Docker, Go, Rust, Tailwind, and more.
- **⚡ Proactive Tmux:** Automated session restoration (`resurrect`/`continuum`), floating terminal (`floax`), and smart pane switching with Neovim.
- **🖥️ Homelab Integration:** Built-in aliases and scripts for mounting and managing remote servers via `sshfs`.
- **🔧 Quality of Life:**
  - Automated Windows `Zone.Identifier` cleanup.
  - Smart Tmux window renaming based on active process.
  - WSL-specific tweaks (auto-jump to Linux home).

## 📥 Installation

> [!WARNING]
> These dotfiles are tailored for a specific WSL2 environment. Review the scripts before applying them to your system.

### 1. Clone the repository

#### From vedanJO (my selfhosted [Forgejo](https://forgejo.org/) instance)
##### Authenticated Pull
```bash
git clone ssh://git@git-ssh.unityblaster.com:2222/vedan/dotfiles_LAPTOP-VED-2-WSL-ARCHLINUX.git ~/.config
```

##### Unauthenticated Pull
```bash
git clone https://git-ssh.unityblaster.com:3332/vedan/dotfiles_LAPTOP-VED-2-WSL-ARCHLINUX.git ~/.config
```

#### From GitHub (mirrored repo)
```bash
git clone git@github.com:Unity-Blaster/dotfiles_LAPTOP-VED-2-WSL-ARCHLINUX.git ~/.config
```

### 2. Install Prerequisites

Ensure you have the following installed:

- `zsh`, `tmux`, `neovim`, `fastfetch`, `fzf`, `zoxide`
- `pnpm`, `bun`, `go`, `rustup`

### 3. Initialize Plugins

- **Zsh:** Restart your shell or run `source ~/.config/zsh/.zshrc`.
- **Tmux:** Press `Prefix` + `I` inside Tmux to install plugins via TPM.
- **Neovim:** Simply open `nvim` and Lazy.nvim will handle the rest.

## ⌨️ Custom Aliases

| Alias          | Description                       |
| :------------- | :-------------------------------- |
| `v`            | Quick open Neovim                 |
| `zshconf`      | Edit Zsh configuration            |
| `zshr`         | Reload Zsh source                 |
| `mount-server` | Mount homelab server via sshfs    |
| `nuke-zones`   | Vaporize Windows ghost files      |
| `ghd`          | Open GitHub Dashboard (`gh dash`) |

---

_Built with ❤️ and a lot of caffeine._ (cringe af, i know, but... Ehh... Whatever, let's keep it in)
