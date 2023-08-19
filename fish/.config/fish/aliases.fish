#####################################################
# FISH ALIASES
#####################################################
  alias ls='exa -ahl --time-style long-iso --color automatic --no-user'
  alias ll='/bin/ls -alG'
  alias lsr='/bin/ls'

  #alias vim='$HOME/Downloads/PROG/nvim-macos/bin/nvim'
  alias vim='nvim'

  alias fishconf='vim $HOME/.config/fish/config.fish'

  alias dev='cd $HOME/DEV'
  alias devi='nvim +"MruRepos"'
  alias devi2='set API_DIR $HOME/DEV/$(/bin/ls $HOME/DEV | fzf-tmux -p 30% -- --prompt "Open project: " --no-bold --layout=reverse --height 50% --margin 0% --no-separator --no-info --black --color bg+:black,hl:reverse,hl+:reverse,gutter:black) && cd $API_DIR && vim $API_DIR'

  alias news='newsboat --config-file .config/newsboat/config --url-file $HOME/.newsboat/urls'

  alias fbuild='$HOME/bin/trigger_jenkins_build.sh'
  alias fdat='hfactory database connect -i'
  alias flog='hfactory logs preview -m'

  alias whr="weechat-hotlist-rs"
  alias sl="weechat-hotlist-rs hotlist | jq '{threads:.priority_1, private:.priority_2, public:.priority_3}'"
  alias sld="weechat-hotlist-rs hotlist -f detailed | jq "

  alias ss='tmux list-windows -a | cut -d" " -f1,2 | while read line; echo $line | sed -e "s/: / /" -e "s/+/ /g" ; end | fzf-tmux -p 30% -- --prompt "switch window: " --no-bold --layout=reverse --height 50% --margin 0% --no-separator --no-info --black --color bg+:black,hl:reverse,hl+:reverse,gutter:black | cut -d " " -f1 | xargs tmux switch -t'
  
  alias fabs='$HOME/DEV/mdn/ftabswitch/app/switch_tab.sh'
  alias fabc='$HOME/DEV/mdn/ftabswitch/app/close_tabs.sh'

  alias tsm="transmission-remote"
  alias tsmd="transmission-daemon"

  # need the running firefox extension, code in DEV/mdn/ftabswitch
  alias importbkms="$HOME/.config/bkms/bin/insert_latest.sh"
  alias syncbkms="$HOME/bin/sync_bkms.sh" 

  alias fedor="ssh -i "$HOME/.ssh/fedor" -p8887 cuncdev@192.168.2.203"
  alias fedor_r="ssh -i "$HOME/.ssh/fedor" -p8887 cuncdev@78.194.17.20"

  alias run="$HOME/DEV/poc_product_search/poc_es_flow/run"
