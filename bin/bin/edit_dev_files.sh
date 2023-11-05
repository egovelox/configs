#!/usr/bin/env bash
# This script is to be used
# with the source command
# so that the parent shell can cd in the $CHOSEN_DIR
# source select.sh



# set -x

CHOSEN_FILE=$(fd --type f --hidden --exclude .git --search-path $HOME/DEV | fzf-tmux -p 70% --prompt "Open file: " --no-bold --layout=reverse --height 50% --margin 0% --no-separator --no-info --black --color bg+:black,hl:222,gutter:black --delimiter 'DEV/' --with-nth 2);

if [[ -z $CHOSEN_FILE ]];
then
  exit 1
else
  CHOSEN_DIR=$(dirname $CHOSEN_FILE)
  nvim $CHOSEN_FILE
  cd $CHOSEN_DIR
fi


