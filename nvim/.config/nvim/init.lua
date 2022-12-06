--[[
 START FILE
]]

require('plugins')
require('colorscheme')
require('settings')
require('mappings')

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  reload_on_bufenter = true,
  view = {
    adaptive_size = true
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$' }
  }
})
