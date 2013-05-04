set nocompatible               " be iMproved
filetype on                    " for os X
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'xmledit'
Bundle 'The-NERD-tree'
Bundle 'javascript.vim--welshare'
Bundle 'php.vim--Hodge'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Auto-Pairs'
Bundle 'surround.vim'
Bundle 'EasyMotion'
Bundle "SuperTab-continued."
Bundle 'tComment'
Bundle "bingaman/vim-sparkup"
Bundle "vim-coffee-script"

"vim-snipmate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "mz026/snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle "matchit.zip"
Bundle "HTML5-Syntax-File"
Bundle "Command-T"
Bundle "Handlebars"
Bundle 'groenewege/vim-less'
Bundle "dbext.vim"
Bundle "Yggdroot/indentLine"
Bundle "css3"
Bundle "altercation/vim-colors-solarized"

filetype plugin indent on     " required! 

" my settings here
syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set number
set cindent 
set autoindent
set ignorecase
set smartcase
set hlsearch
set ruler
set laststatus=2
highlight LineNr term=bold cterm=NONE ctermfg=Grey

" command mode abbreviations.
cab bf buffers


" ========== Personal mappings ==============
" set leader to ,
let mapleader=","
let g:mapleader=","

" ctrl-l and ctrl-h map to swith vsp window
nnoremap <c-h> <c-w>w
inoremap <c-h> <Esc><c-w>w
nnoremap <c-l> <c-w>w
inoremap <c-l> <Esc><c-w>w
nnoremap <c-k> <c-w>k
inoremap <c-k> <Esc><c-w>k
nnoremap <c-j> <c-w>j
inoremap <c-j> <Esc><c-w>j

" map ,gst to fugitive Gstatus
nnoremap <leader>gst :Gstatus<cr>

" map H, L to switch tab
nnoremap H <c-PageUp>
nnoremap L <c-PageDown>

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
nnoremap <silent> <leader>H :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <leader>L :execute 'silent! tabmove ' . tabpagenr()<CR>

" ,/ to close search hilight
nmap <leader>/ :nohl<CR>

" T to zt, put current line to the top of screen.
nmap T zt

" ctrl-t to :tabe, open new tab
nmap <C-t> :tabe<CR>

" ctrl-a to select all 
nmap <C-a> ggVG

" ,v to gv
nmap <leader>v gv

" <leader>s to sort in visual mode
vmap <leader>s :sort /\%V/<CR>

" ========== 80 columns =====================
" 80 column highlight
if v:version >= 703
  set colorcolumn=85
  :hi ColorColumn ctermfg=gray ctermbg=black
endif

"for vsp 80 column width
set winwidth=90
set previewheight=30

" ========== number line background ==============
highlight LineNr ctermfg=darkgray ctermbg=black

" =========== folding methods ==============
" fold highlight
hi Folded ctermfg=white
hi Folded ctermbg=0

" space in normal mode to alternate folding.
nnoremap <space> za

" html folding
au BufNewFile,BufRead *.html nmap F zfit

" php folding
let php_folding=1

"set foldmethod=syntax when ruby
au BufRead,BufNewFile *.rb set foldmethod=syntax


" ========= Plugins settings ===================
" scss syntax, located in .vim/syntax/
au BufRead,BufNewFile *.scss set filetype=scss

" ruby complete
" http://chloerei.blogbus.com/logs/33034033.html
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

"Tlist setting
let Tlist_WinWidth=35

"T-comment alias, map ,, to ctrl_ctrl_
nmap <leader>c <C-_><C-_>
vmap <leader>c <C-_><C-_>

" setup markdown to html
nmap <leader>md :%! $HOME/settingFiles/Markdown_1.0.1/Markdown.pl --html4tags

"change vim-snipmate trigger to ,, to avoid collision with SuperTab.
let g:snips_trigger_key="<leader><leader>"

"change sparkup trigger
let g:sparkupExecuteMapping='<leader>e'

" ========== work around and others ==============
"fix backspace not working in 7.3
"http://linux-journal.blogspot.com/2005/04/fix-vim-backspace-doesnt-work.html
set bs=2


" ========= dbext settings ===================
let g:dbext_default_type ='MYSQL'
let g:dbext_default_user ='root' 
let g:dbext_default_dbname='KDB_dev'
let g:dbext_default_buffer_lines=30

" map ,q (query) in visual mode to execute slected sql
vmap <leader>q :DBExecRangeSQL<cr>

" ======== indent line ===================
let g:indentLine_color_term='black'

" ======= solarized ===========
syntax enable
set background=dark
colorscheme solarized
set t_Co=16