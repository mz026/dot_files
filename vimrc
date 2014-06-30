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
Bundle "mz026/vim-snipmate"

Bundle "matchit.zip"
Bundle "HTML5-Syntax-File"
Bundle "Handlebars"
Bundle 'groenewege/vim-less'
Bundle "dbext.vim"
Bundle "altercation/vim-colors-solarized"
Bundle "css3-syntax-plus"
Bundle "cakebaker/scss-syntax.vim"
Bundle "wincent/Command-T"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-rails"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "Lokaltog/vim-powerline"
Bundle "thoughtbot/vim-rspec"

" rubyblock depends on textobj-user
Bundle "kana/vim-textobj-user" 
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "vim-ruby/vim-ruby"

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
set encoding=utf8
highlight LineNr term=bold cterm=NONE ctermfg=Grey

" enable project level vimrc
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" command mode abbreviations.
cab bf buffers


" ========== Personal mappings ==============
" set leader to ,
let mapleader=","
let g:mapleader=","

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

" ctrl-a to select all 
nmap <C-a> ggVG

" ,v to gv
nmap <leader>v gv

" <leader>s to sort in visual mode
vmap <leader>s :sort /\%V/<CR>

" map ctrl-t to open file under cursor in new tab
nmap <C-t> <C-w>gf

" map ,<C-]> to open tag in new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

nnoremap <leader>h <c-w>w
nnoremap <leader>l <c-w>w

" ======= easy motion =============
" map ,w ,b ,j ,k to easyMotion w b j k
nmap <leader>w ,,w
nmap <leader>e ,,e
nmap <leader>b ,,b
nmap <leader>j ,,j
nmap <leader>k ,,k

" ======= solarized ===========
syntax enable
set background=dark
colorscheme solarized
set t_Co=256


" ========== 80 columns =====================
" 80 column highlight
if v:version >= 703
  set colorcolumn=85
  hi ColorColumn ctermfg=grey ctermbg=235
endif

"for vsp 80 column width
set winwidth=100
set previewheight=30

" ========== number line background ==============
highlight LineNr ctermfg=darkgray ctermbg=black

" =========== folding methods ==============
" fold highlight
hi Folded ctermfg=gray
hi Folded ctermbg=0

" space in normal mode to alternate folding.
nnoremap <space> za

" html folding
au BufNewFile,BufRead *.html nmap <leader>f zfit

" ========= IncSearch style
hi IncSearch term=reverse cterm=reverse ctermfg=1

" ========= Plugins settings ===================
" scss syntax, located in .vim/syntax/
au BufRead,BufNewFile *.scss set filetype=scss

" ruby complete
" http://chloerei.blogbus.com/logs/33034033.html
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

"T-comment alias, map ,, to ctrl_ctrl_
nmap <leader>c <C-_><C-_>
vmap <leader>c <C-_><C-_>

" setup markdown to html
nmap <leader>md :%! $HOME/settingFiles/Markdown_1.0.1/Markdown.pl --html4tags

"change vim-snipmate trigger to ,, to avoid collision with SuperTab.
let g:snips_trigger_key="<leader><leader>"

"change sparkup trigger
let g:sparkupExecuteMapping='<leader>s'

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

" ======= indent guide settings ==========
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0

" ======= Powerline ====================
let g:Powerline_colorscheme="solarized256"

" ======= Rspec vim ====================
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>d :call RunNearestSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!clear; rspec {spec} -f d"

" ======= set backupcopy=yes for karma test runner ========
set backupcopy=yes

" ====== command-T ================
let g:CommandTMaxHeight=20
let g:CommandTMinHeight=20
set wildignore+=*/vendor/**

