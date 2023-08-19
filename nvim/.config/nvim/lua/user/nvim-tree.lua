require("nvim-tree").setup({
-- nvim-tree will open the folder of the file in current buffer
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
  },
  sync_root_with_cwd = false,
  reload_on_bufenter = true,
  renderer = {
    icons = {
      show = {
        folder = false,
        folder_arrow = true
      },
      glyphs = {
        folder = {
          arrow_open = "+",
          arrow_closed = "-"
        }
      }
    }
  },
  view = {
    adaptive_size = false,
  },
  filters = {
    -- show dotfiles
    dotfiles = false,
    -- do not show .git folder
    custom = { '^.git$' }
  }
})
