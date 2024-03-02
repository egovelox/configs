return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used in lots of plugins
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
