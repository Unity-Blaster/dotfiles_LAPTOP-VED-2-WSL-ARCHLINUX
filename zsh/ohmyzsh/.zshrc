# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="frisk-unity"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true" # enable command auto-correction.

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 13 # how often to auto-update (in days).


# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS=dd.mm.yyyy

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
  colored-man-pages
  docker
)

source $ZSH/oh-my-zsh.sh
# fastfetch

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
#   export VISUAL='nvim'
# else
#   export EDITOR="nvim"
#   export VISUAL="nvim"
# fi
export EDITOR="nvim"
export VISUAL="nvim"

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="/home/vedan/.config/zsh/.zshrc"
export zshconfig="/home/vedan/.config/zsh/.zshrc"
alias ohmyzsh="~/.config/zsh/ohmyzsh/oh-my-zsh.sh"
export ohmyzsh="~/.config/zsh/ohmyzsh/oh-my-zsh.sh"

alias zshconfig-c="code ~/.config/zsh/.zshrc"
alias ohmyzsh-c="code ~/.config/zsh/ohmyzsh/oh-my-zsh.sh"
alias zshconfig-reload="source ~/.config/zsh/.zshrc"
alias zshr="source ~/.config/zsh/.zshrc"
alias thorium="thorium-browser-avx2"
alias linphone='__GLX_VENDOR_LIBRARY_NAME=intel QT_QPA_PLATFORM=xcb linphone'

# Add my custom scripts directory to PATH
export PATH="/home/vedan/bin:$PATH"

# pnpm
export PNPM_HOME="/home/vedan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2025-06-15 12:16:46
export PATH="$PATH:/home/vedan/.local/bin"

export PATH="/home/vedan/.spicetify:$PATH"
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:$HOME/.local/opt/go/bin"
export PATH="$PATH:$HOME/go/bin"

# gpull
gpull() {
    echo "🚀 Updating Homelab Website..."
    cd /home/vedan-server/homelab/homelabsite &&     git pull &&     cd .. &&     docker compose up -d --build website &&     cd /home/vedan-server
    echo "✅ Done."
}
# gpull end
alias lzd='lazydocker'
alias tmux-d='~/scripts/start_tmux_docker_main.sh'

bindkey -s ^f "~/.local/bin/tmux-sessionizer\n"

