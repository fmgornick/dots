# add path locations
export PATH="$HOME/.cargo/bin":$PATH
export PATH="/opt/homebrew/bin":$PATH
export PATH="/opt/homebrew/sbin":$PATH
export PATH="/usr/local/go-dev/bin":$PATH

# environment variables
export EDITOR="nvim"
export GOPATH="/usr/local/go-dev"
export ZSH="$HOME/.config/zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export HISTFILE="$HOME/.cache/zsh/zsh_history"
export LESSHISTFILE="$HOME/.cache/less/history"
export ZDOTDIR="$HOME/.cache/zsh"
export JULIA_DEPOT_PATH="$HOME/.cache/julia"

source "$ZSH/omz.sh"
source "$ZSH/prompt.zsh"

bindkey -v
bindkey '^N' autosuggest-accept

# SHORTCUTS
alias v="nvim"
alias pip="python3 -m pip"

# update packages
update() {
  brew update
  brew upgrade
  npx npm-check --global --update-all
}

# add ssh keys (not done automatically for some reason)
ssha() {
  ssh-add ~/.ssh/cselabs
  ssh-add ~/.ssh/github
}

# make command much shorter for sshing into cse labs machine
alias sshg="ssh gorni025@csel-cuda-04.cselabs.umn.edu"

# port forwarding
sshp() {
  ssh -L "$1":127.0.0.1:"$1" gorni025@csel-cuda-04.cselabs.umn.edu
}

# alias for all the different scp commands
stl() { scp gorni025@csel-cuda-04.cselabs.umn.edu:"$1" "$2"; }
stlr() { scp -r gorni025@csel-cuda-04.cselabs.umn.edu:"$1" "$2"; }
lts() { scp "$1" gorni025@csel-cuda-04.cselabs.umn.edu:"$2"; }
ltsr() { scp -r "$1" gorni025@csel-cuda-04.cselabs.umn.edu:"$2"; }

# latex compile shortcut
pdfl() { latexmk -pvc -pdf -interaction=nonstopmode *.tex; }
