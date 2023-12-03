if [ -d /home/homebrew/.homebrew ]
then
  if [ -f $HOME/.local/share/fonts/FiraMonoNerdFont-Regular.otf ] 
  then
    wget -P $HOME/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip
    if [ ! -d $HOME/.local/share/fonts ]
    then
      mkdir -p $HOME/.local/share/fonts
    fi
    unzip $HOME/Downloads/FiraMono.zip -d $HOME/local/share/fonts/
    fc-cache $HOME/local/share/fonts
  else
    echo "[OK] FiraMono Nerd Font seems to be installed"
  fi
fi
