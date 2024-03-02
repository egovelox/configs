return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        ensure_installed = { "vim", "typescript", "javascript", "toml", "rust", "tsx", "java", "toml", "fish", "json", "yaml", "sql", "lua" },
        highlight = {
          enable = true,
          disable = {"vim"},
          additional_vim_regex_highlighting = false,
          module_path = "nvim-treesitter.highlight"
        },
        indent = { enable = true, disable = {} },
      })
    end
  },

}
