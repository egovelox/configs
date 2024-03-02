return {
  {
    'numToStr/Navigator.nvim',
    keys = {
      { '<C-s>h', '<CMD>NavigatorLeft<CR>' },
      { '<C-s>l', '<CMD>NavigatorRight<CR>' },
      { '<C-s>k', '<CMD>NavigatorUp<CR>' },
      { '<C-s>j', '<CMD>NavigatorDown<CR>' },
      { 't', '<C-s>h', '<CMD>NavigatorLeft<CR>' },
      { 't', '<C-s>l', '<CMD>NavigatorRight<CR>' },
      { 't', '<C-s>k', '<CMD>NavigatorUp<CR>' },
      { 't', '<C-s>j', '<CMD>NavigatorDown<CR>' },
    },
    config = function()
        require('Navigator').setup()
    end
  },
}
