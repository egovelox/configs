-- Preliminary note: 
-- With external Karabiner-elements, the Esc key is mapped to Caps-lock
-- Without Karabiner, the standard Ctrl-c is preferred over Esc (and Ctrl is remapped to Caps-lock via OS)

-- Helpers
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

nmap('<C-c>', "<Esc>")
vmap('<C-c>', "<Esc>")
imap('<C-c>', "<Esc>")
tmap('<C-c>', "<Esc>")

-- Open the memo_config help
nmap('<Leader>mo', ':h memo_config<CR>')

--No arrow keys --- force yourself to use the home row
nmap('<up>', '<nop>')
nmap('<down>', '<nop>')
imap('<up>', '<nop>')
imap('<down>', '<nop>')
imap('<left>', '<nop>')
imap('<right>', '<nop>')

-- Old schemas
-- Switch split (or create) with C-h,j,k,l
--nmap("<left>", "<Plug>WinMoveLeft")
--nmap("<down>", "<Plug>WinMoveDown")
--nmap("<up>", "<Plug>WinMoveUp")
--nmap("<right>", "<Plug>WinMoveRight")
-- Same but without Karabiner
--nmap("<C-h>", "<Plug>WinMoveLeft")
--nmap("<C-j>", "<Plug>WinMoveDown")
--nmap("<C-k>", "<Plug>WinMoveUp")
--nmap("<C-l>", "<Plug>WinMoveRight")

-- Scroll faster between paragraphs
nmap('<C-j>', '}')
nmap('<C-k>', '{')

-- Change pane (with Navigator plugin, compatible with tmux panes)
nmap('<C-s>h', '<CMD>NavigatorLeft<CR>')
nmap('<C-s>l', '<CMD>NavigatorRight<CR>')
nmap('<C-s>k', '<CMD>NavigatorUp<CR>')
nmap('<C-s>j', '<CMD>NavigatorDown<CR>')
tmap('<C-s>h', '<CMD>NavigatorLeft<CR>')
tmap('<C-s>l', '<CMD>NavigatorRight<CR>')
tmap('<C-s>k', '<CMD>NavigatorUp<CR>')
tmap('<C-s>j', '<CMD>NavigatorDown<CR>')

-- Search word under cursor
nmap('<Leader>n', '*')

-- Copy current file path into clipboard
nmap('<Leader>fp', ':let @+ = expand("%:p")<CR>')


-- mappings for nvim-tree
nmap("<Leader><BS>", ':NvimTreeToggle<CR>')


-- Zoom a split
nmap("<Leader>zi", ":tabnew %<CR>")
nmap("<Leader>zo", ":tabclose<CR>")

-- Start or end of line
nmap('L', '$')
vmap('L', '$')
nmap('H', '^')
vmap('H', '^')

-- mapping for nvim-blame-line
nmap('<Leader>gb', ":ToggleBlameLine<CR>")

-- mapping to enter vim-floaterm
nmap('<Leader>=', ":FloatermToggle<CR>")
-- same mapping to exit vim-floatterm
vim.cmd[[ tnoremap <silent> <Leader>=   <C-\><C-n>:FloatermToggle<CR> ]]


-- mappings for Telescope
-- see other mappings in init.lua
-- nmap('<Leader>o', ':Telescope oldfiles hidden=true<CR>')
nmap('<Leader>o', ':Mru<CR>')
nmap('<Leader>devi', ':MruRepos<CR>')
nmap('<Leader>mfu', ':Mfu<CR>')

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

-- In visual-mode, paste to the clipboard with <C-C>
-- vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })
-- this was commented due to another choice : set clipboard=unnamedplus (simple y will yank to clipboard)
-- see https://stackoverflow.com/questions/4608161/copying-text-outside-of-vim-with-set-mouse-a-enabled/4608206#4608206
