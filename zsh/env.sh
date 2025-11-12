# xdg directory spec
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/tmp"
export XDG_STATE_HOME="$HOME/.local/state"

# paths
export PATH="/opt/homebrew/bin":$PATH
export PATH="/opt/homebrew/sbin":$PATH
export PATH="$XDG_BIN_HOME":$PATH
export PATH="$XDG_DATA_HOME/cargo/bin":$PATH
export PATH="$XDG_DATA_HOME/go/bin":$PATH
export C_INCLUDE_PATH="/usr/local/include:/opt/homebrew/include"
export DYLD_LIBRARY_PATH="/usr/local/lib:/opt/homebrew/lib"
export LIBRARY_PATH="/usr/local/lib:/opt/homebrew/lib"

# cache
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export ZDOTDIR="$XDG_CACHE_HOME/zsh/dots"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export HISTSIZE=100000
export SAVEHIST=100000

# config
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export COLIMA_HOME="$XDG_CONFIG_HOME/colima"

# data
export CARGO_INSTALL_ROOT="$HOME/.local"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"

# misc
export DOCKER_HOST="unix://$COLIMA_HOME/default/docker.sock"
export EDITOR="nvim"
export FPATH="/opt/homebrew/share/zsh/site-functions":$FPATH
export MANPAGER="nvim -c 'Man!' -o -"
export VISUAL="nvim"
export WORDCHARS="*?_[]~#&;!$%^(){}<>"
