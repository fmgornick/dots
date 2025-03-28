# binary path locations
export PATH="/opt/homebrew/bin":$PATH
export PATH="/opt/homebrew/sbin":$PATH
export PATH="/usr/local/cargo/bin":$PATH
export PATH="/usr/local/go/bin":$PATH
export PATH="/usr/local/pipx/bin":$PATH
export PATH="$HOME/.local/bin":$PATH

# include path locations
export C_INCLUDE_PATH="/usr/local/include"
export C_INCLUDE_PATH="/opt/homebrew/include":$C_INCLUDE_PATH

# library path locations
export LIBRARY_PATH="/usr/local/lib"
export LIBRARY_PATH="/opt/homebrew/lib":$LIBRARY_PATH

# set xdg standard environment variables
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/tmp"

# add autocomplete path location(s)
export FPATH="/opt/homebrew/share/zsh/site-functions":$FPATH

# hell yeah
export EDITOR="nvim"
export MANPAGER="nvim -c 'Man!' -o -"

# move zsh dump files into .cache directory
export ZDOTDIR="$HOME/.cache/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# other random environment variables
export LESSHISTFILE="$HOME/.cache/less/history"
export JULIA_DEPOT_PATH="$HOME/.cache/julia"

# rust
export CARGO_HOME="/usr/local/cargo"
export RUSTUP_HOME="/usr/local/rustup"

# go
export GOPATH="/usr/local/go"

# python
export PIPX_HOME="/usr/local/pipx"
export PIPX_BIN_DIR="$PIPX_HOME/bin"
export PIPX_MAN_DIR="$PIPX_HOME/man"

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export COLIMA_HOME="$XDG_CONFIG_HOME/colima"
