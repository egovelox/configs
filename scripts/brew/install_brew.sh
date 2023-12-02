#! /bin/bash

if test ! $(which brew)
then
  echo "[INFO] Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "[OK] Already existing $(which brew)"
fi
