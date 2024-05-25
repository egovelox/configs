return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    -- a file is loading the plugin, cf ufo.lua
    event = 'VeryLazy',
    init = function()
      -- '1' will show vertical bars on one column. 
      -- If more columns than 1 are needed to display those vertical bars, 
      -- then it will display numbers instead.
      vim.o.foldcolumn = '1'
      -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "lsp", "indent" }
        end
      }
    end
  },
}
