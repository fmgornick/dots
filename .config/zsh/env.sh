# set xdg standard environment variables
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# move zsh dump files into .cache directory
export ZDOTDIR="$HOME/.cache/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# other random environment variables
export LESSHISTFILE="$HOME/.cache/less/history"
export JULIA_DEPOT_PATH="$HOME/.cache/julia"
