source ~/.bash/colors
source ~/.bash/functions
source ~/.bash/aliases

# Installed by 'brew install git'
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/tmux
#source /usr/local/etc/bash_completion.d/t-completion.sh

# Enable autocomplete for aliases
# Leaving it here for documentation purposes
#complete -o default -o nospace -F _git g

ssh_load_autocomplete

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

# Prompt
# Thanks @janmoesen for pointing me to the \[\] surrounding the non-printing
# chars.  These are necessary to prevent issues with command line editing,
# -browsing, -completion.
PROMPT_COMMAND='__git_ps1 " \[${REVERSE}\]\[${BLUE}\] \t \[${NORMAL}\] \u@\h \[${BLUE}\]\W\[${NORMAL}\]" "\n"'
INITIAL_PROMPT_COMMAND=$PROMPT_COMMAND

prompt_no_git() {
    PROMPT_COMMAND='PS1=" \[${REVERSE}\]\[${BLUE}\] \t \[${NORMAL}\] \u@\h \[${BLUE}\]\W\[${NORMAL}\]\n"'
}

prompt_restore() {
    PROMPT_COMMAND=$INITIAL_PROMPT_COMMAND
}


# Path and environment vars.
PATH="/usr/local/php5/bin:~/bin:~/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export EDITOR=vim
export GIT_EDITOR="$EDITOR"

# Keep more of the command history
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000

# Vi mode
#set -o vi

archey
