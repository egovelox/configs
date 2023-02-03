require("ufo").setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
}

-- Existing bindings
-- zn open a fold
-- zm close a fold
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)


