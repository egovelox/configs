########################################
# TPM SETTINGS
########################################
# required if you do not use tpm from brew : 
# First git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Uncomment these lines :
# set -g @plugin 'tmux-plugins/tpm'
# set -g @plugin 'tmux-plugins/tmux-open'
# Once you add a new plugin line, you must do Ctrl-a I to install it.

# List of plugins

set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'samoshkin/tmux-plugin-sysstat'

# https://github.com/fcsonline/tmux-thumbs
# needs to install first, then compile rust executable with: cargo build --release
set -g @plugin 'fcsonline/tmux-thumbs'
run-shell ~/.tmux/plugins/tmux-thumbs/tmux-thumbs.tmux
set -g @thumbs-command 'echo -n {} | pbcopy'
set -g @thumbs-upcase-command 'echo -n {} | pbcopy'
set -g @thumbs-contrast 1

set -g @sysstat_mem_view_tmpl '#{mem.used} / #{mem.total}'



########################################
# TPM BOOTSTRAP
########################################
set-environment -g PATH "/bin:${BREW_PATH}/bin:${BREW_PATH}/sbin:/usr/bin:/usr/local/bin:/usr/sbin"

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '${BREW_PATH}/opt/tpm/share/tpm/tpm'
