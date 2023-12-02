#! /bin/bash

if [ ! -f /usr/local/bin/fish ] 
then
  export BREW_PATH="/opt/homebrew"
else
  export BREW_PATH="/usr/local"
fi

envsubst '${BREW_PATH}' < "$HOME/configs/alacritty/.config/alacritty/shell.yml.tpl" > "$HOME/configs/alacritty/.config/alacritty/shell.yml"


