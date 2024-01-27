local servers = {
	"lua_ls",
	"tsserver",
	"rust_analyzer",
	"jdtls",
	"clangd",
  "pyright",
}

require("mason").setup({
  ensure_installed = {
    "ruff", -- pyton linter
    "mypy", -- python linter and static type checker
    "black", -- python code formatter
    "gopls",
    "goimports-reviser",
    "golines",
  }
})
require("mason-lspconfig").setup({
  ensure_installed = servers
})
