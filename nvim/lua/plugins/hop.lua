local u = require('utils')
return {
  'smoka7/hop.nvim',
  config = function ()
    require'hop'.setup()

    -- place this in one of your configuration file(s)
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection
    local hintPosition = require('hop.hint').HintPosition

    -- map <leader>e to "jump the the end of words"
    vim.keymap.set('', '<leader>e', function()
      hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = hintPosition.END })
    end, {remap=true})

    u.nmap('<leader>w', '<cmd>:HopWordAC<cr>')
    u.nmap('<leader>b', '<cmd>:HopWordBC<cr>')
    u.nmap('<leader>j', '<cmd>:HopLineAC<cr>')
    u.nmap('<leader>k', '<cmd>:HopLineBC<cr>')
  end
}
