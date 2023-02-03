local function setup()
  local fn = vim.fn

  local status_jdtls_ok, jdtls = pcall(require, "jdtls")
  if not status_jdtls_ok then
    print "failed to load jdtls"
    return
  end

  local status_jdtls_setup_ok, jdtls_setup = pcall(require, "jdtls.setup")
  if not status_jdtls_setup_ok then
    print "failed to load jdtls.setup"
    return
  end
  
  local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not status_cmp_ok then
    print "failed to load cmp_nvim_lsp"
    return
  end
  
  -- Determine OS
  local home = os.getenv "HOME"
  
  if fn.has "mac" == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "mac"
  elseif fn.has "unix" == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "linux"
  else
    print "Unsupported system"
  end
  
  local project_name = fn.fnamemodify(fn.getcwd(), ":p:h:t")
  
  local workspace_dir = WORKSPACE_PATH .. project_name
  
  -- Find root of project
  local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
  local root_dir = jdtls_setup.find_root(root_markers)
  if root_dir == "" then
    return
  end
  
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, bufopts)
    -- use telescope instead
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
  
  local capabilities = cmp_nvim_lsp.default_capabilities()
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
  local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
      -- 💀
      --"java", 
      -- or '/path/to/java17_or_newer/bin/java'
      -- depends on if `java` is in your $PATH env variable and if it points to the right version.
      fn.glob(home .. "/.jabba/jdk/openjdk@1.17.0/Contents/Home/bin/java"),
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      -- remove default: ALL
      "-Dlog.level=ERROR",
      "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
      "-Xms4g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
      "-data","/Users/maximerichard/workspace",
    },
  
    on_attach = on_attach,
    capabilities = capabilities,
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,
  
    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- or https://github.com/redhat-developer/vscode-java#supported-vs-code-settings
    -- for a list of options
    settings = {
      java = {
        signatureHelp = {enabled = true},
        import = {enabled = true},
        rename = {enabled = true},
        configuration = {
          runtimes = {
            name = "JavaSE-11",
            path = home .. ".jabba/jdk/openjdk@1.11.0/Contents/Home"
          }
        }
      }
    },  
    init_options = {
      bundles = {},
      extendedClientCapabilities = extendedClientCapabilities,
    },
  }

  return config
end

return { setup = setup }



