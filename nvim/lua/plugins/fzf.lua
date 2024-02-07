local u = require('utils')

return {
  {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all"
  },
  {
    "junegunn/fzf.vim",
    config = function ()
      vim.cmd [[
        let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.85 }}
        let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
        let rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!.git/*" '

        command! -bang -nargs=? FF
          \ call fzf#vim#files(
          \ <q-args>,
          \ fzf#vim#with_preview({'down': '40%'}), <bang>0)

        command! -bang -nargs=* Find
          \ call fzf#vim#grep(
          \   rg_command.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview('up:50%'), <bang>0)

        command! -bang -nargs=* Findnt
          \ call fzf#vim#grep(
          \   rg_command.'--glob "!test[s]/" --glob "!spec[s]/" '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview('up:50%'), <bang>0)

      ]]
      u.nmap('<leader>f', ':Find <C-R><C-W><cr>')
      u.nmap('<leader>F', ':Findnt <C-R><C-W><cr>')
      u.nmap('<leader>t', ':FF<cr>')
      u.nmap('<leader>B', ':Buffers<cr>')
    end,
  },
  {
    'antoinemadec/coc-fzf',
    dependencies = {
      {'neoclide/coc.nvim', branch = 'release'}
    }
  }
}
