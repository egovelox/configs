return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used in lots of plugins
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy"
  },
  "junegunn/fzf",
  { "junegunn/fzf.vim",
    keys = {
      { '<Leader>l', ':Files<CR>' },
      { '<Leader>;', ':GFiles<CR>' },
      { '<Leader>.', ':Buffers<CR>' },
      { "<Leader>'", ':History:<cr>' },
    },
    init = function()
      vim.g.fzf_preview_window = { 'right:hidden', 'ctrl-/' }
      vim.g.fzf_layout = { tmux = '-p 70% --black' }
    end,
    config = function()
      -- Since fzf is in terminal mode, do not use the standard mapping for Esc
      vim.api.nvim_create_autocmd("FileType", { pattern = "fzf", command = [[tnoremap <Esc> <C-c>]] })
      vim.api.nvim_create_autocmd("BufLeave", { command = [[tnoremap <Esc> <C-\><C-n>]] })
    end,
  }, -- FZF embedded in vim
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    -- a file is loading the plugin, cf ufo.lua
    event = 'VeryLazy',
    init = function()
      -- '1' will show vertical bars on one column. 
      -- If more columns than 1 are needed to display those vertical bars, 
      -- then it will display numbers instead.
      vim.o.foldcolumn = '1'
      -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "lsp", "indent" }
        end
      }
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
    'numToStr/Navigator.nvim',
    keys = {
      { '<C-s>h', '<CMD>NavigatorLeft<CR>' },
      { '<C-s>l', '<CMD>NavigatorRight<CR>' },
      { '<C-s>k', '<CMD>NavigatorUp<CR>' },
      { '<C-s>j', '<CMD>NavigatorDown<CR>' },
      { 't', '<C-s>h', '<CMD>NavigatorLeft<CR>' },
      { 't', '<C-s>l', '<CMD>NavigatorRight<CR>' },
      { 't', '<C-s>k', '<CMD>NavigatorUp<CR>' },
      { 't', '<C-s>j', '<CMD>NavigatorDown<CR>' },
    },
    config = function()
        require('Navigator').setup()
    end
  },
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Leader>-", "<CMD>Oil<CR>" }
    },
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
    },
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
  {
    'rcarriga/nvim-dap-ui',
    -- TODO: add keys found in mappings.lua
    lazy = true,
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require("dapui").setup()
    end
  },
  {
    'mfussenegger/nvim-dap',
    commit = "9adbfdc",
    -- TODO: add keys found in mappings.lua
    lazy = true
  },
  {
    'leoluz/nvim-dap-go',
    lazy = true,
    commit = "a5cc8dc",
    ft = { 'go' },
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function (_,opts)
      require("dap-go").setup(opts)
    end
  },
}
