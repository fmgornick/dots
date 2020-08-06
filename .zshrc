# Path to your oh-my-zsh installation.
export ZSH="/Users/Fletcher/.oh-my-zsh"

# ZSH theme
# ZSH_THEME="gianu"

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

################################
### ZSH PROMPT CUSTOMIZATION ###
################################

PROMPT='%{$fg_bold[magenta]%}%n%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)%{$reset_color%}%{$fg_bold[yellow]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}(%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[red]%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
