-- From nvim-tree docs :
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('user.settings')
require('user.mappings')

require('user.plugins')
require('user.colorscheme')
require('user.highlighted-yank')
require('user.git-messenger')
require('user.icon-picker')
require('user.neotree')
require('user.lualine')
require('user.treesitter')
require('user.ufo')
require('user.telescope')
require('user.cmp')
require('user.lsp')

--vim.cmd("syntax enable")
--vim.cmd("filetype plugin indent on")
-- vim.g.rustfmt_autosave = 1

-- https://github.com/neovim/neovim/issues/21771
vim.api.nvim_create_autocmd('DirChanged', {
  group = vim.api.nvim_create_augroup('setDir', { clear = true }),
  pattern = { '*' },
  command = [[call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd))]],
})

vim.api.nvim_create_autocmd('VimLeave', {
  group = vim.api.nvim_create_augroup('setDirEnd', { clear = true }),
  pattern = { '*' },
  command = [[call chansend(v:stderr, printf("\033]7;\033\\"))]],
})

