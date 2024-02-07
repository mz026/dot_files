return {
  'tpope/vim-commentary',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', { noremap = false, silent = false })
    vim.api.nvim_set_keymap('v', '<leader>c', 'gc', { noremap = false, silent = false })
  end
}
