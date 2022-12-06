vim.opt.number = true
vim.opt.cursorline = true
vim.o.numberwidth = 3

-- No not remap default <Leader>
--vim.g.mapleader = " "

vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.softtabstop = -1

vim.o.splitbelow = true
vim.o.splitright = true
vim.cmd [[set mouse=a]]

-- Paste a normal yank into the clipboard
vim.cmd [[set clipboard=unnamedplus]]

-- Light purple indicating the active buffer
-- https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
vim.cmd [[hi StatusLine guibg=#5f5f87]]
vim.o.termguicolors = true
