# personal theme
top_right="%F{69} %*%f"
bottom_left=" %(?:%F{82}❯:%F{196}❯)%f "
bottom_right=""

function top-left() {
  main_prompt=" %F{70}󰠖%f %F{207}%n%f %B%F{123} %3~%f%b "
  if git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"; then
    untracked="%B%F{160} $git_branch 󰔑%f%b"
    modified="%B%F{208} $git_branch 󰔕%f%b"
    clean="%B%F{113} $git_branch 󰔓%f%b"
    local git_status="$(git status --short 2>/dev/null)"
    if [ ${#git_status[@]} -eq 0 ]; then 
      main_prompt+="$clean "
    else
      untracked_files=false
      for line in $git_status; do
        if [[ $line == \?\?* ]]; then 
          untracked_files=true
        fi
      done
      if $untracked_files; then 
        main_prompt+="$untracked "
      else
        main_prompt+="$modified "
      fi
    fi
  fi
  echo $main_prompt
}

preexec() {
    cmd_start="$SECONDS"
}

precmd() {
  local cmd_end="$SECONDS"
  elapsed="$((cmd_end - cmd_start))"
  bottom_right="%F{209} ${elapsed}s%f"
}

function prompt-length() {
  emulate -L zsh
  local COLUMNS=${2:-$COLUMNS}
  local -i x y=$#1 m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ));
    done
    local xy
    while (( y > x + 1 )); do
      m=$(( x + (y - x) / 2 ))
      typeset ${${(%):-$1%$m(l.x.y)}[-1]}=$m
    done
  fi
  echo $x
}

function fill-line() {
  emulate -L zsh
  local left_len=$(prompt-length $1)
  local right_len=$(prompt-length $2 9999)
  local pad_len=$((COLUMNS - left_len - right_len - ${ZLE_RPROMPT_INDENT:-1}))
  if (( pad_len < 1 )); then
    # Not enough space for the right part. Drop it.
    echo -E - ${1}
  else
    local pad=${(pl.$pad_len.. .)}  # pad_len spaces
    echo -E - ${1}${pad}${2}
  fi
}

function set-prompt() {
  emulate -L zsh
  PROMPT="$(fill-line "$(top-left)" "$top_right")"$'\n'$bottom_left
  RPROMPT=$bottom_right
}


preexec_interactive_mode="yes"
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt

# fwalch theme (oh my zsh)
# PROMPT='%{$fg_bold[green]%} %{$fg[cyan]%}%c%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
#
# ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
