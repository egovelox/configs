local status_lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig_ok then
  print "Failed to load lspconfig"
  return
end

require "user.lsp.diagnostic"
require "user.lsp.handlers"
require "user.lsp.null-ls"

local function current_line_diagnostics()
  local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
  local opts = { ["lnum"] = line_nr }

  return vim.diagnostic.get(0, opts)
end

local function addDiagnosticPerLine(bufnr)
  vim.api.nvim_create_augroup("lsp_diagnostic_current_line", {
    clear = true,
  })
  vim.api.nvim_clear_autocmds {
    buffer = bufnr,
    group = "lsp_diagnostic_current_line",
  }
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = "lsp_diagnostic_current_line",
    buffer = bufnr,
    callback = function()
      vim.diagnostic.handlers.current_line_virt.show(
        nil,
        0,
        current_line_diagnostics(),
        nil
      )
    end,
  })

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = "lsp_diagnostic_current_line",
    buffer = bufnr,
    callback = function()
      vim.diagnostic.handlers.current_line_virt.hide(nil, nil)
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return
  end
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
  addDiagnosticPerLine(bufnr)
end

local on_attach_deno_and_ts = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return
  end
  -- https://dev.to/_hariti/solve-nvim-lsp-denols-vs-tsserver-clash-ofd
  local active_clients = vim.lsp.get_active_clients()
  if client.name == 'denols' then
    for _, client_ in pairs(active_clients) do
      -- stop tsserver if denols is already active
      if client_.name == 'ts_ls' then
        client_.stop()
      end
    end
  elseif client.name == 'ts_ls' then
    for _, client_ in pairs(active_clients) do
      -- prevent tsserver from starting if denols is already active
      if client_.name == 'denols' then
        client.stop()
      end
    end
  end
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

  addDiagnosticPerLine(bufnr)
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

lspconfig['denols'].setup{
  single_file_support = false,
  on_attach = on_attach_deno_and_ts,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  flags = lsp_flags,
  capabilities = capabilities,
  init_options = {
--[[
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
        },
      },
    },
--]]
  },
}

lspconfig['ts_ls'].setup{
  -- single_file_support = false,
  --root_dir = lspconfig.util.root_pattern("tsconfig.json", "tsconfig.base.json"),
  flags = lsp_flags,
  capabilities = capabilities,
  on_attach = on_attach_deno_and_ts,
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

lspconfig['zls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = {"zls"},
  root_dir = lspconfig.util.root_pattern("build.zig", "build.zig.zon", ".git"),
  filetype = {"zig"},
  settings = {
    zls = {
    }
  }
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
      addDiagnosticPerLine(bufnr)
    end,
    settings = {
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        --[[ enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
        --]]
        -- rust-analyzer cannot have diagnostics on edit,
        -- instead it requires that you first save the file.
        -- This feature allows a bunch of diagnostics to work
        diagnostics = {
          enable = true,
          experimental = {
            enable = false,
          },
        },
      },
    }
  },
})

