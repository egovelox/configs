local jdtls_config = require('user.lsp.jdtls_config')

local config = jdtls_config.setup()
require("jdtls").start_or_attach(config)


--[[ 
--DEBUG


local config = {
    cmd = {'/Users/maximerichard/.local/share/nvim/mason/packages/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages


--]]


