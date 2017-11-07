#
# .bash_profile will source this .bashrc
#

source ~/.bash/colors
source ~/.bash/functions
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/prompt

# ssh host completion is dynamic.
# Apparently when called from .bash/completions, ssh completion does not work?
# Even though .bash/functions is loaded before .bash/completions.
ssh_load_autocomplete

# Path and environment vars.
PATH="/usr/local/php5/bin:~/bin:~/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export EDITOR=vim
export GIT_EDITOR="$EDITOR"

# Keep more of the command history
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000

archey
