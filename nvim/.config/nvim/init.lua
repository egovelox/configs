--[[----------------------------------------
IMPORTS
--]]----------------------------------------

require('plugins')
require('colorscheme')
require('settings')
require('mappings')
local fn = vim.fn

--[[----------------------------------------
vscode-theme
--]]----------------------------------------
local c = require('vscode.colors').get_colors()

require('vscode').setup({
  disable_nvimtree_bg = true,
  color_overrides = {
    vscBack = '#1d1f21',
    -- dim default lightBlue #9CDCFE
    vscLightBlue = '#647eb5'
  },
  group_overrides = {
    NvimTreeNormal = { fg='#A9B53F', bg = 'NONE' },
    NvimTreeFolderName = { fg=c.vscGray, bg = 'NONE' },
    NvimTreeOpenedFolderName = { fg=c.vscViolet, bg = 'NONE' },
    NvimTreeEmptyFolderName = { fg = c.vscFront, bg = 'NONE' }
  }
})

--[[----------------------------------------
icon-picker
--]]----------------------------------------
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
--vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
 
--[[----------------------------------------
nvim-tree
--]]----------------------------------------

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
-- nvim-tree will open the folder of the file in current buffer
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
  },
  sync_root_with_cwd = false,
  reload_on_bufenter = true,
  renderer = {
    icons = {
      show = {
        folder = false,
        folder_arrow = true
      },
      glyphs = {
        folder = {
          arrow_open = "+",
          arrow_closed = "-"
        }
      }
    }
  },
  view = {
    adaptive_size = true,
  },
  filters = {
    -- show dotfiles
    dotfiles = false,
    -- do not show .git folder
    custom = { '^.git$' }
  }
})


--[[----------------------------------------
LUALINE
--]]----------------------------------------

local base16 = require'lualine.themes.base16'
local my_extension = { sections = { lualine_a = { 'mode', 'diagnostics'} }, filetypes = {'NvimTree'} }
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
      separator = { right = ''},
      color = function(section)
                  return { bg = '#995054', fg= 'black' }
                end
      },
      'diff', 
      'diagnostics' 
    },
    lualine_c = {
      { 'filename', fmt = function(str) if str:find("NvimTree", 1, false) ~= 1 then return str end end },
      'lsp_progress'
    },
    lualine_x = {'encoding', 'fileformat', "require'lsp-status'.status()", 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = { my_extension }
})


--[[----------------------------------------
HIGHLIGHTED-YANK
--]]----------------------------------------

-- TODO could be done with ntive nvim, no plugin needed
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


--[[----------------------------------------
FOLDING
--]]----------------------------------------
require("ufo").setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
}

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

--[[----------------------------------------
TELESCOPE
--]]----------------------------------------
local actions = require('telescope.actions')

-- function to get <C-s>
-- open the file chosen via telescope directly in nvim-tree

local open_in_nvim_tree = function(prompt_bufnr)
    local action_state = require "telescope.actions.state"
    local Path = require "plenary.path"

    -- this will work only if the selected entry is a path
    -- i.e not for the live-grep picker for instance
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
    path_display = { "smart" },
    dynamic_preview_title = true,
    winblend = 4,
    layout_strategy = 'horizontal',
    layout_config = { 
      width = 0.7,
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    mappings = {

        i = {
            ["<c-s>"] = open_in_nvim_tree,
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
            ["<c-s>"] = open_in_nvim_tree,
            ["<Esc>"] = actions.close,
        },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    }
  },
}

-- load telescope-fzf-native extension, always after setup function,
-- to optimize perf
require("telescope").load_extension("fzf")



--[[----------------------------------------
MASON & LSPCONFIG
--]]----------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"sumneko_lua", "tsserver", "rust_analyzer"}
})


--[[----------------------------------------
MASON & LSPCONFIG
--]]----------------
--vim.cmd[[hi DiagnosticError guifg=#88088F]]
--vim.cmd[[hi DiagnosticWarn guifg=DarkOrange]]
--vim.cmd[[hi DiagnosticInfo guifg=Blue]]
--vim.cmd[[hi DiagnosticHint guifg=Green]]

fn.sign_define("DiagnosticSignError", { text = "💥", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "🤨", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "🌤️", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "🐠", texthl = "DiagnosticSignHint" })

-- might be too large, e.g NvimTree diagnostic should be excluded
vim.diagnostic.config {
  underline = false,
  float = { border = "rounded" },
  update_in_insert = true,
  signs = true,
}

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, bufopts)
  -- use telescope
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}



--[[----------------------------------------
CMP & LSPCONFIG
--]]----------------------------------------

local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  completion = {
        autocomplete = false,
        completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping {
      i = cmp.mapping.complete(),
    },
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    capabilities = capabilities,
  },
})

