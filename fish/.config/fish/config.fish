# Commands to run in interactive sessions can go here
if status is-interactive
#####################################################

#####################################################
# IMPORT FILES
#####################################################

source $HOME/.config/fish/env.fish
source $HOME/.config/fish/sec_env.fish
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/abbr.fish

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US:en"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"
#####################################################
# JABBA
#####################################################

if test -d $HOME/.jabba
    source $HOME/.jabba/jabba.fish
end

  jabba use openjdk@1.11.0


#####################################################
# FZF
#####################################################

set -g -x FZF_DEFAULT_COMMAND fd --type f --hidden --follow --exclude /.git
set -g -x FZF_DEFAULT_OPTS --layout=reverse --height 50% --no-separator --color bg+:-1


#####################################################
# NVM
#####################################################

set -g -x NVM_DIR $HOME/.nvm

# would be too long :
# nvm use current


#####################################################
# GREETING
#####################################################

set -g -x fish_greeting '🐟'


#####################################################
# PROMPT
####################################################

# for starship
starship init fish | source


#####################################################
# VARIA
#####################################################

set -xg LESS "-SRXF"
set -xg BKMR_DB_URL "$HOME/.config/bkmr/bkmr.db"
set -xg BKMR_FZF_OPTS "--reverse --height 75% --show-tags"

#####################################################
end

