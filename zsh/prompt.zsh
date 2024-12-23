# clover color tells me if i'm running tmux
function tmux_active() {
  if [[ ! -z "${TMUX}" ]]; then
    echo "%{$fg[green]%}\U000f0816$rc"
  else
    echo "%{$fg[yellow]%}\U000f0816$rc"
  fi
}

# user profile
function user() {
  echo "%{$fg_bold[magenta]%}%n$rc"
}

# directory path
function path() {
  echo "%{$fg_bold[cyan]%}\uf07c %3~$rc"
}

# version control info
function vcs() {
  # exit if not in git dir
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) != 'true' ]]; then
    return
  fi

  # set branch name
  local gbranch=$(git symbolic-ref --short HEAD 2>/dev/null)
  local gstatus=$(git status --short 2>/dev/null)

  if [ ${#gstatus[@]} -eq 0 ]; then
    # green if clean
    echo "%{$fg_bold[green]%}\uf418 $gbranch \U000f0513$rc"
  else
    untracked_files=false
    for line in $gstatus; do
      if [[ $line =~ "\?\?" ]]; then
        untracked_files=true
      fi
    done

    if $untracked_files; then
      # red if there are untracked files
      echo "%{$fg_bold[red]%}\uf418 $gbranch \U000f0511$rc"
    else
      # yellow if modified
      echo "%{$fg_bold[yellow]%}\uf418 $gbranch \U000f0515$rc"
    fi
  fi
}

# status code of previous command
function code() {
  echo "%(?:%{$fg_bold[green]%}❯:%{$fg_bold[red]%}%? ❯)$rc%b"
}

function set-prompt() {
  emulate -L zsh
  PROMPT=" $(tmux_active) $(user) $(path) $(vcs)"$'\n'" $(code) "
}

preexec_interactive_mode="yes"
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt
