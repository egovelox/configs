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
