#####################################################
# BASIC ALIASES
#####################################################
  alias ls='exa -ahl --time-style long-iso --color automatic --no-user'
  alias ll='/bin/ls -alG'
  alias lsr='/bin/ls'
  alias vim='nvim'
  alias fishconf='vim $HOME/.config/fish/config.fish'
  alias dev='cd "$(find $HOME/DEV $HOME/DEV/{fabernovel,exo,deno,rust,golang,C,python,zig,mdn,aws} -maxdepth 1 -type d -print | fzf-tmux -p -- --delimiter / --with-nth -1 --border-label=DEV)" && nvim .'
  alias py="python3"
  alias ed="bass source $HOME/bin/edit_dev_files.sh"


#####################################################
# OTHER CONVENIENT ALIASES
#####################################################
# Challenge ecoCode
  alias ecoc='cd $HOME/DEV/fabernovel/ecoCode'
# SSH
  alias fedor="ssh -i "$HOME/.ssh/fedor" -p8887 cuncdev@192.168.2.203"
  alias fedor_r="ssh -i "$HOME/.ssh/fedor" -p8887 cuncdev@78.194.17.20"
# TMUX
  alias ss='tmux list-windows -a | cut -d" " -f1,2 | while read line; echo $line | sed -e "s/: / /" -e "s/+/ /g" ; end | fzf-tmux -p 30% -- --prompt "switch window: " --no-bold --layout=reverse --height 50% --margin 0% --no-separator --no-info --black --color bg+:black,hl:reverse,hl+:reverse,gutter:black | cut -d " " -f1 | xargs tmux switch -t'
# WEECHAT
  alias hot="weechat-hotlist-rs"
  alias hotclear="weechat-hotlist-rs clear"
  alias hotlist="weechat-hotlist-rs hotlist -f detailed | jq"
# HFACTORY
  alias fbuild='$HOME/bin/trigger_jenkins_build.sh'
  alias fdat='hfactory database connect -i'
  alias flog='hfactory logs preview -m'
# NEWSBOAT
  alias news='newsboat --config-file .config/newsboat/config --url-file $HOME/.newsboat/urls'
# NVIM
 alias devi='nvim +"MruRepos"'
