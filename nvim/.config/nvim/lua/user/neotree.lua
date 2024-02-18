require("neo-tree").setup({
  default_component_configs = {
    container = {
      enable_character_fade = false
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
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
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
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
    },
    window = {
      mappings = {
        ["L"] = "open_nofocus",
      },
    },
    commands = {
      open_nofocus = function(state)
        require("neo-tree.sources.filesystem.commands").open(state)
        vim.schedule(function()
          vim.cmd([[Neotree focus]])
        end)
      end,
    },
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
    }
  }
})

vim.cmd [[hi NeoTreeFileName term=None guifg=gray ctermfg=111]]
vim.cmd [[hi NeoTreeDirectoryName term=None guifg=gray ctermfg=111]]
