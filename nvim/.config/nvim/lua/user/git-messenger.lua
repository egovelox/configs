--[[----------------------------------------
GIT-MESSENGER

<leader>gm
q to quit
o/O to scroll commits
d/D to show current diff/whole diff

https://github.com/rhysd/git-messenger.vim
--]]----------------------------------------
vim.cmd [[let g:git_messenger_floating_win_opts = { 'border': 'single' }]]
vim.g.git_messenger_always_into_popup = true

-- color blue for added lines
vim.cmd [[hi diffAdded term=None guifg=#88b8f6 ctermfg=111]]
-- color red for removed lines
vim.cmd [[hi diffRemoved term=None guifg=#a63d62 ctermbg=111]]

