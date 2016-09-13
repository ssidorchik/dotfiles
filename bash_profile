#Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

function color_prompt {
  MAGENTA="\[\033[0;35m\]"
  YELLOW="\[\033[0;33m\]"
  BLUE="\[\033[34m\]"
  LIGHT_GRAY="\[\033[0;37m\]"
  CYAN="\[\033[0;36m\]"
  GREEN="\[\033[0;32m\]"
  GIT_PS1_SHOWDIRTYSTATE=true
  CLEAR="\[\e[0m\]"

  export PS1=$LIGHT_GRAY"\u@\h"$BLUE" \w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$CLEAR" "
}

color_prompt


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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=/usr/local/opt/android-sdk
export VBOX_USER_HOME=/Volumes/Data/Profile/VirtualBox\ VMs

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/sergey/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

export PEBBLE_PHONE=192.168.100.4
