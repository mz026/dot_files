set nocompatible               " be iMproved
set nomodeline
filetype off                   " required!

call plug#begin('~/.vim/plugged')

" Plug 'vim-scripts/The-NERD-tree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs', { 'commit': '8f4598b' }
Plug 'vim-scripts/surround.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-commentary'

" ===== snipmate and its friends ======
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'mz026/vim-snippets'
" =================================
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-rails'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test'

" rubyblock depends on textobj-user
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'ekalinin/Dockerfile.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'w0rp/ale'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'elixir-lang/vim-elixir'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-abolish'
Plug 'qxxxb/vim-searchhi'
Plug 'aliou/sql-heredoc.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'git@github.com:mz026/dracula-pro-vim.git'

call plug#end()


" use the new regex engine to fix slow typescript syntax highlighting (https://jameschambers.co.uk/vim-typescript-slow)
set re=0
set expandtab
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set termguicolors

" set indent to 4 for python files
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

" enable project level vimrc
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" ========== Personal mappings ==============
" set leader to ,
let mapleader=","
let g:mapleader=","

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

" make diff vertical
if &diff
  set diffopt-=internal
  set diffopt+=vertical
endif

" ======= hop =============

lua <<EOF
require'hop'.setup()
EOF
nnoremap <leader>w <cmd>:HopWordAC<cr>
nnoremap <leader>b <cmd>:HopWordBC<cr>
nnoremap <leader>j <cmd>:HopLineAC<cr>
nnoremap <leader>k <cmd>:HopLineBC<cr>

" ========== 80 columns =====================
" 80 column highlight
if v:version >= 703
  set colorcolumn=85
  hi ColorColumn ctermfg=grey ctermbg=235
endif

" "for vsp 80 column width
" set winwidth=100
set previewheight=30

" ========= match highlight ================
highlight MatchParen cterm=underline ctermfg=none ctermbg=none

" =========== folding methods ==============
" fold highlight
hi Folded ctermfg=gray
hi Folded ctermbg=0

" space in normal mode to alternate folding.
nnoremap <space> za

" highlight def link, to solve js object key highlighting
" form https://github.com/pangloss/vim-javascript/issues/138
hi def link jsObjectKey Label
hi def link jsFunctionKey Label

" ========= IncSearch style
hi IncSearch term=reverse cterm=reverse ctermfg=1 ctermbg=10

" ruby complete
" http://chloerei.blogbus.com/logs/33034033.html
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

"commentary alias, map ,c to ctrl_ctrl_
nmap <leader>c gcc
vmap <leader>c gc

" ========== Tabline settings ==============
set showtabline=2

" " ======= indent guide settings ==========
lua <<EOF
vim.opt.list = true

require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF

" ====== vim-test ==================
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>

" ===== FZF =================
nmap <leader>t :FZF<cr>

nmap <leader>f :Find <C-R><C-W>
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
let g:fzf_layout = { 'down': '40%' }


" ====== ctrlsf ==================
let g:ctrlsf_auto_close = 0
map <leader><s-f> <Plug>CtrlSFCwordPath

" ====== airline ================
let g:airline#extensions#whitespace#checks = []

" airline-powerline-chars
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'dracula_pro'

" ========== ale linter ===========
let g:ale_linters = {
\   'ruby': ['ruby'],
\   'typescript': ['eslint'],
\   'sh': ['shellcheck']
\}
highlight ALEError ctermbg=none cterm=underline
cmap AF ALEFix

" ========= jsx syntax ==================
let g:jsx_ext_required = 0

" ======== Argwrap ====================
nnoremap <silent> <leader>z :ArgWrap<CR>

" ======== nvim-tree ====================
lua <<EOF
require("nvim-tree").setup()
EOF
nnoremap <leader>e :NvimTreeToggle<cr>

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

" <leader>1 to refresh vimrc
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>

"================= coc ===================
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
let g:coc_disable_transparent_cursor = 1

" use <tab> for trigger completion and navigate to the next complete item
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-Tab>" :
      \ coc#refresh()

" Use ,2 to show documentation in preview window.
nnoremap <silent> <leader>2 :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ========== vim-snipMate =======
let g:snipMate = { 'snippet_version' : 1 }
imap <leader><leader> <Plug>snipMateNextOrTrigger
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript-jasmine'
let g:snipMate.scope_aliases['typescript'] = 'javascript-jasmine'

" ======= colorscheme ===========
syntax enable
set background=dark

set t_Co=256
let g:dracula_colorterm = 0
colorscheme dracula_pro_morbius

"=== bufferline
lua << EOF
require("bufferline").setup{
  options = {
    mode = "tabs",
    show_close_icons = false,
    show_buffer_close_icons = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  },

  highlights = {
    fill = {
      guifg = { attribute = "fg", highlight = "#ff0000" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
  },
}
EOF

"=== telescope
nnoremap <leader>F <cmd>Telescope live_grep<cr><esc>
nnoremap <leader>f <cmd>lua require('telescope.builtin').grep_string()<cr>
lua <<EOF
require('telescope').load_extension('coc')
EOF
nmap <silent> gr <cmd>Telescope coc references<cr>
