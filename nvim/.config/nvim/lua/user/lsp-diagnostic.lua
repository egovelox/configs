-- DiagnosticSignXXXX is the sign (an icon) that nvim prints on Diagnostic
local fn = vim.fn
fn.sign_define("DiagnosticSignError", { text = "💥", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "🤨", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "🌤️", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "🐠", texthl = "DiagnosticSignHint" })

vim.diagnostic.config {
  underline = false,
  float = { border = "rounded" },
  update_in_insert = true,
  signs = true,
}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

