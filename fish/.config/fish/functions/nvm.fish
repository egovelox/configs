# We should set NVM_DIR before to ~/.nvm
# cf ../config.fish

function _brew_nvm_exists
  set -gx NVM_BREW_PATH (brew --prefix nvm)
  
  if ! test -d $NVM_BREW_PATH
    echo 'Warn: nvm is not installed. You should install nvm with brew'
    exit 1
  end

  bass source $NVM_BREW_PATH/nvm.sh
end

function nvm
  _brew_nvm_exists

  bass source $NVM_BREW_PATH/nvm.sh --no-use ';' nvm $argv
  
end


