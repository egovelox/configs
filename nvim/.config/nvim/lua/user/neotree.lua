require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  default_component_configs = {
    container = {
      enable_character_fade = true
          },
    indent = {
      with_markers = false,
    },
    icon = {
      folder_closed = "-",
      folder_open = "+",
    },
    name = {
      use_git_status_colors = false
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        modified  = "",
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "󰁕",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    }
  },
  filesystem = {
    bind_to_cwd = false,
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".git"
      },
    },
    follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
  }
})

vim.cmd [[hi NeoTreeFileName term=None guifg=gray ctermfg=111]]
vim.cmd [[hi NeoTreeDirectoryName term=None guifg=gray ctermfg=111]]
