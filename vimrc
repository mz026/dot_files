set nocompatible               " be iMproved
set nomodeline
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'xmledit'
Plugin 'The-NERD-tree'
Plugin 'php.vim--Hodge'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-endwise'
Plugin 'vim-scripts/taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'surround.vim'
Plugin 'EasyMotion'
Plugin 'ervandew/supertab'
Plugin 'tComment'
Plugin 'bingaman/vim-sparkup'
Plugin 'vim-coffee-script'

"vim-snipmate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'mz026/snipmate-snippets'
Plugin 'mz026/vim-snipmate'

Plugin 'matchit.zip'
Plugin 'HTML5-Syntax-File'
Plugin 'Handlebars'
Plugin 'groenewege/vim-less'
Plugin 'dbext.vim'
Plugin 'css3-syntax-plus'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'janko-m/vim-test'

" rubyblock depends on textobj-user
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rking/ag.vim'

Plugin 'ekalinin/Dockerfile.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chriskempson/base16-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'othree/html5.vim'
Plugin 'mz026/vim-elixir'
Plugin 'tmux-plugins/vim-tmux-focus-events'

call vundle#end()
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
set autoread
set noignorecase
set incsearch
set hlsearch
set ruler
set laststatus=2
set encoding=utf8

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

" fix tag binding issue
nnoremap <C-]> <C-]>

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
nnoremap <silent> <leader>H :-tabmove<CR>
nnoremap <silent> <leader>L :+tabmove<CR>

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

" in visual mode, map `/target` to `<Esc>/\%Vtarget`
" so that we can do searching withing the selected block
" http://vim.wikia.com/wiki/Search_and_replace_in_a_visual_selection
vnoremap / <Esc>/\%V

" highlight def link, to solve js object key highlighting
" form https://github.com/pangloss/vim-javascript/issues/138
hi def link jsObjectKey Label
hi def link jsFunctionKey Label

" make diff vertical
set diffopt+=vertical

" ======= easy motion =============
" map ,w ,b ,j ,k to easyMotion w b j k
nmap <leader>w ,,w
nmap <leader>e ,,e
nmap <leader>b ,,b
nmap <leader>j ,,j
nmap <leader>k ,,k

" ======= colorscheme ===========
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow
set t_Co=256


" ========== 80 columns =====================
" 80 column highlight
if v:version >= 703
  set colorcolumn=85
  hi ColorColumn ctermfg=grey ctermbg=235
endif

" ========= match highlight ================
highlight MatchParen cterm=underline ctermfg=none ctermbg=none


"for vsp 80 column width
set winwidth=100
set previewheight=30

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
let g:dbext_default_type ='PGSQL'
let g:dbext_default_buffer_lines=20

" map ,q (query) in visual mode to execute slected sql
vmap <leader>q :DBExecRangeSQL<cr>

" ======= indent guide settings ==========
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235

" ====== vim-test ==================
nmap <silent> <leader>d :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>

" ======= set backupcopy=yes for karma test runner ========
set backupcopy=yes

" ===== FZF =================
nmap <leader>t :FZF<cr>
let $FZF_DEFAULT_COMMAND='ag -l -g ""'

" ====== ctrlsf ==================
let g:ctrlsf_auto_close = 0

" ====== airline ================
let g:airline#extensions#whitespace#checks = []

let g:airline_theme = 'base16'
" airline-powerline-chars
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

call serverlist()

" =========== syntastic ===========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']

" ========= jsx syntax ==================
let g:jsx_ext_required = 0
