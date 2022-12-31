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



#####################################################
# JABBA
#####################################################

if test -d $HOME/.jabba
    source $HOME/.jabba/jabba.fish
end


#####################################################
# FZF
#####################################################

set -g -x FZF_DEFAULT_COMMAND fd --type f --hidden --follow --exclude /.git
set -g -x FZF_DEFAULT_OPTS --height 50% --layout=reverse



#####################################################
# NVM
#####################################################

set -g -x NVM_DIR $HOME/.nvm



#####################################################
# GREETING
#####################################################

set -g -x fish_greeting '🐟'



#####################################################
# PROMPT
#####################################################

# for starship
starship init fish | source



#####################################################
end

