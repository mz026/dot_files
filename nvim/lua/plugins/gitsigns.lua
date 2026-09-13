return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('gitsigns').setup {
      -- Diff against the last commit, not the index, so staged changes still show as hunks.
      base = 'HEAD',
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = false,
      current_line_blame_opts = { delay = 300 },
      on_attach = function(bufnr)
        local gs = require('gitsigns')
        local function map(lhs, rhs)
          vim.keymap.set('n', lhs, rhs, { buffer = bufnr, silent = true })
        end

        map(']c', function() gs.nav_hunk('next') end)
        map('[c', function() gs.nav_hunk('prev') end)
        map('<leader>hp', gs.preview_hunk)
        map('<leader>hs', gs.stage_hunk)
        map('<leader>hr', gs.reset_hunk)
        map('<leader>hu', gs.undo_stage_hunk)
        map('<leader>hb', function() gs.blame_line({ full = true }) end)
        map('<leader>hB', gs.toggle_current_line_blame)
        map('<leader>hd', gs.diffthis)
      end,
    }
  end,
}
