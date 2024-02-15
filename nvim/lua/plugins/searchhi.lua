return {
  'qxxxb/vim-searchhi',
  config = function ()
    vim.cmd [[
      nmap n <Plug>(searchhi-n)
      nmap N <Plug>(searchhi-N)
      nmap * <Plug>(searchhi-*)
      nmap # <Plug>(searchhi-#)

      vmap n <Plug>(searchhi-v-n)
      vmap N <Plug>(searchhi-v-N)
      vmap * <Plug>(searchhi-v-*)
      vmap # <Plug>(searchhi-v-#)

      " ,/ to close search hilight
      nmap <leader>/ <Plug>(searchhi-clear-all)
    ]]
  end
}
