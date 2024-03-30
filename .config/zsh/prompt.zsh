# personal theme

function info() {
  main_prompt=" %{$fg[green]%}󰠖$rc %{$fg_bold[magenta]%}%n$rc %{$fg_bold[cyan]%} %3~ $rc"
  if [[ ! -z "${TMUX}" ]]; then
    main_prompt=" %{$fg[yellow]%}󰠖$rc %{$fg_bold[magenta]%}%n$rc %{$fg_bold[cyan]%} %3~ $rc"
  fi
  if git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"; then
    untracked="%{$fg_bold[red]%} $git_branch 󰔑$rc"
    modified="%{$fg_bold[yellow]%} $git_branch 󰔕$rc"
    clean="%{$fg_bold[green]%} $git_branch 󰔓$rc"

    local git_status="$(git status --short 2>/dev/null)"
    if [ ${#git_status[@]} -eq 0 ]; then
      main_prompt+="$clean "
    else
      untracked_files=false
      for line in $git_status; do
        if [[ $line =~ "\?\?" ]]; then
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

function set-prompt() {
  emulate -L zsh
  PROMPT="$(info)"$'\n'" %(?:%{$fg_bold[green]%}❯:%{$fg_bold[red]%}%? ❯)$rc%b "
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
