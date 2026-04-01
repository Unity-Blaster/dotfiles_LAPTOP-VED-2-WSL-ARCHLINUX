# ==============================================================================
# OH MY ZSH SETUP & THEME
# ==============================================================================
export ZSH="$HOME/.config/zsh/ohmyzsh"
ZSH_THEME="frisk-unity"
# ZSH_THEME="tokyonight"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# Optimized plugin list (Removed conflicting highlighters and lagging autocomplete)
plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  colored-man-pages
  docker
  dotenv
)

# ==============================================================================
# ENVIRONMENT VARIABLES
# ==============================================================================
[[ -f ~/secrets_env ]] && source ~/secrets_env

export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export ARCHFLAGS="-arch $(uname -m)"

# Config Paths (Exported so you can use them in scripts/aliases)
export ZSHCONF="$HOME/.config/zsh/.zshrc"
export lzconf="$HOME/.config/nvim/lua/config"
export lzplugs="$HOME/.config/nvim/lua/plugins"

# ==============================================================================
# XDG BASE DIRECTORY ENFORCEMENT
# ==============================================================================
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Force stubborn tools to respect XDG
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"

# ==============================================================================
# PATH EXPORTS
# ==============================================================================
# Consolidated to prevent messy duplicates
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/.local/share/go/bin:$HOME/.local/share/cargo/bin:$HOME/.local/opt/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# ==============================================================================
# PACKAGE MANAGERS (NVM & PNPM)
# ==============================================================================
# PNPM setup
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# NVM setup (Duplicate block removed for faster terminal startup)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ==============================================================================
# ALIASES & FUNCTIONS
# ==============================================================================
# --- Editor ---
alias v="nvim"

# --- Zsh & Configs ---
alias zshconf="v $ZSHCONF"
alias zshr="source $ZSHCONF && echo 'Zsh reloaded!'"
alias nuke-zones='find ~ -xdev -type f -name "*:Zone.Identifier" -delete && echo "Windows ghost files vaporized!"'
# Safely convert all Windows CRLF files to Linux LF (ignoring heavy/binary folders)
alias fix-crlf='find ~ -xdev -type d \( -name "node_modules" -o -name ".git" -o -name ".next" -o -name ".cache" -o -name ".local" -o -name "server" -o -name "go" \) -prune -o -type f -exec dos2unix -q {} + && echo "All text files converted to Linux line endings!"'

# --- LazyVim Quick Edit ---
alias vopts="v $lzconf/options.lua"
alias vkeys="v $lzconf/keymaps.lua"
alias vplugs="v $lzplugs"
alias voil="v $lzplugs/oil.lua"
alias vtheme="v $lzplugs/colorscheme.lua"

# --- Server Mount ---
alias mount-server="sshfs vedan-server@laptop-ved-1:/home/vedan-server ~/server -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,auto_cache,reconnect,kernel_cache,compression=no,Ciphers=aes128-gcm@openssh.com && echo 'Server mounted at ~/server'"
alias umount-server="fusermount3 -u ~/server && echo 'Server unmounted'"
alias vserver="cd ~/server && v ."

# ==============================================================================
# ZSH OPTIONS & TWEAKS
# ==============================================================================
# Stop 'auto cd' (Executing a directory name to cd into it)
unsetopt autocd
eval "$(zoxide init zsh)"

# ==============================================================================
# WSL AUTO-BOUNCE
# ==============================================================================
# If WSL is launched from the default Windows home directory, instantly jump
# to the native Linux home directory instead.
if [[ "$PWD" == "/mnt/c/Users/vedan" ]]; then
  cd ~
fi

# ==============================================================================
# HISTORY CONFIGURATION
# ==============================================================================
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000 # How many lines of history to keep in memory
export SAVEHIST=100000 # How many lines of history to save to the file

setopt INC_APPEND_HISTORY   # Write to the history file *immediately*, not when the shell exits
setopt SHARE_HISTORY        # Share history across all open Tmux panes/windows instantly
setopt HIST_IGNORE_DUPS     # Don't record an entry if it's the exact same as the last one
setopt HIST_IGNORE_ALL_DUPS # Delete old duplicate commands to keep history clean
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from history items

# LOAD OH-MY-ZSH AFTER EVERYTHING IS SET UP
source $ZSH/oh-my-zsh.sh

# ==============================================================================
# INITIALIZATION & STARTUP SPLASH
# ==============================================================================
# Only run these commands if a human is actually looking at the terminal.
# This prevents fastfetch from breaking background tasks like SCP or SSH tunneling.
if [[ $- == *i* ]]; then

  echo -e "\n"
  # Print system information
  fastfetch

  # Quick check to see if the homelab server is currently connected
  if mountpoint -q "$HOME/server"; then
    echo -e "\n\e[32mHomelab Server is MOUNTED at ~/server\e[0m"
  else
    echo -e "\n\e[31mHomelab Server is NOT mounted. Type 'mount-server' to connect.\e[0m"
  fi

fi

# Enable fzf history search dropdown (Ctrl+R)
source /usr/share/fzf/key-bindings.zsh

# fzf theme
export FZF_DEFAULT_OPTS=" \
  --color=,spinner:#F4DBD6,hl:#ED8796 \
  --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
  --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
  --color=selected-bg:#AEAEFF \
  --color=border:#6E738D,label:#CAD3F5"
