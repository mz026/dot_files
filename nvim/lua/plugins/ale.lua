return {
  'dense-analysis/ale',
  config = function ()
    vim.cmd [[
      let g:ale_linters = {
      \   'ruby': ['ruby'],
      \   'typescript': ['eslint'],
      \   'sh': ['shellcheck']
      \}
      let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
      highlight ALEError ctermbg=none cterm=underline
      cmap AF ALEFix
    ]]
  end
}
