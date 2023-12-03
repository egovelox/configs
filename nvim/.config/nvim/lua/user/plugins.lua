local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads nvim whenever you save the plugins.lua file
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself (update etc)
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
  use "junegunn/fzf"
  use "junegunn/fzf.vim" -- FZF embedded in vim
  use "kkharji/sqlite.lua"
  use { 'ilAYAli/scMRU.nvim', commit = "fa09ac4", requires = 'kkharji/sqlite.lua' }
  use 'voldikss/vim-floaterm'
  use "machakann/vim-highlightedyank"
  use "airblade/vim-rooter"
  use 'arkav/lualine-lsp-progress'
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Colorschemes
  use {"Mofiqul/vscode.nvim", commit = "0597386"} -- A colorscheme inspired by vscode original dark theme

  -- Layout plugins
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", 
    tag = '0.1.4',
    requires = {                                               
        {'nvim-lua/popup.nvim'},                                 
        {'nvim-lua/plenary.nvim'},                               
        {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
        {"nvim-telescope/telescope-live-grep-args.nvim"},
        {'nvim-telescope/telescope-symbols.nvim'},               
    },    
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
    end
  }

  use {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  }
  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use 'simrat39/rust-tools.nvim'
  -- used for running rustfmt on save
  use { 
    'rust-lang/rust.vim',
    ft = { 'rust' },
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  }
  use 'mfussenegger/nvim-jdtls'
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- cmp plugins
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'stevearc/dressing.nvim'

  -- Git
  use 'rhysd/git-messenger.vim'
  use 'tveskag/nvim-blame-line'

  use({
    'ziontee113/icon-picker.nvim',
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end,
  })




  -- Automatically setup your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
