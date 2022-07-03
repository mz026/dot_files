" J and K to multiple navigate
nmap J 5j
vmap J 5j
nmap K 5k
vmap K 5k

" copy and paste
" $ vim --version | grep clipboard    must have +xterm_clipboard
" otherwise,
" $ sudo apt-get install vim-gnome
nmap <C-p> "+p
vmap <C-y> "+y

"move tab to left/right by shift-<left>/<right>
nnoremap <silent> <leader>H :-tabmove<CR>
nnoremap <silent> <leader>L :+tabmove<CR>

" T to zt, put current line to the top of screen.
nmap T zt

" <leader>s to sort in visual mode
vmap <leader>s :sort /\%V/<CR>

" map ctrl-t to open file under cursor in new tab
nmap <C-t> <C-w>gf

" map ,<C-]> to open tag in new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

nnoremap <leader>h <c-w>w
nnoremap <leader>l <c-w>w

" in visual mode, map `/target` to `<Esc>/\%Vtarget`
" so that we can do searching withing the selected block
" http://vim.wikia.com/wiki/Search_and_replace_in_a_visual_selection
vnoremap / <Esc>/\%V

" ,v to select previous selected area
nmap <leader>v gv

" in insert mode, map `kj` to <esc>
imap <leader>d <esc>
nmap <leader>d <esc>
vmap <leader>d <esc>
