return {
  'tpope/vim-commentary',
  config = function()
    -- due to some unknown reason of lazy.nvim + legacy vim plugin, the normal
    -- way of mapping `vim.api.nvim_set_keymap` won't work here.
    vim.cmd [[
      nmap <leader>c gcc
      vmap <leader>c gc
    ]]
  end
}
