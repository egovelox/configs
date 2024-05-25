return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff", -- pyton linter
        "mypy", -- python linter and static type checker
        "black", -- python code formatter
        "gopls",
        "delve",
        "goimports-reviser",
        "golines",
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
      	"lua_ls",
      	"ts_ls",
      	"rust_analyzer",
      	"jdtls",
      	"clangd",
        "denols",
        "pyright",
        "zls"
      }
    }
  },
  {
    'simrat39/rust-tools.nvim',
  },
  -- used for running rustfmt on save
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
    commit = "66b5ace"
  },
}
