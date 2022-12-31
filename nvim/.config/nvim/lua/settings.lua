
-- first enable nvim global status bar
vim.opt.laststatus = 3
vim.g.mapleader = " "
vim.opt.number = true

vim.opt.cursorline = true
vim.o.numberwidth = 4

-- remove ~ at the end of all buffers
-- (especially nvim-tree)
vim.wo.fillchars = 'eob: '

vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.softtabstop = -1

vim.o.splitbelow = true
vim.o.splitright = true
vim.cmd [[set mouse=a]]

-- so nice: paste a normal yank into the clipboard
vim.cmd [[set clipboard=unnamedplus]]

-- Light purple indicating the active buffer
-- Inactive because of lualine
-- https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
-- vim.cmd [[hi StatusLine guibg=#5f5f87]]

vim.o.termguicolors = true


vim.o.foldcolumn = '3' -- '1' will show bars (thanks to ufo plugin)
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
