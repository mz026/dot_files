
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

" ========== 80 columns =====================
" 80 column highlight
if v:version >= 703
  set colorcolumn=85
  hi ColorColumn ctermfg=grey ctermbg=235
endif

" "for vsp 80 column width
" set winwidth=100
set previewheight=30

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

" ========= match highlight ================
highlight MatchParen cterm=underline ctermfg=none ctermbg=none
