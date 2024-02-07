local u = require('utils')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('plugins.fzf'),
  require('plugins.barbar'),
  require('plugins.nvim-tree'),
  require('plugins.commentary'),
  require('plugins.coc'),
  {
    'moll/vim-bbye',
    keys = {
      {'<Leader>q', ':Bdelete<CR>'}
    }
  },
  'tpope/vim-fugitive',
  'tpope/vim-endwise',
})