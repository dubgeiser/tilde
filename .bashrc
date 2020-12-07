#
# .bash_profile will source this .bashrc
#

# shellcheck source=/dev/null
. ~/.bash/config
. ~/.bash/colors
. ~/.bash/functions
. ~/.bash/aliases
. ~/.bash/completions
# . ~/.bash/prompt
eval "$(starship init bash)"
. ~/.bashrc_private
. ~/Library/Preferences/org.dystroy.broot/launcher/bash/br
