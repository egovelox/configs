local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    path_display = { "smart" },
    dynamic_preview_title = true,
    winblend = 4,
    layout_strategy = 'horizontal',
    layout_config = { 
      width = 0.7,
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    mappings = {

        i = {
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
            ["<Esc>"] = actions.close,
        },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    }
  },
}

-- load telescope-fzf-native extension, always after setup function,
-- to optimize perf
require("telescope").load_extension("fzf")




