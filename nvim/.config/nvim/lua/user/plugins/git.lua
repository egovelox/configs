return {
  {
    'nvim-lualine/lualine.nvim',
    commit = "2248ef2",
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    config = function()
      local theme = require('lualine.themes.base16')
      local my_extension = {
        sections = {
          lualine_a = { 'mode', 'diagnostics' }
        },
        filetypes = {'neo-tree'}
      }
      require('lualine').setup({
        options = {
          theme = theme,
          disabled_filetypes = {}
        },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1,2) end },
          },
          lualine_b = {
            {
              'branch',
              separator = { right = ' '},
              color = function()
                return { bg = '#995054', fg= 'black' }
              end
            },
            'diff',
            'diagnostics'
          },
          lualine_c = {
            { 'filename' }
          },
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        extensions = { my_extension }
      })
    end
  },
  {
    'tveskag/nvim-blame-line',
    -- does not work with lazy = true, because of weird Vim Script syntax inside the plugin
    lazy = false,
    keys = {
      {'<Leader>gl', ':ToggleBlameLine<CR>'},
    }
  },
  {
    'rhysd/git-messenger.vim',
    event = "VeryLazy",
    init = function()
      vim.g.git_messenger_floating_win_opts = { border = 'single' }
      vim.g.git_messenger_always_into_popup = true
    end,
    config = function()
      vim.cmd [[hi diffAdded term=None guifg=#88b8f6 ctermfg=111]]
      -- color red for removed lines
      vim.cmd [[hi diffRemoved term=None guifg=#a63d62 ctermbg=111]]
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { '<Leader>gii', ':Gitsigns<CR>' },
    },
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "lewis6991/gitsigns.nvim",
    },
    lazy = false, -- DiffView-- commands should be available at start
    keys = {
      { '<Leader>gis', ':DiffviewOpen<CR>' },
    },
    config = function()
      require("diffview").setup({
        file_panel = {
          win_config = {                      -- See |diffview-config-win_config|
            position = "bottom",
            height = 16,
          },
        },
    })
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { '<C-g>', ':15 split | Gedit:<CR>' },
    }
  },
}
