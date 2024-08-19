
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# plugins=(docker)

export CONDA_AUTO_ACTIVATE_BASE=false

eval "$(zoxide init --cmd cd zsh)"

 # for macOS
if [[ $(uname) == "Darwin" ]]; then
  export PATH=$PATH:/Users/emi/.local/bin/
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# for Linux
if [[ $(uname) == "Linux" ]]; then
  export PATH=$PATH:/home/emiara/.local/bin/
  export PATH="$HOME/.cargo/bin:$PATH"
fi


# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode reminder   # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/emiara/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/emiara/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/emiara/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/emiara/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Vim mode
bindkey -v 
bindkey -M vicmd v edit-command-line




# pyenv setup
 if command -v pyenv 1>/dev/null 2>&1; then
                         eval "$(pyenv init -)"
                      fi
# Example aliases
alias reset="echo FUCK YOU!"
alias please="sudo"

alias vim="nvim"
alias svim="sudoedit"


# RCs
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias vimrc="cd ~/.config/nvim/ && nvim ~/.config/nvim/init.lua && cd -"
alias tmuxrc="nvim ~/.config/tmux/tmux.conf && tmux source-file ~/.config/tmux/tmux.conf"
alias yabairc="nvim ~/.config/yabai/yabairc && yabai --restart-service"
alias xkhdrc="nvim ~/.config/skhd/config"
alias alacrittyrc="nvim ~/.config/alacritty/alacritty.toml && alacritty --restart-service"
alias swayrc="nvim ~/.config/sway/config && swaymsg reload"

alias brewup="brew update && brew upgrade && brew cleanup && brew doctor && clear"
#alias update="sudo pacman -Syu && yay -Syu && clear"
alias update="sudo zypper refresh && sudo zypper update"
alias mac="tmux new-session -As mac"
alias bye="systemctl hibernate"
alias byebye="systemctl poweroff"
alias nf="clear && fastfetch"
alias lg="lazygit"
alias ta="tmux attach-session -t $(tmux list sessions | awk '{print $1}' | head -n 1) || tmux new-session"


alias ls="lsd"
alias ll="lsd -l" 
alias l="lsd -Al" 
alias tre="lsd --tree"
# neofetch




export PATH="$HOME/.ghcup/bin:$PATH"
