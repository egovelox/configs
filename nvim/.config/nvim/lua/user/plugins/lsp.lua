return {
  {
    "j-hui/fidget.nvim",
    version = "v1.1.0",
    config = function()
      require("fidget").setup()
    end
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
      	"tsserver",
      	"rust_analyzer",
      	"jdtls",
      	"clangd",
        "pyright",
      }
    }
  },
  "neovim/nvim-lspconfig",
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
