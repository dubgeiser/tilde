#
# .bash_profile will source this .bashrc
#

. ~/.bash/colors
. ~/.bash/functions
. ~/.bash/aliases
. ~/.bash/completions
. ~/.bash/prompt

# ssh host completion is dynamic.
# Apparently when called from .bash/completions, ssh completion does not work?
# Even though .bash/functions is loaded before .bash/completions.
ssh_load_autocomplete

# Path and environment vars.
PATH="/usr/local/php5/bin:~/bin:~/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/opt/sqlite/bin:$PATH"
export EDITOR=vim
export GIT_EDITOR="$EDITOR"

# Keep more of the command history
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000

export LIQUIBASE_HOME=/usr/local/opt/liquibase/libexec
