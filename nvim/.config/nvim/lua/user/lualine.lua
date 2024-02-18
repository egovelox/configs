local base16 = require'lualine.themes.base16'
local my_extension = { sections = { lualine_a = { 'mode', 'diagnostics'} }, filetypes = {'neo-tree'} }
require('lualine').setup({
  options = {
    theme = base16,
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,2) end },
    },
    lualine_b = {
      {
      'branch',
      --separator = { right = ''},
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
    --[[
    lualine_c = {
      { 'filename', fmt = function(str) if str:find("neo-tree", 1, false) ~= 1 then return str end end },
    },
    --]]
    lualine_x = {'encoding', 'fileformat', "require'lsp-status'.status()", 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = { my_extension }
})
