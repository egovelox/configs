require 'user.utils.key_mapper'

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

-- Scroll faster between paragraphs
Mapper:nmap('<C-j>', '}')
Mapper:nmap('<C-k>', '{')

-- Copy current file path into clipboard
Mapper:nmap('<Leader>fp', ':let @+ = expand("%:p")<CR>')

-- Zoom a split
Mapper:nmap("<Leader>zi", ":tabnew %<CR>")
Mapper:nmap("<Leader>zo", ":tabclose<CR>")

-- toggle between buffers
Mapper:nmap('<Leader>0', '<C-^>')
