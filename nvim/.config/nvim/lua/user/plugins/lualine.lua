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
          lualine_x = {'encoding', 'fileformat', "require'lsp-status'.status()", 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        extensions = { my_extension }
      })
    end
  },
}

