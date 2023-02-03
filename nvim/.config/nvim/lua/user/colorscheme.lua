local colorscheme = "vscode"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local c = require('vscode.colors').get_colors()

local lightBlue = '#5c8296'

require('vscode').setup({
  disable_nvimtree_bg = true,
  color_overrides = {
    vscBack = '#1d1f21',
    -- dim default lightBlue #9CDCFE
    vscLightBlue = lightBlue,
    -- dim default lightGreen #B5CEA8
    vscBlueGreen = '#6f8f88',
  },
  group_overrides = {
    NvimTreeNormal = { fg= lightBlue, bg = 'NONE' },
    NvimTreeFolderName = { fg=c.vscGray, bg = 'NONE' },
    NvimTreeOpenedFolderName = { fg=c.vscViolet, bg = 'NONE' },
    NvimTreeEmptyFolderName = { fg = c.vscFront, bg = 'NONE' }
  }
})

vim.api.nvim_set_hl(0, 'Pmenu', { bg='#1d1f21' })
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg=c.vscGray })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg=c.vscGray })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg=c.vscGray })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg=c.vscGray })

