#! /bin/zsh

echo "Executing install_zsh.sh ..." 

# https://github.com/ohmyzsh/ohmyzsh.git



echo "Cloning zsh git repo in $ZSH and installing"

# Set this variable to indicate the installation path
ZSH="$HOME/.config/zsh/.oh-my-zsh"

# --unattended
# This will have the effect of not trying to change the default shell, and it also won't run zsh when the installation has finished.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || exit 


echo "Installation Succeeded."

# This dir is containing a custom scheme, 
# - is saved in configs
# - is referenced in .zshrc
CUSTOM_THEME_FOLDER="$HOME/configs/zsh/.config/zsh/custom"
 
# Replace the custom folder with 
if ! [ -d $CUSTOM_THEME_FOLDER ]; then 
  echo "Warning : not found directory $CUSTOM_THEME_FOLDER " 
else 

  if ! [ -d $ZSH/custom ]; then 
    echo "Warning : not found directory $ZSH/custom "
  else
    mv $ZSH/custom $ZSH/custom_backup
    cp -r $CUSTOM_THEME_FOLDER $ZSH/custom
  fi

fi


