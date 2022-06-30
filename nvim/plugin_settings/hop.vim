lua <<EOF
require'hop'.setup()
EOF
nnoremap <leader>w <cmd>:HopWordAC<cr>
nnoremap <leader>b <cmd>:HopWordBC<cr>
nnoremap <leader>j <cmd>:HopLineAC<cr>
nnoremap <leader>k <cmd>:HopLineBC<cr>
