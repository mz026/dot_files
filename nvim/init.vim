set nocompatible               " be iMproved

set nomodeline
filetype off                   " required!

call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
" Plug 'junegunn/fzf.vim'
" Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
" Plug 'romgrk/barbar.nvim'

" Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
" Plug 'moll/vim-bbye'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs', { 'commit': '8f4598b' }
Plug 'vim-scripts/surround.vim'
Plug 'smoka7/hop.nvim'
" Plug 'tpope/vim-commentary'
Plug 'mz026/vim-snippets'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-rails'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test'

" rubyblock depends on textobj-user
Plug 'kana/vim-textobj-user', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

Plug 'ekalinin/Dockerfile.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'elixir-lang/vim-elixir'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-abolish'
Plug 'qxxxb/vim-searchhi'
Plug 'aliou/sql-heredoc.vim'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'antoinemadec/coc-fzf'
Plug 'tpope/vim-projectionist'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'git@github.com-mz:mz026/dracula-pro-vim.git'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ruanyl/vim-gh-line'
" for diffview
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" required for vim-markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

call plug#end()

lua <<EOF
require('options')
require('keybindings')
require('settings')
EOF

""commentary alias, map ,c to ctrl_ctrl_
"nmap <leader>c gcc
"vmap <leader>c gc

" ======= indent guide settings ==========
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

" " ===== FZF =================
" let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.85 }}
" let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
" let rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!.git/*" '

" command! -bang -nargs=? FF
"   \ call fzf#vim#files(
"   \ <q-args>,
"   \ fzf#vim#with_preview({'down': '40%'}), <bang>0)

" command! -bang -nargs=* Find
"   \ call fzf#vim#grep(
"   \   rg_command.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview('up:50%'), <bang>0)

" command! -bang -nargs=* Findnt
"   \ call fzf#vim#grep(
"   \   rg_command.'--glob "!test[s]/" --glob "!spec[s]/" '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview('up:50%'), <bang>0)

" nmap <leader>f :Find <C-R><C-W><cr>
" nmap <leader>F :Findnt <C-R><C-W><cr>
" nmap <leader>t :FF<cr>
" nmap <leader>B :Buffers<cr>
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
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
highlight ALEError ctermbg=none cterm=underline
cmap AF ALEFix

" ========= jsx syntax ==================
let g:jsx_ext_required = 0

" ======== Argwrap ====================
nnoremap <silent> <leader>z :ArgWrap<CR>

" ======== nvim-treesitter ====================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "python",
    "go",
    "javascript",
    "bash",
    "sql",
    "typescript"
  },

  highlight = {
    enable = true,
    disable = { "markdown", "md" },
  },
  indent = {
    enable = true
  },
}
EOF


" " ========= nvim-tree
" lua <<EOF
" require("nvim-tree").setup{
"   diagnostics = {
"     enable = true,
"     show_on_dirs = true,
"     icons = {
"       hint = "",
"       info = "",
"       warning = "",
"       error = "",
"     },
"   },
"   view = {
"     adaptive_size = true,
"   },
" }
" EOF
" nnoremap <leader>E <cmd>NvimTreeFindFile<cr>
" nnoremap <leader>3 <cmd>NvimTreeToggle<cr>

" ======== searchhi ==============
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

" <leader>0 to refresh vimrc
nnoremap <silent><leader>0 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>

""================= coc ===================
"let g:coc_global_extensions = [
"  \ 'coc-tsserver',
"  \ 'coc-pyright',
"  \ 'coc-sumneko-lua',
"  \ 'coc-snippets'
"\]

"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gt <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> gm <Plug>(coc-rename)

"" Apply AutoFix to problem on the current line.
"nmap <leader>u  <Plug>(coc-fix-current)
"let g:coc_disable_transparent_cursor = 1

"" Use tab for trigger completion with characters ahead and navigate.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ CheckBackspace() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"imap <leader><leader> <Plug>(coc-snippets-expand-jump)

"" Use ,2 to show documentation in preview window.
"nnoremap <silent> <leader>2 :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction

" ======= colorscheme ===========
syntax enable
set background=dark

set t_Co=256
let g:dracula_colorterm = 0
colorscheme dracula_pro_morbius

hi! link Folded DraculaOrangeItalic

" ====== barbar =============
" let g:barbar_auto_setup = v:false " disable auto-setup
" lua << EOF
"   require'barbar'.setup {}
" EOF
" nnoremap H <cmd>BufferPrevious<cr>
" nnoremap L <cmd>BufferNext<cr>
" nnoremap <leader>H <cmd>BufferMovePrevious<cr>
" nnoremap <leader>L <cmd>BufferMoveNext<cr>

" " so that modified file's color won't get burried by the background
" hi BufferCurrentMod guifg=#abb2bf ctermfg=249 gui=NONE cterm=NONE
" hi BufferInactiveMod ctermfg=249 ctermbg=0 guifg=#abb2bf guibg=#0f0b0b

" ========= ???
" lua <<EOF
" require'bufferline'.setup {
"   tabpages = false,
" }
" local nvim_tree_events = require('nvim-tree.events')
" local bufferline_state = require('bufferline.state')
" EOF

""===== bbye ============
"" close buffer by ,q
":nnoremap <Leader>q :Bdelete<CR>

" ==== hop ============
lua <<EOF
require'hop'.setup()

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
local hintPosition = require('hop.hint').HintPosition

-- map <leader>e to "jump the the end of words"
vim.keymap.set('', '<leader>e', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = hintPosition.END })
end, {remap=true})
EOF

nnoremap <leader>w <cmd>:HopWordAC<cr>
nnoremap <leader>b <cmd>:HopWordBC<cr>
nnoremap <leader>j <cmd>:HopLineAC<cr>
nnoremap <leader>k <cmd>:HopLineBC<cr>


" ===== coc-go ==========
" automatically handle imports before saving
" use silent because gopls' issue when there's nothing new to import
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

"==== diffview ===============
lua <<EOF
local actions = require("diffview.actions")
require'diffview'.setup {
  -- set the file panel as a floating window
  file_panel = {
    win_config = function()
      local c = { type = "float" }
      local editor_width = vim.o.columns
      local editor_height = vim.o.lines
      c.width = math.min(100, editor_width)
      c.height = math.min(24, editor_height)
      c.col = math.floor(editor_width * 0.5 - c.width * 0.5)
      c.row = math.floor(editor_height * 0.5 - c.height * 0.5)
      return c
    end,
  },
  keymaps = {
    -- set <leader>4 as the toggle of file panel and reserve <leader>b and <leader>e for hop
    view = {
      disable_defaults = false,
      ["<leader>b"] = false,
      ["<leader>e"] = false,
      { "n", "<leader>4", actions.toggle_files, { desc = "Toggle the file panel." } },
    },
    file_panel = {
      disable_defaults = false,
      ["<leader>b"] = false,
      ["<leader>e"] = false,
      { "n", "<leader>4", actions.toggle_files, { desc = "Toggle the file panel." } },
    },
  },
}
EOF
cmap GD DiffviewOpen
cmap GC DiffviewClose
cmap GF DiffviewFileHistory


" ======= vim-gh-line =============
" to copy the URL to clipboard instead of opening it in browser
let g:gh_open_command = 'fn() { echo -n "$@" | pbcopy; }; fn '


" vim-go, unmap K. The original mapping is to open godoc.
let g:go_doc_keywordprg_enabled = 0

" Disable copilot by default
let g:copilot_enabled = v:false

" ======== markdown
set conceallevel=2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_toc_autofit = 1
