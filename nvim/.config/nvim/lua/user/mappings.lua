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

--No arrow keys --- force yourself to use the home row 😺
nmap('<up>', '<nop>')
nmap('<down>', '<nop>')
imap('<up>', '<nop>')
imap('<down>', '<nop>')
imap('<left>', '<nop>')
imap('<right>', '<nop>')

-- Scroll faster between paragraphs
nmap('<C-j>', '}')
nmap('<C-k>', '{')

-- Search word under cursor
nmap('<Leader>n', '*')

-- Copy current file path into clipboard
nmap('<Leader>fp', ':let @+ = expand("%:p")<CR>')

-- Zoom a split
nmap("<Leader>zi", ":tabnew %<CR>")
nmap("<Leader>zo", ":tabclose<CR>")

-- Start or end of line
nmap('L', '$')
vmap('L', '$')
nmap('H', '^')
vmap('H', '^')

-- toggle between buffers
nmap('<Leader>0', '<C-^>')

-- dap keybindings
-- TODO LAZY: have these mappings inside the plugins.lua
--nmap('<Leader>db', ':DapToggleBreakpoint<CR>')
--nmap('<Leader>dui', ':lua require("dapui").toggle()<CR>')
--[[
vim.keymap.set('n', '<Leader>dus', function()
   local widgets = require('dap.ui.widgets')
   local my_sidebar = widgets.sidebar(widgets.frames)
   my_sidebar.open()
 end
)
vim.keymap.set('n', '<Leader>dgt', function()
   require('dap-go').debug_test()
 end
)
vim.keymap.set('n', '<Leader>dgl', function()
   require('dap-go').debug_last()
 end
)
--]]
