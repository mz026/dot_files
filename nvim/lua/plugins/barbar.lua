local u = require('utils')

return {
  'romgrk/barbar.nvim',
  dependencies = {
      'lewis6991/gitsigns.nvim', -- for git status
      'nvim-tree/nvim-web-devicons' -- for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {},
  config = function()
    u.nmap('H', '<cmd>BufferPrevious<cr>')
    u.nmap('L', '<cmd>BufferNext<cr>')
    u.nmap('<leader>H', '<cmd>BufferMovePrevious<cr>')
    u.nmap('<leader>L', '<cmd>BufferMoveNext<cr>')

    vim.cmd [[
      hi BufferCurrentMod guifg=#abb2bf ctermfg=249 gui=NONE cterm=NONE
      hi BufferInactiveMod ctermfg=249 ctermbg=0 guifg=#abb2bf guibg=#0f0b0b
    ]]

    require'bufferline'.setup {
      tabpages = false,
    }
    -- local nvim_tree_events = require('nvim-tree.events')
    local bufferline_state = require('bufferline.state')

  end,
}
