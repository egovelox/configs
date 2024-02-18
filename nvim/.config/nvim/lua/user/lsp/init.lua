local status_lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig_ok then
  print "Failed to load lspconfig"
  return
end

require "user.lsp.mason"
require "user.lsp.diagnostic"
require "user.lsp.handlers"
require "user.lsp.null-ls"


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, bufopts)
  -- use telescope instead
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- SERVERS

lspconfig['lua_ls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = {'vim', 'lsp_flags'} }
    }
  }
}

lspconfig['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

lspconfig['clangd'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

lspconfig['spectral'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

lspconfig['pyright'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = {"python"},
}

lspconfig['gopls'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }

    }
  }
}

local rt = require("rust-tools")
rt.setup({
  tools = {
    inlay_hints = {
      only_current_line = true,
    },
    hover_actions = {
      auto_focus = true
    }
  },
  server = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<Leader>h', rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<Leader>-', rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    settings = {
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        -- rust-analyzer cannot have diagnostics on edit,
        -- instead it requires that you first save the file.
        -- This feature allows a bunch of diagnostics to work
        diagnostics = {
          enable = true,
          experimental = {
                  enable = true,
          },
        },
      },
    }
  },
})

