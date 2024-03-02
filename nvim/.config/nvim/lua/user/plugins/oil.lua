return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Leader>-", "<CMD>Oil<CR>" }
    },
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
    },
  },
}
