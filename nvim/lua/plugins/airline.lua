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
  {
    'vim-airline/vim-airline-themes',
    dependencies = { 'git@github.com-mz:mz026/dracula-pro-vim.git' },
    init = function ()
      vim.g.airline_theme = 'dracula_pro'
    end
  }
}
