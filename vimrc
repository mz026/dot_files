set nocompatible               " be iMproved
set nomodeline
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/xmledit'
Plug 'vim-scripts/The-NERD-tree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive', { 'commit': '2564c37' }
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/taglist.vim'
Plug 'jiangmiao/auto-pairs', { 'commit': '8f4598b' }

Plug 'vim-scripts/surround.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'vim-scripts/tComment'
Plug 'bingaman/vim-sparkup'

"vim-snipmate dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'mz026/vim-snippets'

Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/HTML5-Syntax-File'
Plug 'groenewege/vim-less'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/css3-syntax-plus'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test'

" rubyblock depends on textobj-user
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'ekalinin/Dockerfile.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'chriskempson/base16-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'w0rp/ale'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'othree/html5.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-abolish'
Plug 'qxxxb/vim-searchhi'
Plug 'aliou/sql-heredoc.vim'

call plug#end()


" my settings here
set regexpengine=2
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
nnoremap <leader>gst :Gstatus<cr>30+

" https://github.com/thoughtbot/dotfiles/issues/655
set diffopt-=internal
set diffopt+=vertical

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

" in insert mode, map `kj` to <esc>
imap <leader>d <esc>
nmap <leader>d <esc>
vmap <leader>d <esc>

" highlight def link, to solve js object key highlighting
" form https://github.com/pangloss/vim-javascript/issues/138
hi def link jsObjectKey Label
hi def link jsFunctionKey Label

" make diff vertical
if &diff
  set diffopt-=internal
  set diffopt+=vertical
endif

" ======= easy motion =============
" map ,w ,b ,j ,k to easyMotion w b j k
nmap <leader>w ,,w
nmap <leader>e ,,e
nmap <leader>b ,,b
nmap <leader>ge ,,ge
nmap <leader>j ,,j
nmap <leader>k ,,k

" ======= colorscheme ===========
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-railscasts
set t_Co=256


" ========== 80 columns =====================
" 80 column highlight
if v:version >= 703
  set colorcolumn=85
  hi ColorColumn ctermfg=grey ctermbg=235
endif

" ========= match highlight ================
highlight MatchParen cterm=underline ctermfg=none ctermbg=none


" "for vsp 80 column width
" set winwidth=100
set previewheight=30

" =========== folding methods ==============
" fold highlight
hi Folded ctermfg=gray
hi Folded ctermbg=0

" space in normal mode to alternate folding.
nnoremap <space> za

" ========= IncSearch style
hi IncSearch term=reverse cterm=reverse ctermfg=1 ctermbg=10

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

"change vim-snipmate trigger to ,, to avoid collision with SuperTab.
imap <leader><leader> <Plug>snipMateNextOrTrigger
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['typescript'] = 'typescript,javascript-jasmine'

"change sparkup trigger
let g:sparkupExecuteMapping='<leader>s'

" ========== work around and others ==============
"fix backspace not working in 7.3
"http://linux-journal.blogspot.com/2005/04/fix-vim-backspace-doesnt-work.html
set bs=2

" ========== Tabline settings ==============
set showtabline=2
" hi TabLineFill ctermbg=235
" hi TabLine ctermfg=247 ctermbg=237
hi TabLineSel cterm=bold ctermfg=237 ctermbg=4

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
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>

" ======= set backupcopy=yes for karma test runner ========
set backupcopy=yes

" ===== FZF =================
nmap <leader>t :FZF<cr>
imap <leader>z <plug>(fzf-complete-file-ag)

nmap <leader>f :Find <C-R><C-W>
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


" ====== ctrlsf ==================
let g:ctrlsf_auto_close = 0
map <leader><s-f> <Plug>CtrlSFCwordPath

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

" multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

call serverlist()

" ========== ale linter ===========
let g:ale_linters = {
\   'ruby': ['ruby'],
\   'typescript': ['tsserver']
\}
highlight ALEError ctermbg=none cterm=underline


" ========= jsx syntax ==================
let g:jsx_ext_required = 0

" ======== Argwrap ====================
nnoremap <silent> <leader>z :ArgWrap<CR>

" ======== NERD-tree ====================
let g:NERDTreeWinSize = 40

" searchhi
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
