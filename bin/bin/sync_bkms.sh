#!/usr/bin/env bash

BKMS_DIR="$HOME/bkms"

if ! [ -d  $BKMS_DIR ]; then
  echo "Warning: $BKMS_DIR folder was not found."
  echo "Create $BKMS_DIR directory and clone inside https://github.com/egovelox/bkms.git"
  echo "Then stow !"
fi

cd $BKMS_DIR
git pull --rebase || exit 1


