local u = require('utils')
local nmap = u.nmap
local vmap = u.vmap
local imap = u.imap

-- J and K to multiple navigate
nmap('K', '5k')
vmap('K', '5k')
nmap('J', '5j')
vmap('J', '5j')

-- ctrl-p, ctrl-y for copying/pasting from system clipboard
nmap('<C-p>', '"+p')
vmap('<C-y>', '"+y')

-- T for putting the current line on top of the screen
nmap('T', 'zt')

-- <leader>h/l to move the current tab left/right
nmap('<leader>h', '<c-w>w')
nmap('<leader>l', '<c-w>w')

-- in visual mode, map `/target` to `<Esc>/\%Vtarget`
-- so that we can do searching withing the selected block
-- http://vim.wikia.com/wiki/Search_and_replace_in_a_visual_selection
vmap('/', '<Esc>/\\%V')

-- <leader>v to select previous selected area
nmap('<leader>v', 'gv')

-- <leader>d to <Esc>
imap('<leader>d', '<esc>')
nmap('<leader>d', '<esc>')
vmap('<leader>d', '<esc>')
