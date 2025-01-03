if status is-interactive
  set -gx EDITOR "nvim"

#####################################################
# Vim-like keys
  bind \ck history-search-backward
  bind \cj history-search-forward
  for mode in insert default visual
    bind -M $mode \cf forward-char
    bind -M $mode \ck history-search-backward
    bind -M $mode \cj history-search-forward
  end
  set -g fish_key_bindings fish_vi_key_bindings

end
#####################################################
# IMPORT FILES
#####################################################

source $HOME/.config/fish/env.fish
if test -f $HOME/.config/fish/sec_env.fish
    source $HOME/.config/fish/sec_env.fish
end
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/abbr.fish

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US:en"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"

# for python, ruby etc multi-threading on M1
set -xg OBJC_DISABLE_INITIALIZE_FORK_SAFETY "YES"
#####################################################
# JABBA
#####################################################

if test -d $HOME/.jabba
  source $HOME/.jabba/jabba.fish
  if status is-interactive
    jabba use openjdk@1.17.0
  end
end

#####################################################
# FZF
#####################################################

set -gx FZF_DEFAULT_COMMAND fd --type f --hidden --follow --exclude /.git
set -gx FZF_DEFAULT_OPTS -i --cycle --black --ansi --color=fg:246,fg+:150,bg+:black --no-bold --no-hscroll --layout=reverse --bind change:first --height 50% --no-separator --border=bold  --padding 7%

#####################################################
# FNM
#####################################################

set -g -x FNM_DIR $HOME/.fnm
  if status is-interactive
    fnm env --use-on-cd --version-file-strategy recursive | source
  end

#####################################################
# Pyenv
# Requires a build environment to build Python new versions
  # xcode-select --install
  # brew install openssl readline sqlite3 xz zlib tcl-tk
#####################################################

set -g -x PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
  if status is-interactive
    pyenv init - | source
    pyenv shell 3.9.6
  end
#####################################################
# GREETING
#####################################################

set -g -x fish_greeting '🐟'


#####################################################
# PROMPT
####################################################

# for starship
  if status is-interactive
    starship init fish | source
  end


#####################################################
# VARIA
#####################################################

set -xg LESS "-SRXF"
set -xg HOMEBREW_AUTOREMOVE 1

# for deno rusty-v8
# @see https://fresh.egovelox.com/posts/shenanigans/deno-v8
# brew install llvm
# fish_add_path /opt/homebrew/opt/llvm/bin
# fish_add_path "$HOME/DEV/v8/depot_tools"

# for rbenv (MHP iOS build)
# fish_add_path $HOME/.rbenv/bin
# rbenv init - | source

#####################################################
