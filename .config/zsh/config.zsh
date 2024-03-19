# add path locations
export PATH="$HOME/.local/bin":$PATH
export PATH="/opt/homebrew/bin":$PATH
export PATH="/opt/homebrew/sbin":$PATH
export PATH="/usr/local/go-dev/bin":$PATH
export PATH="/usr/local/cargo/bin":$PATH

export ZSH="$HOME/.config/zsh"
source "$ZSH/env.sh"
source "$ZSH/omz.sh"
source "$ZSH/prompt.zsh"

bindkey -v
bindkey '^N' autosuggest-accept
compinit -d "$HOME/.cache/zsh/zcompdump"

# SHORTCUTS
alias v="nvim"
alias pip="python3 -m pip"

# update packages
update() {
  brew update
  brew upgrade
  npx npm-check --global --update-all
}

# alias for all the different ssh commands
labsmachine="gorni025@csel-cuda-04.cselabs.umn.edu"

sshg() { ssh $labsmachine                        }
sshp() { ssh -L "$1":127.0.0.1:"$1" $labsmachine }
stl()  { scp $labsmachine:"$1" "$2"              }
stlr() { scp -r $labsmachine:"$1" "$2"           }
lts()  { scp "$1" $labsmachine:"$2"              }
ltsr() { scp -r "$1" $labsmachine:"$2"           }

# latex compile shortcut
pdfl() { latexmk -pvc -pdf -interaction=nonstopmode *.tex }
