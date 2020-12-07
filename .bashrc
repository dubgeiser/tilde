#
# .bash_profile will source this .bashrc
#

# shellcheck source=/dev/null
. ~/.bash/config
. ~/.bash/functions
. ~/.bash/aliases
. ~/.bash/completions
eval "$(starship init bash)"
. ~/.bashrc_private
. ~/Library/Preferences/org.dystroy.broot/launcher/bash/br
