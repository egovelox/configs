#  sec ex
if [ -f "$HOME/.sec_ex" ]; then
  . $HOME/.sec_ex
else
  echo "Warning : not found $HOME/.sec_ex"
fi

# Enable fzf addons like completion with **
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse'

# set up directory DEV for alias and env
if [ -d "$HOME/Documents/DEV" ] ; then
		export DEV_DIR="$HOME/Documents/DEV"
else	
		export DEV_DIR="$HOME/DEV"
fi

# set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# set up Rust toolchain in $HOME/rust or else in DEV
if [ -d "$HOME/rust" ] ; then
		export RUSTUP_HOME="$HOME/rust/.rustup"
		export CARGO_HOME="$HOME/rust/.cargo"
		. "$HOME/rust/.cargo/env"
else
		export RUSTUP_HOME="$DEV_DIR/rust/.rustup"
		export CARGO_HOME="$DEV_DIR/rust/.cargo"
		. "$DEV_DIR/rust/.cargo/env"
fi

# For brew installed packages
export PATH="/usr/local/sbin:$PATH"

# For brew aws
export PATH="/usr/local/opt/awscli@1/bin:$PATH"

# For lunarvim
export PATH="$PATH:${HOME}/.local/bin"

# NPM Global installed packages
# export PATH="~/.npm-global/bin"

# function to have shell builtin displayed with man
man () {
    case "$(type -t -- "$1")" in
    builtin|keyword)
        help "$1"
        ;;
    *)
        command man "$@"
        ;;
    esac
}

# For java setup
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# For deno setup
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else 
   if [ -f "$HOME/Downloads/PROG/nvim-macos/bin/nvim" ]; then
      export EDITOR="$HOME/Downloads/PROG/nvim-macos/bin/nvim"
   else 
     echo "Warning : not found PROG/nvim-macos"
     export EDITOR='vim'
   fi
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
 


#fzf_history(){
#    iconv -f ISO-8859-1 $HOME/.zsh_history | cut -d ';' -f2 | fzf
#}
#zle -N fzf_history
#bindkey '^R' fzf_history

# ZSH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
#
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
# source file: ~/.oh_my_zsh/custom/themes/agnoster_custom.zsh-theme
ZSH_THEME="agnoster_custom"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM="$HOME/.config/zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to parent/current dir
  p=$(echo "${PWD/#$HOME/~}" | rev | cut -d "/" -f1 -f2 | rev)
  echo -ne "\e]1;$p\a"
}

##################### ALIASES ####################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias ls="ls -alG"
alias cls="clear"
alias -s txt=nvim
alias vim="$EDITOR"
alias dev="$DEV_DIR"
alias zshconf="vim $HOME/.zshrc"

# useful to have brew less version (for lesskey)
# notably for hfactory database connect (mycli behind)
alias less="/usr/local/bin/less"
export LESS="-SRXF"
#export LESS="-SRX"

#alias conndb="${HOME}/bin/hdb-connect/hdb-connect.sh"
#alias hlogs="${HOME}/bin/hlogs-cli/hlogs-cli.sh"
#conndb="${HOME}/bin/hdb-connect/hdb-connect.sh"
#connkib='export HF_COLUMNS=178 && node ${HOME}/DEV/fabernovel/hfactory-cli/dist/index.js logs preview -m'


# hfactory (CLI) aliases

let "FACTO_COMMAND_COUNT = $(hfactory --help | grep '  ' | wc -l) - 1"
FACTO_COMMAND_LIST="$(hfactory --help | grep '  ' | tail -n $FACTO_COMMAND_COUNT | grep -v 'help')"

alias fhelp="echo "\"$FACTO_COMMAND_LIST\"" | fzf | xargs hfactory help"
alias flog="export HF_COLUMNS=$COLUMNS && hfactory logs preview -m"
alias fdat="hfactory database connect -i" 

