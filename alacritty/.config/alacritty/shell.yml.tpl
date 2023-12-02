# set up alacritty shell
shell:
  program: ${BREW_PATH}/bin/fish
  args: 
    - -l
    - -c
    - "${BREW_PATH}/bin/tmux attach || ${BREW_PATH}/bin/tmux"
