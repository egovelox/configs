return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        completion = {
              autocomplete = false,
              completeopt = 'menu,menuone,noinsert'
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        }, {
          { name = 'buffer' },
        })
      })
      -- Enable completing paths in :
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        })
      })
    end
  },
  {
    "airblade/vim-rooter",
    init = function()
      vim.g.rooter_patterns = { '.git' }
    end,
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
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        ensure_installed = { "vim", "typescript", "javascript", "toml", "rust", "tsx", "java", "toml", "fish", "json", "yaml", "sql", "lua" },
        highlight = {
          enable = true,
          disable = {"vim"},
          additional_vim_regex_highlighting = false,
          module_path = "nvim-treesitter.highlight"
        },
        indent = { enable = true, disable = {} },
      })
    end
  },
}
