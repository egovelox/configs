-- Preliminary note: 
-- With external Karabiner-elements, the Esc key is mapped to Caps-lock

-- TODO : move in utils
-- Helpers
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

--No arrow keys --- force yourself to use the home row
nmap('<up>', '<nop>')
nmap('<down>', '<nop>')
imap('<up>', '<nop>')
imap('<down>', '<nop>')
imap('<left>', '<nop>')
imap('<right>', '<nop>')

-- Scroll faster between paragraphs
nmap('J', '}')
nmap('K', '{')

-- Search word under cursor
nmap('<Leader>n', '*')

-- Copy current file path into clipboard
nmap('<Leader>fp', ':let @+ = expand("%:p")<CR>')

-- Left and right can switch buffers
nmap('<left>', ':bp<CR>')
nmap('<right>', ':bn<CR>')


-- mappings for nvim-tree
nmap("<Leader><BS>", ':NvimTreeToggle<CR>')


-- Switch split (or create) with C-h,j,k,l
nmap("<C-h>", "<Plug>WinMoveLeft")
nmap("<C-j>", "<Plug>WinMoveDown")
nmap("<C-k>", "<Plug>WinMoveUp")
nmap("<C-l>", "<Plug>WinMoveRight")


-- Zoom a split
nmap("<Leader>zi", ":tabnew %<CR>")
nmap("<Leader>zo", ":tabclose<CR>")

-- Start or end of line
nmap('L', '$')
vmap('L', '$')
nmap('H', '^')
vmap('H', '^')


-- mapping to enter vim-floaterm
nmap('<Leader>=', ":FloatermToggle<CR>")
-- same mapping to exit vim-floatterm
vim.cmd[[ tnoremap <silent> <Leader>=   <C-\><C-n>:FloatermToggle<CR> ]]


-- mappings for Telescope
-- see other mappings in init.lua
nmap('<Leader>o', ':Telescope oldfiles hidden=true<CR>')
nmap('<Leader>i', ':Telescope live_grep hidden=true<CR>')
nmap('<leader>j',':Telescope jumplist<cr>')

nmap('<leader>gd',':Telescope lsp_definitions<cr>')
nmap('<leader>gr',':Telescope lsp_references<cr>')

-- Since fzf is in terminal mode, do not use the standard mapping for Esc
vim.api.nvim_create_autocmd("FileType", { pattern = "fzf", command = [[tnoremap <Esc> <C-c>]] })
vim.api.nvim_create_autocmd("BufLeave", { command = [[tnoremap <Esc> <C-\><C-n>]] })
-- mappings for triggering FZF vim plugin
-- think l as list
-- and  . .
--       .
--
-- List files
nmap('<Leader>l', ':Files<CR>')
-- List files with .gitignore
nmap('<Leader>;', ':GFiles<CR>')
-- List Buffers
nmap('<Leader>.', ':Buffers<CR>')


-- Display nvim commands history with fzf
nmap("<Leader>'", ':History:<cr>')


-- <leader><leader> toggles between buffers
nmap('<leader><leader>', '<C-^>')



-- TODO : use another way 
-- Ctrl+h to stop searching
-- vmap('<C-h>', ':nohlsearch<cr>')
--nmap('<C-h>', ':nohlsearch<cr>')



-- In visual-mode, paste to the clipboard with <C-C>
-- vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })
-- this was commented due to another choice : set clipboard=unnamedplus (simple y will yank to clipboard)
-- see https://stackoverflow.com/questions/4608161/copying-text-outside-of-vim-with-set-mouse-a-enabled/4608206#4608206
