--[[----------------------------------------
IMPORTS
--]]----------------------------------------

require('plugins')
require('colorscheme')
require('settings')
require('mappings')
local fn = vim.fn


--[[----------------------------------------
NVIM-TREE
--]]----------------------------------------

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  reload_on_bufenter = true,
  view = {
    adaptive_size = true
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$' }
  }
})


--[[----------------------------------------
LUALINE
--]]----------------------------------------

local base16 = require'lualine.themes.base16'
require('lualine').setup({
  options = { theme = base16 }, 
})


--[[----------------------------------------
HIGHLIGHTED-YANK
--]]----------------------------------------

vim.g.highlightedyank_highlight_in_visual = 0


--[[----------------------------------------
NVIM-TREESITTER
--]]----------------------------------------

-- treesitter is shipped with nvim, but does not enable any module.
-- Now, for treesitter to actually work we need a language parser. 
-- To install a new parser we use the command TSInstall followed by the name of the language.
-- So here, we tell nvim-treesitter what parsers we always want installed.
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "javascript",
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
  autotag = {
    enable = true,
  },
}


--[[----------------------------------------
TELESCOPE
--]]----------------------------------------
local actions = require('telescope.actions')

local open_in_nvim_tree = function(prompt_bufnr)
    local action_state = require "telescope.actions.state"
    local Path = require "plenary.path"

    local entry = action_state.get_selected_entry()[1]
    local entry_path = Path:new(entry):parent():absolute()
    actions._close(prompt_bufnr, true)
    entry_path = Path:new(entry):parent():absolute() 
    entry_path = entry_path:gsub("\\", "\\\\")

    vim.cmd("NvimTreeClose")

    vim.cmd("NvimTreeOpen " .. entry_path)

    file_name = nil
    for s in string.gmatch(entry, "[^/]+") do
        file_name = s
    end

    vim.cmd("/" .. file_name)
    -- fix intempestive highlight
    vim.cmd([[nohl]])
end

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<c-s>"] = open_in_nvim_tree,
                ["<Esc>"] = actions.close,
            },
            n = {
                ["<c-s>"] = open_in_nvim_tree,
                ["<Esc>"] = actions.close,
            },
        },
    },
}
--require("telescope").setup()
-- load telescope-fzf-native extension, always after setup function,
-- to optimize perf
--require("telescope").load_extension("fzf")



