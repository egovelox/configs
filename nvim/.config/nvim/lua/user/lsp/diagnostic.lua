local signs = {
  Error = "💥 ",
  Warn = "🐠 ",
  Hint = "🐠 ",
  Info = "🐠 ",
}
-- DiagnosticSignXXXX is the sign (an icon) that nvim prints on Diagnostic
local fn = vim.fn
fn.sign_define("DiagnosticSignError", { text = "💥", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "🐠", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "🌤️", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "🐠", texthl = "DiagnosticSignHint" })

local function best_diagnostic(diagnostics)
  if vim.tbl_isempty(diagnostics) then
    return
  end

  local best = nil
  local line_diagnostics = {}
  local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1

  for k, v in pairs(diagnostics) do
    if v.lnum == line_nr then
      line_diagnostics[k] = v
    end
  end

  for _, diagnostic in ipairs(line_diagnostics) do
    if best == nil then
      best = diagnostic
    elseif diagnostic.severity < best.severity then
      best = diagnostic
    end
  end

  return best
end


local virt_handler = vim.diagnostic.handlers.virtual_text
local ns = vim.api.nvim_create_namespace "current_line_virt"
local severity = vim.diagnostic.severity
local virt_options = {
  prefix = "",
  format = function(diagnostic)
    local message = vim.split(diagnostic.message, "\n")[1]

    if diagnostic.severity == severity.ERROR then
      return signs.Error .. message
    elseif diagnostic.severity == severity.INFO then
      return signs.Info .. message
    elseif diagnostic.severity == severity.WARN then
      return signs.Warn .. message
    elseif diagnostic.severity == severity.HINT then
      return signs.Hint .. message
    else
      return message
    end
  end,
}

vim.diagnostic.handlers.current_line_virt = {
  show = function(_, bufnr, diagnostics, _)
    local diagnostic = best_diagnostic(diagnostics)
    if not diagnostic then
      return
    end

    local filtered_diagnostics = { diagnostic }

    pcall(
      virt_handler.show,
      ns,
      bufnr,
      filtered_diagnostics,
      { virtual_text = virt_options }
    )
  end,
  hide = function(_, bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    virt_handler.hide(ns, bufnr)
  end,
}

vim.diagnostic.config {
  virtual_text = false,
  underline = false,
  float = { source = 'always', border = "rounded" },
  severity_sort = true,
  current_line_virt = true,
  update_in_insert = true,
  signs = true,
}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)


