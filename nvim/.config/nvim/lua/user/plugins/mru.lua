return {
  {
    'ilAYAli/scMRU.nvim',
    -- this plugin can really slow down the whole nvim startup
    -- make it lazy !
    lazy = true,
    cmd = "MruRepos",
    keys = {
      {'<Leader>o', ':Mru<CR>'},
      {'<Leader>devi', ':MruRepos<CR>'},
      {'<Leader>mfu', ':Mfu<CR>'},
    },
    dependencies = 'kkharji/sqlite.lua'
  },
}
