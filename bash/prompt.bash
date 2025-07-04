function gstatus() {
    status=$(git status --porcelain)
    if [[ $status =~ "??" ]]; then
        return 1 # untracked files
    elif [[ ${#status} -ne 0 ]]; then
        return 2 # changes not commited
    else
        return 3 # clean
    fi
}

function prompt() {
    if [[ $? -eq 0 || $? -eq 130 ]]; then
        status=''
    else
        status='\[\e[0;31m\]$?\[\e[0m\] '
    fi

    gbranch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        gstatus=$(gstatus; echo $?)
        if [[ $gstatus -eq 1 ]]; then
            export PS1="$status\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\][\[\e[0;31m\]$gbranch\[\e[0m\]]\$ "
        elif [[ $gstatus -eq 2 ]]; then
            export PS1="$status\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\][\[\e[0;33m\]$gbranch\[\e[0m\]]\$ "
        else
            export PS1="$status\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\][\[\e[0;35m\]$gbranch\[\e[0m\]]\$ "
        fi
    else
        export PS1="$status\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ "
    fi
}

PROMPT_COMMAND=prompt
