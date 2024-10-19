require 'user.utils.key_mapper'

vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('WA', 'wa', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})

Mapper:nmap('<C-c>', "<Esc>")
Mapper:vmap('<C-c>', "<Esc>")
Mapper:imap('<C-c>', "<Esc>")
Mapper:tmap('<C-c>', "<Esc>")

-- Open the memo_config help
Mapper:nmap('<Leader>mo', ':h memo_config<CR>')

-- disable recording
Mapper:nmap('q', '<nop>')
--No arrow keys --- force yourself to use the home row 😺
Mapper:nmap('<up>', '<nop>')
Mapper:nmap('<down>', '<nop>')
Mapper:imap('<up>', '<nop>')
Mapper:imap('<down>', '<nop>')
Mapper:imap('<left>', '<nop>')
Mapper:imap('<right>', '<nop>')

-- Scroll faster between sentences
Mapper:nmap('<C-j>', ')')
Mapper:nmap('<C-k>', '(')

-- matchup
-- Move from outside inside forward bracket or parenthesis etc
Mapper:nmap('<C-n>', '<plug>(matchup-z%)')
-- same backward ( buggy )
Mapper:nmap('<C-p>', '<plug>(matchup-Z%)')
-- Change all from inside bracket
Mapper:nmap('<C-u>', 'c<plug>(matchup-i%)')

-- Copy current file path into clipboard
Mapper:nmap('<Leader>fp', ':let @+ = expand("%:p")<CR>')

-- Zoom a split
Mapper:nmap("<Leader>zi", ":tabnew %<CR>")
Mapper:nmap("<Leader>zo", ":tabclose<CR>")

-- toggle between buffers
Mapper:nmap('<Leader>0', '<C-^>')

vim.keymap.set('', '<C-h>', '^')
vim.keymap.set('', '<C-l>', '$')
