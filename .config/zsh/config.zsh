path+="/opt/homebrew/bin"
path+="/usr/local/sbin"
path+="$HOME/.cargo/bin"
path+="$HOME/Library/Python/3.9/bin"
export PATH

export ZSH=$HOME/.config/zsh
export EDITOR="nvim"

source "$ZSH/omz.sh"
source "$ZSH/prompt.zsh"

bindkey -v
bindkey '^N' autosuggest-accept

# SHORTCUTS
alias v="nvim"
alias pip="python3 -m pip"

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

alias tsd="transmission-daemon"
alias tsm="transmission-remote"
alias costart="colima stop && colima start --network-driver slirp"
