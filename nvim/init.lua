require('options')
require('keybindings')

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
  require('plugins.markdown'),
  require('plugins.colorscheme'),
  require('plugins.treesitter'),
  require('plugins.airline'),
  require('plugins.hop'),
  require('plugins.diffview'),
  require('plugins.searchhi'),
  require('plugins.ale'),
  {
    'moll/vim-bbye',
    keys = {
      {'<Leader>q', ':Bdelete<CR>'}
    }
  },
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
  },
  {
    'FooSoft/vim-argwrap',
    lazy = false,
    keys = {
      {'<leader>z', ':ArgWrap<CR>'}
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {}
  },
  {
    'ruanyl/vim-gh-line',
    config = function ()
      -- to copy the URL to clipboard instead of opening it in browser
      vim.g.gh_open_command = 'fn() { echo -n "$@" | pbcopy; }; fn '
    end
  },
  {
    'janko-m/vim-test',
    keys = {
      {'<leader>x', ':TestNearest<CR>'},
      {'<leader>r', ':TestFile<CR>'},
      {'<leader>a', ':TestSuite<CR>'},
      {'<C-o>', '<C-\\><C-n>', mode = 't'}
    }
  },
  {
    'fatih/vim-go',
    build = ':GoInstallBinaries'
  },
  { 'pangloss/vim-javascript', ft = {'javascript', 'typescript'} },
  {
    'MaxMEllon/vim-jsx-pretty',
    ft = {'javascriptreact', 'typescriptreact'},
    config = function () vim.g.jsx_ext_required = 0 end,
  },
  { 'Vimjas/vim-python-pep8-indent', ft = 'python' },
  { 'pedrohdz/vim-yaml-folds', ft = 'yaml' },
  { 'ekalinin/Dockerfile.vim', ft = 'Dockerfile' },
  'tpope/vim-fugitive',
  'tpope/vim-endwise',
  'tpope/vim-projectionist',
  'bronson/vim-trailing-whitespace',
  'godlygeek/tabular',
  'vim-scripts/surround.vim',
  'mz026/vim-snippets',
  'hashivim/vim-terraform',
})
