# set xdg standard environment variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CURRENT_DESKTOP="sway"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_STATE_HOME="$HOME/.local/state"

# misc.
export EDITOR="nvim"
export HISTFILE="$XDG_CACHE_HOME/bash/history"
export HISTFILESIZE=100000
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export NPM_CONFIG_CACHE="$HOME/.cache/npm"
