export BASH="$HOME/.config/bash"

source "$BASH/env.sh"
source "$BASH/prompt.bash"

# load custom scripts
for script in "$BASH/custom/"*.bash; do
  [ -r "$script" ] && source "$script"
done

# bash options
shopt -s autocd
shopt -s extglob
shopt -s histappend

# completion system
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

bind "set colored-stats on"
bind "set completion-ignore-case on"
bind "set match-hidden-files off"
bind "set menu-complete-display-prefix on"
bind "set show-all-if-ambiguous on"
bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'

alias copy='xclip -selection clipboard'
alias env="env | sort | nvim"
alias l="eza -ailhH"
alias ls="eza"
alias sway='sway --unsupported-gpu'
alias v="nvim"
alias -- -="cd -"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."

cd() {
    case "$1" in
        ...)      builtin cd ../.. ;;
        ....)     builtin cd ../../.. ;;
        .....)    builtin cd ../../../.. ;;
        ......)   builtin cd ../../../../.. ;;
        .......)  builtin cd ../../../../../.. ;;
        ........) builtin cd ../../../../../../.. ;;
        .........) builtin cd ../../../../../../../.. ;;
        ..........) builtin cd ../../../../../../../../.. ;;
        *)        builtin cd "$@" ;;  # fallback to normal cd
    esac
}
