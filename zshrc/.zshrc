# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# ZSH Settings and variables
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
zstyle ':omz:update' mode reminder  # Update settings: auto, reminder, never

ZSH_THEME="powerlevel10k/powerlevel10k"
#plugins=(zsh-autosuggestions zsh-syntax-highlighting)


# File navigation
eval "$(zoxide init zsh --cmd cd)"
alias ls="eza"

# Vim mode
bindkey -v 
bindkey -M vicmd v edit-command-line


# Alias
alias vim="nvim"
alias svim="sudoedit"

alias brewup="brew update && brew upgrade && brew cleanup && brew doctor && clear"
alias reset="echo FUCK YOU!"

alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias vimrc="cd ~/.config/nvim/ && nvim ~/.config/nvim/init.lua && cd -" # vimrc
alias tmuxrc="nvim ~/.config/tmux/tmux.conf && tmux source-file ~/.config/tmux/tmux.conf" # tmuxrc


# Python + Conda settings
export CONDA_AUTO_ACTIVATE_BASE=false
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

# PyEnv
# command -v pyenv 1>/dev/null && eval "$(pyenv init -)"


# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
