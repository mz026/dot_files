return {
  'qxxxb/vim-searchhi',
  config = function ()
    vim.cmd [[
      nmap n <Plug>(searchhi-n)
      nmap N <Plug>(searchhi-N)
      nmap * <Plug>(searchhi-*)
      nmap g* <Plug>(searchhi-g*)
      nmap # <Plug>(searchhi-#)
      nmap g# <Plug>(searchhi-g#)
      nmap gd <Plug>(searchhi-gd)
      nmap gD <Plug>(searchhi-gD)

      vmap n <Plug>(searchhi-v-n)
      vmap N <Plug>(searchhi-v-N)
      vmap * <Plug>(searchhi-v-*)
      vmap g* <Plug>(searchhi-v-g*)
      vmap # <Plug>(searchhi-v-#)
      vmap g# <Plug>(searchhi-v-g#)
      vmap gd <Plug>(searchhi-v-gd)
      vmap gD <Plug>(searchhi-v-gD)

      " ,/ to close search hilight
      nmap <leader>/ <Plug>(searchhi-clear-all)
    ]]
  end
}
