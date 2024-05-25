return {
  {
    'rcarriga/nvim-dap-ui',
    -- TODO: add keys found in mappings.lua
    lazy = true,
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require("dapui").setup()
    end
  },
  {
    'mfussenegger/nvim-dap',
    commit = "9adbfdc",
    -- TODO: add keys found in mappings.lua
    lazy = true
  },
  {
    'leoluz/nvim-dap-go',
    lazy = true,
    commit = "a5cc8dc",
    ft = { 'go' },
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function (_,opts)
      require("dap-go").setup(opts)
    end
  },
}
