local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')


local opts = {
  sources = {
    -- for go
    null_ls.builtins.formatting.gofmt,
    -- ensure_installed in Mason :
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines.with({
      extra_args = {"-m", "80"}
    }),
    -- for python
    -- ensure_installed in Mason :
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
  },
  on_attach = function(_, bufnr)
    if true then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
}

null_ls.setup(opts)
