# Commands to run in interactive sessions can go here
if status is-interactive
#####################################################

# When Karabiner is missing
bind \ck history-search-backward
bind \cj history-search-forward
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

# for python, ruby etc multi-threading on M1
set -xg OBJC_DISABLE_INITIALIZE_FORK_SAFETY "YES"
#####################################################
# JABBA
#####################################################

if test -d $HOME/.jabba
    source $HOME/.jabba/jabba.fish
end

  jabba use openjdk@1.11.0


if test -d $HOME/apache-maven-3.6.3
    set -g -x M2_HOME $HOME/apache-maven-3.6.3
end
#####################################################
# FZF
#####################################################

set -g -x FZF_DEFAULT_COMMAND fd --type f --hidden --follow --exclude /.git
set -g -x FZF_DEFAULT_OPTS --layout=reverse --height 50% --no-separator --color bg+:-1


#####################################################
# NVM
#####################################################

set -g -x NVM_DIR $HOME/.nvm

# deactivate if too long :
nvm use current > /dev/null


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
set -xg BKMR_DB_URL "$HOME/.config/bkms/bkmr.db"
set -xg BKMR_FZF_OPTS "--reverse --height 50% --show-tags"

#####################################################
end

