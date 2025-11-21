function __gstatus() {
    status=$(git status --porcelain 2>/dev/null)
    if [[ $status =~ "??" ]]; then echo '\e[0;31m\]'    # untracked files      => RED
    elif [[ ${#status} -ne 0 ]]; then echo '\e[0;33m\]' # changes not commited => YELLOW
    else echo '\e[0;35m\]'; fi                          # clean                => MAGENTA
}

function prompt() {
    if [[ $? -eq 0 || $? -eq 130 ]]; then status='' # 0/130 code => don't print return code
    else status='\[\e[0;31m\]$?\[\e[0m\] '; fi      # else       => print return code in red

    gbranch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        export PS1="$status\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\][\[$(__gstatus)$gbranch\[\e[0m\]]\$ "
    else
        export PS1="$status\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ "
    fi
}

PROMPT_COMMAND='history -a; prompt'
