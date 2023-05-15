export ZSH="/Users/Fletcher/.oh-my-zsh"
export PATH=/Users/Fletcher/.local/bin:$PATH
export PATH=/Users/Fletcher/.emacs.d/bin:$PATH
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

alias v="lvim"             # nvim alias
alias pip="python3 -m pip" # pip install alias

# oh-my-zsh stuff
ZSH_THEME="fwalch"
source $ZSH/oh-my-zsh.sh
bindkey -v

################################### SSH COMMANDS ###################################
sshfsm () {
  mkdir ~/remote;
  sshfs gorni025@csel-cuda-04.cselabs.umn.edu:/home/gorni025 /Users/Fletcher/remote;
}
sshfsu () {
  diskutil umount force ~/remote;
  rm -rf ~/remote;
}

# make command much shorter for sshing into cse labs machine
alias sshg="ssh gorni025@csel-cuda-04.cselabs.umn.edu"

# port forwarding
sshp () {
    ssh -L "$1":127.0.0.1:"$1" gorni025@csel-cuda-04.cselabs.umn.edu
}

# alias for all the different scp commands
stl  () { scp gorni025@csel-cuda-04.cselabs.umn.edu:"$1" "$2"    }
stlr () { scp -r gorni025@csel-cuda-04.cselabs.umn.edu:"$1" "$2" }
lts  () { scp "$1" gorni025@csel-cuda-04.cselabs.umn.edu:"$2"    }
ltsr () { scp -r "$1" gorni025@csel-cuda-04.cselabs.umn.edu:"$2" }
####################################################################################

# latex compile shortcut
pdfl () { latexmk -pvc -pdf -interaction=nonstopmode *.tex }
