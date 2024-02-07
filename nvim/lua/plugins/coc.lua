local u = require('utils')
return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.cmd [[
      let g:coc_global_extensions = [
        \ 'coc-tsserver',
        \ 'coc-pyright',
        \ 'coc-sumneko-lua',
        \ 'coc-snippets'
      \]

      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)
      " GoTo code navigation.
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gt <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
      nmap <silent> gm <Plug>(coc-rename)

      " Apply AutoFix to problem on the current line.
      nmap <leader>u  <Plug>(coc-fix-current)
      let g:coc_disable_transparent_cursor = 1

      " Use tab for trigger completion with characters ahead and navigate.
      inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
      imap <leader><leader> <Plug>(coc-snippets-expand-jump)

      " Use ,2 to show documentation in preview window.
      nnoremap <silent> <leader>2 :call Show_documentation()<CR>

      function! Show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
          call CocActionAsync('doHover')
        else
          execute '!' . &keywordprg . " " . expand('<cword>')
        endif
      endfunction
    ]]
  end
}
