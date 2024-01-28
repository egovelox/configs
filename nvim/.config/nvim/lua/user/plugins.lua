-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used in lots of plugins
  "junegunn/fzf",
  "junegunn/fzf.vim", -- FZF embedded in vim
  { 'ilAYAli/scMRU.nvim', dependencies = 'kkharji/sqlite.lua' },
  'voldikss/vim-floaterm',
  "machakann/vim-highlightedyank",
  "airblade/vim-rooter",
  -- use 'arkav/lualine-lsp-progress' replaced by fidget
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

  -- Colorschemes
  { "Mofiqul/vscode.nvim", commit = "0597386" }, -- A colorscheme inspired by vscode original dark theme

  -- Layout plugins
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-lualine/lualine.nvim', commit = "2248ef2", dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true } },
  {
    "j-hui/fidget.nvim",
    version = "v1.1.0",
    config = function()
      require("fidget").setup()
    end
  },
  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = '0.1.4',
    dependencies = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build="make"},
        {"nvim-telescope/telescope-live-grep-args.nvim"},
        {'nvim-telescope/telescope-symbols.nvim'},
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
    end
  },

  {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  },
  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  'simrat39/rust-tools.nvim',
  -- used for running rustfmt on save
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  { 'mfussenegger/nvim-jdtls', commit = "66b5ace" },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require("dapui").setup()
    end
  },
  {
    'mfussenegger/nvim-dap',
    commit = "9adbfdc",
  },
  {
    'leoluz/nvim-dap-go',
    commit = "a5cc8dc",
    ft = { 'go' },
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function (_,opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- cmp plugins
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'stevearc/dressing.nvim',

  -- Git
  'rhysd/git-messenger.vim',
  'tveskag/nvim-blame-line',

  {
    'ziontee113/icon-picker.nvim',
    config = function()
      require("icon-picker").setup({
        dependencies = true
      })
    end,
  },
}

require("lazy").setup(plugins, {})

