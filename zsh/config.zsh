# add path locations
export PATH="$HOME/.local/bin":$PATH
export PATH="/opt/homebrew/bin":$PATH
export PATH="/opt/homebrew/sbin":$PATH
export PATH="/usr/local/cargo/bin":$PATH
export PATH="/usr/local/go/bin":$PATH
export PATH="/usr/local/pipx/bin":$PATH

export ZSH="$HOME/.config/zsh"
source "$ZSH/env.sh"
source "$ZSH/omz.sh"
source "$ZSH/prompt.zsh"

bindkey -v
bindkey '^N' autosuggest-accept
compinit -d "$HOME/.cache/zsh/zcompdump"

# SHORTCUTS
alias env="env | sort"
alias l="eza -ailhH"
alias v="nvim"

# update packages
update() {
  brew update && brew upgrade         # brew
  cargo install-update -a             # rust
  go-global-update                    # go
  pipx upgrade-all -f                 # python
  npx npm-check --global --update-all # npm
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
