set nocompatible               " be iMproved
set nomodeline
filetype off                   " required!

call plug#begin('~/.vim/plugged')

" Plug 'vim-scripts/The-NERD-tree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs', { 'commit': '8f4598b' }
Plug 'vim-scripts/surround.vim'
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

source ~/.dot_files/nvim/options.vim
source ~/.dot_files/nvim/keybindings.vim
source ~/.dot_files/nvim/plugin_settings/hop.vim


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

""=== barbar
hi BufferCurrentMod guifg=#abb2bf ctermfg=248 gui=NONE cterm=NONE

nnoremap <silent> <leader>L <cmd>BufferMoveNext<CR>
nnoremap <silent> <leader>H <cmd>BufferMovePrev<CR>

"=== telescope
nnoremap <leader>F <cmd>Telescope live_grep<cr><esc>
nnoremap <leader>f <cmd>lua require('telescope.builtin').grep_string()<cr>
lua <<EOF
require('telescope').load_extension('coc')
EOF
nmap <silent> gr <cmd>Telescope coc references<cr>
