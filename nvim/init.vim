set nocompatible               " be iMproved
set nomodeline
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'fannheyward/telescope-coc.nvim'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs', { 'commit': '8f4598b' }
Plug 'vim-scripts/surround.vim'
Plug 'phaazon/hop.nvim', { 'tag': 'v1.3.0' }
Plug 'tpope/vim-commentary'
Plug 'mz026/vim-snippets'
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
Plug 'antoinemadec/coc-fzf'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'git@github.com-mz:mz026/dracula-pro-vim.git'

call plug#end()

source ~/.dot_files/nvim/options.vim
source ~/.dot_files/nvim/keybindings.vim

"commentary alias, map ,c to ctrl_ctrl_
nmap <leader>c gcc
vmap <leader>c gc

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

" for neovim, map ctrl-o to switching to normal mode from terminal mode
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" ===== FZF =================
let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.85 }}
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
let rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!.git/*" '

command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   rg_command.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up:50%'), <bang>0)

command! -bang -nargs=* Findnt
  \ call fzf#vim#grep(
  \   rg_command.'--glob "!test[s]/" --glob "!spec[s]/" '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up:50%'), <bang>0)

nmap <leader>f :Find <C-R><C-W><cr>
nmap <leader>F :Findnt <C-R><C-W><cr>
nmap <leader>t :Files<cr>

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
nnoremap <leader>e <cmd>NvimTreeToggle<cr>

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
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-snippets',
  \ 'coc-go'
\]

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" ======= colorscheme ===========
syntax enable
set background=dark

set t_Co=256
let g:dracula_colorterm = 0
colorscheme dracula_pro_morbius

""=== telescope =================
"lua <<EOF
"require('telescope').load_extension('coc')
"EOF
"nmap <silent> gr <cmd>Telescope coc references<cr>

" ====== barbar =============
nnoremap H <cmd>BufferPrevious<cr>
nnoremap L <cmd>BufferNext<cr>
nnoremap <leader>H <cmd>BufferMovePrevious<cr>
nnoremap <leader>L <cmd>BufferMoveNext<cr>
hi BufferCurrentMod guifg=#abb2bf ctermfg=249 guibg=#1e1e1e ctermbg=234 gui=NONE cterm=NONE
lua <<EOF
require'bufferline'.setup {}
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)
EOF

"===== bbye ============
" close buffer by ,q
:nnoremap <Leader>q :Bdelete<CR>

" ==== hop ============
lua <<EOF
require'hop'.setup()
EOF
nnoremap <leader>w <cmd>:HopWordAC<cr>
nnoremap <leader>b <cmd>:HopWordBC<cr>
nnoremap <leader>j <cmd>:HopLineAC<cr>
nnoremap <leader>k <cmd>:HopLineBC<cr>
