-- tmux can no longer read the CWD (regression)
-- https://github.com/neovim/neovim/issues/21771
vim.api.nvim_create_autocmd('DirChanged', {
  group = vim.api.nvim_create_augroup('setDir', { clear = true }),
  pattern = { '*' },
  command = [[call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd))]],
})

vim.api.nvim_create_autocmd('VimLeave', {
  group = vim.api.nvim_create_augroup('setDirEnd', { clear = true }),
  pattern = { '*' },
  command = [[call chansend(v:stderr, printf("\033]7;\033\\"))]],
})

