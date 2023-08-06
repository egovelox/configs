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
require('user.nvim-tree')
require('user.lualine')
require('user.treesitter')
require('user.ufo')
require('user.telescope')
require('user.cmp')
require('user.lsp')
