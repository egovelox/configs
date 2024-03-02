return {
  {
    "nvim-telescope/telescope.nvim",
    version = '0.1.4',
    dependencies = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build="make"},
        {"nvim-telescope/telescope-live-grep-args.nvim"},
        {'nvim-telescope/telescope-symbols.nvim'},
    },
    config = function()
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
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
    end,
    keys = {
      {'<Leader>i', ':Telescope live_grep hidden=true<CR>'},
      {'<leader>j',':Telescope jumplist<cr>'},
      {'<leader>gd',':Telescope lsp_definitions<cr>'},
      {'<leader>gr',':Telescope lsp_references<cr>'},
    }
  },
}
