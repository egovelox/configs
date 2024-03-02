return {
  "junegunn/fzf",
  { "junegunn/fzf.vim",
    keys = {
      { '<Leader>l', ':Files<CR>' },
      { '<Leader>;', ':GFiles<CR>' },
      { '<Leader>.', ':Buffers<CR>' },
      { "<Leader>'", ':History:<cr>' },
    },
    init = function()
      vim.g.fzf_preview_window = { 'right:hidden', 'ctrl-/' }
      vim.g.fzf_layout = { tmux = '-p 70% --black' }
    end,
    config = function()
      -- Since fzf is in terminal mode, do not use the standard mapping for Esc
      vim.api.nvim_create_autocmd("FileType", { pattern = "fzf", command = [[tnoremap <Esc> <C-c>]] })
      vim.api.nvim_create_autocmd("BufLeave", { command = [[tnoremap <Esc> <C-\><C-n>]] })
    end,
  }, -- FZF embedded in vim
}
