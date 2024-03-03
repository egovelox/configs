return {
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    commit = "0597386",
    config = function()
      local vs = require('vscode')
      local c = require('vscode.colors').get_colors()
      local lightBlue = '#5c8296'
      vs.setup({
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
      vs.load()

    end
  }, -- A colorscheme inspired by vscode original dark theme
  {
    "sunjon/shade.nvim",
    event = "VeryLazy",
    opts = {
      overlay_opacity = 65,
      opacity_step = 10,
      keys = {
        brightness_up    = '<C-Up>',
        brightness_down  = '<C-Down>',
        toggle           = '<Leader>s',
      }
    },
  },
  {
    "machakann/vim-highlightedyank",
    init = function()
      vim.g.highlightedyank_highlight_in_visual = 0
    end,
  },
}
