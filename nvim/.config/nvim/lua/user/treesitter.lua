-- treesitter is shipped with nvim, but does not enable any module.
-- Now, for treesitter to actually work we need a language parser. 
-- To install a new parser we use the command TSInstall followed by the name of the language.
-- So here, we tell nvim-treesitter what parsers we always want installed.
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
  ensure_installed = {
    "vim",
    "typescript",
    "javascript",
    "toml",
    "rust",
    "tsx",
    "java",
    "toml",
    "fish",
    "json",
    "yaml",
    "sql",
    "lua"
  },
  highlight = {
    enable = true,
    disable = {"vim"},
    additional_vim_regex_highlighting = false,
    module_path = "nvim-treesitter.highlight"
  },
  indent = {
    enable = true,
    disable = {},
  },
  auto_install = true,
}



