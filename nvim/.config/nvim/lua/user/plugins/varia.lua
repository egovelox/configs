return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used in lots of plugins
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
  {
    'numToStr/Navigator.nvim',
    keys = {
      { '<C-s>h', '<CMD>NavigatorLeft<CR>' },
      { '<C-s>l', '<CMD>NavigatorRight<CR>' },
      { '<C-s>k', '<CMD>NavigatorUp<CR>' },
      { '<C-s>j', '<CMD>NavigatorDown<CR>' },
      -- { 't', '<C-s>h', '<CMD>NavigatorLeft<CR>' },
      -- { 't', '<C-s>l', '<CMD>NavigatorRight<CR>' },
      -- { 't', '<C-s>k', '<CMD>NavigatorUp<CR>' },
      -- { 't', '<C-s>j', '<CMD>NavigatorDown<CR>' },
    },
    config = function()
        require('Navigator').setup()
    end
  },
  {
    'ilAYAli/scMRU.nvim',
    -- this plugin can really slow down the whole nvim startup
    -- make it lazy !
    lazy = true,
    cmd = "MruRepos",
    keys = {
      {'<Leader>o', ':Mru<CR>'},
      {'<Leader>devi', ':MruRepos<CR>'},
      {'<Leader>mfu', ':Mfu<CR>'},
    },
    dependencies = {
      'kkharji/sqlite.lua',
      "nvim-telescope/telescope.nvim",
    }
  },
  {
    'ziontee113/icon-picker.nvim',
    keys = {
      { "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>" },
      { "<Leader><Leader>y", "<cmd>IconPickerYank<cr>" }, -- Yank the selected icon into register
    },
    config = function()
      require("icon-picker").setup({
        dependencies = true
      })
    end,
  },
}
