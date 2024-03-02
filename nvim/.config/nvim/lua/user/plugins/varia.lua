return {
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy"
  },
  {
    'ziontee113/icon-picker.nvim',
    keys = {
      { "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>" },
      { "<Leader><Leader>y", "<cmd>IconPickerYank<cr>" }, -- Yank the selected icon into register
    },
    config = function()
      require("icon-picker").setup({
        dependencies = true
      })
    end,
  },
}
