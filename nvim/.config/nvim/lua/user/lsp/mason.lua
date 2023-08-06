local servers = {
	"lua_ls",
	"tsserver",
	"rust_analyzer",
	"jdtls",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})
