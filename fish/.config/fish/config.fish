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

