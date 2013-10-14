#Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

include () {
    [[ -f "$1" ]] && source "$1"
}

include /usr/local/etc/bash_completion.d/git-completion.bash
include /usr/local/etc/bash_completion.d/git-prompt.sh

include /usr/share/bash-completion/completions/git
include /usr/lib/git-core/git-sh-prompt

include ~/.bash_aliases

PATH="/usr/local/bin:${PATH}"
export PATH

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for npm
PATH="/usr/local/share/npm/bin:${PATH}"
export PATH

function color_prompt {
    MAGENTA="\[\033[0;35m\]"
    YELLOW="\[\033[0;33m\]"
    BLUE="\[\033[34m\]"
    LIGHT_GRAY="\[\033[0;37m\]"
    CYAN="\[\033[0;36m\]"
    GREEN="\[\033[0;32m\]"
    GIT_PS1_SHOWDIRTYSTATE=true

    export PS1=$LIGHT_GRAY"\u@\h"$BLUE" \w"'$(
        if [[ $(__git_ps1) =~ \*\)$ ]]
        # a file has been modified but not added
        then echo "'$YELLOW'"$(__git_ps1 " (%s)")
        elif [[ $(__git_ps1) =~ \+\)$ ]]
        # a file has been added, but not commited
        then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
        # the state is clean, changes are commited
        else echo "'$CYAN'"$(__git_ps1 " (%s)")
        fi)'$GREEN" "
}

color_prompt
