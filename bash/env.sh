# xdg directory spec
export LOCAL="$HOME/.local"
export XDG_BIN_HOME="$LOCAL/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$LOCAL/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_STATE_HOME="$LOCAL/state"

# cache
export HISTFILE="$XDG_CACHE_HOME/bash/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export HISTSIZE=100000
export SAVEHIST=100000

# config
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# data
export CARGO_INSTALL_ROOT="$LOCAL"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"

# misc
export EDITOR="nvim"
export GTK_THEME=Adwaita:dark
export MANPAGER="nvim -c 'Man!' -o -"
export QT_STYLE_OVERRIDE=Adwaita-Dark
export VISUAL="nvim"
