local u = require('utils')
return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local actions = require("diffview.actions")
    require('diffview').setup {
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

    u.cmap('GD', 'DiffviewOpen')
    u.cmap('GC', 'DiffviewClose')
    u.cmap('GF', 'DiffviewFileHistory')
  end

}
