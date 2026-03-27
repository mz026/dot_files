return {
  'git@github.com:mz026/dracula-pro-vim.git',
  config = function()
    vim.cmd [[
      syntax enable
      set background=dark

      set t_Co=256
      let g:dracula_colorterm = 0
      colorscheme dracula_pro_lincoln

      hi! link Folded DraculaOrangeItalic
    ]]
  end
}
