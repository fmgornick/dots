function __gstatus() {
    _status=$(git status --porcelain)
    if [[ $_status =~ "\?\?" ]]; then echo "red"      # untracked files
    elif [[ ${#_status} -ne 0 ]]; then echo "yellow" # changes not commited
    else echo "magenta"; fi                         # clean
}

function prompt() {
    if [[ $? -eq 0 || $? -eq 130 ]]; then _status='' # 0/130 => don't print return code
    else _status='%F{red}$?%f '; fi                  # else  => print return code in red

    gbranch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        export PS1="$_status%F{green}%n@%m%f:%F{blue}%1~%f[%F{$(__gstatus)}$gbranch%f]\$ "
    else
        export PS1="$_status%F{green}%n@%m%f:%F{blue}%1~%f\$ "
    fi
}

add-zsh-hook precmd prompt
