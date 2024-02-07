local u = require('utils')
return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        adaptive_size = true,
      },
    }

    u.nmap('<leader>E', "<cmd>NvimTreeFindFile<cr>")
    u.nmap('<leader>3', '<cmd>NvimTreeToggle<cr>')

    require('nvim-tree.events')
  end,
}
