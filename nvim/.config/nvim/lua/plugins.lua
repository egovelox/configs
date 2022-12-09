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
  use "Mofiqul/vscode.nvim" -- A colorscheme inspired by vscode original dark theme
  use "junegunn/fzf"
  use "junegunn/fzf.vim" -- FZF embedded in vim
  use "kassio/neoterm"
  use "machakann/vim-highlightedyank"
  use "airblade/vim-rooter"
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- Have a light configureable bottom bar
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.0',
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







  -- Automatically setup your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
