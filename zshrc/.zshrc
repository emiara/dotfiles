# ZSH Settings and variables
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
zstyle ':omz:update' mode reminder  # Update settings: auto, reminder, never


 eval "$(starship init zsh)"

# File navigation
eval "$(zoxide init zsh --cmd cd)"
alias ls="eza"

# Vim mode
bindkey -v
bindkey -M vicmd v edit-command-line


# Alias
alias vim="nvim"
alias svim="sudoedit"


alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias vimrc="cd ~/.config/nvim/ && nvim ~/.config/nvim/init.lua && cd -" # vimrc
alias tmuxrc="nvim ~/.config/tmux/tmux.conf && tmux source-file ~/.config/tmux/tmux.conf" # tmuxrc
alias alacrittyrc="nvim ~/.config/alacritty/alacritty.toml"
alias hyprc="nvim ~/.config/hypr/"
alias -g G='| grep'

# Cargo
. "$HOME/.cargo/env"


[ -f "/home/emiara/.ghcup/env" ] && . "/home/emiara/.ghcup/env" # ghcup-env