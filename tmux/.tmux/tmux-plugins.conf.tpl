########################################
# TPM SETTINGS
########################################
# required: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Once you add a new plugin line, you must do Ctrl-a I to install it.

# List of plugins
#set -g @plugin 'tmux-plugins/tpm'
#set -g @plugin 'tmux-plugins/tmux-open'

set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'samoshkin/tmux-plugin-sysstat'

set -g @sysstat_mem_view_tmpl '#{mem.used} / #{mem.total}'

# remember 
# I modified the below plugin, in fzf-url.sh
# adding
# [ -z "${chosen[0]}" ] && tmux display 'tmux-fzf-url: no URLs chosen' && exit
# before line :
# for item in "${chosen[@]}"; do
# This way, fzf can gracefully exit with escape (no url selected) 
#set -g @plugin 'wfxr/tmux-fzf-url'

# Split status bar
# Ctrl-a S : status bar goes below windows bar
# Ctrl-a H : hide status bar
#set -g @plugin 'charlietag/tmux-split-statusbar'
#set -g @split-statusbar-mode 'on' 
#set -g @split-statusbar-bindkey 'S'
#set -g @split-status-hide-bindkey 'H'
#set -g @plugin 'sainnhe/tmux-fzf'
#set -g @treemux-tree-nvim-init-file '~/.tmux/plugins/treemux/configs/treemux_init.vim'
#set -g @plugin 'kiyoon/treemux'
# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
set-environment -g PATH "/bin:${BREW_PATH}/bin:${BREW_PATH}/sbin:/usr/bin:/usr/local/bin:/usr/sbin"

#run '~/.tmux/plugins/tpm/tpm'

run '${BREW_PATH}/opt/tpm/share/tpm/tpm'