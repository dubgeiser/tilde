#
# .bash_profile will source this .bashrc
#

# shellcheck source=/dev/null
. ~/.bash/config
. ~/.bash/colors
. ~/.bash/functions
. ~/.bash/aliases
. ~/.bash/completions
. ~/.bash/prompt
. ~/.bashrc_private

# ssh host completion is dynamic.
# Apparently when called from .bash/completions, ssh completion does not work?
# Even though .bash/functions is loaded before .bash/completions.
ssh_load_autocomplete
