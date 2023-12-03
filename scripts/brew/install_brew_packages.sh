#! /bin/bash

installBrewfile() { 
  brew bundle --file="~/configs/scripts/brew/$1"
  if [ "$?" -ne 0 ]
  then
    echo "[FATAL] Error installing brew packages list"
    exit 1
  else
    echo "[INFO] Listing all brew installed packages..."
    brew list
  fi
}

if test ! $(which brew)
then
  echo "[FATAL] homebrew is not installed..."
else
  echo "[OK] Already existing $(which brew)"
  # on Linux
  if [ -d /home/linuxbrew/.linuxbrew ]
  then
    echo "[INFO] Installing brew packages list from configsLinuxBrewfile..."
    installBrewfile "configsLinuxBrewfile"
  else 
    if [ -f /usr/local/bin/brew ] || [ -f /opt/homebrew/bin/brew ]
    then
      echo "[INFO] Installing brew packages list from configsBrewfile..."
      installBrewfile "configsBrewfile"
    fi
  fi
fi
