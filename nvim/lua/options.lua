-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Basic settings
vim.o.re = 0
vim.o.expandtab = true
vim.wo.number = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.termguicolors = true


-- Set indent to 4 for python and proto files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "proto"},
  command = "setlocal shiftwidth=4 softtabstop=4 tabstop=4",
})

-- Fold settings
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Custom fold text
vim.cmd [[
function! FoldText()
  let line = getline(v:foldstart)
  let numOfLines = v:foldend - v:foldstart
  let fillCount = winwidth('%') - len(line) - len(numOfLines) - 14
  return line . '  ' . repeat('.', fillCount) . ' (' . numOfLines . ' L)'
endfunction
set foldtext=FoldText()
]]

vim.o.fillchars = "fold: "

-- Enable project-level vimrc and security
vim.o.exrc = true
vim.o.secure = true

-- Diff options
vim.o.diffopt = vim.o.diffopt:gsub("internal,", "")
vim.o.diffopt = vim.o.diffopt .. ",vertical"

-- 80 column highlight
vim.wo.colorcolumn = "80"
vim.cmd [[ hi ColorColumn ctermfg=grey ctermbg=235 ]]

-- Preview height
vim.o.previewheight = 30

-- Folding methods and mappings
vim.api.nvim_set_keymap('n', '<space>', 'za', {noremap = true})
vim.api.nvim_create_autocmd("BufWinEnter", {pattern = "*", command = "silent! :%foldopen!"})

-- Syntax highlighting fixes
vim.cmd [[
hi def link jsObjectKey Label
hi def link jsFunctionKey Label
]]

-- Match highlight
vim.cmd [[ highlight MatchParen cterm=underline ctermfg=none ctermbg=none ]]

-- Turn off copilot by default
vim.g.copilot_enabled = false
