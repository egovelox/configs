return {
  {
    "nvim-telescope/telescope.nvim",
    version = '0.1.8',
    dependencies = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build="make"},
        {"nvim-telescope/telescope-live-grep-args.nvim"},
        {'nvim-telescope/telescope-symbols.nvim'},
    },
    lazy = false,
    config = function()
      local actions = require('telescope.actions')
      local action_state = require "telescope.actions.state"

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
          },
          git_commits = {
            theme = 'dropdown',
            previewer = false,
            mappings = {
              i = {
                ["<CR>"] = function(prompt_bufnr)
                  actions.close(prompt_bufnr)
                  local value = action_state.get_selected_entry(prompt_bufnr).value
                  vim.cmd('DiffviewOpen ' .. value .. '~1..' .. value)
                end,
              }
            }
          },
          git_branches = {
            theme = 'dropdown',
            previewer = false,
            mappings = {
              i = {
                ["<CR>"] = function(prompt_bufnr)
                  actions.close(prompt_bufnr)
                  local value = action_state.get_selected_entry(prompt_bufnr).value
                  -- we compare branch X with HEAD i.e our current branch
                  -- we use ... because we want our comparaison to be based on a shared commit :
                  -- the branch X commit that our branch also contains
                  -- If we would use .. we would compare branch X tip with our current branch tip.
                  vim.cmd('DiffviewOpen ' .. value .. '...HEAD')
                end,
              }
            }
          },
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
      {'<leader>gib',':Telescope git_branches<cr>'},
      {'<leader>gic',':Telescope git_commits<cr>'},
    }
  },
}
