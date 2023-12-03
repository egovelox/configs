#! /bin/bash

if test ! $(which brew)
then
  echo "[FATAL] homebrew is not installed..."
  echo "[WARN] Cannot adapt brew path for alacritty and tmux shell."
else
  export BREW_PATH="$(brew --prefix)"
  envsubst '${BREW_PATH}' < "$HOME/configs/alacritty/.config/alacritty/shell.yml.tpl" > "$HOME/configs/alacritty/.config/alacritty/shell.yml"
  envsubst '${BREW_PATH}' < "$HOME/configs/tmux/.tmux/tmux-other-settings.conf.tpl" > "$HOME/configs/tmux/.tmux/tmux-other-settings.conf"
fi


