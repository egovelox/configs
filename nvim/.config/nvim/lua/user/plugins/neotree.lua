return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    -- a file is loading the plugin, cf neotree.lua
    lazy = false,
    keys = {
      { "<Leader><BS>", ':Neotree toggle<CR>' },
      { "<Leader>b", ':Neotree source=buffers position=bottom toggle<CR>' }
    },
    config = function()
      vim.cmd [[hi NeoTreeFileName term=None guifg=gray ctermfg=111]]
      vim.cmd [[hi NeoTreeDirectoryName term=None guifg=gray ctermfg=111]]

require("neo-tree").setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  sources = {"filesystem", "buffers", "git_Status" },
  source_selector = {
    winbar = false, -- toggle to show selector on winbar
    show_separator_on_edge = false,
    content_layout = "center",
    tabs_layout = "equal",
    sources = {
        {source = "filesystem", display_name = "󰉓"},
        {source = "buffers", display_name = "󰈙"},
        {source = "git_status", display_name = ""},
        -- todo: install https://github.com/mrbjarksen/neo-tree-diagnostics.nvim
        {source = "diagnostics", display_name = "󰒡"}
    }
  },
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
  buffers = {
    window = {
      mappings = {
        ["u"] = "open_nofocus",
      }
    },
    commands = {
      open_nofocus = function(state)
        require("neo-tree.sources.common.commands").open(state)
        vim.schedule(function()
          vim.cmd([[Neotree source=buffers focus]])
        end)
      end,
    },
  },
  filesystem = {
    bind_to_cwd = true,
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".git"
      },
    },
    window = {
      mappings = {
        ["u"] = "open_nofocus",
      }
    },
    commands = {
      open_nofocus = function(state)
        require("neo-tree.sources.common.commands").open(state)
        vim.schedule(function()
          vim.cmd([[Neotree focus]])
        end)
      end,
    },
    follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
  },
   window = {
    mappings = {
      ["i"] = "next_source",
      ["l"] = "open",
      ["h"] = "close_node",
    }
  },
})
    end
  },
}
