# Path to your oh-my-zsh installation.
export ZSH="/Users/Fletcher/.oh-my-zsh"
export PATH=/Users/Fletcher/.local/bin:$PATH
export PATH=/Users/Fletcher/.emacs.d/bin:$PATH

# nvim alias
alias v="lvim"
alias ssha="ssh -i "fletcher.pem" ubuntu@ec2-13-59-172-194.us-east-2.compute.amazonaws.com"

# commands to mount filesystem onto local machine and remove mount
alias sshfsm="mkdir ~/remote; sshfs gorni025@csel-kh1250-16.cselabs.umn.edu:/home/gorni025 /Users/Fletcher/remote"
alias sshfsu="diskutil umount force ~/remote; rm -rf ~/remote"

# make command much shorter for sshing into cse labs machine
alias sshg="ssh gorni025@csel-kh1250-16.cselabs.umn.edu"
# port forwarding
sshp () {
    ssh -L "$1":127.0.0.1:"$1" gorni025@csel-kh1250-16.cselabs.umn.edu
}

# alias for all the different scp commands
stl () {
    scp gorni025@csel-kh1250-16.cselabs.umn.edu:"$1" "$2"
}
stlr () {
    scp -r gorni025@csel-kh1250-16.cselabs.umn.edu:"$1" "$2"
}
lts () {
    scp "$1" gorni025@csel-kh1250-16.cselabs.umn.edu:"$2"
}
ltsr () {
    scp -r "$1" gorni025@csel-kh1250-16.cselabs.umn.edu:"$2"
}

pdfl () {
    latexmk -pvc -pdf -interaction=nonstopmode *.tex
}

# ZSH theme
ZSH_THEME="fwalch"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# switch ZSH from emacs mode to vim mode
bindkey -v

test -r /Users/Fletcher/.opam/opam-init/init.zsh && . /Users/Fletcher/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f "/Users/Fletcher/.ghcup/env" ] && source "/Users/Fletcher/.ghcup/env" # ghcup-env
