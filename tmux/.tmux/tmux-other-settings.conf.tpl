########################################
# OTHER SETTINGS
########################################

# default shell
set -g default-shell ${BREW_PATH}/bin/fish
#set -g default-command /opt/homebrew/bin/fish

# helps in faster key repetition Avoid ESC delay
set -sg escape-time 0

# set scroll history to 100,000 lines
set-option -g history-limit 100000

# VIM MODE
#
# To enter, use one of these bindings: 
# * prefix-[
# * Command ] (if set in alacritty)
# * Ctrl-s d  (if set in tmux-keys.conf)
# 
# To quit, use default quit binding : 
# * q
setw -g mode-keys vi

# Mouse friendly
set -g mouse on