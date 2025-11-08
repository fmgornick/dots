export ZSH="$HOME/.config/zsh"

source "$ZSH/env.sh"
source "$ZSH/prompt.zsh"

# load custom scripts
for script in "$ZSH/custom/"*.zsh; do
  [ -r "$script" ] && source "$script"
done

# zsh options
setopt append_history
setopt auto_cd
setopt extended_glob
setopt inc_append_history
setopt share_history

# prettier tab-completion
zstyle ":completion:*" ignored-patterns "_*"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select
bindkey "^[[Z" reverse-menu-complete

# run custom prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt

# shell completion
autoload -Uz compinit
compinit -d $ZSH_COMPDUMP

# shortcuts
alias ls="eza"
alias l="eza -ailhH"
alias env="env | sort | nvim"
alias v="nvim"
alias -- -="cd -"
alias cd ...="cd ../.."
alias cd ....="cd ../../.."
alias cd .....="cd ../../../.."
alias cd ......="cd ../../../../.."
alias cd .......="cd ../../../../../.."
alias cd ........="cd ../../../../../../.."
alias cd .........="cd ../../../../../../../.."
alias cd ..........="cd ../../../../../../../../.."
alias cd ...........="cd ../../../../../../../../../.."
alias cd ............="cd ../../../../../../../../../../.."

update() {
  brew update
  brew upgrade
}
