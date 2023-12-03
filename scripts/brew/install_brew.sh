#! /bin/bash

# On MacOS
if [ -f /usr/local/bin/brew ] || [ -f /opt/homebrew/bin/brew ] || [ -f /home/linuxbrew/.linuxbrew/bin/brew ]
then
  echo "[OK] Already existing brew"
else
  echo "[INFO] Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
