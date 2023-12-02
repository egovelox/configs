#! /bin/bash
die() { echo "$2" >&2; exit "$1"; }

if test ! $(which brew)
then
  echo "[FATAL] homebrew is not installed..."
else
  echo "[OK] Already existing $(which brew)"
  if [ -f $HOME/configs/scripts/brew/configsBrewfile ]
  then
    echo "[INFO] Installing brew packages list from configsBrewfile..."
    brew bundle --file=~/configs/scripts/brew/configsBrewfile
    if [ "$?" -ne 0 ]
    then
      echo "[FATAL] Error installing brew packages list"
      exit 1
    else
      echo "[INFO] Listing all brew installed packages..."
      brew list
    fi
  else
    echo "[INFO] Missing $HOME/configs/brew/configsBrewfile"
    echo "[FATAL] Cannot install brew packages"
    exit 1
  fi
fi
