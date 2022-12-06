-- Note: With external Karabiner-elements, the Esc key is mapped to Caps-lock

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
 
vim.api.nvim_create_autocmd("BufEnter", { command = "if &buftype == 'terminal' | :startinsert | endif" }) 

-- mappings for nvim-tree
nmap('<Leader>]', ':NvimTreeFindFile<CR>')

-- mappings for triggering FZF vim plugin
nmap('<C-p>', ':Files<CR>')
nmap('<C-g>', ':GFiles<CR>')
nmap('<C-o>', ':Buffers<CR>')

-- mappings for neoterm
nmap('<Leader>t', ':Ttoggle<CR><Esc>')
nmap('<Leader>tg', ':Tclear | T git stt<CR><Esc>')

-- mappings for navigating between normal and terminal splits
-- In vim the command <C-\><C-N> can be used to go to Normal mode from any other mode.
nmap('<Leader>i', [[<C-\><C-n><C-w>h]], { noremap = true }) 
nmap('<Leader>o', [[<C-\><C-n><C-w>j]], { noremap = true }) 
nmap('<Leader>p', [[<C-\><C-n><C-w>k]], { noremap = true }) 
nmap('<Leader>[', [[<C-\><C-n><C-w>l]], { noremap = true }) 

tmap('<Esc>', [[<C-\><C-n>]], { noremap = true }) 
tmap('<Leader>i', [[<C-\><C-n><C-w>h]], { noremap = true }) 
tmap('<Leader>o', [[<C-\><C-n><C-w>j]], { noremap = true }) 
tmap('<Leader>p', [[<C-\><C-n><C-w>k]], { noremap = true }) 
tmap('<Leader>[', [[<C-\><C-n><C-w>l]], { noremap = true }) 

-- to be moved elsewhere
vim.g.neoterm_size = tostring(0.3 * vim.o.columns)
vim.g.neoterm_fixedsize = 1
vim.g.neoterm_default_mod = 'botright vertical'
vim.g.neoterm_autoscroll = 1
-- Enter terminals with insert mode
-- not really needed. Moreover, see g.neoterm_autoinsert = 1

-- Since fzf is in terminal mode, do not use the standard mapping for Esc
vim.api.nvim_create_autocmd("FileType", { pattern = "fzf", command = [[tnoremap <Esc> <C-c>]] })
vim.api.nvim_create_autocmd("BufLeave", { command = [[tnoremap <Esc> <C-\><C-n>]] })

-- In visual-mode, paste to the clipboard with <C-C>
-- vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })
-- this was commented due to another choice : set clipboard=unnamedplus (simple y will yank to clipboard)
-- see https://stackoverflow.com/questions/4608161/copying-text-outside-of-vim-with-set-mouse-a-enabled/4608206#4608206
