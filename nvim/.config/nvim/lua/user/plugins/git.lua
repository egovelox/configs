return {
  {
    'tveskag/nvim-blame-line',
    -- does not work with lazy = true, because of weird Vim Script syntax inside the plugin
    lazy = false,
    keys = {
      {'<Leader>gb', ':ToggleBlameLine<CR>'},
    }
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { '<C-g>', ':Git<CR>' }
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
}
