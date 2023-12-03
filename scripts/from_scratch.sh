#! /bin/bash

if [ ! -d $HOME/DEV ]
then
  echo "[INFO] Creating directory $HOME/DEV"
  mkdir $HOME/DEV
else
  echo "[OK] already existing directory $HOME/DEV"
fi

# installing brew and brew packages

if [ ! -d $HOME/configs/scripts/brew ]
then
  echo "[INFO] Missing $HOME/configs/scripts/brew directory"
  echo "[FATAL] cannot install brew"
else
  $HOME/configs/scripts/brew/install_brew.sh
  $HOME/configs/scripts/brew/install_brew_packages.sh
  $HOME/configs/scripts/brew/adapt_brew_path.sh
  $HOME/configs/scripts/linux/post_brew_install.sh
fi
