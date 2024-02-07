return {
  {
    'bling/vim-airline',
    config = function ()
      vim.cmd [[
        let g:airline#extensions#whitespace#checks = []

        " airline-powerline-chars
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
      ]]
    end
  },
  {'vim-airline/vim-airline-themes'}
}
