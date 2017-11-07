source ~/.bash/colors
source ~/.bash/functions
source ~/.bash/aliases

# Installed by 'brew install git'
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/tmux

# fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.bash"
export FZF_DEFAULT_OPTS='--color=light'

# Enable autocomplete for aliases
# Leaving it here for documentation purposes
#complete -o default -o nospace -F _git g

ssh_load_autocomplete

source ~/.bash/prompt

# Path and environment vars.
PATH="/usr/local/php5/bin:~/bin:~/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export EDITOR=vim
export GIT_EDITOR="$EDITOR"

# Keep more of the command history
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000

archey
